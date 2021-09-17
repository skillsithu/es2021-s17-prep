import { useMemo, useState } from "react";
import { CarsList } from "../components/CarsList";
import { Dropzone } from "../components/Dropzone";
import { EditForm } from "../components/EditForm";

export function ManageCars({ cars, updateCars, addNewCar, deleteCar }) {
    const [editing, setEditing] = useState()
    const [carToEdit, setCarToEdit] = useState()

    const parking = useMemo(() => {
        return cars.filter(({ published, sold }) => published === -1 && !sold)
    }, [cars])

    const published = useMemo(() => {
        return cars
            .filter(({ published, sold }) => published > 0 && !sold)
            .sort((a, b) => a.published - b.published)
            .map((car, index) => ({ ...car, published: index + 1 }))
    }, [cars])

    const newCar = () => {
        setCarToEdit(undefined)
        setEditing(true)
    }

    // On drop at published list
    const onDropPublished = (newCars) => {
        updateCars(newCars)
    }

    // On drop at parked list
    const onDropParked = (car) => {
        updateCars([{ ...car, published: -1 }])
    }

    // On drop to edit
    const onDropEdit = (car) => {
        setCarToEdit(car)
        setEditing(true)
    }

    // On drop to delete
    const onDropDelete = (car) => {
        if (window.confirm("Are you sure you want to delete the selected car?")) {
            deleteCar(car)

            alert("Car successfully deleted")
        }
    }

    // On drop to sell
    const onDropSell = (car) => {
        if (window.confirm("Are you sure you want to set this car as sold?")) {
            updateCars([{ ...car, sold: new Date().toISOString() }])

            alert("Car successfully sold")
        }
    }

    // Handle dialog close
    const closeDialog = (payload) => {
        setEditing(false)

        if (payload && payload.id) {
            // if we have saving payload and id, which meach we edited
            updateCars([payload])

            alert("Car successfully updated")

        } else if (payload) {
            // if we have payload, but no id, which means it's a new car
            addNewCar({
                ...payload,
                id: `${Math.floor(Math.random() * 10000)}`,
                published: -1,
                highlighted: -1
            })

            alert("Car successfully added to the parking place")
        }
    }

    return <div>
        <h1>Manage Cars</h1>
        {editing && <EditForm carToEdit={carToEdit} close={closeDialog} />}
        <div className="row">
            <div className="col">
                <h2>Parking</h2>
                <Dropzone onDrop={onDropParked} />
                <CarsList cars={parking} />
            </div>
            <div className="col">
                <h2>Published</h2>
                <CarsList cars={published} handleDrop={onDropPublished} />
            </div>
            <div className="col-auto">
                <button className="btn btn-primary" onClick={newCar}>+</button>
                <div className="mt-3">
                    <Dropzone onDrop={onDropEdit}>Edit</Dropzone>
                    <Dropzone onDrop={onDropDelete}>Delete</Dropzone>
                    <Dropzone onDrop={onDropSell}>Sold</Dropzone>
                </div>
            </div>
        </div>
    </div>
}
