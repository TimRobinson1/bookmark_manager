feature 'Adding links' do
  scenario 'user can add links to page' do
    add_new_link
    expect(page).to have_content 'Vimeo'
  end
end
