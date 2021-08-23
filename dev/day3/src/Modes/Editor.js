import { useEffect, useRef, useState } from "react";
import { Element } from "../Components/Element";

export function Editor() {
  const [positions, setPositions] = useState([]);
  const [links, setLinks] = useState([]);
  // This is used to store manual link creation
  const [manual, setManual] = useState();
  const canvasRef = useRef();

  // Positions on load
  useEffect(() => {
    const p = localStorage.getItem("positions");
    const l = localStorage.getItem("links");

    if (p && l) {
      setPositions(JSON.parse(p));
      setLinks(JSON.parse(l));
    } else {
      setPositions([
        { x: window.innerWidth / 2, y: window.innerHeight / 2, n: 1 },
      ]);
      setLinks([]);
    }
  }, []);

  // Save to localstorage
  useEffect(() => {
    localStorage.setItem("positions", JSON.stringify(positions));
    localStorage.setItem("links", JSON.stringify(links));
  }, [positions, links]);

  // Check if there is a link at a direction
  const hasLinkAt = (n, e) => {
    return !!links.some(
      (link) =>
        (link.n1 === n && link.n1e === e) || (link.n2 === n && link.n2e === e)
    );
  };

  // Add new element, calculate position and link with parent
  const addElement = (position, direction) => {
    const n = Math.max(...positions.map(({ n }) => n)) + 1;
    let newPos, n1e, n2e;
    switch (direction) {
      case "e1":
        if (hasLinkAt(position.n, "e1")) return;

        n1e = "e1";
        n2e = "e3";
        newPos = { x: position.x, y: position.y - 180, n };
        break;
      case "e2":
        if (hasLinkAt(position.n, "e2")) return;

        n1e = "e2";
        n2e = "e4";
        newPos = { x: position.x + 180, y: position.y, n };
        break;
      case "e3":
        if (hasLinkAt(position.n, "e3")) return;

        n1e = "e3";
        n2e = "e1";
        newPos = { x: position.x, y: position.y + 180, n };
        break;
      case "e4":
        if (hasLinkAt(position.n, "e4")) return;

        n1e = "e4";
        n2e = "e2";
        newPos = { x: position.x - 180, y: position.y, n };
        break;
      default:
        break;
    }

    setPositions([...positions, newPos]);
    setLinks([...links, { n1: position.n, n1e, n2: newPos.n, n2e }]);
  };

  // Remove elements and its relations
  const removeElement = (position) => {
    setLinks([
      ...links.filter(
        ({ n1, n2 }) => !(n1 === position.n || n2 === position.n)
      ),
    ]);
    setPositions([...positions.filter(({ n }) => n !== position.n)]);
  };

  // Manual link creation
  const addLinkManual = (link) => {
    setLinks([...links, link]);
    setManual(undefined);
  };

  // Update element position
  const updatePosition = (newPos) => {
    setPositions([
      ...positions.map((pos) => {
        if (pos.n === newPos.n) {
          return newPos;
        } else {
          return pos;
        }
      }),
    ]);
  };

  // Draw lines
  useEffect(() => {
    const canvas = canvasRef.current;
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    links.forEach(({ n1, n1e, n2, n2e }) => {
      const from = positions.find(({ n }) => n === n1);
      const to = positions.find(({ n }) => n === n2);

      const diffX1 = n1e === "e4" ? -45 : n1e === "e2" ? 45 : 0;
      const diffY1 = n1e === "e1" ? -45 : n1e === "e3" ? 45 : 0;
      const diffX2 = n2e === "e4" ? -45 : n2e === "e2" ? 45 : 0;
      const diffY2 = n2e === "e1" ? -45 : n2e === "e3" ? 45 : 0;

      ctx.beginPath();
      ctx.moveTo(from.x + diffX1, from.y + diffY1);
      ctx.lineTo(to.x + diffX2, to.y + diffY2);
      ctx.stroke();
    });
  }, [links, positions]);

  return (
    <div className="h-100">
      {positions.map((position) => {
        return (
          <Element
            positions={positions}
            position={position}
            addElement={addElement}
            removeElement={removeElement}
            updatePosition={updatePosition}
            setManual={setManual}
            manual={manual}
            addLinkManual={addLinkManual}
            key={position.n}
          />
        );
      })}

      <canvas ref={canvasRef}></canvas>
    </div>
  );
}
