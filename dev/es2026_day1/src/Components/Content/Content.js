import { useState } from "react";
import { Pages } from "./Pages/Pages";
import { Tabs } from "./Tabs/Tabs";
import promotion from "../../img/promote-16x16.png";
import tickets from "../../img/ticket-16x16.png";
import wheel from "../../img/wheel-16x16.png";
import financial from "../../img/financial-16x16.png";
import about from "../../img/about-16x16.png";
import career from "../../img/career-16x16.png";
import news from "../../img/news-16x16.png";
import "./Content.scss";

export function Content() {
  const [tabs] = useState([
    {
      name: "Promotion",
      title: "2 adults, 1 kid free promotion during December.",
      icon: promotion,
      color: "crimson",
    },
    {
      name: "Tickets",
      title: "Tickets and Admission",
      icon: tickets,
      color: "tomato",
    },
    {
      name: "Attractions",
      title: "Attractions",
      icon: wheel,
      color: "gold",
    },
    {
      name: "Financial Report",
      title: "Financial Report",
      icon: financial,
      color: "yellowgreen",
    },
    {
      name: "About Company",
      title: "About Company",
      icon: about,
      color: "olivedrab",
    },
    {
      name: "Careers",
      title: "Careers",
      icon: career,
      color: "skyblue",
    },
    {
      name: "Events & News",
      title: "Events & News",
      icon: news,
      color: "rebeccapurple",
    },
  ]);
  const [selectedTab, setSelectedTab] = useState(0);

  return (
    <main className="container-max-width rainbow-border">
      <div className="row flex-lg-column" style={{ "--bs-gutter-x": 0 }}>
        <div className="col-auto d-none d-md-block">
          <Tabs
            tabs={tabs}
            selectedTab={selectedTab}
            setSelectedTab={setSelectedTab}
          />
        </div>
        <div className="col">
          <Pages tabs={tabs} selectedTab={selectedTab} />
        </div>
      </div>
    </main>
  );
}
