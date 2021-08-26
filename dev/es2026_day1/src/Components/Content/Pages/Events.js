import { useState } from "react";
import banner from "../../../img/banner.jpeg";
import "./Events.scss";

export function Events() {
  const [events] = useState([
    {
      title: "Upcoming theme park opening in Lisbon in 2018.",
      date: "2016-12-01",
      description: "Read some intro about the event.",
    },
    {
      title: "Christmas Party month",
      date: "2016-11-28",
      description: "Read some intro about the event.",
    },
    {
      title: "Q4 financial report to be announced on Feb 2017",
      date: "2016-11-25",
      description: "Read some intro about the event.",
    },
    {
      title: "Q3 financial report is ready",
      date: "2016-11-04",
      description: "Read some intro about the event.",
    },
  ]);

  return (
    <div className="events">
      <div className="row m-2">
        {events.map((event, idx) => (
          <div className="col-12 col-md-6 col-lg-4 mb-4" key={idx}>
            <div className="card shadow-sm">
              <img src={banner} className="card-img-top" alt={event.title} />
              <div className="card-body">
                <h5 className="card-title">{event.title}</h5>
                <h6 className="card-subtitle mb-2 text-muted">{event.date}</h6>
                <p className="card-text">{event.description}</p>
                <button className="btn btn-secondary">Visit Event</button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
