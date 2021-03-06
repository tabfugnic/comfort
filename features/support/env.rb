require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  require 'headless'

  headless = Headless.new
  headless.start

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
    :google_oauth2,
    {
    uid: "1",
    info: {
      name: "John Doe",
      email: "john@company_name.com",
      first_name: "John",
      last_name: "Doe",
      image: "https//lh3.googleusercontent.com/url/photo.jpg"
    },
    credentials: {
      token: "token",
      refresh_token: "another_token",
      expires_at: 1354920555,
      expires: true
    },
    extra: {
      raw_info: {
        id: "123456789",
        email: "user@domain.example.com",
        verified_email: true,
        name: "John Doe",
        given_name: "John",
        family_name: "Doe",
        link: "https//plus.google.com/123456789",
        picture: "https//lh3.googleusercontent.com/url/photo.jpg",
        gender: "male",
        birthday: "0000-06-25",
        locale: "en",
        hd: "company_name.com"
      }
    }
  })
  # Capybara defaults to CSS3 selectors rather than XPath.
  # If you'd prefer to use XPath, just uncomment this line and adjust any
  # selectors in your step definitions to use the XPath syntax.
  # Capybara.default_selector = :xpath

end

Spork.each_run do

  ActionController::Base.allow_rescue = false

  # Remove/comment out the lines below if your app doesn't have a database.
  # For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation

end

def google_auth
{
  provider: "google_oauth2",
  uid: "123456789",
  info: {
    name: "John Doe",
    email: "john@company_name.com",
    first_name: "John",
    last_name: "Doe",
    image: "https//lh3.googleusercontent.com/url/photo.jpg"
  },
  credentials: {
    token: "token",
    refresh_token: "another_token",
    expires_at: 1354920555,
    expires: true
  },
  extra: {
    raw_info: {
      id: "123456789",
      email: "user@domain.example.com",
      verified_email: true,
      name: "John Doe",
      given_name: "John",
      family_name: "Doe",
      link: "https//plus.google.com/123456789",
      picture: "https//lh3.googleusercontent.com/url/photo.jpg",
      gender: "male",
      birthday: "0000-06-25",
      locale: "en",
      hd: "company_name.com"
    }
  }
}
end
