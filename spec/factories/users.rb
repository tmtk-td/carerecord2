FactoryBot.define do
  # 作成するテストデータの名前を「user」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :user do
    name { 'aaaaaa' }
    email { 'aaaaaa@exam.com' }
    password { '111111' }
    admin { true }
  end
  # 作成するテストデータの名前を「admin_user」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :admin_user, class: User do
    # id { 20 }
    name { 'admin' }
    email { 'admin@example.com' }
    password { '000000' }
    admin { true }
  end
end