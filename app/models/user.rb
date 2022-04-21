class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :saved_sourcelist

  def initialize(saved_sourcelist)
    @saved_sourcelist = saved_sourcelist
  end
  
end
