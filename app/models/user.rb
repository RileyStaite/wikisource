class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    attr_accessor :sourcelist
    # validates_presence_of :sourcelist, presence: true
       
    def self.save_a_source(new_source,sourcelist)
      sourcelist.append(new_source)
        return(sourcelist)
      end
       
    def self.show_sources(saved_sourcelist)
        return saved_sourcelist
    end
end
