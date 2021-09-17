import { useCallback, useEffect, useMemo, useState } from 'react';
import { Footer } from './components/Footer';
import { Header } from './components/Header';
import { Main } from './components/Main';
import { Slider } from './homepage/Slider';
import { Distance } from './pages/Distance';
import { Homepage } from './pages/Homepage';
import { Login } from './pages/Login';
import { ManageCars } from './pages/ManageCars';
import { Video } from './pages/Video';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(JSON.parse(localStorage.getItem('isLoggedIn')));
  const [screen, setScreen] = useState();
  const [cars, setCars] = useState([]);

  const updateLogin = (loggedIn) => {
    localStorage.setItem('isLoggedIn', loggedIn)
    setIsLoggedIn(loggedIn)
  }

  const updateScreen = (s) => {
    const newScreen = s.substr(1);
    
    if (screen !== newScreen) {
      window.history.pushState("", "", s);
      setScreen(newScreen)
    }
  }

  // Save cars to local db
  const _saveCars = useCallback((updatedList) => {
    localStorage.setItem("cars", JSON.stringify(updatedList))
    setCars(updatedList)
  }, [])

  // Set new cars
  const updateCars = useCallback((newCars) => {
    const newCar = (id) => newCars.find((car) => car.id === id)
    const updatedList = cars.map(c => newCar(c.id) ? newCar(c.id) : c);
    _saveCars(updatedList)
  }, [cars, _saveCars])

  // Add new car
  const addNewCar = useCallback((newCar) => {
    _saveCars([...cars, newCar])
  }, [cars, _saveCars])

  // Delete car
  const deleteCar = useCallback((car) => {
    _saveCars(cars.filter(({ id }) => id !== car.id))
  }, [cars, _saveCars])

  // load cars from localStorage or json
  useEffect(() => {
    if (!localStorage.getItem("cars")) {
      fetch(process.env.PUBLIC_URL + "/carprofessional/carprofessional.json")
        .then(resp => resp.json())
        .then(cars => cars.map(car => ({
          ...car,
          published: parseInt(car.published, 10),
          highlighted: parseInt(car.highlighted, 10)
        })))
        .then(cars => {
          localStorage.setItem("cars", JSON.stringify(cars))
          setCars(cars)
        })
    } else {
      setCars(JSON.parse(localStorage.getItem("cars")))
    }

    const setPage = () => {
      setScreen(window.location.pathname.split('/')[1])
    }

    setPage()

    window.addEventListener("popstate", setPage)

    return () => window.removeEventListener("popstate", setPage)
  }, [])

  // Routing
  const MainPage = useMemo(() => {
    if (!isLoggedIn) {
      switch (screen) {
        case "login":
          return () => <Main Page={() => <Login setIsLoggedIn={updateLogin} />} />
        default:
          return () => <main><Slider cars={cars} /><Homepage cars={cars} /></main>
      }
    }

    switch (screen) {
      case "distance":
        return () => <Main Page={Distance} />
      case "video":
        return () => <Main Page={Video} />
      default:
        return () => <Main Page={() => <ManageCars cars={cars} updateCars={updateCars} addNewCar={addNewCar} deleteCar={deleteCar} />} />
    }
  }, [isLoggedIn, cars, updateCars, addNewCar, deleteCar, screen])

  return (
    <>
      <Header isLoggedIn={isLoggedIn} setIsLoggedIn={updateLogin} setScreen={updateScreen} />
      <MainPage />
      <Footer />
    </>
  );
}

export default App;
