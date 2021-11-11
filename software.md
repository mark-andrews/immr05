The required software for this workshop is all free and open source
and will run identically on Windows, Mac OS X, and Linux platforms.

There are a few pieces of software to install:

-   [R](https://www.r-project.org/): An environment for statistical
    computing.
-   [Rstudio](https://www.rstudio.com/): An integrated development
    environment for using R.
-   [tidyverse](https://www.tidyverse.org/): A bundle of R packages to
    use R the modern way.
-   [lme4](https://cran.r-project.org/web/packages/lme4/index.html) for linear and generalized linear mixed effects models.
-   [Stan](http://mc-stan.org/): A Bayesian probabilistic modelling
    language.
-   [brms](https://github.com/paul-buerkner/brms): An R package to
    interface with [Stan](http://mc-stan.org/).

All of the above installation should be easy and painless except
possibly for the installation of [Stan](http://mc-stan.org/), which can
possibly be tricky because it is an external program and requires
addition programming tools like c++ libraries and compilers etc.
However, in the instructions below there are links to pages that provide
ample detail on how to install and test [Stan](http://mc-stan.org/) and
all its dependencies.


## Installing R

Go to the [R](https://www.r-project.org/) website and follow the links
for downloading. On Windows, this should lead you to

-   <https://cran.r-project.org/bin/windows/base/>.

Downloading this and following the usual Windows installation process,
you\'ll then have a full working version of R.

On Macs, the installation procedure is essentially identical. The latest
Mac installer should be available at

-   <https://cran.r-project.org/bin/macosx/>.

Download this and follow the usual Mac installation process to get a
full working version of R for Macs.

## Installing Rstudio

Using Rstudio is not strictly necessary. You can do all you need to do
with R without using Rstudio. However, many people have found that using
R is more convenient and pleasant when working through Rstudio. To
install it, go to the [Rstudio](https://www.rstudio.com/) website,
specifically to

-   <https://www.rstudio.com/products/rstudio/download/>

which will list all the available installers. Note that you just want
the Rstudio *desktop* program. The Rstudio *server* is something else
(basically it is for providing remote access to Rstudio hosted on Linux
servers).

Again, you\'ll just follow the usual installation process for Windows or
Macs to install Rstudio using these installers.

## Installing the tidyverse packages

The so-called [tidyverse](https://www.tidyverse.org/) is a collection of
interrelated R packages that implement essentially a new standard
library for R. In other words, the
[tidyverse](https://www.tidyverse.org/) gives us a bundle tools for
doing commonplace data manipulation and visualization and programming.
It represents the modern way to use R, and in my opinion, it\'s the best
way to use R. All the [tidyverse](https://www.tidyverse.org/) packages
can be installed by typing the following command in R:

```r
install.packages("tidyverse")
```

The main packages that are contained within the
[tidyverse](https://www.tidyverse.org/) bundle are listed
[here](https://www.tidyverse.org/packages/).

## Installing lme4

We will do general and generalized linear models using `lme4`, which is installed like any other R package.
```r
install.packages("lme4")
```

## Installing Stan

Stan is a probabilistic programming language. Using the Stan language,
you can define arbitrary probabilistic models and then perform Bayesian
inference on them using
[MCMC](https://en.wikipedia.org/wiki/Markov_chain_Monte_Carlo),
specifically using [Hamiltonian Monte
Carlo](https://en.wikipedia.org/wiki/Hamiltonian_Monte_Carlo).

In general, Stan is a external program to R; it does not need to be used
with R. However, one of the most common ways of using Stan is by using
it through R and that is what we will be doing in this workshop.

To use Stan with R, you need to install an R package called
[rstan](http://mc-stan.org/users/interfaces/rstan). However, you also
need additional external tools installed in order for
[rstan](http://mc-stan.org/users/interfaces/rstan) to work.

Instructions for installing rstan on can be found here:

- <https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started>

Specific instructions for different platforms can be found by following links from this page.

## Installing brms

If the installation of R, Rstudio and Stan seemed to go fine, you can
get the [brms](https://github.com/paul-buerkner/brms) R package, which
makes using Stan with R particularly easy when using conventional
models.


To get [brms](https://github.com/paul-buerkner/brms), first start
Rstudio (whether on Windows, Macs, Linux) and then run

``` {.R}
install.packages('brms')
```

You can test that it worked by running the following code, which should take around 1 minute to complete.

```r
library(tidyverse)
library(brms)

data_df <- tibble(x = rnorm(10))

M <- brm(x ~ 1, data = data_df)
```

### Installing Stan, `rstan`, `brms`

As a test, recently, I installed Stan, `rstan`, and `brms` from scrarch on Windows.

First, I did this: 

* Uninstall R and RStudio completely.
* Delete my Documents/R (default location of R packages) folder
* Reinstall R and RStudio from latest versions

Then, I installed `rstan`.
``` {.R}
install.packages("rstan", repos = "https://cloud.r-project.org/", dependencies = TRUE)
```

Then, I installed `rtools` using 64 bit installer here https://cran.r-project.org/bin/windows/Rtools/, i.e. https://cran.r-project.org/bin/windows/Rtools/rtools40-x86_64.exe

Then, I tested Stan/`rstan` with
```{.R}
library(rstan)
example(stan_model,run.dontrun = TRUE)
```
There was a lot of output, but it eventually (after about 3-5 minutes) finished with samples from a model.

Then, I installed `tidyverse` and `brms`.

```{.R}
install.packages("tidyverse")
install.packages("brms")
```


Then, tested the tiny `brms` model.
```{.R}
library(tidyverse)
library(brms)

data_df <- tibble(x = rnorm(10))

M <- brm(x ~ 1, data = data_df)
```

And all was well.

# If all else fails


An RStudio server session with Stan and `brms` installed and ready to use is available by clicking this button.
[![Binder](https://notebooks.gesis.org/binder/badge_logo.svg)](https://notebooks.gesis.org/binder/v2/gh/mark-andrews/intro_bda_qub/HEAD?urlpath=rstudio)