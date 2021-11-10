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

# infer normal model for Russia
M_4 <- lm(alcohol ~ 1, data = filter(alcohol_df, country == 'Russia'))
coef(M_4) # maximum likelihood estimator for the mean of the normal distribution
sigma(M_4)

# multilevel normal model
M_5 <- lmer(alcohol ~ 1 + (1|country), data = alcohol_df)
summary(M_5)

# estimate of theta
fixef(M_5)

# the estimates of tau and sigma, respectively
as.data.frame(VarCorr(M_5))[,5]

# estimates of mu's
coef(M_5)

# estimates of the zeta's
ranef(M_5)

head(ranef(M_5)$country) # zeta for first 6 countries
head(coef(M_5)$country) # mu for first 6 countries

head(residuals(M_5)) # epsilon terms for first 6 countries

# tau^2 and sigma^2
var_terms <- as.data.frame(VarCorr(M_5))[,4]

ICC <- var_terms[1] / sum(var_terms) 
ICC



# Multilevel linear models, aka linear mixed effects models ---------------

ggplot(sleepstudy,
       aes(x = Days, y = Reaction)
) + geom_point()

ggplot(sleepstudy,
       aes(x = Days, y = Reaction, colour = Subject)
) + geom_point()

ggplot(sleepstudy,
       aes(x = Days, y = Reaction, colour = Subject)
) + geom_point() + facet_wrap(~Subject)

ggplot(sleepstudy,
       aes(x = Days, y = Reaction, colour = Subject)
) + geom_point() + 
  facet_wrap(~Subject) +
  stat_smooth(method = 'lm', se = FALSE)


# lm(Reaction ~ Days, ...)
# lm(Reaction ~ 1 + Days)

M_6 <- lmer(Reaction ~ Days + (Days|Subject),
            data = sleepstudy)

# identical to
M_6a <- lmer(Reaction ~ 1 + Days + (1 + Days|Subject),
             data = sleepstudy)

summary(M_6)

# if t-value was 2.8
# then p-value can be estimated by
pnorm(2.8, lower.tail = FALSE) * 2


# random intercepts only model
M_7 <- lmer(Reaction ~ 1 + Days + (1|Subject),
            data = sleepstudy)
summary(M_7)
