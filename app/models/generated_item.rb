class GeneratedItem < ActiveRecord::Base
  before_create :generate_unique_item_id

  protected

  def generate_unique_item_id
    self.unique_item_id = loop do
      unique_id_string = Digest::SHA1.hexdigest([Time.now, rand].join)
      break unique_id_string unless GeneratedItem.exists?(unique_item_id: unique_id_string)
    end
  end
end