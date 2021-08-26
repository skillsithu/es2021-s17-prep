import "./TabItem.scss";

export function TabItem({
  name,
  icon,
  color,
  tab,
  selectedTab,
  setSelectedTab,
}) {
  return (
    <div
      onClick={() => setSelectedTab(tab)}
      className={`tab-item tab-color-${color} ${
        tab === selectedTab ? "selected" : ""
      }`}
    >
      <div className="wrapper">
        <div className="background"></div>
        <div className="content">
          <img src={icon} alt={name} />
          <span>{name}</span>
        </div>
      </div>
    </div>
  );
}
