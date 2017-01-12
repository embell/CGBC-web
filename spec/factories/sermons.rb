FactoryGirl.define do
  factory :sermon do
    title "Default"
    speaker "Default"
    date "2016-09-27"

    audio_file { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec", "fixtures", "test.txt")) }

    trait :speaker_marty do
      speaker "Marty Grainger"
    end

    trait :title_test_sermon do
      title "Test Sermon"
    end

    trait :oct312018 do
      date "2018-10-31"
    end

    trait :aug202017 do
      date "2017-08-20"
    end
  end
end
