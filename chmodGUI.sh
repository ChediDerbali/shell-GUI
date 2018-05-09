#!/bin/bash


# first window
  ans=$(zenity --info --title 'ChmodGui!' --width=200\
      --text 'which do you want to edit ' \
      --ok-label Quit\
      --extra-button File --extra-button Folder);
  echo "${ans}";


# second window
if [[ $ans == "File" ]]
then
echo hey;
str=$(zenity --file-selection --multiple --separator=:);
echo "$str";
echo "$str";
echo "$str";


elif [[ $ans == "Folder" ]]
then
echo hello;
str=$(zenity --file-selection --multiple --separator=: --directory);
echo "$str";
echo "$str";
echo "$str";
else
echo none;
fi;

if [[ $ans == "Folder" ]] || [[ $ans == "File" ]]
then
#third window
perm=$(zenity  --list  --text "Is linux.byexamples.com helpful?" --checklist  --column "Pick" --column "perms" \
 TRUE "r--------"\
 TRUE "-w-------"\
 FALSE "--x------"\
 TRUE "---r-----"\
 TRUE "----w----"\
 FALSE "-----x---"\
 TRUE "------r--"\
 FALSE "-------w-"\
 FALSE "--------x"); 
echo $perm

array=(${str//:/ });


#third window
permstr=$(zenity  --list  --text "select the new permissions" --height=350 --checklist  --column "Pick" --column "permetion" TRUE 'r........' TRUE '.w.......' FALSE '..x......' TRUE '...r.....' FALSE '....w....' FALSE '.....x...' TRUE '......r..' FALSE '.......w.' FALSE '........x' --separator=":");

echo "permstr = $permstr";
echo;

permlist=(${permstr//:/ });

n=0

for i in "${!permlist[@]}"
do
echo "${permlist[i]}"
case ${permlist[i]} in
	r........)
		n=$(($n+400));
		echo "$n"
		;;
	.w.......)
		n=$(($n+200));
		echo "$n"
		;;
	..x......)
		n=$(($n+100));
		echo "$n"
		;;
	...r.....)
		n=$(($n+40));
		echo "$n"
		;;
	....w....)
		n=$(($n+20));
		echo "$n"
		;;
	.....x...)
		n=$(($n+10));
		echo "$n"
		;;
	......r..)
		n=$(($n+4));
		echo "$n"
		;;
	.......w.)
		n=$(($n+2));
		echo "$n"
		;;
	........x)
		n=$(($n+1));
		echo "$n"
		;;
	*)
		echo "Sorry, I don't understand"
		;;
  esac
done

for i in "${!array[@]}"
do
    chmod $n ${array[i]}
done
fi;