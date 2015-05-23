# GUPTA Perioperative Cardiac Risk Estimator
# Matteo Fiorani 2015
#
# See:
# Gupta PK, Gupta H, Sundaram A, Kaushik M, Fang X, Miller WJ, Esterbrooks DJ, Hunter CB, Pipinos II,
# Johanning JM, Lynch TG, Forse RA, Mohiuddin SM, Mooss AN.
# Development and validation of a risk calculator for prediction of cardiac risk after surgery.
# Circulation. 2011 Jul 26;124(4):381-7. Epub 2011 Jul 5.

# Declare parameters and stores in relative dataframes 

# ASA 
ASA <- data.frame(c('ASA 1','ASA 2','ASA 3','ASA 4','ASA 5'),
                   c('Normal healthy patient',
                    'Patients with mild systemic disease',
                    'Patients with severe systemic disease',
                    'Patients with severe systemic disease that is a constant threat to life',
                    'Moribund patients who are not expected to survive without the operation'),
                   c(-5.17, -3.29, -1.92, -0.95, 0)
                  )

names(ASA) <- c("class", "description", "value")

# creatinine 
creatinine <- data.frame(c('>= 1.5 mg/dL (133 mmol/L)','Unknown','< 1.5 mg/dL (133 mmol/L)'),
                         c('abnormal', 'missing', 'normal'),
                         c(0.61, -0.10, 0)
                         )

names(creatinine) <- c("description", "note", "value")

# preoperative functional status
status <- data.frame(c('Totally dependent', 'Partially indipendent', 'Totally indipendent'),
                     c(1.03, 0.65, 0)
                     )

names(status) <- c("description", "value")

# surgical procedures
procedures <- data.frame(c('Anorectal', 'Aortic', 'Bariatric','Brain','Breast','Cardiac','ENT','Foregut/hepatopancreatobiliary','GBAAS','Intestinal','Neck','Obstetric/gynecologic','Orthopedic','Other abdomen','Peripheral vascular','Skin','Spine','Thoracic','Vein', 'Urology'),
                         c(-0.16, 1.60, -0.25, 1.40, -1.61, 1.01, 0.71, 1.39, 0.59, 1.14, 0.18, 0.76, 0.80, 1.13, 0.86, 0.54, 0.21, 0.40, -1.09, -0.26)
                         )

names(procedures) <- c("description", "value")

# estimator function
MICA <- function (age, i_ASA, i_status, i_creatinine, i_procedure){
        ee <- -5.25 + (age * 0.02) + ASA$value[i_ASA] + status$value[i_status] + creatinine$value[i_creatinine] + procedures$value[i_procedure]
        return (100 * (1 / (1 + exp(-1*ee))))
}

#########################################################################
# 1. Sixty-year-old man, ASA class 4, independent, with
# normal creatinine, undergoing aortic surgery:
# MICA(60,4,3,3,2)
# computed <- 3.23%
# expected_value <- 3.18%
#########################################################################
# 2. Seventy-year-old woman, ASA class 3, independent, with
# normal creatinine, undergoing brain surgery:
# MICA(70,3,3,3,4)
# computed <- 1.25%
# expected_value <- 1.22%
#########################################################################
# 3. Seventy-year-old man, ASA class 5, totally dependent,
# with elevated creatinine, undergoing pancreatoduodenectomy:
# MICA(70,5,1,1,8)
# computed <- 30.58%
# expected_value <- 30.23%
#########################################################################
# 4. Forty-year-old woman, ASA class 2, independent, with
# normal creatinine, undergoing laparoscopic cholecystectomy:
# MICA(40,2,3,3,9)
# computed <- 0.08%
# expected_value <- 0.08%
#########################################################################
# 5. Sixty-five-year-old man, ASA class 4, partially dependent,
# with elevated creatinine, undergoing peripheral vascular
# surgery:
# MICA(65,4,2,1,15)
# computed <- 5.84%
# expected_value <- 5.75%
#########################################################################

