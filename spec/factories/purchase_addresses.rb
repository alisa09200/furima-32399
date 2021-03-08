FactoryBot.define do
  factory :purchase_address do
    postalcode { '123-4567' }
    area_id { 2 }
    city { '渋谷区' }
    block { '神宮前2丁目' }
    building { 'フー101' }
    phone { '0901234567' }
  end
end
