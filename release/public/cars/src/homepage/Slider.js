import { Fragment, useMemo, useState, useRef } from 'react'
import { Slide } from '../components/Slide'

export function Slider({ cars }) {
    const [selected, setSelected] = useState(0);
    const sliderRef = useRef();

    const highlighted = useMemo(() => {
        return cars
            .filter(({ highlighted, sold }) => highlighted > 0 && !sold)
            .sort((a, b) => a.highlighted - b.highlighted)
    }, [cars])

    const next = () => {
        if (selected >= highlighted.length - 1) {
            toSlide(0)
        } else {
            toSlide(selected + 1)
        }
    }
    const prev = () => {
        if (selected <= 0) {
            toSlide(highlighted.length - 1)
        } else {
            toSlide(selected - 1)
        }
    }
    const toSlide = (index) => {
        setSelected(index);

        const width = document.body.offsetWidth;
        sliderRef.current.scrollLeft = index * width;
    }

    return <section className="position-relative">
        <div className="d-flex slider" ref={sliderRef}>
            {highlighted.map(car => <Fragment key={car.id}><Slide car={car} next={next} prev={prev} /></Fragment>)}
        </div>
        <div className="slider-dots d-flex justify-content-center">
            {highlighted.map((car, index) => <Fragment key={car.id}>
                <button
                    className={`btn slider-dot p-0 m-2 ${selected === index ? 'bg-c-primary' : 'bg-light'}`}
                    onClick={() => toSlide(index)}
                    aria-label={`Go to slide ${index + 1}`}></button>
            </Fragment>)}
        </div>
    </section>
}
