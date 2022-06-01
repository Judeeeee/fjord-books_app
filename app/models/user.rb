# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_relationships, class_name: "Userrelationship"
  has_many :passive_relationships, class_name: "Userrelationship"
end
