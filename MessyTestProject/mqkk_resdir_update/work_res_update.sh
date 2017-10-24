#!/bin/sh
dir_path=$1
decollator_dir=$2
decollator_branch=$3

refreshRes(){
	echo 'start refresh dir :.......................  '$1
	cd $1
	echo 'start refresh CACommon........'
	cd CACommon
	git checkout .
	git svn fetch -r HEAD
	git svn rebase
	cd ..
	echo 'start refresh Design........'
	cd Design
	git checkout .
	git svn fetch -r HEAD
	git svn rebase
	cd ..
}

refreshBranch(){
	echo 'start refresh branch :..................... '$1
	git add .
	git checkout $1
	git add .
	git pull
	git reset .
	echo 'refresh '$1' complete...........'
}

pathList=${dir_path//$decollator_dir/ }

for path in ${pathList[@]}
do
	path=${path//$decollator_branch/ }

	refreshRes_dir=true
	for branch in ${path[@]}
	do
		if $refreshRes_dir -eq true
		then
			refreshRes_dir=false
			refreshRes $branch
		else
			refreshBranch $branch
		fi
	done
	
	# 默认切回master
	git add .
	git checkout master
done

