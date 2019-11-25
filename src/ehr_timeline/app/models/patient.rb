class Patient < ApplicationRecord
  has_many :events

  def to_s
    self.name
  end
end