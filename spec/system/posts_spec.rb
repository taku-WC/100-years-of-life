require 'rails_helper'

describe'投稿のテスト' do
  let(:user){ create(:user) } #(!)呼び出された時 (create(:user)factories bot 呼び出し)
  let!(:user2) { create(:user, email:"test2@test2") } #（!について）あらかじめ
  let!(:post){ create(:post, user: user) }
  let!(:post){ create(:post, user: user2) }
  let!(:level_setting){ create(:level_setting)}
  before do
    visit new_user_session_path
    fill_in 'メールアドレス',with: user.email #with→入力値
    fill_in 'パスワード',with: user.password
    click_button 'ログイン'
  end
  it '新規投稿のテスト' do
    visit posts_path
    fill_in 'post-form', with: "投稿テスト"
    click_button '投稿'
    expect(page).to have_content "投稿テスト"
  end
  it'投稿に失敗する' do
    click_button'投稿'
    expect(posts_path).to eq('/posts')
  end
end
