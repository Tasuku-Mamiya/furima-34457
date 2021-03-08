FactoryBot.define do
  factory :item do
    item_name               {"服"}
    item_description        {"かっこいい"}
    category_id             {3}
    item_status_id          {2}
    shipping_cost_burden_id {2}
    shipping_area_id        {24}
    delivery_day_id         {2}
    price                   {50000}
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
