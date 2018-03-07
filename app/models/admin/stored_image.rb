class Admin::StoredImage < ApplicationRecord
    belongs_to :stored_image

    has_attached_file :url, styles: { small: '170x170', thumb: '50x50' }
    validates_attachment_content_type :url, content_type: /\Aimage\/.*\z/
    validates :title, presence: :true, uniqueness: { case_sensitive: false }

end
