require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)
  end

  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータがなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_registration_path
        fill_in '名前', with: 'bbbbbb'
        fill_in 'メールアドレス', with: 'bbb@bbb.bbb'
        fill_in 'パスワード', with: 'bbbbbb'
        fill_in '確認用パスワード', with: 'bbbbbb'
        click_on 'アカウント登録'
        expect(page).to have_content 'bbbbbb'
      end
    end 
  end

  describe 'セッション機能のテスト' do
    context 'ログインができること' do
      it '自分のマイページに飛べること' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'aaaaaa@exam.com'
        fill_in 'user[password]', with: '111111'
        click_button 'ログイン'
        expect(page).to have_content 'aaaaaa@exam.com'
        expect(page).to have_content '現在 aaaaaa さんがログインしています'
      end
    end 
  
    context '投稿ページにいけないこと' do
      it 'ログインしていない時はログイン画面に飛ぶ' do
        visit care_records_path
        expect(current_path).to eq new_user_session_path
      end
    end 

    context 'ログアウトができること' do
      it 'ログアウトするとトップページへ戻る' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'aaaaaa@exam.com'
        fill_in 'user[password]', with: '111111'
        click_button 'ログイン'
        click_button 'ログアウト'
        expect(current_path).to eq "/"
      end
    end 
  end
end