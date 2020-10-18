# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「care_record」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :care_record do
    content { 'factory_sample1' }
    content_date {'2020-09-16'}
    
  end
  # 作成するテストデータの名前を「second_care-record」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_care_record, class: CareRecord do
    content { 'factory_sample2' }
    content_date {'2020-09-16'}
  end  
    # association :sender, factory: :client
    # association :recipient, factory: :client
    
  
end