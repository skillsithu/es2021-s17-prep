import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import { api } from "../api";

export function Agenda() {
  // Use url params
  const params = useParams();

  // Store the event data
  const [event, setEvent] = useState();

  // Fetch the event data from api
  useEffect(() => {
    api
      .get(`organizers/${params.organizer}/events/${params.event}`)
      .then(({ data }) => {
        setEvent(data);
      });
  }, [params]);

  if (!event) return <></>;

  return (
    <div className="card">
      <div className="card-body">
        {/* Card header */}
        <div className="d-flex justify-content-between align-items-center mb-4">
          <h4>{event.name}</h4>
          <Link
            to={`/register/${params.organizer}/${params.event}`}
            id="register"
          >
            <button type="button" className="btn btn-outline-primary login-btn">
              Register for this event
            </button>
          </Link>
        </div>

        {/* Render the agenda header */}
        <div className="row border-bottom mb-1">
          <div className="col-4"></div>
          <div className="col-2">9:00</div>
          <div className="col-2">11:00</div>
          <div className="col-2">13:00</div>
          <div className="col-2">15:00</div>
        </div>

        {/* Render the agenda */}
        {event.channels.map((channel) => {
          return (
            <div className="row border-bottom" key={channel.id}>
              <div className="col-2 py-1 my-1 channel">{channel.name}</div>
              <div className="col-2">
                {channel.rooms.map((room) => {
                  return (
                    <div key={room.id} className="room p-1 my-1">
                      {room.name}
                    </div>
                  );
                })}
              </div>

              <div className="col-8">
                {channel.rooms.map((room) => {
                  return (
                    <div key={room.id}>
                      {room.sessions.map((session) => {
                        return (
                          <Link
                            to={`/session/${params.organizer}/${params.event}/${session.id}`}
                            className="session my-1 mr-1 d-inline-block text-reset border p-1"
                            key={session.id}
                          >
                            {session.title}
                          </Link>
                        );
                      })}
                    </div>
                  );
                })}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
