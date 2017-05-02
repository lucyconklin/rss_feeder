require 'rails_helper'

describe "Audio Service" do
  it "takes a url and date" do
    url = 'https://rss.prod.firstlook.media/missingrichardsimmons/podcast.rss'
    date = '2017-03-15'
    params = {'url' => url, 'date' => date }
    auth_service = AudioService.new(params)

    expect(Audio.count).to eq(1)
    expect(Audio.first.title).to eq("5: O Brother, Where Art Thou?")
  end
end
