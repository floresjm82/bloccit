include RandomData

FactoryGirl.define do
  factory :label do
    name
    labelable
    labelable type
  end
end
