class Provider < ApplicationRecord
  has_many :events
  enum provider_type: {
      'physician': 0,
      'physician_assistant': 1,
      'nurse': 2,
      'administrator': 3,
      'lab_technician': 4
  }
end