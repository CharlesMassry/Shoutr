class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :content, presence: true, length: { maximum: 160 }
end
