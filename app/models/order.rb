class Order < ApplicationRecord
    attr_accessor :token
  
    belongs_to :user
    belongs_to :lesson
    has_one :adress
  end
  