require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
    context 'postカラム' do
      it "空欄でないこと" do
        post = build(:post, post: nil)
        post.valid?
        expect(post.errors[:post]).to include("を入力してください")
      end
      it "500文字以下であること" do
        post = build(:post, post: "a"*501)
        post.valid?
        expect(post.errors[:post]).to include("は500文字以内で入力してください")
      end
    end
  end
end