# R Gupta Perioperative Cardiac Risk-Estimator

This is a simple R implementation of the Gupta's et al. Perioperative Cardiac Risk Estimator. See the original article for reference:

> Gupta PK, Gupta H, Sundaram A, Kaushik M, Fang X, Miller WJ, Esterbrooks DJ, Hunter CB, Pipinos II,
> Johanning JM, Lynch TG, Forse RA, Mohiuddin SM, Mooss AN.
> **Development and validation of a risk calculator for prediction of cardiac risk after surgery.**
> Circulation. 2011 Jul 26;124(4):381-7. Epub 2011 Jul 5.

All original paremeters values are included.

The usage of the function is quite straight-forward:
> Ex.5. Sixty-five-year-old man, ASA class 4, partially dependent, with elevated creatinine, undergoing peripheral vascular surgery:
> **5.75%**

	MICA(65,4,2,1,15)
	> 5.84

To see the reference values just type the corresponding dataframe name (ex. "ASA", or "procedures").

**Note:** Due to parameters' roundings, risks are slightly overestimated (< 0.5%). The formula is provided with no 
warranty. Please use wisely.

May, 2015

Matteo
