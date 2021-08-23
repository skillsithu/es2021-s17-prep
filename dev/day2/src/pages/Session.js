import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { api } from "../api";

export function Session() {
  // Use url params
  const params = useParams();

  // Store the session data
  const [session, setSession] = useState();

  // Fetch the event data from api, then search session
  useEffect(() => {
    api
      .get(`organizers/${params.organizer}/events/${params.event}`)
      .then(({ data }) => {
        let session;

        // search for selected session
        data.channels.forEach((channel) =>
          channel.rooms.forEach((room) =>
            room.sessions.forEach((s) => {
              if (parseInt(s.id, 10) === parseInt(params.session, 10)) {
                session = s;
              }
            })
          )
        );

        setSession(session);
      });
  }, [params]);

  if (!session) return <></>;

  return (
    <div className="card">
      <div className="card-body">
        <h4>
          {session.title} - {session.type}
        </h4>
        <p>{session.description}</p>

        <div className="row">
          <div className="col-2">Speaker</div>
          <div className="col">{session.speaker}</div>
        </div>

        <div className="row">
          <div className="col-2">Start</div>
          <div className="col">{session.start}</div>
        </div>

        <div className="row">
          <div className="col-2">End</div>
          <div className="col">{session.end}</div>
        </div>

        {session.cost && (
          <div className="row">
            <div className="col-2">Cost</div>
            <div className="col">{session.cost}</div>
          </div>
        )}
      </div>
    </div>
  );
}
