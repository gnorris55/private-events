class EventAttendee < ApplicationRecord
    belongs_to :attendee_of_event, class_name: "User"
    belongs_to :attended_event, class_name: "Event"
end
