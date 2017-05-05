feature 'Adding tags' do
  scenario 'user can add tags to links' do
    visit '/links/new'
    fill_in 'title', with: 'Slack'
    fill_in 'url', with: 'www.slack.com'
    fill_in 'tag', with: 'communication, fun'
    click_button 'Submit'
    visit '/tags/fun'
    expect(page).to have_content 'Slack'
  end
end
