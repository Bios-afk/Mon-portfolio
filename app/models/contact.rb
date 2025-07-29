class Contact
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :name, :string
  attribute :email, :string
  attribute :message, :string

  validates :name, presence: { message: "Le nom est requis" }
  validates :email, presence: { message: "L'email est requis" },
                   format: { with: URI::MailTo::EMAIL_REGEXP, message: "Format d'email invalide" }
  validates :message, presence: { message: "Le message est requis" }
end
