class Admin::EmailTemplate < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates :title, presence: true, uniqueness: {case_sensitive: false}

    has_attached_file :snapshot
    validates_attachment_content_type :snapshot, content_type: /\Aimage\/.*\z/
end