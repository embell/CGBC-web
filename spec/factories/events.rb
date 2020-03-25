FactoryBot.define do
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

  trait :ongoing do
    start_date {4.days.ago}
    end_date {3.days.from_now}
  end

  # Events in the current month, next and last year
  trait :next_year do
    start_date {Date.new(Date.today.year+1, Date.today.month)} 
    start_time {Date.new(Date.today.year+1, Date.today.month)} 
  end

  trait :last_year do
    start_date {Date.new(Date.today.year-1, Date.today.month)} 
    start_time {Date.new(Date.today.year-1, Date.today.month)} 
  end

  # Events that span between months
  trait :ends_next_month do
    if (Date.today.month == 12)
      next_month = 1
      next_month_year = Date.today.year + 1
    else
      next_month = Date.today.month + 1
      next_month_year = Date.today.year
    end

    start_date {Date.new(Date.today.year, Date.today.month, 26)}
    start_time {Date.new(Date.today.year, Date.today.month, 26)}
    end_date {Date.new(next_month_year, next_month, 7)}
  end

  trait :ends_this_month do
    if (Date.today.month == 1)
      last_month = 12
      last_month_year = Date.today.year - 1
    else
      last_month = Date.today.month - 1
      last_month_year = Date.today.year
    end

    start_date {Date.new(last_month_year, last_month, 28)}
    start_time {Date.new(last_month_year, last_month, 28)}

    end_date {Date.new(Date.today.year, Date.today.month, 3)}
  end
end
