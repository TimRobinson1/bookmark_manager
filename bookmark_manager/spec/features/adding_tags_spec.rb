feature 'Adding tags' do
  scenario 'user can add tags to links' do
    add_new_link
    expect(Link.first.tags.map(&:name)).to include 'entertainment'
  end
end
