FactoryGirl.define do
  factory :contact_platform, class: 'Contact::Platform' do
    factory :diaspora do
      uid 'diaspora'
      logo 'https://diasporafoundation.org/assets/diaspora-handdrawn-1c739b7540911dc332d97e09afb2efe512dbd144d7c1076d4eb742f2bf353d59.png'
    end

    factory :email do
      uid 'email'
      logo '<i class="icon-envelope"></i>'
    end
  end
end
