export function EditLabels({ position, updatePosition }) {
  return (
    <>
      <div className="form-group mt-3">
        <label htmlFor="link1">Link Label at 1</label>
        <input
          type="text"
          className="form-control"
          id="link1"
          value={position.e1 ?? ""}
          onChange={(e) => updatePosition({ ...position, e1: e.target.value })}
        />
      </div>

      <div className="form-group mt-3">
        <label htmlFor="link2">Link Label at 2</label>
        <input
          type="text"
          className="form-control"
          id="link2"
          value={position.e2 ?? ""}
          onChange={(e) => updatePosition({ ...position, e2: e.target.value })}
        />
      </div>

      <div className="form-group mt-3">
        <label htmlFor="link3">Link Label at 3</label>
        <input
          type="text"
          className="form-control"
          id="link3"
          value={position.e3 ?? ""}
          onChange={(e) => updatePosition({ ...position, e3: e.target.value })}
        />
      </div>

      <div className="form-group mt-3">
        <label htmlFor="link4">Link Label at 4</label>
        <input
          type="text"
          className="form-control"
          id="link4"
          value={position.e4 ?? ""}
          onChange={(e) => updatePosition({ ...position, e4: e.target.value })}
        />
      </div>
    </>
  );
}
