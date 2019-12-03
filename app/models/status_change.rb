class StatusChange < ApplicationRecord
  validates :stat_name, uniqueness: {scope: :move_id}
  belongs_to :move
end
