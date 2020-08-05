class Baby < ApplicationRecord
  belongs_to :admin
  has_many :pool, dependent: :delete_all
end
