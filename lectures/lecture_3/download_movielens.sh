#!/bin/bash
#
# downloads movielens rating data
# 
# see http://grouplens.org/datasets/movielens/ for more info
#

DATA_DIR=.

url=http://files.grouplens.org/datasets/movielens/ml-10m.zip

# create movielens directory
[ -d $DATA_DIR/movielens ] || mkdir -p $DATA_DIR/movielens
echo $DATA_DIR/movielens
# change to movielens directory
cd $DATA_DIR/movielens

# download ratings zip file
[ -f movielens_10M.zip ] || curl -o movielens_10M.zip $url

# uncompress zip file
if [ ! -f ratings.dat ]
    then
    unzip movielens_10M.zip && mv ml-10M100K/* .
fi

# reformat to comma-separated file
[ -f ratings.csv ] || cat ratings.dat | sed 's/::/,/g' > ratings.csv

