FactoryGirl.define do
  factory :event do
    name "MyString"
    date {Time.now}
    time {Time.now}
    description "This is a cool event."
  end

  trait :future do
    date {100.days.from_now}
    time {100.days.from_now}
  end

  trait :past do
    date {100.days.ago}
    time {100.days.ago}
  end
end
