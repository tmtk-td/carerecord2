require 'rails_helper'
RSpec.describe '介護記録機能', type: :model do
  before do
    # あらかじめケアレコード一覧のテストで使用するためのケアレコーどを作成する
    @user = FactoryBot.create(:user)
    @client = FactoryBot.create(:client)
    care_record = FactoryBot.build(:care_record) 
  end
  describe '新規作成機能' do
    context '新規作成で介護記録を入力しない場合' do
      it 'バリデーションを通らない' do
      care_record = CareRecord.new(content: '', content_date: '02020-09-16')
      expect(care_record).not_to be_valid
      end
    end
    context '新規作成で介護記録日付を入力しない場合' do
      it 'バリデーションを通らない' do
      care_record = CareRecord.new(content: '記録サンプル', content_date: '')
      expect(care_record).not_to be_valid
      end
    end
    context '新規作成で介護記録と記録日付を入力した場合' do
      it 'バリデーションを通る' do
      
      care_record = CareRecord.new(content: '記録サンプル', content_date: '02020-09-16', user_id: @user.id, client_id: @client.id)
      expect(care_record).to be_valid
      end
    end
  end
  
end