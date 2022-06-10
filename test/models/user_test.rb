# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'フォローできるか？' do
    alice = User.create!(email: 'alice@example', password: 'alice_password')
    bob = User.create!(email: 'bob@example', password: 'bob_password')

    alice.follow(bob)
    assert alice.following?(bob)
  end

  test 'フォローされているか？' do
    alice = User.create!(email: 'alice@example', password: 'alice_password')
    bob = User.create!(email: 'bob@example', password: 'bob_password')

    alice.follow(bob)
    assert bob.followed_by?(alice)
  end

  test 'フォローを解除できるか？' do
    alice = User.create!(email: 'alice@example', password: 'alice_password')
    bob = User.create!(email: 'bob@example', password: 'bob_password')

    alice.follow(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test 'ユーザー名を表すのに、登録した名前かemailのどちらかを選択する' do
    user_fill_in_email = User.new(email: 'hoge@example', name: '')
    assert_equal 'hoge@example', user_fill_in_email.name_or_email

    user_fill_in_name = User.new(email: '', name: 'hoge')
    assert_equal 'hoge', user_fill_in_name.name_or_email

    user_fill_in_name_and_email = User.new(email: 'hoge@example', name: 'hoge')
    assert_equal 'hoge', user_fill_in_name_and_email.name_or_email
  end
end
