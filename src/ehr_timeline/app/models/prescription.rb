class Prescription < ApplicationRecord
  belongs_to :event, optional: true

  def to_s
    self.name
  end

  def self.generate_random_prescriptions
    n = rand(3)
    prescription_ids = Prescription.pluck(:id)
    prescriptions = []
    (0...n).each do |i|
      prescriptions.push(Prescription.find(prescription_ids.sample))
    end
    return prescriptions.uniq
  end
end