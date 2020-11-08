require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'nameカラム' do
      it "空欄でないこと" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
      it "15文字以下であること" do
        user = build(:user, name: "012345678901234567890")
        user.valid?
        expect(user.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context 'profileカラム' do
      it "100文字以内であること" do
        user = build(:user, profile: "a"*101)
        user.valid?
        expect(user.errors[:profile]).to include("は100文字以内で入力してください")
      end
    end
  end
end