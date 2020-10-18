require 'rails_helper'
RSpec.describe 'ユーザ登録機能', type: :model do
  before do
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)
  end
  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータを全て入力した場合' do
      it 'バリデーションが通る' do
        user = User.new(
        name: 'bbbbbb',
        email: 'bbb@bbb.bbb',
        password: 'bbbbbb',
        password_confirmation: 'bbbbbb'
        )
        expect(user).to be_valid
      end
    end 
    context '名前が入力がない場合' do
      it 'バリデーションが通らない' do
        user = User.new(
        name: '',
        email: 'bbb@bbb.bbb',
        password: 'bbbbbb',
        password_confirmation: 'bbbbbb'
        )
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスの入力がない場合' do
      it 'バリデーションが通らない' do
        user = User.new(
          name: 'bbbbbb',
          email: '',
          password: 'bbbbbb',
          password_confirmation: 'bbbbbb'
          )
          expect(user).not_to be_valid
      end
    end
    context 'パスワードの入力がない場合' do
      it 'バリデーションが通らない' do
        user = User.new(
          name: 'bbbbbb',
          email: 'bbb@bbb.bbb',
          password: '',
          password_confirmation: 'bbbbbb'
          )
          expect(user).not_to be_valid
      end
    end
    context 'パスワードと確認パスワードの入力が一致しない場合' do
      it 'バリデーションが通らない' do
        user = User.new(
          name: 'bbbbbb',
          email: 'bbb@bbb.bbb',
          password: 'aaaaaa',
          password_confirmation: 'bbbbbb'
          )
          expect(user).not_to be_valid
      end
    end
  end
end