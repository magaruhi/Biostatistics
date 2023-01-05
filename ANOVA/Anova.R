library(nortest)
library(dplyr)
library(ggplot2)
library(statsr)

#######One-way ANOVA

G1 <- c(51,45,33,45,67)
G2 <- c(23,43,23,43,45)
G3 <- c(56,76,74,87,56)

?hist
?dnorm
?lines
hist(G1, prob = TRUE, main = "Histogram", xlab="Groups",ylab ="Prob")
x <- seq(min(G1), max(G1))
f <- dnorm(x, mean = mean(G1), sd = sd(G1))
lines(x, f, col = "red")

?qqnorm
?qqline
qqnorm(G1)
qqline(G1, col =  "red")

#Test de normalidad de Shapiro-Wilk
?shapiro.test
shapiro.test(G1)
shapiro.test(G2)
shapiro.test(G3)

#Test de normalidad de Anderson-Darling
install.packages("nortest")
library(nortest)
?ad.test
ad.test(G1)
ad.test(G2)
ad.test(G3)

#Prueba de Pearson chi-square basada en una distribución Ji cuadrado y 
#que corresponde a una prueba de bondad de ajuste.
?pearson.test
pearson.test(G1)
pearson.test(G2)
pearson.test(G3)


?aov
dat <- c(51,45,33,45,67,23,43,23,43,45,56,76,74,87,56)
grp <- as.factor(c(rep(c("G1", "G2", "G3"), each =5)))
boxplot(dat ~ grp)
fm <- lm(dat ~ grp)
anova(fm)
summary(fm)
?kruskal.test
kruskal.test(dat ~ grp)
TukeyHSD(fm)

M1 <- c(19.2,18.7,21.3,16.5,17.3,22.4)
M2 <- c(18.7,14.3,20.2,17.6,19.3,16.1)
M3 <- c(12.5,14.3,8.7,11.4,9.5,16.5)
M4 <- c(20.3,22.5,17.6,18.4,15.9,19)
M5 <- c(19.9,24.3,17.6,20.2,18.4,19.1)

dat <- c(19.2,18.7,21.3,16.5,17.3,22.4,18.7,14.3,20.2,17.6,19.3,16.1,12.5,14.3,8.7,11.4,9.5,16.5,20.3,22.5,17.6,18.4,15.9,19,19.9,24.3,17.6,20.2,18.4,19.1)
grp <- as.factor(c(rep(c("M1","M2","M3","M4","M5"), each =6)))
boxplot(dat ~ grp)
fm <- lm(dat ~ grp)
summary(fm)
anova(fm)
kruskal.test(dat ~ grp)
TukeyHSD(aov(dat ~ grp))

#######Two-way ANOVA
gender <- c("female","female","female","female","female","female","female","female","female","female","female","female","male","male","male","male","male","male","male","male","male","male","male","male")
genotype <- c("FF","FF","FF","FF","FS","FS","FS","FS","SS","SS","SS","SS","FF","FF","FF","FF","FS","FS","FS","FS","SS","SS","SS","SS")
act <- c(2.838,4.216,2.889,4.198,3.55,4.556,3.087,1.943,3.620,3.079,3.586,2.669,1.884,2.283,4.939,3.486,2.396,2.956,3.105,2.649,2.801,3.421,4.275,3.110)
dat <- data.frame(gender,genotype,act)
dat
str(dat)
dat$gender <- factor(dat$gender)
dat$genotype <- factor(dat$genotype)
str(dat)

library(ggplot2)
boxplot(act ~ gender * genotype, data=dat, col = c("red", "green"))
interaction.plot(x.factor = dat$genotype, trace.factor = dat$gender, 
                 response = dat$act, fun = mean)
res_lm <- lm(act ~ gender*genotype, data = dat)
summary(res_lm)
res_aov <- aov(act ~ gender*genotype, data = dat)
summary(res_aov)
plot(res_aov)

?residuals
shapiro.test(residuals(res_aov))
shapiro.test(residuals(res_lm))

TukeyHSD(res_aov,conf.level=0.95)
TukeyHSD(res_aov, which = "gender")
TukeyHSD(res_aov, which = "genotype")


dat <-anova_data1
str(dat)
dat$X2<- factor(dat$X2)
dat$X3<- factor(dat$X3)
str(dat)
anova(lm(X1 ~ X2*X3, data=dat))
TukeyHSD(aov(X1 ~ X2+X3, data=dat))

dat <-crop_data
str(dat)
dat$block<- factor(dat$block)
dat$fertilizer<- factor(dat$fertilizer)
dat$density<- factor(dat$density)
str(dat)
anova(lm(yield ~ fertilizer*density, data=dat))
TukeyHSD(aov(yield ~ fertilizer+density, data=dat))

