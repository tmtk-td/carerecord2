require 'rails_helper'
RSpec.describe '介護記録機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
    # あらかじめケアレコード一覧のテストで使用するためのケアレコーどを作成する
    @client = FactoryBot.create(:client)
    @care_record = FactoryBot.build(:care_record)
    @label = FactoryBot.create(:label)
    FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id) 
    FactoryBot.create(:second_care_record, client_id: @client.id, user_id: @user.id)
    visit clients_path
  end
  describe '新規作成機能' do
    context '介護記録を新規作成した場合' do
      it '作成した記録が表示される' do
        # 1. new_care_record_pathに遷移する（新規作成ページに遷移する）
      # ここにnew_care_record_pathにvisitする処理を書く
      all('tbody tr')[1].click_on '記録を書く'
      # 2. 新規登録内容を入力する
      #「介護記録」というラベル名の入力欄と、「日付」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      # ここに「介護記録」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      # ここに「日付」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      care_record = FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id)
      fill_in "care_record_content", with: 'sample'
      fill_in "care_record_content_date", with: '02020-08-30'
      click_button "登録する"
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      # ここに「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
      # 4. clickで登録されたはずの情報が、記録詳細ページに表示されているかを確認する
      # （記録が登録されたら記録詳細画面に遷移されるという前提）
      # ここに記録詳細ページに、テストコードで作成したデータが記録詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content 'sample'
      expect(page).to have_content '08-30'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
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
      it '作成済みの介護記録一覧が表示される' do
        # テストで使用するためのケアレコードを作成
        care_record = FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id, content: 'sample')
        # ケアレコード一覧ページに遷移
        visit care_records_path(client_id: @client.id)
        # visitした（遷移した）page（記録一覧ページ）に「sample」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content '記録一覧'
        expect(page).to have_content 'factory_sample1'
        expect(page).to have_content 'factory_sample2'
        expect(page).to have_content 'sample'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
  end
  describe '詳細表示機能' do
     context '任意の介護記録詳細画面に遷移した場合' do
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
       it '該当記録の内容が表示される' do
        # テストで使用するためのケアレコードを作成
        # 介護詳細ページに遷移
        visit care_records_path(client_id: @client.id)
        all('tbody tr')[1].click_on '詳細確認'
        # visitした（遷移した）page（ケアレコード一覧ページ）に「sample」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content 'factory_sample_client1'
        expect(page).to have_content 'factory_sample1'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
       end
     end
  end
  describe '編集機能' do
    context '介護記録を編集した場合' do
      it '編集した記録が表示される' do
        # 1. edit_care_record_pathに遷移する（新規作成ページに遷移する）
      # ここにedit_care_record_pathにvisitする処理を書く
      visit care_records_path(client_id: @client.id)
        all('tbody tr')[1].click_on '編集する'
      # 2. 新規登録内容を入力する
      #「介護記録」というラベル名の入力欄と、「日付」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      # ここに「介護記録」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      # ここに「日付」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      care_record = FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id)
      fill_in "care_record_content", with: '編集sample'
      click_button "更新する"
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      # ここに「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
      # 4. clickで登録されたはずの情報が、記録詳細ページに表示されているかを確認する
      # （記録が登録されたら記録詳細画面に遷移されるという前提）
      # ここに記録詳細ページに、テストコードで作成したデータが記録詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content '編集しました'
      expect(page).to have_content '編集sample'
      end
    end
  end
  describe '削除機能' do
    context '介護記録を削除した場合' do
      it '該当記録が削除される' do
        # 1. destroy_care_record_pathに遷移する（新規作成ページに遷移する）
      # ここにdestroy_care_record_pathにvisitする処理を書く
      visit care_records_path(client_id: @client.id)
      page.accept_confirm do
        all('tbody tr')[1].click_on '削除する'
      end  
      # 2. 新規登録内容を入力する
      #「介護記録」というラベル名の入力欄と、「日付」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
      # ここに「介護記録」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      # ここに「日付」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      care_record = FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id)
      # ここに一覧ページに、テストコードで作成したデータが記録詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content '削除しました'
      expect{ care_record.destroy }.to change{ CareRecord.count }.by(-1)
      end
    end
  end
  describe 'ラベル機能' do
    context '介護記録で指定のラベルをチェックした場合' do
      it '作成したチェック記録が一覧に表示される' do
        # 1. new_care_record_pathに遷移する（新規作成ページに遷移する）
      # ここにnew_care_record_pathにvisitする処理を書く
      all('tbody tr')[1].click_on '記録を書く'
      # 2. 新規登録内容を入力する
      #「介護記録」というラベル名の入力欄と、「日付」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力し、該当ラベルにチェックを入れる。
      care_record = FactoryBot.create(:care_record, client_id: @client.id, user_id: @user.id)
      fill_in "care_record_content", with: 'sample'
      fill_in "care_record_content_date", with: '02020-08-30'
      check 'care_record_label_ids_1'
      click_button "登録する"
      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      # ここに「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
      # 4. clickで登録されたはずの情報が、記録詳細ページに表示されているかを確認する
      # ここに記録詳細ページに、テストコードで作成したデータが記録詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content 'label_sample'
      end
    end
  end
end