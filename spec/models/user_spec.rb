require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @users = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@users).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @users.nickname = nil
      @users.valid?
      expect(@users.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できないこと' do
      @users.email = nil
      @users.valid?
      expect(@users.errors.full_message).to include("Email can't be blank")
    end
    it 'emailに@がないと登録できないこと' do
      users.email =
        users.valid?
      expect(@users.errors.full_message).to include
    end
    it 'passwordが空だと登録できないこと' do
      users.password = nil
      users.valid?
      expect(@users.errors.full_message).to include
    end
    it 'passwordが5文字以下だと登録できないこと' do
      @users.password = '12345'
      @users.password_confirmation = '12345'
      @users.valid?
      expect(@users.errors.full_message).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字でないと登録できないこと' do
      @users.password =
        @users.valid?
      expect(@users.errors.full_message).to include
    end
    it 'passwordが6文字以上であれば登録できること' do
      @users.password = 'test123'
      @users.password_confirmation = 'test123'
      expect(@users).to be_valid
    end
    it 'passwordが存在してもpassword_confirmationが空だと登録できないこと' do
      @users.password_confirmation = 'test1'
      @users.valid?
      expect(@users.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空だと保存できないこと' do
      @users.first_name = nil
      @users.valid?
      expect(@users.errors.full_message).to include("First_name can't be blank")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @users.first_name = 'tanaka'
      @users.valid?
      expect(@users.errors.full_message).to include('First_name is invalid. Input full-width characters.')
    end
    it 'last_nameが空だと保存できないこと' do
      @users.last_name = nil
      @users.valid?
      expect(@users.errors.full_message).to include("Last_name can't be blank")
    end
    it 'last_nameが全角日本語でないと保存できないこと' do
      @users.last_name = 'tarou'
      @users.valid?
      expect(@users.errors.full_messages).to include('Last_name is invalid. Input full-width characters.')
    end
    it 'first_name_kanaが空だと保存できないこと' do
      @users.first_name_kana = nil
      @users.valid?
      expect(@users.errors.full_message).to include("First_name_kana can't be blank")
    end
    it 'first_name_kanaがカタカナでないと保存できないこと' do
      @users.first_name_kana = 'たなか'
      @users.valid?
      expect(@users.errors.full_message).to include('first_name_kana is invalid. Input full-width katakana characters.')
    end
    it 'last_name_kanaが空だと保存できないこと' do
      @users.last_name_kana = nil
      @users.valid?
      expect(@users.errors.full_message).to include("Last_name_kana can't be blank")
    end
    it 'last_name_kanaがカタカナでないと保存できないこと' do
      @users.last_namekana = 'たろう'
      @users.valid?
      expect(@users.errors.full_message).to include('Last_name_kana is invalid. Input full-width katakana characters.')
    end
    it 'birth_dateが空だと保存できないこと' do
      @users.birth_date = nil
      @users.valid?
      expect(@users.errors.full_message).to include("Birth_date can't be blank")
    end
  end
end
