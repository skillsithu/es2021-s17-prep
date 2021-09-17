import { About } from "../homepage/About";
import { Contact } from "../homepage/Contact";
import { Distance } from "../homepage/Distance";
import { Offers } from "../homepage/Offers";
import { Services } from "../homepage/Services";

export function Homepage({ cars }) {
    return <>
        <About />
        <Offers cars={cars} />
        <Services />
        <Contact />
        <Distance />
    </>
}