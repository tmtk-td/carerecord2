# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「client」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :client do
    name { 'factory_sample_client1' }
    sex { '男性' }
  end
  # 作成するテストデータの名前を「second_care-client」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_client, class: Client do
    name { 'factory_sample_client2' }
    sex { '女性' }
    
    trait :skip_validate do
      to_create {|instance| instance.save(validate: false)}
    end
  end
end