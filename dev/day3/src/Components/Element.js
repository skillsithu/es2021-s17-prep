import { useEffect, useState } from "react";
import { EditLabels } from "./EditLabels";
import "./Element.scss";

export function Element({
  positions,
  position,
  addElement,
  removeElement,
  updatePosition,
  setManual,
  manual,
  addLinkManual,
}) {
  const [isVisible, setIsVisible] = useState(false);
  const [isEdit, setIsEdit] = useState(false);
  const [editor, setEditor] = useState();

  const removeThis = () => {
    setIsVisible(false);

    // wait for animation
    setTimeout(() => removeElement(position), 400);
  };

  const onMouseDown = (event, direction) => {
    if (event.shiftKey) {
      console.log(event);
      event.preventDefault();
      event.stopPropagation();
      setManual({ position, direction });
    }
  };

  const onMouseUp = (event, direction) => {
    if (manual) {
      event.preventDefault();
      event.stopPropagation();

      addLinkManual({
        n1: manual.position.n,
        n1e: manual.direction,
        n2: position.n,
        n2e: direction,
      });
    }
  };

  useEffect(() => {
    requestAnimationFrame(() => {
      setIsVisible(true);

      window.jQuery(`#element-wrapper${position.n}`).draggable({
        start: (event) => {
          if (event.shiftKey) {
            event.preventDefault();
            event.stopPropagation();
          }
        },
        drag: () => {
          const elem = window.jQuery(`#element-wrapper${position.n}`);
          const y = parseInt(elem.css("top")) + 90;
          const x = parseInt(elem.css("left")) + 90;
          updatePosition({ ...position, x, y });
        },
        stop: () => {
          const elem = window.jQuery(`#element-wrapper${position.n}`);
          const y = parseInt(elem.css("top")) + 90;
          const x = parseInt(elem.css("left")) + 90;
          updatePosition({ ...position, x, y });
        },
      });
    });
  }, [positions, position, updatePosition]);

  // Handle editor
  useEffect(() => {
    requestAnimationFrame(() => {
      if (isEdit && !editor) {
        const instance = window.CKEDITOR.replace(`element-editor${position.n}`);
        instance.setData(position.data);

        setEditor(instance);
      } else if (!isEdit && editor) {
        updatePosition({ ...position, data: editor.getData() });

        requestAnimationFrame(() => {
          editor.destroy();
          setEditor(undefined);
        });
      }

      return () => {
        editor && editor.destroy();
      };
    });
  }, [isEdit, editor, position, updatePosition]);

  return (
    <div
      className="element-wrapper"
      id={`element-wrapper${position.n}`}
      style={{ top: position.y - 90, left: position.x - 90 }}
    >
      {/* Only allow removing additional elements, not the root */}
      {position.n > 1 && (
        <button
          className="btn btn-danger btn-action btn-delete"
          onClick={removeThis}
        >
          X
        </button>
      )}
      <button
        className="btn btn-success btn-action btn-edit"
        onClick={() => setIsEdit(!isEdit)}
      >
        E
      </button>

      <div className={`element ${isVisible && "visible"}`}>
        <div
          className="e e1"
          onClick={() => addElement(position, "e1")}
          onMouseDown={(e) => onMouseDown(e, "e1")}
          onMouseUp={(e) => onMouseUp(e, "e1")}
        >
          <span>1</span>
        </div>
        <div
          className="e e2"
          onClick={() => addElement(position, "e2")}
          onMouseDown={(e) => onMouseDown(e, "e2")}
          onMouseUp={(e) => onMouseUp(e, "e2")}
        >
          <span>2</span>
        </div>
        <div
          className="e e4"
          onClick={() => addElement(position, "e4")}
          onMouseDown={(e) => onMouseDown(e, "e4")}
          onMouseUp={(e) => onMouseUp(e, "e4")}
        >
          <span>4</span>
        </div>
        <div
          className="e e3"
          onClick={() => addElement(position, "e3")}
          onMouseDown={(e) => onMouseDown(e, "e3")}
          onMouseUp={(e) => onMouseUp(e, "e3")}
        >
          <span>3</span>
        </div>
      </div>

      {isEdit && (
        <div className="card shadow-sm edit-card">
          <div className="card-body">
            <h2 className="mb-3">Edit Content of Slide</h2>

            <div id={`element-editor${position.n}`}></div>

            <EditLabels position={position} updatePosition={updatePosition} />

            <div className="mt-3">
              <button
                className="btn btn-secondary"
                onClick={() => setIsEdit(!isEdit)}
              >
                Save and Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
