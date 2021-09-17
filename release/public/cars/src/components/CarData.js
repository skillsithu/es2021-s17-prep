export function CarData({ car }) {
    return <div className="card-body px-0">
        <div className="card-title">{car.title} ({car.price}$)</div>
        <p className="card-text">{car.make} {car.model} {car.modelVariant} - {car.yearMonth}</p>
        <p className="card-text">Engine Size {car.engineSize} - Power{car.enginePower} - Bhp {car.enginePowerBhp} - Miles {car.mileAge}</p>
    </div>
}