class Goal < ActiveRecord::Base
  validates :content, :user_id, presence: true
  validates :privated, :completed, inclusion: [true, false]

  belongs_to :user

end
