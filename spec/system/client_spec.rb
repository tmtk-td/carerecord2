require 'rails_helper'
RSpec.describe '利用者様機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
    # あらかじめケアレコード一覧のテストで使用するためのケアレコーどを作成する
    @client = FactoryBot.create(:client)
    care_record = FactoryBot.build(:care_record) 
    FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id) 
    FactoryBot.create(:second_care_record, client_id: @client.id, user_id: @user.id)
    visit clients_path
  end
  describe '利用者様一覧機能' do
    context '利用者様一覧に遷移した場合' do
      it '作成した利用者様一覧が表示される' do
        # 1. new_care_record_pathに遷移する（新規作成ページに遷移する）
      # ここにnew_care_record_pathにvisitする処理を書く
      # 2. 新規登録内容を入力する
      #「介護記録」というラベル名の入力欄と、「日付」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      # ここに「介護記録」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      # ここに「日付」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      care_record = FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id)
      # ここに記録詳細ページに、テストコードで作成したデータが記録詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content '利用者様一覧'
      expect(page).to have_content 'factory_sample_client1'
      end
    end
  end
  describe '詳細表示機能' do
    context '利用者様詳細画面に遷移した場合' do
     before do
       # @user = FactoryBot.create(:user)
       visit new_user_session_path
       # あらかじめケアレコード一覧のテストで使用するためのケアレコーどを作成する
       @client = FactoryBot.create(:client)
       care_record = FactoryBot.build(:care_record) 
       FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id) 
       FactoryBot.create(:second_care_record, client_id: @client.id, user_id: @user.id)
       visit clients_path
     end
      it '該当記録の詳細内容が表示される' do
       # 利用者詳細ページに遷移
       all('tbody tr')[1].click_on '詳細確認'
       # visitした（遷移した）page（ケアレコード一覧ページ）に「詳細画面」という文字列が
       # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
       expect(page).to have_content 'ご利用者様詳細画面'
       expect(page).to have_content 'factory_sample_client'
       # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
  end
  describe '新規作成機能' do
    context '利用者様をを新規登録した場合' do
      it '登録した利用者様が表示される' do
      click_on "利用者様登録"
      # 2. 新規登録内容を入力する
      #「利用者」というラベル名の入力欄と、「性別」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      # 入力欄に内容をfill_in（入力）する処理を書く
      care_record = FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id)
      fill_in "client_name", with: 'sample利用者'
      select '男性', from: "client_sex"
      click_button "登録する"
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      # ここに「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
      # 4. clickで登録されたはずの情報が、記録詳細ページに表示されているかを確認する
      # テストコードで作成したデータが記録画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content 'sample利用者'
      expect(page).to have_content '男性'
      end
    end
  end
end  