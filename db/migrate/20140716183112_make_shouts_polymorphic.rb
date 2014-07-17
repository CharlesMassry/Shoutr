class MakeShoutsPolymorphic < ActiveRecord::Migration

  class Shout < ActiveRecord::Base
  end

  class TextShout < ActiveRecord::Base
  end

  def change
    add_column :shouts, :content_type, :string
    add_column :shouts, :content_id, :integer, index: true

    Shout.all.each do |shout|
      text_shout = TextShout.create!(content: shout.body)
      shout.update!(content_type: "TextShout", content_id: text_shout.id)
    end

    remove_column :shouts, :body
  end
end
