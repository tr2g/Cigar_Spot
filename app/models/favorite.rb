class Favorite < ApplicationRecord

  belongs_to :reviewer
  belongs_to :shop

end
