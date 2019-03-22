require 'mkmf'

#Need to link with C GSL libraries to use in C extensions
#gsl_inc = `gsl-config --cflags`

#$CFLAGS = " -Wall -I../include #{gsl_inc}"

#srcs = Dir.glob("*.c")

#p ['srcs', srcs]
                                                                                                         
#$objs = srcs.collect { |f| f.sub(".c", ".o") }                                                           
nagemspec=Gem::Specification.find_by_name('narray')
$CPPFLAGS = " -I#{File.join(nagemspec.require_paths, '')} "+$CPPFLAGS
p ['CPPFLAGS', $CPPFLAGS]

have_header("narray.h")

create_makefile("hdf5/hdf5")  
