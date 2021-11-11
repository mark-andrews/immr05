library(tidyverse)
library(lme4)

# varying slopes and varying intercepts
M_6 <- lmer(Reaction ~ Days + (Days|Subject),
            data = sleepstudy)

# varying intercepts only
M_7 <- lmer(Reaction ~ 1 + Days + (1|Subject),
            data = sleepstudy)

ggplot(sleepstudy,
       aes(x = Days, y = Reaction, colour = Subject)
) + geom_point() + facet_wrap(~Subject)

summary(M_7)

library(modelr)
add_predictions(sleepstudy, M_6) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred)) +
  facet_wrap(~Subject) + 
  ggtitle('M_6')

add_predictions(sleepstudy, M_7) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred)) +
  facet_wrap(~Subject)

add_predictions(sleepstudy, M_7) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred))

M_8 <- lmer(Reaction ~ 1 + Days + (0 + Days | Subject),
            data = sleepstudy)

summary(M_8)


add_predictions(sleepstudy, M_8) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred)) +
  facet_wrap(~Subject)

add_predictions(sleepstudy, M_8) %>%
  ggplot(aes(x = Days, 
             y = Reaction, 
             colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred))


M_9 <- lmer(Reaction ~ 1 + Days + (1|Subject) + (0 + Days|Subject),
            data = sleepstudy)

M_9a <- lmer(Reaction ~ 1 + Days + (1 + Days || Subject),
            data = sleepstudy)

M_9b <- lmer(Reaction ~ Days + (Days || Subject),
             data = sleepstudy)

add_predictions(sleepstudy, M_9) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred)) +
  facet_wrap(~Subject)


# complete pooling model
M_10 <- lm(Reaction ~ Days, data = sleepstudy)

add_predictions(sleepstudy, M_10) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred))

sigma(M_10)
summary(M_10)$coefficients

add_predictions(sleepstudy, M_10) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  facet_wrap(~ Subject)


# no pooling model
M_11 <- lm(Reaction ~ Days * Subject, data = sleepstudy)
M_11a <- lm(Reaction ~ Days + Subject + Days:Subject, data = sleepstudy)

add_predictions(sleepstudy, M_11) %>%
  ggplot(aes(x = Days, y = Reaction, colour = Subject)) + 
  geom_point() +
  geom_line(aes(y = pred)) +
  facet_wrap(~Subject) + 
  ggtitle('M_11')



# Model comparison --------------------------------------------------------

anova(M_9, M_6)


M_6_ml <- lmer(Reaction ~ Days + (Days|Subject),
               REML = FALSE,
               data = sleepstudy)

M_9_ml <- lmer(Reaction ~ 1 + Days + (1|Subject) + (0 + Days|Subject),
               REML= FALSE,
               data = sleepstudy)

anova(M_9_ml, M_6_ml)
logLik(M_9_ml) * -2
logLik(M_6_ml) * -2
logLik(M_9_ml) 
logLik(M_6_ml) 

# varying intercepts only
M_7_ml <- lmer(Reaction ~ 1 + Days + (1|Subject),
               REML = FALSE,
               data = sleepstudy)

M_8_ml <- lmer(Reaction ~ 1 + Days + (0 + Days | Subject),
               REML = FALSE,
               data = sleepstudy)

anova(M_7_ml, M_6_ml)
anova(M_8_ml, M_6_ml)

anova(M_7_ml, M_8_ml)



# Nested groups -----------------------------------------------------------

classroom_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/immr05/main/data/classroom.csv")

ggplot(classroom_df,
       aes(x = ses, y = mathscore)
) + geom_point() + 
  facet_wrap(~schoolid)



ggplot(classroom_df,
       aes(x = ses, y = mathscore)
) + geom_point() + 
  stat_smooth(method = 'lm', se = F) +
  facet_wrap(~schoolid)

ggplot(classroom_df,
       aes(x = ses, y = mathscore)
) + geom_point()


M12 <- lmer(mathscore ~ 1 + ses + (1 + ses|schoolid) + (1 + ses|classid),
            data = classroom_df)

# This is NOT what you want to do ....
# lmer(mathscore ~ 1 + ses + (1 + ses|schoolid) + (1 + ses|classid2),
#      data = classroom_df)

M13 <- lmer(mathscore ~ 1 + ses + (1 + ses|schoolid/classid2),
            data = classroom_df)

# M_13 is identical to ...
M14 <- lmer(mathscore ~ 1 + ses + (1 + ses|schoolid) + (1 + ses|schoolid:classid2),
            data = classroom_df)


# Crossed structures ------------------------------------------------------

blp_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/immr05/main/data/blp-short2.csv")

# count number of observations per each word ("spelling")
group_by(blp_df, spelling) %>% summarise(n = n())

# count number of observations per each subject
group_by(blp_df, participant) %>% summarise(n = n())

M_15 <- lmer(rt ~ 1 + (1|participant) + (1|spelling),
             data = blp_df)

summary(M_15)

# Using brms for Bayesian modelling ---------------------------------------

library(brms)

# Bayesian counterpart of a classical normal linear model using `lm`
M_16 <- brm(Reaction ~ Days, data = sleepstudy)


# Bayesian counterpart of multilevel linear model M_6
M_17 <- brm(Reaction ~ Days + (Days|Subject),
            data = sleepstudy)
