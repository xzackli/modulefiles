#!/bin/bash

module use --append /tigress/zequnl/shared/modulefiles
module load fftw/gcc/3.3.4 gsl/2.4 anaconda3
module load healpy/1.13.0
module load pixell/0.7.0
module load NaMaster/1.0.1
module load nawrapper/dev

exec /home/zequnl/src/julia-1.4.1/bin/julia -i --startup-file=yes --color=yes --sysimage=/home/zequnl/Projects/mysysimage/mysys.dylib /home/zequnl/.julia/dev/IJulia/src/kernel.jl "$@"
