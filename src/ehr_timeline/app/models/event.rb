class Event < ApplicationRecord
  enum type: {routine_physical: 0, visit: 1, surgery: 2, vaccination: 3, lab: 4}

end