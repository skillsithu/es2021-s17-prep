import { useMemo } from "react";
import { CarPublic } from "../components/CarPublic";

export function Offers({ cars }) {
    const published = useMemo(() => {
        return cars
            .filter(({ published, sold }) => published > 0 && !sold)
            .sort((a, b) => a.published - b.published)
            .map((car, index) => ({ ...car, published: index + 1 }))
    }, [cars])

    return <section className="py-5 section-dark-background" >
        <div className="section-spacing" id="offers"></div>
        <div className="container offers-spacing">
            <h2>Offers</h2>
            {published.map((car, index) => {
                return <div className="mb-4" key={car.id}>{index < 5 ? <CarPublic car={car} /> : null}</div>
            })}
        </div>
    </section>
}
