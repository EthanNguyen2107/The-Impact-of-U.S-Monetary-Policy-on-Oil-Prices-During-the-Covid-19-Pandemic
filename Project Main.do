* ==========================================================
* Figure export code with titles for the Econ 350 oil paper
* Based on the uploaded Stata workflow and variable names
* ==========================================================

capture log close
clear all
set more off

* Assumes your dataset is already loaded and the variables below exist
* index, dcoilwtico, ldcoilwtico, fedfunds, fedfunds_lag,
* cpaltt01usm657n_growth_lag, dcoilwtico_growth

* 1. WTI crude oil prices in levels

twoway ///
    (line dcoilwtico index, lwidth(medthick)), ///
    title("WTI Crude Oil Prices Over Time") ///
    subtitle("Quarterly series used in the oil-price project") ///
    xtitle("Time index") ///
    ytitle("WTI crude oil price") ///
    note("Source: FRED-based project dataset") ///
    legend(off)
graph export "fig_oil_levels.pdf", replace

* 2. Log of WTI crude oil prices

twoway ///
    (line ldcoilwtico index, lwidth(medthick)), ///
    title("Log of WTI Crude Oil Prices Over Time") ///
    subtitle("Log transformation used to stabilize variance") ///
    xtitle("Time index") ///
    ytitle("log(WTI crude oil price)") ///
    note("Used to construct quarterly oil price growth") ///
    legend(off)
graph export "fig_oil_loglevels.pdf", replace

* 3. Lagged CPI growth proxy over time

twoway ///
    (line cpaltt01usm657n_growth_lag index, lwidth(medthick)), ///
    title("Lagged CPI Growth Proxy Over Time") ///
    subtitle("Inflation proxy used in the regression model") ///
    xtitle("Time index") ///
    ytitle("Lagged CPI growth") ///
    note("Large spikes reflect pandemic-era deflation and later inflation surges") ///
    legend(off)
graph export "fig_inflation_proxy.pdf", replace

* 4. Federal funds rate in levels

twoway ///
    (line fedfunds index, lwidth(medthick)), ///
    title("Federal Funds Rate Over Time") ///
    subtitle("Policy rate in the sample period") ///
    xtitle("Time index") ///
    ytitle("Federal funds rate") ///
    legend(off)
graph export "fig_fedfunds.pdf", replace

* 5. Lagged federal funds rate

twoway ///
    (line fedfunds_lag index, lwidth(medthick)), ///
    title("Lagged Federal Funds Rate Over Time") ///
    subtitle("Lagged monetary policy variable used in the regression") ///
    xtitle("Time index") ///
    ytitle("Lagged federal funds rate") ///
    legend(off)
graph export "fig_fedfunds_lag.pdf", replace

* 6. Oil price growth over time

twoway ///
    (line dcoilwtico_growth index, lwidth(medthick)), ///
    title("Quarterly Growth in WTI Crude Oil Prices") ///
    subtitle("Dependent variable in the main regression") ///
    xtitle("Time index") ///
    ytitle("Oil price growth (percent)") ///
    legend(off)
graph export "fig_oil_growth.pdf", replace
