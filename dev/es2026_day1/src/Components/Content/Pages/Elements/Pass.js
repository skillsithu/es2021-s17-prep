import "./Pass.scss";

export function Pass({ name, fastpass }) {
  return (
    <div className={`pass ${fastpass ? "fastpass" : ""}`}>
      <div className="pass-name">{name}</div>
      <div className="pass-start"></div>
      <div className="pass-middle"></div>
      <div className="pass-end"></div>
    </div>
  );
}
