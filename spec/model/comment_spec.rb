require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    context 'commentカラム' do
      it "空欄でないこと" do
        comment = build(:comment, comment: nil)
        comment.valid?
        expect(comment.errors[:comment]).to include("を入力してください")
      end
      it "500文字以下であること" do
        comment = build(:comment, comment: "a"*501)
        comment.valid?
        expect(comment.errors[:comment]).to include("は500文字以内で入力してください")
      end
    end
  end
end