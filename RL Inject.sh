#!/bin/bash
rpaurl='https://raw.githubusercontent.com/Shizmob/rpatool/master/rpatool'

clear

NC='\033[0m'
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan

cols=`tput cols`
line=`printf '#%.0s' $(seq 1 $cols)`

bkupIFS=$IFS
IFS=$'\n'

echo -e $BGreen$line"\n\n"
echo -e "     ____    __       ____        _           __ "
echo -e "    / __ \  / /      /  _/___    (_)__  _____/ /_"
echo -e "   / /_/ / / /       / // __ \  / / _ \/ ___/ __/"
echo -e "  / _^, _/ / /___   _/ // / / / / /  __/ /__/ /_ " 
echo -e " /_/ ^|_^| /_____/  /___/_/ /_/_/ /\___/\___/\__/"
echo -e "                           /___/                \n" 
echo -e "   *nix Version by Sleepingkirby"
echo -e "   SLDR @ F95zone.com"
echo -e "   Built on UnRen v0.7 by Sam"
echo -e $line$NC"\n\n"

curpath=`pwd`

  if [[ `basename $curpath` != "game" || `echo $curpath|grep -ic 'rogue'` -lt 1 ]]
  then
  echo -e "$BRed This script is in the wrong path. Please make sure it's in \"Rogue-like<version>/game/\" folder $NC"
  exit 1
  fi

echo -e "$BGreen Checking if modification has already been done...$NC"

  if [[ -f ./options.rpy.orig || -f ./screens.rpy.orig ]]
  then
  echo -e "${BRed}\n\nBackup files found. This probably means it was already patched. No need to further action. Exitting...$NC"
  exit 1
  fi
echo -e "$BGreen No backup's found. Safe to progress.\n$NC"
echo -e "$BGreen Checking to make sure requirements are met. \n\n$NC"

perlP=`which perl`

  if [[ $perlP == "" ]]
  then
  echo $perlP
  echo -e "$BRed Perl was not found. This script requires perl.$NC"
  exit 1
  fi


  if [[ ! -f ./options.rpy || ! -f ./screens.rpy ]]
  then
  echo -e "${BRed}\n\nFiles to be editted not found. Is it still in the archive.rpa?\n\n$NC"
    if [[ -f ./archive.rpa && ! -f ./rpatool ]]
    then
    echo -e "$BRed Rpatool missing. Downloading$NC"
    wget $rpaurl
    chmod 755 ./rpatool
    echo -e "$BRed Extracting archive.rpa$NC"
    ./rpatool -x ./archive.rpa
    wait
    fi
  fi

#============= Custom Doreen patch ==========
#=========== this one is just for me ========
doreenPath=~/dev/RL-Inject/rogue-like_doreen_mouth_edits.zip
doreenDst=./images/DoreenSprite/
doreenMthSprite=./Doreen_Sprite_Mouth_*.png

  if [[ -f $doreenPath ]]
  then
    #if backups don't exist, make them
    if [[ `find ${doreenDst} -name "*.orig"|wc -l` -le 0 ]]
    then
    echo -e "${BCyan}Backing up Doreen mouth sprites.$NC"
      for fn in `ls $doreenDst$doreenMthSprite`
      do
      cp $fn ${fn}.orig
      done
    else
    echo -e "${BCyan}Backups for Doreen mouth pngs exist. No need to back up.$NC"
    fi
  unzip -j $doreenPath "rogue-like_doreen_mouth_edits/*.png" -d $doreenDst
  fi


#============= options.rpy =========
fn='./options.rpy'
cp $fn $fn.orig
perl -i -pe 's/config.developer = False/config.developer = False\n    config.console = True/' $fn

echo -e "${BGreen}options.rpy patched$NC"

#=========== screens.rpy
fn='./screens.rpy'
cp $fn $fn.orig

perl -i -pe 's/Quit\(confirm=False\)/Quit(confirm=False)\n\n    frame:\n        xalign .5\n        text("Cheats enabled!")/' $fn

tmpTtl='text "Inventory:" size 20\n        textbutton "+ \$1000" text_size 15 action SetField(Player, "Cash", Player.Cash + 1000)'
  for n in Player RogueX KittyX EmmaX LauraX JeanX StormX JubesX GwenX BetsyX DoreenX WandaX
  do
  tmp="\n        if $n.Lvl < 10:\n            textbutton \"$n Max Level\" text_size 15 action [ SetField($n, \"Lvl\", 10), SetField($n, \"XP\", 3330), SetField($n, \"StatPoints\", 10) ]"
  tmpTtl=$tmpTtl$tmp
  done

tmpTtl=$tmpTtl"\n        if \"Xavier's photo\" not in Player.Inventory and \"Xavier's files\" not in Player.Inventory:\n            textbutton \"Give Xavier Blackmail Items\" text_size 15 action [ AddToSet(Player.Inventory, \"Xavier's photo\"), AddToSet(Player.Inventory, (\"Xavier's files\")) ]"

perl -i -pe 's/text "Inventory:" size 20/'"$tmpTtl"'/' $fn

perl -i -pe 's/hover "images\/Clockface.png" action NullAction\(\)/hover "images\/Clockface.png" action SetVariable("Round", 100)/' $fn


  perl -i -pe "s/value UI_Focus.Lust/value FieldValue(UI_Focus, \"Lust\", 100)/" $fn
  perl -i -pe "s/value \(UI_Focus.Love\/10\)/value FieldValue(UI_Focus, \"Love\", 1000)/" $fn
  perl -i -pe "s/value \(UI_Focus.Obed\/10\)/value FieldValue(UI_Focus, \"Obed\", 1000)/" $fn
  perl -i -pe "s/value \(UI_Focus.Inbt\/10\)/value FieldValue(UI_Focus, \"Inbt\", 1000)/" $fn
  perl -i -pe "s/value UI_Focus.Addict/value FieldValue(UI_Focus, \"Addict\", 1000)/" $fn
  perl -i -pe "s/value \(UI_Focus.Addictionrate\*10\)/value FieldValue(UI_Focus, \"Addictionrate\", 10)/" $fn


perl -i -pe "s/value Player.Focus/value FieldValue(Player, \"Focus\", 100)/" $fn
perl -i -pe "s/value \(Player\.Semen\*20\)/value FieldValue(Player, \"Semen\", 5)/" $fn
perl -i -0pe "s/        button:\n                #button to control whether cock is visible or not\n.*\n.*\n.*//g" $fn
perl -i -0pe "s/        button:\n                #button to reset semen\n.*\n.*\n.*//g" $fn


echo -e "${BGreen}screens.rpy patched$NC"

IFS=$bkupIFS

echo -e "${BGreen}DONE!$NC"
exit 0
