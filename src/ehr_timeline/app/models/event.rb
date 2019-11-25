class Event < ApplicationRecord
  belongs_to :patient
  belongs_to :provider
  enum event_type: {
      'routine physical': 0,
      'visit': 1,
      'surgery': 2,
      'vaccination': 3,
      'lab': 4
  }

  has_many :symptoms
  has_many :procedures
  has_many :prescriptions

  def self.generate_random_events
    n = 10
    events = []
    patient_ids = Patient.pluck(:id)
    patient = Patient.find(patient_ids.sample)
    (0...n).each do |i|
        event = self.generate_random_event
        event.patient = patient
        events.push(event)
    end
    return events
  end

  def self.generate_random_event
    event = Event.new

    provider_ids = Provider.pluck(:id)

    event.provider = Provider.find(provider_ids.sample)
    event.event_type = self.event_types[event_types.keys.sample]
    event.created_at = rand(20.years).seconds.ago

    event.symptoms = Symptom.generate_random_symptoms
    event.procedures = Procedure.generate_random_procedures
    event.prescriptions = Prescription.generate_random_prescriptions
    return event
  end

  def get_month_and_date
    self.created_at.strftime("%B #{self.created_at.day.ordinalize}")
  end

  def get_year
    self.created_at.strftime('%Y')
  end

  def get_priority
    priorities = [
        self.calc_event_type_priority,
        self.calc_symptom_priority,
        self.calc_procedure_priority,
        self.calc_prescription_priority,
        self.calc_provider_priority,
    ]
    priority = priorities.sum / 2

    if priority > 4
      priority = 4
    elsif priority < 1
      priority = 1
    end
    return priority
  end

  def calc_event_type_priority
      if self.event_type == 'routine physical'
        return 1
      elsif self.event_type == 'vaccination'
        return 1
      elsif self.event_type == 'surgery'
        return 4
      elsif self.event_type == 'lab'
        return 1
      elsif self.event_type == 'visit'
        return 1
      end
  end

  def calc_provider_priority
    if self.provider.provider_type == 'physician'
      return 1
    end
    return 0
  end

  def calc_symptom_priority
    if self.symptoms.blank?
      return 0
    end

    priority = 0
    self.symptoms.each do |symptom|
      priority += symptom.priority
    end
    return priority
  end

  def calc_procedure_priority
    if self.procedures.blank?
      return 0
    end

    priority = 0
    self.procedures.each do |procedure|
      priority += procedure.priority
    end
    return priority
  end

  def calc_prescription_priority
    if self.prescriptions.blank?
      return 0
    end

    priority = 0
    self.prescriptions.each do |prescription|
      priority += prescription.priority
    end
    return priority
  end

  def self.order_by_occurrence(events)
    events = events.sort_by {
      |event| event.created_at.to_i
    }.reverse!
    return events
  end

  def to_s
    event_note = ""
    event_note += "On " + self.get_month_and_date + ", " + self.get_year + ",
                  " + self.patient.name + " met with " +
                  self.provider.name + ". "
    event_note += "The event was of type " + self.event_type + ". "
    if self.symptoms.present?
      event_note += "The symptoms recorded were: "
      self.symptoms.each_with_index do |symptom, index|
        if index == 0
          event_note += symptom.name
        else
          event_note += ", " + symptom.name
        end
      end
      event_note += ". "
    end

    if self.procedures.present?
      event_note += "The procedures done were: "
      self.procedures.each_with_index do |procedure, index|
        if index == 0
          event_note += procedure.name
        else
          event_note += ", " + procedure.name
        end
      end
      event_note += ". "
    end

    if self.prescriptions.present?
      event_note += "The prescriptions given were: "
      self.prescriptions.each_with_index do |prescription, index|
        if index == 0
          event_note += prescription.name
        else
          event_note += ", " + prescription.name
        end
      end
      event_note += ". "
    end

    return event_note
  end
end