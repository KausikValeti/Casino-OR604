\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  1200 xF1_NB + 3100 xF1_DR + 3000 xF1_DOR + 550 xF1_GP + 2000 xF1_HDD
   + 2000 xF1_ML + 2500 xF1_BJ + 1200 xF2_NB + 3100 xF2_DR + 3000 xF2_DOR
   + 550 xF2_GP + 2000 xF2_HDD + 2000 xF2_ML + 2500 xF2_BJ + 1200 xF3_NB
   + 3100 xF3_DR + 3000 xF3_DOR + 550 xF3_GP + 2000 xF3_HDD + 2000 xF3_ML
   + 2500 xF3_BJ + 1200 xF4_NB + 3100 xF4_DR + 3000 xF4_DOR + 550 xF4_GP
   + 2000 xF4_HDD + 2000 xF4_ML + 2500 xF4_BJ
Subject To
 hrs_month: 0.67 xF1_NB + xF1_DR + 2 xF1_DOR + 1.1 xF1_GP + 0.67 xF1_HDD
   + 0.5 xF1_ML + 0.75 xF1_BJ + 0.67 xF2_NB + xF2_DR + 2 xF2_DOR
   + 1.1 xF2_GP + 0.67 xF2_HDD + 0.5 xF2_ML + 0.75 xF2_BJ + 0.67 xF3_NB
   + xF3_DR + 2 xF3_DOR + 1.1 xF3_GP + 0.67 xF3_HDD + 0.5 xF3_ML
   + 0.75 xF3_BJ + 0.67 xF4_NB + xF4_DR + 2 xF4_DOR + 1.1 xF4_GP
   + 0.67 xF4_HDD + 0.5 xF4_ML + 0.75 xF4_BJ <= 835
 onhand_NB: xF1_NB + xF2_NB + xF3_NB + xF4_NB <= 200
 onhand_DR: xF1_DR + xF2_DR + xF3_DR + xF4_DR <= 150
 onhand_DOR: xF1_DOR + xF2_DOR + xF3_DOR + xF4_DOR <= 100
 onhand_GP: xF1_GP + xF2_GP + xF3_GP + xF4_GP <= 250
 onhand_HDD: xF1_HDD + xF2_HDD + xF3_HDD + xF4_HDD <= 125
 onhand_ML: xF1_ML + xF2_ML + xF3_ML + xF4_ML <= 100
 onhand_BJ: xF1_BJ + xF2_BJ + xF3_BJ + xF4_BJ <= 250
 F1: 2 xF1_NB + 2.5 xF1_DR + 6 xF1_DOR + 2.75 xF1_GP + 3.5 xF1_HDD
   + 4 xF1_ML + 2.75 xF1_BJ <= 750
 F2: 2 xF2_NB + 2.5 xF2_DR + 6 xF2_DOR + 2.75 xF2_GP + 3.5 xF2_HDD
   + 4 xF2_ML + 2.75 xF2_BJ <= 1000
 F3: 2 xF3_NB + 2.5 xF3_DR + 6 xF3_DOR + 2.75 xF3_GP + 3.5 xF3_HDD
   + 4 xF3_ML + 2.75 xF3_BJ <= 550
 F4: 2 xF4_NB + 2.5 xF4_DR + 6 xF4_DOR + 2.75 xF4_GP + 3.5 xF4_HDD
   + 4 xF4_ML + 2.75 xF4_BJ <= 700
Bounds
Generals
 xF1_NB xF1_DR xF1_DOR xF1_GP xF1_HDD xF1_ML xF1_BJ xF2_NB xF2_DR xF2_DOR
 xF2_GP xF2_HDD xF2_ML xF2_BJ xF3_NB xF3_DR xF3_DOR xF3_GP xF3_HDD xF3_ML
 xF3_BJ xF4_NB xF4_DR xF4_DOR xF4_GP xF4_HDD xF4_ML xF4_BJ
End
