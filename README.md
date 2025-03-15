# Comparing the applicability of de facto population markers for spatiotemporal trend analysis in wastewater-based epidemiology

Example code for xgboost baseline and temporal model.

### Codebook for data/anthro_dataset_full.csv

-   **category** : *Factor*, category of param, e.g.,
    "Biological","Exogenous",..

-   **date** : *Date*, yyyy-mm-dd

-   **param** : *Factor*, population parameter, e.g., "bio_pmmov",
    "di_atenolol",..

-   **predictor** : *Numeric*, value of param on specified data (e.g.,
    mass load on that day)

-   **analysis_method** : *Factor*, additional information, can be NA

-   **population** : *Numeric*, de facto population on that day

-   **param_fullname** : *Factor*, full name of the parameter for
    graphics, e.g., PMMoV, Atenolol,..

-   **param_unit** : *Factor*, predictor unit of parameter for graphics,
    e.g., "corrected copies/mL", "mg/day",..

-   **ml_include** : *Logical*, should be TRUE

-   **param_label_newl_unit**: *Factor*, full name of parameter and unit
    on next line for graphics, e.g., "Atenolol\r\n(mg/day)",..

-   **param_label_unit** : *Factor*, full name of parameter and unit in
    brackets, e.g., "Atenolol (mg/day)",..

The original data is available on request.
