require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # attr_accessor  crea un atributo para la contraseña en default 
  # permite asignar y leer la contraseña temp sin guardarla en la bd
  attr_accessor :password
  
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :name, :lastname, :dni, :birth_date, :phone_number, presence: true
  
  has_one :account
  has_many :pets
  has_many :card, through: :account
  has_many :transfers
  
  def password
    @password ||= Password.new(self[:password]) if self[:password].present?
  end
  
  # encripta la pw antes de guardala
  def password=(new_password)
    @password = Password.create(new_password)
    self[:password] = @password
  end
  # checkea si la pw es correcta 
  def authenticate(submitted_password)
    password == submitted_password
  end

  def main_pet
    pets.find_by(pet_number: main_pet_number)
  end

end
