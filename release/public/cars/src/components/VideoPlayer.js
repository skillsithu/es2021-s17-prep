import { useCallback, useEffect, useRef, useState } from "react"

export function VideoPlayer({ videos, onClose }) {
    const [actual, setActual] = useState(0)
    const [progress, setProgress] = useState(0)
    const [volume, setVolume] = useState(1)
    const [muted, setMuted] = useState(false)
    const [playing, setPlaying] = useState(false)
    const containerRef = useRef()
    const videoRef = useRef()
    const sourceRef = useRef()

    // Handle controls
    const play = () => {
        videoRef.current?.play()
        setPlaying(true)
    }
    const pause = () => {
        videoRef.current?.pause()
        setPlaying(false)
    }
    const previous = () => {
        setActual(actual > 1 ? actual - 1 : videos.length - 1)
    }
    const next = useCallback(() => {
        setActual(actual === videos.length - 1 ? 0 : actual + 1)
    }, [actual, videos])
    const mute = () => {
        if (!videoRef.current) return
        videoRef.current.volume = 0
        setMuted(true)
    }
    const unmute = () => {
        if (!videoRef.current) return
        videoRef.current.volume = volume
        setMuted(false)
    }
    const volumeUp = () => {
        if (volume < 1 && videoRef.current) {
            setVolume(volume + 0.1)
            videoRef.current.volume = volume + 0.1
        }
    }
    const volumeDown = () => {
        if (volume > 0.1 && videoRef.current) {
            setVolume(volume - 0.1)
            videoRef.current.volume = volume - 0.1
        }
    }

    // Handle fullscreen change
    useEffect(() => {
        const container = containerRef.current
        if (!container) return

        const listenToClose = () => {
            if (!document.fullscreenElement) {
                onClose()
            }
        }

        container.addEventListener("fullscreenchange", listenToClose)

        if (!document.fullscreenElement) {
            container.focus()
            container.requestFullscreen()
        }

        return () => container.removeEventListener("fullscreenchange", listenToClose)
    }, [containerRef, onClose])

    // Handle source change
    useEffect(() => {
        const video = videoRef.current
        const source = sourceRef.current
        if (!video || !source) return

        const file = `/videos/${videos[actual].file}`

        source.setAttribute("src", file)
        video.load()
        play()

    }, [videoRef, sourceRef, actual, videos])

    // Handle progress bar
    useEffect(() => {
        const video = videoRef.current
        if (!video) return

        const progressChange = () => {
            setProgress(video.currentTime / video.duration * 100)

            if (video.currentTime === video.duration) {
                next()
            }
        }

        video.addEventListener("timeupdate", progressChange)

        return () => video.removeEventListener("timeupdate", progressChange)
    }, [videoRef, next])

    return <div ref={containerRef} className="position-relative">
        <video controls={false} className="w-100 h-100" ref={videoRef}>
            <source ref={sourceRef} type="video/mp4" />
        </video>
        <div className="vid-controls d-flex align-items-end">
            <div className="vid-controls-inside rounded shadow-sm m-3 py-3 px-2 w-100 d-flex align-items-center">
                <button className="btn btn-outline-dark mx-2" onClick={previous}>Previous</button>

                {!playing && <button className="btn btn-outline-dark mx-2" onClick={play}>Play</button>}
                {playing && <button className="btn btn-outline-dark mx-2" onClick={pause}>Pause</button>}

                <div className="progress flex-fill mx-2">
                    <div className="progress-bar" style={{ width: `${progress}%` }}></div>
                </div>

                {!muted && <button className="btn btn-outline-dark mx-2" onClick={mute}>Mute</button>}
                {muted && <button className="btn btn-outline-dark mx-2" onClick={unmute}>Unmute</button>}

                <button className="btn btn-outline-dark mx-2" onClick={volumeUp}>+</button>
                <button className="btn btn-outline-dark mx-2" onClick={volumeDown}>-</button>

                <button className="btn btn-outline-dark mx-2" onClick={next}>Next</button>
                <button className="btn btn-outline-dark mx-2" onClick={onClose}>Exit</button>
            </div>
        </div>
    </div>
}
