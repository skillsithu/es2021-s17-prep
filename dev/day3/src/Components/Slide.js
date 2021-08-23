import { useEffect, useState } from "react";
import { Navigation } from "./Navigation";

export function Slide({ slide, navigate, routes, goIn, goOut }) {
  const [animation, setAnimation] = useState(true);

  useEffect(() => {
    requestAnimationFrame(() => {
      setAnimation(false);
    });
  }, []);

  // calculate the classes for animation
  const containerClasses = `container slide out-${goOut} ${
    goIn ? `in ${animation && `in-${goIn}`}` : ""
  }`;

  return (
    <div className={containerClasses}>
      <div className="text-center mb-3">
        <Navigation
          slide={slide}
          navigate={navigate}
          routes={routes}
          route="e1"
        />
      </div>
      <div className="row d-flex align-items-center">
        <div className="col-auto">
          <Navigation
            slide={slide}
            navigate={navigate}
            routes={routes}
            route="e4"
          />
        </div>
        <div className="col bg-white p-3">
          <div
            className="slider"
            dangerouslySetInnerHTML={{ __html: slide?.data }}
          ></div>
        </div>
        <div className="col-auto">
          <Navigation
            slide={slide}
            navigate={navigate}
            routes={routes}
            route="e2"
          />
        </div>
      </div>
      <div className="text-center mt-3">
        <Navigation
          slide={slide}
          navigate={navigate}
          routes={routes}
          route="e3"
        />
      </div>
    </div>
  );
}
