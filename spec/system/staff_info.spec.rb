require 'rails_helper'
RSpec.describe 'スタッフ連絡事項記録機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
    # あらかじめケアレコード一覧のテストで使用するためのケアレコーどを作成する
    @client = FactoryBot.create(:client)
    care_record = FactoryBot.build(:staff_info) 
    FactoryBot.create(:staff_info, user_id: @user.id) 
    FactoryBot.create(:second_staff_info, user_id: @user.id)
    visit staff_infos_path
  end
  describe '新規連絡事項作成機能' do
    context '連絡記録を新規作成した場合' do
      it '作成した記録が表示される' do
        click_on "新しく連絡事項を記入"
      staff_info = FactoryBot.create(:staff_info, user_id: @user.id)
      fill_in "staff_info_info_date", with: '02019年08月15日'
      fill_in "staff_info_info", with: '連絡事項sample'
      click_button "登録する"
      expect(page).to have_content '連絡事項sample'
      end
    end
  end
  describe '連絡事項一覧表示機能' do
    context '連絡記録一覧に遷移した場合' do
      it '連絡事項一覧が表示される' do
      FactoryBot.create(:staff_info, user_id: @user.id)
      FactoryBot.create(:second_staff_info, user_id: @user.id)
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      # ここに「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
      # 4. clickで登録されたはずの情報が、記録詳細ページに表示されているかを確認する
      # （記録が登録されたら記録詳細画面に遷移されるという前提）
      # ここに記録詳細ページに、テストコードで作成したデータが記録詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content '連絡事項一覧'
      end
    end
  end
end  