# Rosner, Pag. 557
dat <-SWISS_DAT
str(dat)
creat_68 <- dat$`'creat_68'`
group <-dat$`'group'`
creat_68.na <- is.na(creat_68)
creat_68_a <- creat_68[creat_68.na == FALSE]
group_a <- group[creat_68.na == FALSE]
tapply(creat_68_a, group_a, length)
plot(group_b, creat_68_b)
creat_68_b <- creat_68_a[creat_68_a <4]
group_b <- group_a[creat_68_a <4]
tapply(creat_68_b, group_b, length)
plot(group_b, creat_68_b)
group_b <- factor(group_b)
anova(lm(creat_68_b~ group_b))
#Pag.565
TukeyHSD(aov(creat_68_b ~ group_b))
#Pag. 615
dat <-TEAR_DAT
str(dat)

#Random Effects

d <- eucalyptus
str(d)
d$stocking <- factor(d$stocking)
boxplot(hgt ~ stocking, data=d)
a1 <- aov(hgt ~ stocking, data=d)
summary(a1)
TukeyHSD(a1)

m1 <- lm(hgt ~ stocking, data=d)
summary(m1)
anova(m1)
plot(m1)
library(nortest)
lillie.test(residuals(m1))

d$spp <- factor(d$spp)
str(d)
m2 <- lm(hgt ~ stocking * spp, data=d)
plot(m2)
lillie.test(residuals(m2))

m2 <- aov(hgt ~ stocking * spp, data=d)
summary(m2)

install.packages("lme4")
library(lme4)
install.packages("lmerTest")
library(lmerTest)
?lmer

d$plot <- factor(d$plot)
m4 <- lmer(hgt ~ stocking * spp * (1|plot), data=d)
anova(m4)
summary(m4)$varcor

m5 <- lmer(hgt ~ spp * (1|plot), data=d)
anova(m5)

# NESTED ANOVA
install.packages("rstatix")
uptake$tech <- factor(uptake$tech)
uptake$rat <- factor(uptake$rat)
boxplot(upt ~ tech/rat, data=uptake)
library(ggplot2)
ggplot(uptake, aes(x=rat, y=upt, fill=tech))+
  geom_boxplot()

aov(upt ~ tech/rat, data=uptake)
summary(aov(upt ~ tech/rat, data=uptake))
lm(upt ~ tech/rat, data=uptake)
anova(lm(upt ~ tech/rat, data=uptake))

nest <- aov(upt ~ tech / rat, data=uptake)
summary(nest)
TukeyHSD(nest)
plot(TukeyHSD(nest))

install.packages("rstatix")
library(rstatix)
anova_test(upt ~ tech/rat, data=uptake)
anova_test(lm(upt ~ tech/rat, data=uptake))

growth <- c(13, 16, 16, 12, 15, 16, 19, 16, 15, 15, 12, 15,
            19, 19, 20, 22, 23, 18, 16, 18, 19, 20, 21, 21,
            21, 23, 24, 22, 25, 20, 20, 22, 24, 22, 25, 26)
fertilizer <- c(rep(c('A', 'B', 'C'), each=12))
tech <- c(rep(1:9, each=4))
dat <- data.frame(growth,fertilizer,tech)
dat$fertilizer <- factor(dat$fertilizer)
dat$tech <- factor(dat$tech)
boxplot (growth ~ fertilizer / tech, data=dat)
ggplot(dat, aes(x=tech, y=growth, fill=fertilizer))+
  geom_boxplot()

nest <- aov(growth ~ fertilizer / tech, data=dat)
summary(nest)
TukeyHSD(nest)
plot(TukeyHSD(nest))

time <- c("0m","0m","0m","0m","0m","0m",
          "3m","3m","3m","3m","3m","3m",
          "6m","6m","6m","6m","6m","6m")
subj <- c(1,2,3,4,5,6,1,2,3,4,5,6,1,2,3,4,5,6)
fl <- c(45,42,36,39,51,44,50,42,41,35,55,49,
        55,45,43,40,59,56)
dat <- data.frame(subj,time,fl)
dat$subj <- factor(dat$subj)
dat$time <- factor(dat$time)
bloxplot(fl~time, data=dat)

anova_test(data = dat, dv = fl, wid = subj, within = time)
get_anova_table(anova_test(data = dat, dv = fl, wid = subj, within = time))

aov_res <- anova_test(data = dat, dv = fl, wid = subj, within = time)
get_anova_table(aov_res)

aov(fl ~ time, data=dat)
TukeyHSD(nest)
