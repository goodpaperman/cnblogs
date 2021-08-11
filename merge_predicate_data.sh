#! /bin/sh
paste predicate_reciprocal.data predicate_logarithm.data > predicate_merged.tmp
awk '{print $1,$2/3+$4*2/3}' predicate_merged.tmp | tee predicate_merged.data
rm predicate_merged.tmp
