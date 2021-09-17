import { useEffect, useState } from "react"

const site = {
    latitude: 47.06732237933592,
    longitude: 15.40366505697929
}
const calc = (coords) => {
    const R = 6371e3
    const l1 = site.latitude * Math.PI / 180
    const l2 = coords.latitude * Math.PI / 180
    const d1 = (coords.latitude - site.latitude) * Math.PI / 180
    const d2 = (coords.longitude - site.longitude) * Math.PI / 180

    const a = Math.sin(d1 / 2) * Math.sin(d1 / 2) +
        Math.cos(l1) * Math.cos(l2) *
        Math.sin(d2 / 2) * Math.sin(d2 / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    const d = R * c

    console.log(d)

    return Math.floor(d / 1000)
}

export function DistanceCalculation() {
    const [distance, setDistance] = useState(0);

    useEffect(() => {
        navigator.geolocation.getCurrentPosition(({ coords }) => setDistance(calc(coords)))
    }, [])

    return <p>The distance between your address and the Car Professional shop is {distance}km.</p>
}