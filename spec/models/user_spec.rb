require 'rails_helper'

describe User do
  describe '#create' do
    it 'is invalid without a name' do
      user = User.new(first_name: "",last_name:"", kana_first_name:"",kana_last_name:"",email: "test@email.com",
                      phone_number: "090-1234-5678",password: "11111111", password_confirmation: "11111111")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  end
end