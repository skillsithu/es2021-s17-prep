import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { api } from "../api";

export function List() {
  const [events, setEvents] = useState([]);

  // Get Events from api
  useEffect(() => {
    api.get("events").then(({ data }) =>
      setEvents(
        data
          .map((event) => ({
            ...event,
            date: new Date(event.date).toDateString(),
          }))
          .sort((a, b) => new Date(a.date) - new Date(b.date))
      )
    );
  }, []);

  return (
    <div>
      {events.map((event) => (
        <Link
          to={`/agenda/${event.organizer.slug}/${event.slug}`}
          className="event text-reset text-decoration-none"
          key={event.id}
        >
          <div className="card mb-4">
            <div className="card-body">
              <h5 className="card-title">{event.name}</h5>
              <p className="card-text">
                Organizer: {event.organizer.name}, {event.date}
              </p>
            </div>
          </div>
        </Link>
      ))}
    </div>
  );
}
