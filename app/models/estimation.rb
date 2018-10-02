class Estimation < MailForm::Base
  attribute :nom,      :validate => true
  attribute :email,    :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :telephone
  attribute :type, inclusion: { in: [ "Appartement", "false" ] }
  attribute :nombre_de_pieces
  attribute :surface_habitable
  attribute :ville
  attribute :code_postal
  attribute :message
  attribute :nickname,  :captcha  => true



  def headers
    {
      :subject => "Estimation",
      :to => "ag.dulouvre@gmail.com",
      :from => %("#{nom}" <#{email}>)
    }
  end
end
