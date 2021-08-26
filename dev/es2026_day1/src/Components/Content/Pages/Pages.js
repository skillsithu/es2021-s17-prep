import { PageTitle } from "./Elements/PageTitle";
import { AboutCompany } from "./AboutCompany";
import { Attractions } from "./Attractions";
import { Careers } from "./Careers";
import { Events } from "./Events";
import { FinancialReport } from "./FinancialReport";
import { Promotion } from "./Promotion";
import { Tickets } from "./Tickets";
import "./Pages.scss";

export function Pages({ tabs, selectedTab }) {
  return (
    <>
      <div className={`page-container ${selectedTab !== 0 ? `d-md-none` : ""}`}>
        <PageTitle tab={tabs[0]} />
        <Promotion />
      </div>
      <div className={`page-divider my-4 d-md-none rainbow-border`}></div>
      <div className={`page-container ${selectedTab !== 1 ? `d-md-none` : ""}`}>
        <PageTitle tab={tabs[1]} />
        <Tickets />
      </div>
      <div className={`page-divider my-4 d-md-none rainbow-border`}></div>
      <div className={`page-container ${selectedTab !== 2 ? `d-md-none` : ""}`}>
        <PageTitle tab={tabs[2]} />
        <Attractions />
      </div>
      <div className={`page-divider my-4 d-md-none rainbow-border`}></div>
      <div className={`page-container ${selectedTab !== 3 ? `d-md-none` : ""}`}>
        <PageTitle tab={tabs[3]} />
        <FinancialReport />
      </div>
      <div className={`page-divider my-4 d-md-none rainbow-border`}></div>
      <div className={`page-container ${selectedTab !== 4 ? `d-md-none` : ""}`}>
        <PageTitle tab={tabs[4]} />
        <AboutCompany />
      </div>
      <div className={`page-divider my-4 d-md-none rainbow-border`}></div>
      <div className={`page-container ${selectedTab !== 5 ? `d-md-none` : ""}`}>
        <PageTitle tab={tabs[5]} />
        <Careers />
      </div>
      <div className={`page-divider my-4 d-md-none rainbow-border`}></div>
      <div className={`page-container ${selectedTab !== 6 ? `d-md-none` : ""}`}>
        <PageTitle tab={tabs[6]} />
        <Events />
      </div>
    </>
  );
}
