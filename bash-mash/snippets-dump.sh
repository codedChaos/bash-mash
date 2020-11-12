#!/bin/bash

find -depth 1
find . -depth 1
find . -depth 2
find . -depth 2 -type d
find . -depth 3 -type d
find . -depth 4 -type d
find . -depth 4 -type d | sort
find . -depth 4 -type d -exec basename {} /;
find . -depth 4 -type d -exec basename {} \;
find . -depth 4 -type d -exec basename {} \; | sort
find . -depth 2 -type d -exec basename {} \; | sort
ls
for folders in *.; do echo $folders; done
for folders in *; do echo $folders; done
find . -depth 2 -type d | sort
for folder in `find . -depth 2 -type d | sort`; do echo $folder; done
for folder in `find . -depth 2 -type d | sort`; do echo "copying $folder to ./combined" ; if [ ! -d "./combined" ]; then echo "dir doesn't exist"; fi; done
for folder in `find . -depth 2 -type d | sort`; do echo "copying $folder to ./combined" ; if [ ! -d "./combined" ]; then echo "dir doesn't exist"; echo "creating dir ./combined"; mkdir ./combined; fi; done
ls
for folder in `find . -depth 2 -type d | sort`; do echo "copying $folder to ./combined" ; if [ ! -d "./combined" ]; then echo "dir doesn't exist"; echo "creating dir ./combined"; mkdir ./combined; fi; /bin/cp -al "$folder/*" ./combined/; done
ls
find . -depth 2 -type d | sort
find . -depth 3 -type d | sort
find . -depth 2 -type d | sort
echo ${`find . -depth 2 -type d | sort`%/*}
echo ${`find . -depth 2 -type d | sort`%*}
2038* 
find . -depth 2 -type d -exec 
echo "${${pwd}}"
echo "${pwd}"
echo "${PWD}"
echo "${{PWD}%//a/A}"
echo "${#{PWD}}"
echo "${#PWD}"
echo "${#$($PWD)}"
echo "${#$("/drive/test/drive")}"
echo "${#"$("/drive/test/drive")"}"
echo "${#(("test"))}"
tr "/test/drive/car"
man tr
cp -al ./2020-02-21-02PM/home/* ./combined/
ls ./combined/
ls -R ./combined/
for folder in `find . -depth 2 -type d | sort`; do echo "copying $folder to ./combined" ; if [ ! -d "./combined" ]; then echo "dir doesn't exist"; echo "creating dir ./combined"; mkdir ./combined; fi; cp -al $folder/* ./combined/; done
du
df
ls
du ./combined/
du ./combined
du -hc ./combined
du -hc ./2020-02-21-10AM/
du -hc ./2020-02-21-09AM/
du -hc ./2020-02-21-08AM/
du -hc ./2020-02-21-02PM/
ls -lRahH
man ls
ls -lioF
ls -lioFR
man ls
ls -lG
ls -lGah
ls -ltGah
ls -l
find . -samedir
find . -samefile combined/hardcopy.0 
find . -samefile combined/scripts/rsync-snapshot-backup.sh 
cd ./combined/
ls
find . -samefile
find . -samefile *
find . -samefile `basename $(ls -R *)`
`basename $(ls -R *)` 
find . -type f
find . -type f -samefile
find . -type f -exec find . -samefile {} \;
find . -type f -name `ls -f *' \;
find . -type f -name `ls -f *'
find . -type f -name `ls -f *`
ls -f
ls -f | xargs
ls -f | xargs 
ls -f | xargs -d
ls -f | xargs -0
ls -f | xargs -0N
ls -f | xargs -0 -P 5 
ls -f | xargs -0 -P 5 find . -name
ls -f | xargs -0 -P 5 find . -name $1
ls -f | xargs -0 -P 5 find . -name {}
ls -f | xargs -0 find . 
ls -f | xargs -0 find . -samefile
ls -f | xargs -
ls -f
wd
wc
man wc
find . -type f -exec find . -samefile {} \; | wc
find . -type f | wc
df ./<username>/
du ./<username>/
du -h ./<username>/
ls -l
find -samefile prefix32/
find -same
ls -li
find . -inum 45687440
find ../ -inum 45687440
cd ..
ls
cd <computer name>/
ls
cd 2020-02-21-02PM/
ls -lioFG
find ../ -inum 43168304
cd home/
ls
cd <username>/
ls
find ../../../ -samefile hardcopy.0 
ls -i
find ../../../ -inum 43173164
find / -inum 43173164
test hardcopy.0 -ef 43173164
[ test hardcopy.0 -ef 43173164 ]:echo "yes"
[ test hardcopy.0 -ef 43173164 ];
if [ test hardcopy.0 -ef 43173164 ]; echo "yes"; else echo "no"; fi
if [ test hardcopy.0 -ef 43173164 ]; echo "yes"; else; echo "no"; fi
man test
ls -ld
ls -id
ls
ls -d
ls
ls -l
ls -d
df hardcopy.0 
df hardcopy.0 | tail -1l | awk '{print $6}')
df hardcopy.0 | tail -1l | awk '{print $6}'
ls -d
ls -g
ls -G
ls -Gl
du -sh .
cd ..
du -sh .
du -h .
du -sh ./combined/
du -sh ./2020-02-21-*/
du -sh *
du ./combined/
du -sh ./combined/
du -sh *
du -sh ./2020-02-21-08AM/
du -sh ./2020-02-21-09AM/
du -sh ./2020-02-21-10AM/
du -sh ./2020-02-21-02AM/
du -sh ./2020-02-21-02{M/
du -sh ./2020-02-21-02PM/
find ../../../ -inum 43173164
find . -inum 43173164
ls -f
ls
ls -d
ls -fR
ls -l
ls *
find . 
find . -type f -exec stat -c%i {} /;
find . -type f -exec stat -c%i {} \;
cd combined/
ls
stat -c%i hardcopy.0 
stat hardcopy.0 
stat -f%i hardcopy.0 
man stat
stat -f%i hardcopy.0 
stat -f%l hardcopy.0 
find ../ -samefile hardcopy.0 
find ../ -inum `stat -f%i hardcopy.0`
stat -f%d hardcopy.0 
stat -f%l hardcopy.0 
find . -type f -exec stat -f%i {} \;
zpools tatus
zpool status
find . -type f -exec stat -f%i {} \; | uniq
find . -type f -exec stat -f%i {} \; | uniq -c
INODES=$(find . -type f -exec stat -f%i {} \;)
echo $INODES
INODES=$(find -name hardcopy.0 -type f -exec stat -f%i {} \;)
INODES=$(find . -name hardcopy.0 -type f -exec stat -f%i {} \;)
echo $INODES 
echo $INODES[@]
echo ${INODES@}
echo ${#INODES}
INODES=()
INODES+="test"
INODES+="test2"
INODES+="test4"
echo $INODES
echo ${INODES[0]}
2211* 
echo ${INODES[@]}
type INDOES
type INODES
typeset INODES
declare -p
INODES=(test test2 test4)
${#INODES}
"${#INODES}"
echo "${#INODES}"
echo ${INODES[@]}
echo ${INODES[1]}
echo ${INODES[0]}
INODES+=(test6 test8)
echo ${INODES[0]}
echo ${INODES[@]}
echo "${!INODES[@]}"
echo "${INODES[@]}"
echo "${#INODES[@]}"
( $(ls) )
echo "( $(ls) )"
echo ( $(ls) )
FILES=( $(ls) )
echo $FILES
ls
echo $FILES[1]
FILES=( $(ls) )
echo $FILES
echo "${#FILES}"
echo "${!FILES[@]}"
echo "${FILES[2]}"
echo "${#FILES[@]}"
FILES=( $(ls -iF) )
echo $FILES 
echo $FILES[1] 
echo "${FILES[1]}"
echo "${FILES[2]}"
echo "${FILES[3]}"
echo "${FILES[4]}"
echo "${FILES[@]}"
ls -i
FILES=( $(find . -type f -exec stat -f%i {} \;) )
echo "${FILES[@]}"
echo "${#FILES[@]}"
for f in ${FILES[@]}; do echo $f; done
for f in ${FILES[@]}; do stat -f%l $f; done
stat -i
stat -f%li hardcopy.0
stat -f%l%i hardcopy.0
stat -f%l%s%i hardcopy.0
stat -f%l hardcopy.0
history
ls -liof hardcopy.0
ls -liof hardcopy.0 | awk '{ print $1 $2 }'
ls -liof hardcopy.0 | awk '{ print $1 $3 }'
ls -liof hardcopy.0 | awk '{ print $1\t $3 }'
ls -liof hardcopy.0 | awk '{ print $1 %t $3 }'
ls -liof hardcopy.0 | awk '{ print $1"\t"$3 }'
ls -liof hardcopy.0 | awk '{ print $1"\s"$3 }'
ls -liof hardcopy.0 | awk '{ print $1" "$3 }'
IL=( $(ls -liof hardcopy.0 | awk '{ print $1" "$3 }') )
echo $IL
echo ${IL[@]}
echo ${IL[1]}
stat -f%l\t%i hardcopy.0
stat -f%lt%i hardcopy.0
stat -f%l%i hardcopy.0
stat -f%l %i hardcopy.0
stat -f "%l %i" hardcopy.0
IL2=( $(stat -f "%l %i" hardcopy.0) )
echo ${#IL2[@]}
echo ${IL2[@]}
for f in ${FILES[@]}; do stat -f "$l $i $n" $f; done
for f in ${FILES[@]}; do stat -f "$l $i" $f; done
for f in ${FILES[@]}; do echo $f; done
echo "${FILES[@]}"
echo "${INODES[@]}"


