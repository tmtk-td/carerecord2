require 'rails_helper'
RSpec.describe '介護記録機能', type: :model do
  before do
    # あらかじめケアレコード一覧のテストで使用するためのケアレコーどを作成する
    @client = FactoryBot.create(:client)
    care_record = FactoryBot.build(:care_record) 
  end
  describe '新規利用者作成機能' do
    context '新規作成で名前を入力しない場合' do
      it 'バリデーションを通らない' do
      client = Client.new(name: '', sex: '男性')
      expect(client).not_to be_valid
      end
    end
    context '新規作成で性別を入力しない場合' do
      it 'バリデーションを通らない' do
      client = Client.new(name: '利用者サンプルテスト', sex: '')
      expect(client).not_to be_valid
      end
    end
    context '新規作成で名前と性別を入力した場合' do
      it 'バリデーションを通る' do
      client = Client.new(name: '利用者サンプルテスト', sex: '男性')
      expect(client).to be_valid
      end
    end
  end
  
end