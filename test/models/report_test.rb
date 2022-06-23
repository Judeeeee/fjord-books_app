# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'ログインユーザーが作成した日報なら編集できる' do
    alice = User.create!(email: 'alice@example', password: 'alice_password')
    alice_report = Report.create!(title: 'アリスの日報', content: '本文だよ', user: alice)

    assert alice_report.editable?(alice)
  end

  test 'ログインユーザーが作成した日報以外は編集できない' do
    alice = User.create!(email: 'alice@example', password: 'alice_password')
    bob = User.create!(email: 'bob@example', password: 'bob_password')
    bob_report = Report.create!(title: 'ボブの日報', content: 'ボブの日報本文だよ', user: bob)

    assert_not_equal(alice.id, bob_report.user_id)
  end

  test '日報作成時間を、yyyy/mm/dd表記にする' do
    alice = User.create!(email: 'alice@example', password: 'alice_password')
    alice_report = Report.create!(title: 'アリスの日報', content: 'アリスの日報本文だよ', user: alice)
    today_time = Time.zone.now.to_date

    assert_equal(alice_report.created_at.to_date, today_time)
  end
end
