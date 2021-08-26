import { useState } from "react";
import "./HiddenGem.scss";

const abc = "QWERTZUIOPLKJHGFDSAYXCVBNM0123456789".split("");
const generateCode = () =>
  Array(4)
    .fill(0)
    .map((_) => abc[Math.floor(Math.random() * abc.length)])
    .join('');

export function HiddenGem() {
  const [clicks, setClicks] = useState(
    localStorage.getItem("clicks")
      ? parseInt(localStorage.getItem("clicks"), 10)
      : 0
  );
  const [code, setCode] = useState(localStorage.getItem("code"));

  const onClick = () => {
    if (clicks < 3) {
      setClicks(clicks + 1);
      localStorage.setItem("clicks", clicks + 1);

      if (clicks === 2) {
        const c = generateCode();
        setCode(c);
        localStorage.setItem("code", c);
      }
    }
  };

  return (
    <div className="hidden-gem">
      <div className={`gem gem-${clicks}`} onClick={onClick}>
        {clicks === 3 && (
          <div>
            <p className="fw-bold">Discount Code: {code}</p>
            <div>Awesome! You found a secret discount code in our website.</div>
          </div>
        )}
      </div>
    </div>
  );
}
