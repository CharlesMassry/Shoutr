class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :content, presence: true, length: { maximum: 160 }
  default_scope { order(created_at: :desc) }

  def self.search(search)
    text_shouts = TextShout.where("content ILIKE ?", "%#{search}%").select(:id)
    Shout.where(content_type: "TextShout", content_id: text_shouts).includes(:content, :user)
  end
end
