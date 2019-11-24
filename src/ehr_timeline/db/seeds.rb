# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed of patients
patients = Patient.create(
    [
        {name: 'Darshan'},
        {name: 'Bob'},
        {name: 'Alice'},
        {name: 'Emma'},
        {name: 'Olivia'},
        {name: 'Ava'},
        {name: 'Sophia'},
        {name: 'Charlotte'},
    ]
)
providers = Provider.create(
[
    {name: 'Alexander', provider_type: 'physician'},
    {name: 'Liam', provider_type: 'physician'},
    {name: 'William', provider_type: 'physician'},
    {name: 'Claire', provider_type: 'physician'},

    {name: 'Benjamin', provider_type: 'physician assistant'},
    {name: 'Lucas', provider_type: 'nurse'},
    {name: 'Henry', provider_type: 'administrator'},
    {name: 'Skylar', provider_type: 'lab technician'},
  ]
)
prescriptions = Prescription.create(
    [
        {name: 'levothyroxine', priority: 0},
        {name: 'rosuvastatin', priority: 1},
        {name: 'albuterol', priority: 2},
        {name: 'esomeprazole', priority: 0},
        {name: 'fluticasone', priority: 1},
        {name: 'insulin glargine', priority: 2},
        {name: 'lisdexamfetamine', priority: 0},
        {name: 'pregabalin', priority: 1},
    ]
)
symptoms = Symptom.create(
    [
        {name: 'chills', priority: 0},
        {name: 'fever', priority: 1},
        {name: 'headache', priority: 2},
        {name: 'swelling', priority: 0},
        {name: 'inflammation', priority: 1},
        {name: 'nose bleed', priority: 2},
        {name: 'coughing', priority: 0},
        {name: 'stuffy nose', priority: 1},
    ]
)
procedures = Symptom.create(
    [
        {name: 'lumbar puncture', priority: 1},
        {name: 'ppd test', priority: 2},
        {name: 'blood test', priority: 3},
        {name: 'appendix removal', priority: 1},
        {name: 'eye exam', priority: 2},
        {name: 'vaccination', priority: 3},
        {name: 'biopsy', priority: 1},
        {name: 'c section', priority: 2},
    ]
)
