user_packages <- as.data.frame(installed.packages()[, c(1, 4)])
rownames(user_packages) <- NULL
user_packages <- user_packages[is.na(user_packages$Priority), ]$Package
write(user_packages, file = "~/.R/user_R_packages.txt")
