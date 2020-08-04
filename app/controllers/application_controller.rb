class ApplicationController < ActionController::Base
    helper_method :ozToLbs, :getBabyWinner
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || babies_path
    end

    def ozToLbs(oz)
        lbs = oz.to_f / 16.0
        lbsSplit = lbs.to_s.split('.')
        ozDecimal = sprintf(".%s", lbsSplit[1]).to_f * 16

        return sprintf("%s lbs %d oz", lbsSplit[0], ozDecimal)
    end

    def getBabyWinner(baby_id)
        pool = Pool.where(baby_id: baby_id, winner: true).limit(1).first
        return pool
    end
end
