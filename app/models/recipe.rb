class Recipe < ApplicationRecord

    validates :title, :presence, length: { minimum: 3 }
    validates :description, length: { minimum: 3 }

    scope :last_recipes,  -> (count) { limit(count).order(created_at: :desc) }
end
