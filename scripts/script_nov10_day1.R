library(tidyverse)
library(lme4)

rats_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/immr05/main/data/rats.csv")

rats_df <- mutate(rats_df, batch = factor(batch))
print(rats_df, n = Inf)

rats_df_42 <- filter(rats_df, batch == '42')

# model of the probability of developing a 
# a tumour in batch 42
M_1 <- glm(cbind(m, n -m ) ~ 1, 
           data = rats_df_42, 
           family = binomial())
# maximum likelihood estimator of the probability
plogis(coef(M_1))
# 95% confidence interval on the probability
plogis(confint.default(M_1))

# model of the probabilities of developing tumours
# in all 71 batches
M_2 <- glm(cbind(m, n -m) ~ 0 + batch,
           data = rats_df, 
           family = binomial())

# maximum likelihood estimates for the probabilities in each batch
round(plogis(coef(M_2)), 2)

# 95% confidence intervals
plogis(confint.default(M_2))


# a multilevel binomial model of the variability 
# in probabilities across the 71 groups
M_3 <- glmer(cbind(m, n-m) ~ 1 + (1|batch),
             data = rats_df,
             family = binomial())


summary(M_3)

# mean of the probability distribution over the probabilities
plogis(fixef(M_3))

# the range of values within which lies 95% of the area under 
# the population model
plogis(fixef(M_3) + c(-1, 1) * 1.96 * 0.66)


# Normal random effects model ---------------------------------------------

alcohol_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/immr05/main/data/alcohol.csv")

