class MessageMailer < ApplicationMailer
  def contact(message)
    @name = message.name
    @body = message.body

    mail(from: message.email, to: "apdrf.94@gmail.com", subject: "[afiol.info] #{message.subject}")
  end
end
