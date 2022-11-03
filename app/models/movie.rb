class Movie < ApplicationRecord
    def flop?
        total_gross.blank? || total_gross < 250000000
    end
end
