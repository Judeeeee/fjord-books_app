# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase # rubocop:disable Metrics/ClassLength
  setup do
    @report = reports(:alice_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the reports page' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'アリスの日報'
    fill_in '内容', with: '今日は天気がよかった〜！'
    click_button '登録する'
    assert_text '日報が作成されました。'
    assert Report.exists?(title: "アリスの日報")
    assert_text 'アリスの日報'
  end

  test 'creating a Report but fill in title only' do
    visit new_report_path
    fill_in 'タイトル', with: 'アリスの日報'
    fill_in '内容', with: ''
    click_button '登録する'
    assert_text '内容を入力してください'
  end

  test 'creating a Report but fill in content only' do
    visit new_report_path
    fill_in 'タイトル', with: ''
    fill_in '内容', with: '今日は天気がよかった〜！'
    click_button '登録する'
    assert_text 'タイトルを入力してください'
  end

  test 'creating a Report but do not fill in form' do
    visit new_report_path
    fill_in 'タイトル', with: ''
    fill_in '内容', with: ''
    click_button '登録する'
    assert_text 'タイトルを入力してください'
    assert_text '内容を入力してください'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', match: :prefer_exact
    fill_in 'タイトル', with: 'ありすのにっぽう'
    fill_in '内容', with: 'きょうはてんきがよかった〜！'
    click_button '更新する'
    assert_text '日報が更新されました。'
    assert Report.exists?(title: "ありすのにっぽう")
    assert_text 'ありすのにっぽう'
  end

  test 'updating a Report but fill in title only' do
    visit edit_report_url(@report)
    fill_in 'タイトル', with: 'ありすのにっぽう'
    fill_in '内容', with: ''
    click_button '更新する'
    assert_text '内容を入力してください'
  end

  test 'updating a Report but fill in content only' do
    visit edit_report_url(@report)
    fill_in 'タイトル', with: ''
    fill_in '内容', with: 'きょうはてんきがよかった〜！'
    click_button '更新する'
    assert_text 'タイトルを入力してください'
  end

  test 'updating a Report but do not fill in form' do
    visit edit_report_url(@report)
    fill_in 'タイトル', with: ''
    fill_in '内容', with: ''
    click_button '更新する'
    assert_text 'タイトルを入力してください'
    assert_text '内容を入力してください'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '日報が削除されました。'
    assert_not Report.exists?(title: "MyString")
  end

  test 'move from create report page to reports page' do
    visit new_report_path
    click_on '戻る'
  end

  test 'move from updating report page to reports page' do
    visit edit_report_url(@report)
    click_on '戻る'
  end

  test 'visiting the report page' do
    visit reports_url
    click_on '詳細', match: :first
    assert_selector 'h1', text: '日報の詳細'
  end

  test 'move from report page to reports page' do
    visit report_url(@report)
    click_on '編集', match: :prefer_exact
    click_on '戻る'
  end

  test 'move from updating report page to report page' do
    visit edit_report_url(@report)
    click_on '詳細', match: :first
    click_on '戻る'
  end
end
