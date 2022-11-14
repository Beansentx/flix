class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ }, 
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true}

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
  
end
