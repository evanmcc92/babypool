class Pool < ApplicationRecord
  belongs_to :admin
  belongs_to :baby

    def updateAfterBabyBorn(baby)
        gender_points = self.gender === baby.gender ? 440 : 0
        birth_date_difference = self.determineValue(220 - (20 * (self.birth_date - baby.birth_date).to_i.abs))
        self.update_attribute(:birth_date_points, birth_date_difference)
        if self.birth_time
            birth_time_difference = self.determineValue(120 - (5 * ((self.birth_time - baby.birth_time) / 1.hour).abs))
        else
            birth_time_difference = 0
        end
        self.update_attribute(:birth_time_points, birth_time_difference)
        birth_weight_difference = self.determineValue(50 - (5 * ((self.weight - baby.weight).abs)))
        self.update_attribute(:birth_weight_points, birth_weight_difference)
        birth_length_difference = self.determineValue(50 - (5 * (((self.length - baby.length) / 0.25).abs)))
        self.update_attribute(:birth_length_points, birth_length_difference)

        total = gender_points + birth_date_difference + birth_time_difference + birth_weight_difference + birth_length_difference
        self.update_attribute(:score, total)

        return total
    end

    def setWinner
        self.update_attribute(:winner, true)
    end

    def determineValue(val)
        if val < 0
            return 0
        else
            return val.to_i.round
        end
    end
end
