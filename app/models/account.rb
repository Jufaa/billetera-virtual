class Account < ActiveRecord::Base
    belongs_to :user
    has_many :card
    has_many :transfers
end
