class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.save_a_source(new_source,sourcelist)
    sourcelist.append(new_source)
  end

  def self.show_sources(saved_sourcelist)
    return saved_sourcelist
  end

end
