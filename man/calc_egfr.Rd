% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_egfr.R
\name{calc_egfr}
\alias{calc_egfr}
\title{Calculate eGFR}
\usage{
calc_egfr(method = "cockcroft_gault", sex = NULL, age = NULL,
  scr = NULL, scr_unit = NULL, scr_assay = NULL, race = "other",
  weight = NULL, height = NULL, bsa = NULL, preterm = FALSE,
  ckd = FALSE, times = NULL, bsa_method = "dubois", relative = NULL,
  unit_out = "mL/min", ...)
}
\arguments{
\item{method}{eGFR estimation method, choose from `cockcroft_gault`, `cockcroft_gault_ideal`, `mdrd`, `ckd_epi`, malmo_lund_revised`, `schwartz`, `jelliffe`, `jellife_unstable`, `wright`}

\item{sex}{sex}

\item{age}{age}

\item{scr}{serum creatinine (mg/dL)}

\item{scr_unit, }{`mg/dL` or `micromol/L` (==`umol/L`)}

\item{scr_assay, }{`jaffe` or `enzymatic` or `idms`}

\item{race}{`black` or `other`}

\item{weight}{weight}

\item{height}{height, only relevant when converting to/from BSA-relative unit}

\item{bsa}{body surface area}

\item{preterm}{is patient preterm?}

\item{ckd}{chronic kidney disease? (Schwartz equations only)}

\item{times}{vector of sampling times for creatinine (only used in Jelliffe equation for unstable patients)}

\item{bsa_method}{BSA estimation method, see `bsa()` for details}

\item{relative}{`TRUE`/`FALSE`. Report eGFR as per 1.73 m2? Requires BSA if re-calculation required. If `NULL` (=default), will choose value typical for `method`.}

\item{unit_out}{`ml/min` (default), `L/hr`, or `mL/hr`}

\item{...}{arguments passed on}
}
\description{
Calculate the estimated glomerulal filtration rate (an estimate of renal function) based on measured serum creatinine using one of the following approaches:
- Cockcroft-Gault (using weight, ideal body weight, or adjusted body weight)
- Revised Lund-Malmo
- Modification of Diet in Renal Disease study (MDRD)
- Schwartz
- Schwartz revised
- Jelliffe
- Jelliffe (for unstable renal function)
- Wright
}
\details{
Equations for estimation of eGFR from Cystatin C concentrations are available from the `calc_egfr_cystatin()` function.
}
\examples{
calc_egfr(sex = "male", age = 50, scr = 1.1, weight = 70)
calc_egfr(sex = "male", age = 50, scr = 1.1, weight = 70, unit_out = "L/hr")
calc_egfr(sex = "male", age = 50, scr = 1.1, weight = 70, bsa = 1.8, method = "ckd_epi")
calc_egfr(sex = "male", age = 50, scr = c(1.1, 0.8),
  weight = 70, height = 170, method = "jelliffe")
calc_egfr(sex = "male", age = 50, scr = c(1.1, 0.8),
  weight = 70, height = 170, method = "jelliffe_unstable")
calc_egfr(sex = "male", age = 50, scr = 1.1,
  weight = 70, bsa = 1.6, method = "malmo_lund_rev", relative = FALSE)
}
