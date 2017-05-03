feature 'Adding tags' do
  scenario 'user can add tags to links' do
    visit '/links/new'
    fill_in 'title', with: 'Vimeo'
    fill_in 'url', with: 'www.vimeo.com'
    fill_in 'tag', with: 'entertainment'
    click_button 'Submit'
    expect(Link.first.tags.map(&:name)).to include 'entertainment'
  end
end
