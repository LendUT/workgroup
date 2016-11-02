class Member < ApplicationRecord
  before_save :default_values

  belongs_to :group, inverse_of: :members
  belongs_to :user,  inverse_of: :members
  has_many   :tasks, inverse_of: :member

  validates :group, presence: true
  validates :user,  presence: true

  private

    def default_values
      self.admin ||= false
    end
end
