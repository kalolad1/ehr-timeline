class Procedure < ApplicationRecord
  belongs_to :event, optional: true

  def to_s
    self.name
  end

  def self.generate_random_procedures
    # Generates random procedures.
    n = rand(3)
    procedure_ids = Procedure.pluck(:id)
    procedures = []
    (0...n).each do |i|
      procedures.push(Procedure.find(procedure_ids.sample))
    end
    return procedures.uniq
  end
end