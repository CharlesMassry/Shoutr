class TextShout < ActiveRecord::Base
  has_one :shout, as: :content, dependent: :destroy

  def self.search(search)
    where("content ILIKE ?", "%#{search}%")
  end
end
