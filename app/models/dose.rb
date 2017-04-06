class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail, uniqueness: { scope: :ingredient,
     message: "Should be unique for a given cocktail/ingredient combo" }
end
