RSpec::Matchers.define :have_empty_form_errors do
  match do |page|
    expect(page).to have_content('error')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Email is invalid")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Password is too short")
    expect(page).to have_selector('div.field_with_errors', text: 'Name')
    expect(page).to have_selector('div.field_with_errors', text: 'Email')
    expect(page).to have_selector('div.field_with_errors', text: 'Password')
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end

def fill_valid_signup_info
  fill_in "Name", with: "Example User"
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "foobar"
  fill_in "Confirm Password", with: "foobar"
end