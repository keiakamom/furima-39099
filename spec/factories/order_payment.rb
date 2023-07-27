FactoryBot.define do
  factory :order_payment do
    postcode { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    adresses { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
