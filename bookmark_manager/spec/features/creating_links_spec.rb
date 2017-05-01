feature 'Adding links' do
  scenario 'user can add links to page' do
    visit '/links/new'
    fill_in 'title', with: 'YouTube'
    fill_in 'url', with: 'www.youtube.com'
    click_button 'Submit'
    expect(page).to have_content 'YouTube'
  end
end
