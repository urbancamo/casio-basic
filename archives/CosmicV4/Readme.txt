---------------------------------------------------------------
 Cosmic Fly 
 a publich domain game for the Casio PB-1000
 written by Gernot Fink <gernot.fink@munich.netsurf.de>
 published by Andreas Wichmann on 2000-03-03 on
 http://www.itkp.uni-bonn.de/~wichmann/pb1000.html
---------------------------------------------------------------
 rewrited by BLUE <qze12045@nifty.com> on 2003-12-04 
 for the Casio FX-870P/VX-4/VX-3 systems.
 http://www.geocities.co.jp/SiliconValley/2104/
---------------------------------------------------------------
 quick loader rewritten by 123
  for readability, usability and portability
 http://luckleo.cocolog-nifty.com/pockecom/VX-4/HTML/vx-4_jp.html
---------------------------------------------------------------

The contents of the compression file are as follows:
Readme.txt ------- This file, document in English.
Readmej.txt ------ Document in Japanese.
Cosmic2.s --------- Source code of Cosmic Fly.
clr.b ------------ Expanded clear command for Vx-4/Fx-870p.
CosmicV4.bas ----- Stand-alone distribution for Vx-4/Fx-870p.

Key Function in game:
  [EXE] ---- Game start
  [BRK] ---- End of game. (break)
  [0] ------ shot
  [4] ------ left move    [6] ------ right move

* Preface
  The orignal disribution of Cosmic Fly for FX-870P,VX-4 and VX-3
was done in the PBF format.
It is preferable in the view point of the efficiency of user's memory
of your pocket computers.
However, you must either use an add-in software such as VX-menu or
receiver machine-code data via RS-232C after runnging the loader program.
I felt that these somewhat burdensome operations may make barriers to run
and play games for beginner useres like me, 123. 
So I built up the stand-alone distribution even though the efficiecy of
the user's memory was deteriorated.
Moreover, the quick-loader, which was too mysterious to understand for beginners,
is rewritten for readabilty, usability and portability. 


* How to play
  (1) Using PB-1000 Data Communicator, which you can get in "http://www.lsigame.com/",
      you transmit two files of clr.b and CosimicV4.bas to your FX-870P/Vx-4
      from your MS windows machine.
  (2) By executing clr.b, extended CLEAR machine-codes to make machine code area is
      to be installed. 
      After the message "MODE110(&H18F5)" is displayed, execute "MODE110(&H18F5),1520[EXE]"
      to allocate 1520 bytes for machine code area.
  (3) By executing Cosmic.bas, you can play Cosmic Fly.
      The new quick-loader works as follows:
      (a) Checking the allocated size of the machine code area, the program is terminated
          with an warning message if the size is not enough to install.
      (b) Checking the first 24-byte data in machine code area, the program stops to install
          the machine and executes the machine codes of Cosmic Fly if the data are identical
          with those of the loader program.
      (c) When you want to play again, you may execute Cosmic.bas.
          If you erase Cosmic.bas to enlarge user's memory, exexute "MODE110(7376)[EXE]"
          to call machine codes of Cosmic Fly.

* Remark
  (1) After executing an C program in C-language mode, the data of the machine codes
      of Cosmic Fly is destroyed because C-langugae system uses the work area in the different
      way. 
      Therefore, you need to execute CosmicV4.bas again.
            