import { DistanceCalculation } from '../components/DistanceCalculation'

export function Distance() {
    return <section className="py-5">
        <div className="section-spacing" id="distance"></div>
        <div className="container">
            <h2>Distance</h2>
            <DistanceCalculation />
        </div>
    </section>
}
