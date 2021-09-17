export function Car({ car }) {
    return <div className="card my-2" draggable onDragStart={e => {e.dataTransfer.setData("text/plain", JSON.stringify(car))}}>
        {/* <img src={`${process.env.PUBLIC_URL}/carprofessional/${car.image}`} className="card-img-top" alt="car" /> */}
        <div className="card-body">
            <div className="card-title">{car.title} ({car.price}$)</div>
            <p className="card-text">{car.make} {car.model} {car.modelVariant} - {car.yearMonth}</p>
        </div>
    </div>
}