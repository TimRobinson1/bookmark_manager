feature 'Filtering by tags' do
  scenario 'user can filter links by tags' do
    add_new_link
    visit '/tags/entertainment'
    expect(page).to have_content 'Vimeo'
  end

  scenario 'unrelated tags will not be displayed' do
    add_new_link
    add_different_link
    visit '/tags/communication'
    expect(page).not_to have_content 'Vimeo'
  end
end
