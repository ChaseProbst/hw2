class Movie < ActiveRecord::Base
    def self.ratings 
        ['G','PG','PG-13','R']
    end
    scope :ratedscope, lambda { |allow| 
        Movie.where(rating: allow)
    }
    #def self.movie_filter(filters, sorts)
    #    return self.all.sort_by { |obj| obj[sorts] }
        #if not filters
        #self.where(:rating => filters.keys).order(sort_t)
    #end
end
