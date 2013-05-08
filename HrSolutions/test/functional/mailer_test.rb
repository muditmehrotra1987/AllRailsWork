require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "invit" do
    mail = Mailer.invit
    assert_equal "Invit", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
