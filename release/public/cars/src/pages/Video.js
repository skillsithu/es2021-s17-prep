import { useEffect, useState } from "react"
import { VideoPlayer } from "../components/VideoPlayer"

export function Video() {
    const [videos, setVideos] = useState([])
    const [playing, setPlaying] = useState(false)

    useEffect(() => {
        fetch("/videos/video.json").then(resp => resp.json()).then(videos => setVideos(videos))
    }, [])

    return <div>
        <h1>Videos</h1>

        <div className="card">
            <div className="card-body">
                {videos.map(video => <div key={video.file}><div>{video.title} ({video.file})</div></div>)}
            </div>
        </div>

        <div className="mt-3">
            <button className="btn btn-outline-primary" onClick={() => setPlaying(true)}>Start Playing</button>
        </div>

        {playing && <VideoPlayer videos={videos} onClose={() => setPlaying(false)} />}
    </div>
}
