# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
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
    click_on '戻る'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: 'ありすのにっぽう'
    fill_in '内容', with: 'きょうはてんきがよかった〜！'
    click_button '更新する'

    assert_text '日報が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end


  test 'move from create report page to reports page' do
    visit new_report_path
    click_on '戻る'
  end

  test 'move from updating report page to reports page' do
    visit edit_report_url(@report)
    click_on '戻る'
  end


end
