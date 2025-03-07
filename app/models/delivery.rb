# == Schema Information
#
# Table name: deliveries
#
#  id                    :bigint           not null, primary key
#  arrived               :boolean
#  description           :text
#  details               :text
#  supposed_to_arrive_on :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Delivery < ApplicationRecord
  belongs_to :user

  # def self.received
  #   Delivery.where({ :arrived => true })
  # end

  # def self.waiting_on
  #   Delivery.where({ :arrived => false })
  # end

  def updated_minutes_ago
    current_time = Time.now
    ((current_time - self.updated_at)/60).to_i
  end
end
