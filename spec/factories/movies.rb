FactoryBot.define do
  factory :movie do
    name { '30 Days of Night' }
    released { '20-1-07' }
    points { 9 }
    liked { true }
  end

  factory :new_movie, class: Movie do
    name { 'The Walking Dead' }
    released { '21-2-09' }
    points { 10 }
    liked { true }
  end
end
