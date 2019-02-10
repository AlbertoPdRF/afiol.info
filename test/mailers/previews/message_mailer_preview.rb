# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/contact
  def contact
    message = Message.new(name: "Jon Snow", email: "jsnow@winterfell.org", subject: "The North remembers", body: "Winter is coming")
    MessageMailer.contact(message)
  end

end
