class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def actors_list
        Character.all.select{|character|
            character.show == self
        }.map{
            |character| character.actor.full_name
        }.uniq
    end
  
end