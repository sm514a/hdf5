
Hdf5 only for my cygwin env
====
This is updated for my current cygwin evironment as of March 2019
* CYGWIN_NT-10.0 3.0.4(0.338/5/3) 2019-03-16 09:50 x86_64 Cygwin
* ruby 2.3.6p384 (2017-12-14 revision 9808) [x86_64-cygwin]
* narray (0.6.1.2)
* libhdf5: 1.10.2

cyghdf5-101.dll, which is found in /usr/bin, must be renamed (or copied) to cyghdf5.dll



This is a Ruby module for reading and manipulating HDF5 (Hierarchical Data Format) 
files. At the current time (July 2014) it is capable of basic reading operations.
However, its use of the FFI library means that extending its capabilities is easy
and quick. 

Installation
------------

Make sure you have libhdf5 installed on your system, then simply execute:

    gem install hdf5

Examples
--------

Basic usage: 

    require 'hdf5'
    file = Hdf5::H5File.new('filename.hdf5')
    dataset = file.dataset('/path/to/dataset')
    narray = dataset.narray_all
    file.close

Extended example:


    require 'hdf5'

    file = Hdf5::H5File.new('test/field.dat.h5') # Open an existing file readonly

    ds = file.dataset('/field/phi/0000000000')  # Open a dataset
    p ds.narray_type # Print the Ruby/NArray type of the dataset (if possible)

    p dt = ds.datatype # Access the datatype
    p dt.nmembers # Print the number of members of the datatype

    p dsp = ds.dataspace # Access the dataspace
    p dsp.ndims # Number of dimensions in dataspace
    p dsp.dims # Array of dimension sizes
    p dsp.maxdims # Array of max dimension sizes

    p na = ds.narray_all  # Read the whole dataset into an narray

    p na2 = ds.narray_simple_read([0,0,0], [0,0,0]) # Read one element of the dataset into an narray

    p na3 = ds.narray_simple_read([1,0,0], [3,-1,-1]) # Read a section of the dataset into an narray

    file.close # Close the file
