class Experiment < ActiveRecord::Base
  include AASM
  belongs_to :researcher, class_name: "User"
  belongs_to :proposal
  has_many :comments, as: :commentable
  has_many :observations

  validates :title, :observations, presence: true

  aasm column: 'status' do
    ###
  end
end
