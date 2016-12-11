module Contact
  class Platform < ApplicationRecord
    has_many :translations, as: :translatable, class_name: 'Multilingual::Translation'

    validates :uid, presence: true,
                    uniqueness: true,
                    length: { within: 2..32 },  # arbitrary limit
                    format: { with: /[[:lower:]]{2,32}/,
                       message: 'only allows lowercase letters' }
  end
end
