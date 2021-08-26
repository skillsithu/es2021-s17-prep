import { TabItem } from "./TabItem/TabItem";
import "./Tabs.scss";

export function Tabs({ tabs, selectedTab, setSelectedTab }) {
  return (
    <div className="d-flex flex-column flex-lg-row">
      {tabs.map((tab, key) => (
        <TabItem
          key={key}
          tab={key}
          name={tab.name}
          icon={tab.icon}
          color={tab.color}
          selectedTab={selectedTab}
          setSelectedTab={setSelectedTab}
        />
      ))}
    </div>
  );
}
