FactoryBot.define do
  factory :link do
    source_url   { 'https://google.com' }
    active       { true }
  end
end