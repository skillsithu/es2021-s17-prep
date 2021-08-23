export function Navigation({ slide, navigate, routes, route }) {
  // Render the button
  return (
    <>
      {routes && routes[route] && (
        <button
          className="btn btn-primary mr-3"
          onClick={() => navigate(route)}
        >
          {route.substr(1)} -{" "}
          {slide && slide[route]
            ? slide[route]
            : `Go to slide ${routes[route]}`}
        </button>
      )}
    </>
  );
}
