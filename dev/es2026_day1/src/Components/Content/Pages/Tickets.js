import { useState } from "react";
import { api } from "../../../api";
import { TicketRow } from "./Elements/TicketRow";
import "./Tickets.scss";

export function Tickets() {
  const [adults, setAdults] = useState(0);
  const [children, setChildren] = useState(0);
  const [seniors, setSeniors] = useState(0);

  const [adultTickets, setAdultTickets] = useState([]);
  const [childrenTickets, setChildrenTickets] = useState([]);
  const [seniorTickets, setSeniorTickets] = useState([]);

  // Check if every ticket is fastpass
  const isEveryFastpass = () => {
    return (
      adultTickets.every(({ fastpass }) => fastpass) &&
      childrenTickets.every(({ fastpass }) => fastpass) &&
      seniorTickets.every(({ fastpass }) => fastpass) &&
      (adultTickets.length > 0 ||
        childrenTickets.length > 0 ||
        seniorTickets.length > 0)
    );
  };
  const isNoneFastpass = () => {
    return (
      adultTickets.every(({ fastpass }) => !fastpass) &&
      childrenTickets.every(({ fastpass }) => !fastpass) &&
      seniorTickets.every(({ fastpass }) => !fastpass) &&
      (adultTickets.length > 0 ||
        childrenTickets.length > 0 ||
        seniorTickets.length > 0)
    );
  };

  // Handle count update
  const updateTickets = (value, setter, tickets, ticketsSetter) => {
    const n = parseInt(value, 10);
    setter(n);

    if (tickets.length < n) {
      ticketsSetter([
        ...tickets,
        ...Array(n - tickets.length).fill({
          name: "",
          fastpass: isEveryFastpass(),
        }),
      ]);
    } else {
      ticketsSetter(tickets.slice(0, n));
    }
  };

  // Handle value update
  const updateTicket = (field, value, idx, tickets, ticketsSetter) => {
    ticketsSetter([
      ...tickets.slice(0, idx),
      {
        ...tickets[idx],
        [field]: value,
      },
      ...tickets.slice(idx + 1, tickets.length),
    ]);
  };

  // Handle fastpass update
  const doubleCheckFastpass = (check) => {
    if (isNoneFastpass() && check) {
      setAdultTickets(adultTickets.map((t) => ({ ...t, fastpass: true })));
      setChildrenTickets(
        childrenTickets.map((t) => ({ ...t, fastpass: true }))
      );
      setSeniorTickets(seniorTickets.map((t) => ({ ...t, fastpass: true })));
      return false;
    }
    return true;
  };

  // Handle submit
  const handleSubmit = () => {
    const tickets = [
      ...adultTickets.map((t) => ({ ...t, type: "adult" })),
      ...childrenTickets.map((t) => ({ ...t, type: "child" })),
      ...seniorTickets.map((t) => ({ ...t, type: "senior" })),
    ];

    const formD = new FormData();
    formD.append("tickets", JSON.stringify(tickets));

    api.post("/	form-handler.php", formD);
  };

  return (
    <div className="tickets-container">
      <p>Amount of Guests</p>
      <div className="row">
        <div className="col-4">
          <div className="form-group">
            <label htmlFor="adults">Adult:</label>
            <input
              type="number"
              min={0}
              className="form-control"
              id="adults"
              value={adults}
              onChange={(e) =>
                updateTickets(
                  e.target.value,
                  setAdults,
                  adultTickets,
                  setAdultTickets
                )
              }
            />
          </div>
        </div>
        <div className="col-4">
          <div className="form-group">
            <label htmlFor="children">Children:</label>
            <input
              type="number"
              min={0}
              className="form-control"
              id="children"
              value={children}
              onChange={(e) =>
                updateTickets(
                  e.target.value,
                  setChildren,
                  childrenTickets,
                  setChildrenTickets
                )
              }
            />
          </div>
        </div>
        <div className="col-4">
          <div className="form-group">
            <label htmlFor="seniors">Senior:</label>
            <input
              type="number"
              min={0}
              className="form-control"
              id="seniors"
              value={seniors}
              onChange={(e) =>
                updateTickets(
                  e.target.value,
                  setSeniors,
                  seniorTickets,
                  setSeniorTickets
                )
              }
            />
          </div>
        </div>
      </div>

      {adultTickets.map((ticket, idx) => (
        <TicketRow
          type="Adult"
          key={idx}
          idx={idx}
          ticket={ticket}
          updateName={(value) =>
            updateTicket("name", value, idx, adultTickets, setAdultTickets)
          }
          updateFastpass={(value) => {
            if (doubleCheckFastpass(value)) {
              updateTicket(
                "fastpass",
                value,
                idx,
                adultTickets,
                setAdultTickets
              );
            }
          }}
        />
      ))}
      {childrenTickets.map((ticket, idx) => (
        <TicketRow
          type="Child"
          key={idx}
          idx={idx}
          ticket={ticket}
          updateName={(value) =>
            updateTicket(
              "name",
              value,
              idx,
              childrenTickets,
              setChildrenTickets
            )
          }
          updateFastpass={(value) => {
            if (doubleCheckFastpass(value)) {
              updateTicket(
                "fastpass",
                value,
                idx,
                childrenTickets,
                setChildrenTickets
              );
            }
          }}
        />
      ))}
      {seniorTickets.map((ticket, idx) => (
        <TicketRow
          type="Senior"
          key={idx}
          idx={idx}
          ticket={ticket}
          updateName={(value) =>
            updateTicket("name", value, idx, seniorTickets, setSeniorTickets)
          }
          updateFastpass={(value) => {
            if (doubleCheckFastpass(value)) {
              updateTicket(
                "fastpass",
                value,
                idx,
                seniorTickets,
                setSeniorTickets
              );
            }
          }}
        />
      ))}

      <button
        className="btn btn-lg btn-outline-secondary w-100 mt-4"
        onClick={handleSubmit}
      >
        Checkout and Confirm the tickets
      </button>
    </div>
  );
}
