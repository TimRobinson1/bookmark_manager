feature 'Signing in Users' do
  scenario 'user can sign in successfully' do
      visit '/signup'
      fill_in 'email', with: 'whatever@example.com'
      fill_in 'password', with: 'awesomepassword'
      click_button 'Submit'
      expect(page).to have_content 'Hey whatever@example.com!'
  end

  scenario 'user count increases' do
    expect { User.create(email: 'email', password: 'password') }.to change { User.all.count }.by(1)
  end
end
