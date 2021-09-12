FactoryBot.define do
  factory :user do
      first_name            "Taro"
      last_name             "Yamada"
      kana_first_name       "タロウ"
      kana_last_name　　　　"ヤマダ"
      email　　　　　　　　 "test@test.ne.jp"
      password              "11111111"
      password_confirmation "11111111"
      admin                 "false"
    end

    trait :admin do
      email                 "admin@admin.ne.jp"
      password              "123456"
      password_confirmation "123456"
      admin                 "true"
    end
end

