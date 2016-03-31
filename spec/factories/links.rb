FactoryGirl.define do
  factory :link do
    full_url "http://www.facebook.com"
    short_url "shortr"
    active true
    visit_count 0
  end
end
