import "./PageTitle.scss";

export function PageTitle({ tab }) {
  const { icon, name, title } = tab;
  return (
    <div className="page-title">
      <img src={icon} alt={name} />
      <span>{title}</span>
    </div>
  );
}
