class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :inventories  

#creates getters and setters, even if not in database (virtual attribute)
  #attr_accessor :first_name, :last_name, :email

  #old way of whitelisting stuff for mass assignment
  #attr_accessible

  #Creates an virtual attributes for new things, allows use of active record casting
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :email2, :string # virtural attribute


  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i


  # def initialize(new_email)
  #   @email = new_email
  # end

end
