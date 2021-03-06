#!/bin/tcsh -f
#====================
# Unpack data from tarball
#
# Stefan Gary, 2018
# Distributed under the terms
# of the GNU GPL 3.0 or later
#====================

# Get critical information about file
set bn = `basename $1 .tar.gz`
set year = `echo $bn | awk -F_ '{print $2}'`
set season = `echo $bn | awk -F_ '{print $3}'`
set year_season = ${year}_${season}
echo Working on $bn with $year_season

# Unpack everything (slow and takes lots of space)
#tar -xzf $1

# Unpack just histograms (faster, less disk space usage)
tar -xzf $1 --exclude 'split*.nc' --exclude 't.cdf' --exclude 'larval_behaviour.txt'

# Make directory to put it in
mkdir $year_season

# Move stuff into the directory
mv larval_run_* $year_season

# Done
