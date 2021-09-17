import { Fragment } from "react"
import { Car } from "./Car"
import { Dropzone } from "./Dropzone"

export function CarsList({ cars, handleDrop }) {
    // On drop at list
    const onDrop = (car, index) => {
        let updatedCars = [];
        // If moved from parked
        if (car.published === -1) {
            updatedCars = cars
                .filter(({ published }) => published >= index)
                .map(car => ({ ...car, published: car.published + 1 }))

        } else {
            // if moved within the list
            updatedCars = car.published < index
                ? cars
                    .filter(({ published }) => published <= index && published > car.published)
                    .map(car => ({ ...car, published: car.published - 1 }))
                : cars
                    .filter(({ published }) => published >= index && published < car.published)
                    .map(car => ({ ...car, published: car.published + 1 }))
        }

        // callback
        handleDrop([...updatedCars, { ...car, published: index }])
    }

    return <div>
        {handleDrop && <Dropzone onDrop={(car) => onDrop(car, 1)} />}
        {cars.map((car, index) => {
            return <Fragment key={car.id}>
                <Car car={car} />
                {handleDrop && <Dropzone onDrop={(car) => onDrop(car, index + 2)} />}
            </Fragment>
        })}
    </div>
}
