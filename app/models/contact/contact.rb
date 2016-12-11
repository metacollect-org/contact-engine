module Contact
  class Contact < ApplicationRecord
    belongs_to :accessible, polymorphic: true
    belongs_to :platform

    validates :accessible, :platform, presence: true
    validates :content, presence: true
  end
end
