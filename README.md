# Conda recipe for HaMStR
Building conda package

```
conda-build conda_recipe
```

Upload package into anaconda cloud
```
anaconda upload path_to_hamstr-version.tar.bz2
```

Install hamstr within a conda env
```
conda install -c trvinh hamstr
setup_hamstr
```
*Note: change `trvinh` to channel name that hosts hamstr conda package*
