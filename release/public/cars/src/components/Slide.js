import { CarData } from "./CarData";

export function Slide({ car, next, prev }) {
    return <div className="slide w-100 position-relative" style={{ backgroundImage: `url('${`${process.env.PUBLIC_URL}/carprofessional/${car.image}`}')` }}>
        <button className="prev" onClick={prev} aria-label="Previous slide"></button>
        <button className="next" onClick={next} aria-label="Next slide"></button>
        <div className="car-card my-2 px-3 position-absolute">
            <CarData car={car} />
        </div>
    </div>
}