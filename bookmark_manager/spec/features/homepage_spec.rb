feature 'Displays links' do
  scenario 'links appear on homepage' do
    Link.create(title: 'Google', url: 'www.google.com')
    visit '/'
    expect(page).to have_content 'Google'
  end
end
