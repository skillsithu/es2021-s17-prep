import { useState } from "react";

export function Login({ setIsLoggedIn }) {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");

    const submit = (event) => {
        event.preventDefault()
        event.stopPropagation()

        if (email === 'admin@carprofessional.at' && password === 'euroskills') {
            setIsLoggedIn(true)
            setEmail('')
            setPassword('')
            setError('')
        } else {
            setError('Email or password not correct')
        }
    }

    return <div>
        <h1>Login</h1>

        {error && <div className="alert alert-danger" role="alert">
            {error}
        </div>}

        <form onSubmit={submit}>
            <div className="form-group">
                <label htmlFor="email">Email address</label>
                <input type="email" className="form-control" id="email" value={email} onChange={e => setEmail(e.target.value)} />
            </div>
            <div className="form-group">
                <label htmlFor="password">Password</label>
                <input type="password" className="form-control" id="password" value={password} onChange={e => setPassword(e.target.value)} />
            </div>
            <button type="submit" className="btn btn-primary">Login</button>
        </form>
    </div>
}