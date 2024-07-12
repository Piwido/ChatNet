#require 'enumerize'

class User < ApplicationRecord
  #extend enumerize
  #enumerize :role, in: [:user, :admin], default: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  validates :username, uniqueness: {case_sensitive: false},   
  presence: true, length: { minimum: 3, maximum: 25}

  validates :email, presence: true, length: { maximum: 105 }, 
  uniqueness: {case_sensitive: false}, format: {with: URI::MailTo::EMAIL_REGEXP, message: "invalid email format"}
end
