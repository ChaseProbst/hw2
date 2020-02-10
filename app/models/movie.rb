class Movie < ActiveRecord::Base
    def self.ratings 
        ['G','PG','PG-13','R']
    end
    attr_accessible :title, :rating, :description, :release_date
end
