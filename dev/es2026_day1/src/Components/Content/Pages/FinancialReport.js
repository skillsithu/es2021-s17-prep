import { useCallback, useEffect, useState } from "react";
import { api } from "../../../api";
import "./FinancialReport.scss";

export function FinancialReport() {
  const [stockPrice, setStockPrice] = useState("$93.65");

  const refresh = useCallback(() => {
    api.get("/stock.php").then(({ data }) => {
      setStockPrice(data);
    });
  }, [setStockPrice]);

  useEffect(() => {
    refresh();

    let interv;
    if (process.env.NODE_ENV !== "development") {
      interv = window.setInterval(() => {
        refresh();
      }, 1500);
    }

    return () => interv && window.clearInterval(interv);
  }, [refresh]);

  return (
    <div className="financial-report">
      <div className="row">
        <div className="col-6 text">
          <div>FUNI as of 13:45, 1st December, 2016:</div>
          <div>Pricing delayed by 15 min.</div>
        </div>
        <div className="col-6 stock">{stockPrice}</div>
      </div>

      <div className="mt-4 pb-4 text-center">
        <button className="btn btn-lg btn-outline-secondary">
          <div className="btn-dots">
            <div className="btn-dot btn-dot-1"></div>
            <div className="btn-dot btn-dot-2"></div>
            <div className="btn-dot btn-dot-3"></div>
            <div className="btn-dot btn-dot-4"></div>
            <div className="btn-dot btn-dot-5"></div>
            <div className="btn-dot btn-dot-6"></div>
            <div className="btn-dot btn-dot-7"></div>
            <div className="btn-dot btn-dot-8"></div>
            <div className="btn-dot btn-dot-9"></div>
            <div className="btn-dot btn-dot-10"></div>
          </div>
          Download Q3 Financial Report
        </button>
      </div>
    </div>
  );
}
