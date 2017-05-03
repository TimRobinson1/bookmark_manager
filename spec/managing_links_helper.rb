
def add_new_link
  visit '/links/new'
  fill_in 'title', with: 'Vimeo'
  fill_in 'url', with: 'www.vimeo.com'
  fill_in 'tag', with: 'entertainment'
  click_button 'Submit'
end

def add_different_link
  visit '/links/new'
  fill_in 'title', with: 'Slack'
  fill_in 'url', with: 'www.slack.com'
  fill_in 'tag', with: 'communication'
  click_button 'Submit'
end
