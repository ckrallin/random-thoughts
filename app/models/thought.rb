class Thought < ApplicationRecord
  belongs_to :user
  belongs_to :place

  include RankedModel
  ranks :row_order, with_same: :place_id
end
