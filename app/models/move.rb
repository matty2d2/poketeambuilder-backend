class Move < ApplicationRecord
    validates :name, uniqueness: true
    belongs_to :type
    has_many :status_changes
end
