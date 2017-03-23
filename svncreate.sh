#!/bin/bash
svnadmin create $1
rm -r $1/conf
cp -r /bin/svn/conf $1/conf
cp /bin/svn/hooks/post-commit $1/hooks/post-commit
name=${1##*/}
name1=${name//\//\\/}
project=$2/$name
sed -i  "s/repertory/${project//\//\\/}/g" $1/hooks/post-commit
cd $2
svn checkout svn://localhost/${1##*/}