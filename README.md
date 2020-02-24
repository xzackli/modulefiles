# modulefiles

These modulefiles make it easier to use CMB data analysis software on the Tiger and Della clusters at Princeton University.

## Available Modules
Append this line to your `.bashrc`,

```
module use --append /tigress/zequnl/shared/modulefiles
```

These modules are built against the default anaconda/fftw/gsl on tiger/della, so you will want to load those in first.
```
module load fftw/gcc/3.3.4 gsl/2.4 anaconda3
```

You'll then have access to some new modules when you type `module avail`,

```
healpy/1.13.0   
NaMaster/1.0.1  NaMaster/master 
pixell/0.7.0    pixell/master
```

## Loading Modules

It's recommended that you load the specific version you want, i.e.
```
module load pixel/0.7.0
```

The master versions reflect the GitHub master branch, i.e. `pixell/master`. These are kept up to date manually, so bug me if they need updating on tiger/della. 

## Jupyter Kernel

You can add a convenient Jupyter kernel by copying this template to your kernel directory! Run the following copy command,

```
cp -r /tigress/zequnl/shared/modulefiles/kernels/act $HOME/.local/share/jupyter/kernels/
```

## Technical Details

Following Matthew Hasselfield, I am compiling everything with `gcc`. 

### pixell

I installed this with just 

```
pip install . --prefix=$PSROOT
```

### healpy
The pip version of healpy 1.13.0 seems to depend on a more recent version of gcc than is available by default on tiger. This can be fixed by including `libstdc++.so.6` from anaconda in your `LD_LIBRARY_PATH`. However, it's really not desirable to put the anaconda `lib` folder into your `LD_LIBRARY_PATH`, as it breaks the universe (including emacs, somehow).

Instead, I symlink that static library into the module's software directory.

```
cd /tigress/zequnl/shared/software/healpy/1.13.0/lib/
ln -s /usr/licensed/anaconda3/2019.10/lib/libstdc++.so.6 libstdc++.so.6
``` 

The path to the module's `lib` directory is then prepended to the `LD_LIBRARY_PATH` when you load the `healpy` module.

### NaMaster

NaMaster requires installing `cfitsio` and the C version of `HEALPix`. I require the default tiger/della modules `gsl/2.4` and `fftw/gcc`.