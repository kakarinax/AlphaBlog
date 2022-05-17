FactoryBot.define do
  factory :article do
    title { 'Test Article' }
    description { 'Test Description must have more letters' }
  end
end