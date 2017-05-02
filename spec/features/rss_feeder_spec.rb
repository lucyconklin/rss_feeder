require 'rails_helper'

describe "As a guest" do
  it "I can enter the url and date to save a podcast" do
    visit '/'

    fill_in 'audio_url', with: 'https://rss.prod.firstlook.media/missingrichardsimmons/podcast.rss'
    fill_in 'audio_date', with: '2017-02-22'
    click_on 'Submit'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('2: Stakeout')
    expect(page).to have_content('2017-02-22')
  end
end
