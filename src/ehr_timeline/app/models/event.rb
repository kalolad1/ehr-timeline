class Event < ApplicationRecord
  belongs_to :patient
  belongs_to :provider
  enum event_type: {'routine physical': 0, visit: 1, surgery: 2, vaccination: 3, lab: 4}

  def self.generate_random_events(with_default)
    if with_default
      return self.get_default_events
    end
  end

  def self.get_default_events
    patient = Patient.new
    patient.name = 'Darshan Kalola'

    provider_one = Provider.new(
        name: 'Alexander Fleming',
        provider_type: 'physician')

    provider_two = Provider.new(
        name: 'Hippocrates',
        provider_type: 'physician'
    )

    provider_three = Provider.new(
        name: 'William Osler',
        provider_type: 'physician')

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
    return [event_one, event_two, event_three, event_four, event_five]
  end

  def get_month_and_date
    self.created_at.strftime("%B #{self.created_at.day.ordinalize}")
  end

  def get_year
    self.created_at.strftime('%Y')
  end

  def get_priority
    rand(4) + 1
  end

end