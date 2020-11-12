#!/bin/bash

module use --append /tigress/zequnl/shared/modulefiles
module load fftw/gcc/3.3.4 gsl/2.4 anaconda3
module load healpy/1.14.0
module load pixell/master
module load NaMaster/master
module load nawrapper/dev

exec python -m ipykernel_launcher "$@"
