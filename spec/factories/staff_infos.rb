FactoryBot.define do
  # 作成するテストデータの名前を「staff_info」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :staff_info do
    info { 'info_sample1' }
    info_date {'2020-09-16'}
    
  end
  # 作成するテストデータの名前を「second_staff_info」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_staff_info, class: StaffInfo do
    info { 'info_sample2' }
    info_date {'2020-09-16'}
  end  
    # association :sender, factory: :client
    # association :recipient, factory: :client
end