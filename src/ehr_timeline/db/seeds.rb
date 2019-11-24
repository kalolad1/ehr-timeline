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



