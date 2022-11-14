* Load dataset
use "C:\Users\ConquerV\Documents\2022-23Fall\eco499\replication_study\dataset_output05_2018.dta"

* Generate Abnormal Asymmetric Attention
gen asymmetric_searches_x3 = local_searches_x3 - us_searches_x3

* Summarize Independent, Control Variables
tabstat us_searches_x3 local_searches_x3 asymmetric_searches_x3 mkvalt beme ret ret_cum amihud spread ret_vol_scaled turnover_x PercentPriceImpact_LR_Ave, stat(s)

* Set Panel dataset
xtset gvkey monthly

* Run Fama-Macbeth Two-step Cross-Sectional Regression
* BaseCase: No Selection
asreg ret_dgtw_f1 us_searches_x3 asymmetric_searches_x3 l_mkvalt l_beme ret ret_cum l_amihud spread ret_vol_scaled turnover_x, fmb

* Case1: Length > 1
asreg ret_dgtw_f1 us_searches_x3 asymmetric_searches_x3 l_mkvalt l_beme ret ret_cum l_amihud spread ret_vol_scaled turnover_x if len>1, fmb

* Run Fama-Macbeth Two-step Cross-Sectional Regression
asreg ret_dgtw_f1 us_searches_x3 asymmetric_searches_x3 l_mkvalt l_beme ret ret_cum l_amihud spread ret_vol_scaled turnover_x if len>2, fmb