class TextShout < ActiveRecord::Base
  has_one :shout, as: :content, dependent: :destroy
end
