import { useCallback, useEffect, useMemo, useState } from "react";
import { Slide } from "../Components/Slide";
import "./View.scss";

export function View() {
  const [positions, setPositions] = useState([]);
  const [links, setLinks] = useState([]);
  const [node, setNode] = useState(1);
  const [nodeNext, setNodeNext] = useState(0);
  const [direction, setDirection] = useState();

  // Set the current slide
  const slide = useMemo(() => {
    return positions.find(({ n }) => n === node);
  }, [positions, node]);

  // Set the next slide
  const slideNext = useMemo(() => {
    return positions.find(({ n }) => n === nodeNext);
  }, [positions, nodeNext]);

  // Set the possible routes
  const routes = useMemo(() => {
    const _routes = {};
    links?.forEach(({ n1, n1e, n2, n2e }) => {
      if (n1 === node) {
        _routes[n1e] = n2;
      }
      if (n2 === node) {
        _routes[n2e] = n1;
      }
    });
    return _routes;
  }, [links, node]);

  // Set the possible routes
  const routesNext = useMemo(() => {
    const _routes = {};
    // map the available routes
    links?.forEach(({ n1, n1e, n2, n2e }) => {
      if (n1 === nodeNext) {
        _routes[n1e] = n2;
      }
      if (n2 === nodeNext) {
        _routes[n2e] = n1;
      }
    });
    return _routes;
  }, [links, nodeNext]);

  // Navigation handle
  const navigate = useCallback(
    (route) => {
      if (routes[route]) {
        setNodeNext(routes[route]);
        setDirection(route);

        setTimeout(() => {
          setNode(routes[route]);
          setNodeNext(0);
          setDirection(undefined);
        }, 1000);
      }
    },
    [routes, setNode]
  );

  // Get data from localstorage
  useEffect(() => {
    const p = localStorage.getItem("positions");
    const l = localStorage.getItem("links");

    if (p && l) {
      setPositions(JSON.parse(p));
      setLinks(JSON.parse(l));
    } else {
      setPositions([]);
      setLinks([]);
    }
  }, []);

  // Handle keyboard navigation
  useEffect(() => {
    const keyboardNavigation = (event) => {
      switch (event.keyCode) {
        case 49:
        case 38:
          navigate("e1");
          break;
        case 50:
        case 39:
          navigate("e2");
          break;
        case 51:
        case 40:
          navigate("e3");
          break;
        case 52:
        case 37:
          navigate("e4");
          break;
        default:
          break;
      }
    };
    window.addEventListener("keyup", keyboardNavigation);

    return () => window.removeEventListener("keyup", keyboardNavigation);
  }, [navigate]);

  return (
    <div className="h-100 bg-light overflow-hidden">
      {slideNext ? (
        <>
          <Slide
            slide={slide}
            navigate={navigate}
            routes={routes}
            goOut={direction}
          />
          <Slide
            slide={slideNext}
            navigate={navigate}
            routes={routesNext}
            goIn={direction}
          />
        </>
      ) : (
        <Slide slide={slide} navigate={navigate} routes={routes} />
      )}
    </div>
  );
}
