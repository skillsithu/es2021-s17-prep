import { useRef, useState } from "react";
import { Editor } from "./Modes/Editor";
import { View } from "./Modes/View";

function App() {
  const [isViewMode, setIsViewMode] = useState(false);
  const rootRef = useRef();

  const updateMode = () => {
    if (!isViewMode && rootRef.current.requestFullscreen) {
      rootRef.current.requestFullscreen();
    } else if (document.exitFullscreen) {
      document.exitFullscreen();
    }

    setIsViewMode(!isViewMode);
  };

  return (
    <div className="app h-100" ref={rootRef}>
      <img
        src={`${process.env.PUBLIC_URL}/knowledge_explorer.png`}
        className="position-absolute logo"
        width={120}
        alt="logo"
      />
      <button
        className="btn btn-secondary position-absolute mode-btn"
        onClick={updateMode}
      >
        {isViewMode ? "Design mode" : "Presentation mode"}
      </button>
      {isViewMode ? <View /> : <Editor />}
    </div>
  );
}

export default App;
