module AuthenticationHelper
  def sign_in
    page.driver.browser.basic_authorize(ENV["BASIC_AUTH_NAME"],
                                        ENV["BASIC_AUTH_PASSWORD"])
  end
end

RSpec.configuration.include AuthenticationHelper
