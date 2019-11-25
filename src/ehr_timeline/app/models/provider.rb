class Provider < ApplicationRecord
  has_many :events
  enum provider_type: {
      'physician': 0,
      'physician assistant': 1,
      'nurse': 2,
      'administrator': 3,
      'lab technician': 4
  }

  def to_s
    self.name
  end
end