FactoryGirl.define do
  factory :contact_contact, class: 'Contact::Contact' do
    factory :doe do
      content 'mrjohn@doe.net'
    end
  end
end
