import { useEffect, useMemo, useState } from "react";
import { useHistory, useParams } from "react-router-dom";
import { api } from "../api";

export function Register({ isLoggedIn }) {
  // Use url params
  const params = useParams();
  const history = useHistory();

  // Store the event data
  const [event, setEvent] = useState();
  const [ticket, setTicket] = useState();
  const [selectedWs, setSelectedWs] = useState([]);

  // Calculate additional cost
  const additionalCost = useMemo(() => {
    return selectedWs.reduce((sum, ws) => sum + parseInt(ws.cost, 10), 0);
  }, [selectedWs]);

  // Calculate ticket cost
  const ticketCost = useMemo(() => {
    return ticket ? parseInt(ticket.cost, 10) : 0;
  }, [ticket]);

  // workshops list
  const workshops = useMemo(() => {
    let ws = [];

    // search for workshop-type sessions
    event?.channels.forEach((channel) =>
      channel.rooms.forEach((room) =>
        room.sessions.forEach((session) => {
          if (session.type === "workshop") {
            ws.push(session);
          }
        })
      )
    );

    return ws;
  }, [event]);

  // Toggle selected workshops
  const toggleWs = (ws) => {
    if (selectedWs.includes(ws)) {
      setSelectedWs(selectedWs.filter((s) => s.id !== ws.id));
    } else {
      setSelectedWs([...selectedWs, ws]);
    }
  };

  // Register api call
  const register = () => {
    api
      .post(
        `organizers/${params.organizer}/events/${params.event}/registration`,
        { ticket_id: ticket.id, session_ids: selectedWs.map(({ id }) => id) }
      )
      .then(() => {
        alert("Registration successful");
        history.push(`/agenda/${params.organizer}/${params.event}`);
      });
  };

  // Fetch the event data from api
  useEffect(() => {
    api
      .get(`organizers/${params.organizer}/events/${params.event}`)
      .then(({ data }) => {
        setEvent(data);
      });
  }, [params]);

  // Check if logged in
  useEffect(() => {
    if (!isLoggedIn) {
      history.push("/login");
    }
  }, [history, isLoggedIn]);

  if (!event) return <></>;

  return (
    <div className="card">
      <div className="card-body">
        {/* Card header */}
        <div className="d-flex justify-content-between align-items-center mb-4">
          <h4>{event.name}</h4>
        </div>

        {/* Tickets */}
        <h5 className="font-weight-normal">Select your ticket</h5>
        <div className="row">
          {event.tickets.map((ticket) => {
            return (
              <div className="col-4 mb-3" key={ticket.id}>
                <div className="card shadow-sm">
                  <div className="card-body">
                    {/* Ticket radio */}
                    <div className="form-check">
                      <input
                        className="form-check-input ticket"
                        type="radio"
                        name="ticket"
                        id={`ticket${ticket.id}`}
                        value={ticket.id}
                        disabled={!ticket.available}
                        onChange={() => setTicket(ticket)}
                      />

                      {/* Ticket radio label */}
                      <label
                        className="form-check-label"
                        htmlFor={`ticket${ticket.id}`}
                      >
                        <h5 className="card-title">
                          {ticket.name} - {ticket.cost}.-
                        </h5>
                        <p className="card-text">
                          {ticket.available
                            ? ticket.description
                            : "Unavailable"}
                          &nbsp;
                        </p>
                      </label>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>

        {/* Workshops */}
        <div className="row">
          <div className="col-6">
            <h5 className="font-weight-normal mt-3">
              Select additional workshops you want to book
            </h5>

            {workshops.map((workshop) => {
              return (
                <div className="form-check" key={workshop.id}>
                  <input
                    className="form-check-input workshop"
                    type="checkbox"
                    value={workshop.id}
                    id={`ws${workshop.id}`}
                    onChange={() => toggleWs(workshop)}
                  />
                  <label
                    className="form-check-label"
                    htmlFor={`ws${workshop.id}`}
                  >
                    {workshop.title} - {workshop.cost}.-
                  </label>
                </div>
              );
            })}
          </div>
          <div className="col-6">
            {/* Checkout */}
            <h5 className="mt-3 pr-3 text-right">Checkout</h5>

            <div className="d-flex justify-content-end">
              <table className="table w-auto">
                <tbody>
                  <tr>
                    <td>Event ticket</td>
                    <td id="event-cost">{ticketCost}.-</td>
                  </tr>
                  <tr>
                    <td>Additional workshops</td>
                    <td id="additional-cost">{additionalCost}.-</td>
                  </tr>
                  <tr>
                    <th>Total</th>
                    <th id="total-cost">{ticketCost + additionalCost}.-</th>
                  </tr>
                </tbody>
              </table>
            </div>

            <div className="pr-3 text-right">
              <button
                type="button"
                className="btn btn-primary"
                id="purchase"
                onClick={register}
                disabled={!ticket}
              >
                Purchase
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
