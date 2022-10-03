#! /bin/bash

#sudo apt-get update -y                          ##uncomment this line if you are freshly  running this bash script 
#sudo apt-get install -y avrdude
avrdude


 #---------------------------------read from the board 
 flashing() {
echo "Enter correct details  of the microcontroller board: "
echo "Enter com port eg COM5:"
read port
echo "Enter adruino microcontroller name eg atmega328p :"
read Admic
echo "Enter programmer eg adruino : "
read programmer
echo "baud rate(default you can write 115200) "
read br  

echo "enter file name :"
read filename


avrdude -c $programmer -P $port -b $br -p $Admic -D -U flash:w:$filename:i

echo "done!! flashing"
}
 
 #--------------------------------------------------------------
extract () { 
 echo "Enter details  of the microcontroller board: "
echo "Enter com port eg COM5:"
read port
echo "Enter adruino microcontroller name eg atmega328p :"
read Admic
echo "Enter programmer eg adruino : "
read programmer
echo "baud rate(default you can write 115200) "
read br  

avrdude -c $programmer -P $port -p $Admic -U flash:r:extracted.hex:i
 
echo "done!! extracting"
 
 
 }
 
 
echo "enter what you want to do :1.write   2.read"
read choice
if [$choice==1];then
  flashing
else 
 extract
   fi  

 
