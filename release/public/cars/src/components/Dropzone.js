import { useState } from "react";

export function Dropzone({ children, onDrop }) {
    const [hovered, setHovered] = useState(false);

    const noop = (event) => {
        event.preventDefault();
        event.stopPropagation();
        event.dataTransfer.dropEffect = "move";
    }

    const drop = (event) => {
        const car = JSON.parse(event.dataTransfer.getData("text/plain"))
        onDrop(car)
        setHovered(false)
    }

    const color = hovered ? "bg-success text-white" : "bg-secondary text-white";
    return <div
        className={`my-2 p-2 text-center rounded ${color}`}
        onDrop={drop}
        onDragLeave={(e) => setHovered(false)}
        onDragEnter={(e) => setHovered(true)}
        onDragOver={noop}>
        {children}
    </div>
}
