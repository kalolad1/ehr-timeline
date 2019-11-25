class Symptom < ApplicationRecord
  belongs_to :event, optional: true

  def to_s
    self.name
  end

  def self.generate_random_symptoms
    n = rand(3)
    symptom_ids = Symptom.pluck(:id)
    symptoms = []
    (0...n).each do |i|
      symptoms.push(Symptom.find(symptom_ids.sample))
    end
    return symptoms.uniq
  end
end