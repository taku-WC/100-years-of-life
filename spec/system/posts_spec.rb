require 'rails_helper'

describe'ホーム画面テスト' do
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
  it '投稿のテスト' do
    visit posts_path
    fill_in 'post-form', with: "投稿テスト"
    click_button '投稿'
    expect(page).to have_content "投稿テスト"
  end
  it'投稿に失敗するテスト' do
    visit posts_path
    click_button'投稿'
    expect(posts_path).to eq('/posts')
  end

  context'サイドバー確認' do
    it 'ホームが表示される' do
      visit posts_path
      expect(page).to have_content"ホーム"
    end
    it 'ホームのリンク先が正しい' do
      expect(page).to have_link'ホーム', href: posts_path
    end
    it 'プロフィールが表示される' do
      visit posts_path
      expect(page).to have_content"プロフィール"
    end
    it 'プロフィールのリンク先が正しい' do
      expect(page).to have_link'プロフィール', href: user_path(user)
    end
    it 'メンバーズが表示される' do
      visit posts_path
      expect(page).to have_content"メンバーズ"
    end
    it 'メンバーズのリンク先が正しい' do
      expect(page).to have_link'メンバーズ', href: users_path
    end
    it 'ログアウトが表示される' do
      visit posts_path
      expect(page).to have_content"ログアウト"
    end
  end

  context '投稿一覧の表示確認' do
    it 'ホームが表示される' do
      expect(page).to have_content'ホーム'
  end
  it '自分と他人の画像リンクが正しい' do
    expect(page).to have_link '', href: user_path(post.user)
    expect(page).to have_link '', href: user_path(post.user2)
  end
  it '削除リンクの表示' do
    visit post_path post
    expect(page).to have_link '', href: post_path(post.user)
  end
end
