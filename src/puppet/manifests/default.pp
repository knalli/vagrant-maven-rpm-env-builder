# puppet stages are of limted use - but defining repositories at the right point seems to be valid
stage { 'last': }
Stage['main'] -> Stage['last']

# Basics
include base
# Stuff for RPMBUILD
include rpmbuild
include jdk
include maven