FactoryGirl.define do
  factory :event do
    name "MyString"
    start_date {Time.now}
    start_time {Time.now}
    description "This is a cool event."
  end

  trait :future do
    start_date {100.days.from_now}
    start_time {100.days.from_now}
  end

  trait :past do
    start_date {100.days.ago}
    start_time {100.days.ago}
  end

  trait :last_week do
    start_date {5.days.ago}
    start_time {5.days.ago}
  end

  trait :today do
    start_date {Date.today}
    start_time {Date.today}
  end

  trait :yesterday do
    start_date {Date.yesterday}
    start_time {Date.yesterday}
  end
end
