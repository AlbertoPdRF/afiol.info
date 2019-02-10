class Message
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :body

  validates :name, :email, :subject, :body, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
