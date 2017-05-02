class AudioService

  def initialize(params)
    @url = params['url']
    @date = Date.parse(params['date'])
    get_information
  end

  def get_information
    xml_response = Faraday.get(@url).body
    response_hash = Hash.from_xml(xml_response)
    all_episodes = response_hash['rss']['channel']['item']
    matching_episodes = all_episodes.select do |episode|
      Date.parse(episode['pubDate']) == @date
    end
    create_audio(matching_episodes)
  end

  def create_audio(matching_episodes)
    audio_instances = matching_episodes.map do |episode|
      url = episode ['enclosure']['url']
      length = episode['enclosure']['length']
      title = episode['title']
      date = Date.parse(episode['pubDate'])
      audio = Audio.new(url: url, length: length, title: title, date: date)
      if audio.save
        audio.filepath = "./public/audio/#{ENV['RAILS_ENV']}/#{audio.id}.mp3"
        IO.copy_stream(open(url, :allow_redirections => :safe), audio.filepath)
      end
    end
    audio_instances
  end
end
