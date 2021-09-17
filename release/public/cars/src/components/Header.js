import logo from '../carprofessional-logo.png';

export function Header({ isLoggedIn, setIsLoggedIn, setScreen }) {
    return <header className="sticky-top">
        <nav className="navbar navbar-expand-lg navbar-light bg-white shadow-sm flex-column flex-md-row">
            <button className="btn btn-link navbar-brand" onClick={() => setScreen('/')} aria-label="Homepage">
                <img src={logo} alt="Car Professional" height="40" />
            </button>

            <h1 className="sr-only">Car Professional - Used Car Retails</h1>

            {isLoggedIn && <ul className="navbar-nav mx-auto ml-md-0 flex-row flex-wrap">
                <li className="nav-item active">
                    <button className="btn btn-link nav-link" onClick={() => setScreen('/')}>Manage Cars</button>
                </li>
                <li className="nav-item active">
                    <button className="btn btn-link nav-link" onClick={() => setScreen('/distance')}>Distance</button>
                </li>
                <li className="nav-item active">
                    <button className="btn btn-link nav-link" onClick={() => setScreen('/video')}>Video</button>
                </li>
                <li className="nav-item active">
                    <button className="btn btn-link nav-link" onClick={() => setIsLoggedIn(false)}>Logout</button>
                </li>
            </ul>}
            {!isLoggedIn && <ul className="navbar-nav mx-auto ml-md-0 flex-row flex-wrap">
                <li className="nav-item active">
                    <a className="btn btn-link nav-link" href="/#about">About</a>
                </li>
                <li className="nav-item active">
                    <a className="btn btn-link nav-link" href="/#offers">Offers</a>
                </li>
                <li className="nav-item active">
                    <a className="btn btn-link nav-link" href="/#services">Services</a>
                </li>
                <li className="nav-item active">
                    <a className="btn btn-link nav-link" href="/#contact">Contact</a>
                </li>
                <li className="nav-item active">
                    <a className="btn btn-link nav-link" href="/#distance">Distance</a>
                </li>
                <li className="nav-item active">
                    <button className="btn btn-link nav-link" onClick={() => setScreen('/login')}>Login</button>
                </li>
            </ul>}
        </nav>
    </header>
}
