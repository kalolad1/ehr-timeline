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
    return nil
  end

  def self.get_default_events
    patient = Patient.new
    patient.name = 'Darshan Kalola'
    patient.save

    provider_one = Provider.new(
        name: 'Alexander Fleming',
        provider_type: 'physician')
    provider_one.save

    provider_two = Provider.new(
        name: 'Hippocrates',
        provider_type: 'physician'
    )
    provider_two.save

    provider_three = Provider.new(
        name: 'William Osler',
        provider_type: 'physician')
    provider_three.save

    event_one = Event.new(
        patient: patient,
        provider: provider_one,
        event_type: "vaccination",
        created_at: "1998-04-15 00:00:00",
        note: "On this day, baby Darshan received 5 painful vaccinations. He
              cried profusely.")

    event_two = Event.new(
        patient: patient,
        provider: provider_two,
        event_type: "routine physical",
        created_at: "2001-02-12 00:00:00",
        note: "Young boul Darshan went to the doctor's for a routine physical.
              All was well.")

    event_three = Event.new(
        patient: patient,
        provider: provider_three,
        event_type: "surgery",
        created_at: "2004-12-25 00:00:00",
        note: "On the blessed day of Christmas, poor Darshan had surgery. His
               appendix was removed, much to his dismay. He loved that thing
               like it was his kidney.")

    event_four = Event.new(
        patient: patient,
        provider: provider_one,
        event_type: 'visit',
        created_at: '2016-10-31 00:00:00',
        note: "After ingesting 2lbs of chocolate, Darshan makes a trip to the
              doctor's office. The physician prescribes antibiotics, because he
              trusts the US Research and Development sector more than he trusts
              the bacteria's ability to become resistant.")

    event_five = Event.new(
        patient: patient,
        provider: provider_two,
        event_type: 'lab',
        created_at: '2019-11-25 00:00:00',
        note: 'Darshan worked so hard on the OSS project that his platelet count
              dropped dangerously low. His doctor ordered some blood work.
              Lucky for him, he has enough platelets to give this
              presentation.')

    event_one.save
    event_two.save
    event_three.save
    event_four.save
    event_five.save
    return [event_one, event_two, event_three, event_four, event_five]
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
    priority = priorities.sum
    if priority > 4
      priority = 4
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
    0
  end

  def calc_procedure_priority
    0
  end

  def calc_prescription_priority
    0
  end

end