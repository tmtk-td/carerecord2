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
      # テストコードで作成したデータが記録一覧画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content '連絡事項一覧'
      expect(page).to have_content 'info_sample1'
      expect(page).to have_content 'info_sample2'
      # expect(page).to have_content ''
      end
    end
  end
end  