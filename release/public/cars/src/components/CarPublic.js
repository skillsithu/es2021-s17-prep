import { CarData } from "./CarData";

export function CarPublic({ car }) {
    return <div className="car-card my-2">
        <div className="row">
            <div className="col-3 col-md-4">
                <img src={`${process.env.PUBLIC_URL}/carprofessional/${car.image}`} className="card-img-top h-100" alt="car" />
            </div>
            <div className="col-9 col-md-8">
                <CarData car={car} />
            </div>
        </div>
    </div>
}