import { Pass } from "./Pass";

export function TicketRow({ idx, ticket, updateName, updateFastpass, type }) {
  return (
    <div className="row mt-4">
      <div className="col-5">
        <div className="form-group">
          <label htmlFor={`adult_${idx}`}>
            {type} {idx + 1}
          </label>
          <input
            type="text"
            className="form-control"
            id={`adult_${idx}`}
            value={ticket.name}
            onChange={(e) => updateName(e.target.value)}
          />
        </div>
        <div className="form-group form-check mt-3">
          <input
            type="checkbox"
            className="form-check-input"
            id={`fastpass_${idx}`}
            checked={ticket.fastpass}
            onChange={(e) => updateFastpass(e.target.checked)}
          />
          <label className="form-check-label" htmlFor={`fastpass_${idx}`}>
            + Fast Pass &gt;&gt;
          </label>
        </div>
      </div>
      <div className="col-7">
        <Pass name={ticket.name} fastpass={ticket.fastpass} />
      </div>
    </div>
  );
}
