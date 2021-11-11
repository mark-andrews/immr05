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
