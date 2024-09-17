<!-- R Commander Markdown Template -->

Practicing R with CHAOSS data set 
=======================

### PHILIPM3

### 2024-09-17




``` r
> CHAOSS <- 
+   readXL("C:/Users/philipm3/OneDrive - Cleveland Clinic/Academics/_Biostatistics/Handedness in Surgery Study data.xlsx",
+    rownames=FALSE, header=TRUE, na="", sheet="Sheet1", stringsAsFactors=TRUE)
```


``` r
> str(CHAOSS)
```

```
'data.frame':	223 obs. of  7 variables:
 $ Surgeon   : num  1 2 3 4 5 6 7 8 9 10 ...
 $ Hand      : Factor w/ 2 levels "left","right": 2 2 2 2 2 2 2 2 2 2 ...
 $ Gender    : Factor w/ 2 levels "female","male": 1 1 2 1 1 1 2 1 1 1 ...
 $ Ailment   : Factor w/ 13 levels "bad plumbing",..: 7 10 3 4 13 8 10 13 12 1 ...
 $ Experience: Factor w/ 2 levels "no","yes": 2 2 2 1 2 2 2 1 2 2 ...
 $ Outcome   : Factor w/ 2 levels "failure","success": 2 2 2 1 1 1 2 2 2 2 ...
 $ Time      : num  8 11 6 23 15 11 6 3 14 16 ...
```



``` r
> Righthanders <- subset(CHAOSS, subset=Hand=="right")
```


``` r
> str(Righthanders)
```

```
'data.frame':	186 obs. of  7 variables:
 $ Surgeon   : num  1 2 3 4 5 6 7 8 9 10 ...
 $ Hand      : Factor w/ 2 levels "left","right": 2 2 2 2 2 2 2 2 2 2 ...
 $ Gender    : Factor w/ 2 levels "female","male": 1 1 2 1 1 1 2 1 1 1 ...
 $ Ailment   : Factor w/ 13 levels "bad plumbing",..: 7 10 3 4 13 8 10 13 12 1 ...
 $ Experience: Factor w/ 2 levels "no","yes": 2 2 2 1 2 2 2 1 2 2 ...
 $ Outcome   : Factor w/ 2 levels "failure","success": 2 2 2 1 1 1 2 2 2 2 ...
 $ Time      : num  8 11 6 23 15 11 6 3 14 16 ...
```


``` r
> Righthanders <- within(Righthanders, {
+   Quick <- Recode(Time, '0:5="1"; 5.01:1000="0"; else="NA"', as.factor=TRUE,
+    to.value="=", interval=":", separator=";")
+ })
```


``` r
> CHAOSS <- within(CHAOSS, {
+ Quick <- Recode(Time, '0:5="1"; 5.01:1000="0"; else="NA"', as.factor=TRUE,
+ to.value="=", interval=":", separator=";")
+ })
```



``` r
> str(CHAOSS)
```

```
'data.frame':	223 obs. of  8 variables:
 $ Surgeon   : num  1 2 3 4 5 6 7 8 9 10 ...
 $ Hand      : Factor w/ 2 levels "left","right": 2 2 2 2 2 2 2 2 2 2 ...
 $ Gender    : Factor w/ 2 levels "female","male": 1 1 2 1 1 1 2 1 1 1 ...
 $ Ailment   : Factor w/ 13 levels "bad plumbing",..: 7 10 3 4 13 8 10 13 12 1 ...
 $ Experience: Factor w/ 2 levels "no","yes": 2 2 2 1 2 2 2 1 2 2 ...
 $ Outcome   : Factor w/ 2 levels "failure","success": 2 2 2 1 1 1 2 2 2 2 ...
 $ Time      : num  8 11 6 23 15 11 6 3 14 16 ...
 $ Quick     : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 2 1 1 ...
```


