# Introduction to Multilevel (hierarchical, or mixed effects) Models

In this two day course, we provide a comprehensive practical and theoretical introduction to multilevel models, also known as hierarchical or mixed effects models.
We will focus primarily on multilevel linear models, but also cover multilevel generalized linear models.
Likewise, we will also describe Bayesian approaches to multilevel modelling.
On Day 1, we will begin by focusing on *random effects* multilevel models.
These models make it clear how multilevel models are in fact models of models.
In addition, random effects models serve as a solid basis for understanding mixed effects, i.e. fixed and random effects, models.
In this coverage of random effects, we will also cover the important concepts of statistical shrinkage in the estimation of effects, as well as intraclass correlation.
We then proceed to cover linear mixed effects models, particularly focusing on varying intercept and/or varying slopes regresssion models.
On Day 2, we cover further aspects of linear mixed effects models, including multilevel models for nested and crossed data data, and group level predictor variables.
On Day 2, we also cover Bayesian approaches to multilevel levels using the `brms` R package.

## Intended Audience

This course is aimed at anyone who is interested in advanced statistical modelling generally and multilevel odelling in particular. These methods are practiced widely throughout academic scientific research, as well as widely throughout the public and private sectors.

## Teaching Format

This course will be largely practical, hands-on, and workshop based. For each topic, there will first be some lecture style presentation, i.e., using slides or blackboard, to introduce and explain key concepts and theories. Then, we will cover how to perform the various statistical analyses using R. Any code that the instructor produces during these sessions will be uploaded to a publicly available GitHub site after each session. For the breaks between sessions, and between days, optional exercises will be provided. Solutions to these exercises and brief discussions of them will take place after each break.

The course will take place online using Zoom. On each day, the live video broadcasts will occur between (UK local timezone) at:

* 10am-12pm
* 1pm-3pm
* 4pm-6pm
 
All sessions will be video recorded and made available to all attendees as soon as possible, hopefully soon after each 2hr session.
  
Although not strictly required, using a large monitor or preferably even a second monitor will make the learning experience better, as you will be able to see my RStudio and your own RStudio simultaneously. 

All the sessions will be video recorded, and made available immediately on a private video hosting website. Any materials, such as slides, data sets, etc., will be shared via GitHub.

## Assumed quantitative knowledge

We will assume familiarity with general statistical concepts, linear models, statistical inference (p-values, confidence intervals, etc). Anyone who has taken undergraduate (Bachelor's) level introductory courses on (applied) statistics can be assumed to have sufficient familiarity with these concepts.

## Assumed computer background

Minimal prior experience with R and RStudio is required. Attendees should be familiar with some basic R syntax and commands, how to write code in the RStudio console and script editor, how to load up data from files, etc. 

## Equipment and software requirements

Attendees of the course will need to use RStudio. Most people will want to use their own computer on which they install the RStudio desktop software. This can be done Macs, Windows, and Linux, though not on tablets or other mobile devices. Instructions on how to install and configure all the required software, which is all free and open source, will be provided before the start of the course. We will also provide time at the beginning of the workshops to ensure that all software is installed and configured properly. An alternative to using a local installation of RStudio is to use RStudio cloud (https://rstudio.cloud/). This is a free to use and full featured web based RStudio. It is not suitable for computationally intensive work but everything done in this class can be done using RStudio cloud. 

In addition, we will use a set of additional R packages. 
Instructions on how to install all the software is [here](software.md).

# Course programme 

## Day 1 

* Topic 1: *Random effects models*. The defining feature of multilevel models is that they are models of models. We begin by using a binomial random effects model to illustrate this. Specifically, we show how multilevel models are models of the variability in models of different clusters or groups of data.
* Topic 2: *Normal random effects models*. Normal, as in normal distribution, random effects models are the key to understanding the more general and widely used linear mixed effects models. Here, we also cover the key concepts of statistical shrinkage and intraclass correlation.
* Topic 3: *Linear mixed effects models*. Next, we turn to multilevel linear models, also known as linear mixed effects models. We specifically deal with the cases of varying intercept and/or varying slope linear regression models.

## Day 2

* Topic 4: *Multilevel models for nested data*. Here, we will consider multilevel linear models for nested, as in groups of groups, data. As an example, we will look at multilevel linear models applied to data from animals within broods that are themselves within different locations, and where we model the variability of effects across the broods and across the locations.
* Topic 5: *Multilevel models for crossed data*. In some multilevel models, each observation occurs in multiple groups, but these groups are not nested. For example, animals may be members of different species and in different locations, but the species are not subsets of locations, nor vice versa. These are known as crossed or multiclass data structures. 
* Topic 6: *Group level predictors*. In some multilevel regression models, predictor variable are sometimes associated with individuals, and sometimes associated with their groups. In this section, we consider how to handle these two situations.
* Topic 8: *Bayesian multilevel models*. All of the models that we have considered can be handled, often more easily, using Bayesian models. Here, we provide an brief introduction to Bayesian models and how to perform examples of the models that we have considered using Bayesian methods and the `brms` R package.

