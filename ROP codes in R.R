
#clear console
cat("\014")
#clear plots
dev.off()
#clear list in workspace, all variables
rm(list = ls())

Db<-8.5
Dc<-0.5
rc<-Dc/2
NOC<-40
BR<-20
SR<-15
L_cutter<-2
LC<-L_cutter
Embed_Length<-0.2
EL<-Embed_Length
Cutter_tt<-0.08
CT<-Cutter_tt
ROPCoff<-52
#w1 is cutter stud area weight
w1<-0.05;
#w2 is cutter PDC layer weight
w2<-1;

#cutter quality w
w<-0.00000000001;

DOCP<-matrix(0,nrow = 9,ncol = 1)
DOC<-matrix(0,nrow = 9,ncol = 1)

A_Covered_Clean<-matrix(0,nrow = 9,ncol = 1)
ACC<-A_Covered_Clean
A_Wornout_BG<-matrix(0,nrow = 9,ncol = 1)
AWB<-A_Wornout_BG

#import data in R
ABR<-read.csv("C:/Users/DASLAB Hareland 3/Desktop/data/ABR.csv", header = F)
CCS<-read.csv("C:/Users/DASLAB Hareland 3/Desktop/data/CCS.csv", header = F)
Depth<-read.csv("C:/Users/DASLAB Hareland 3/Desktop/data/Depth.csv", header = F)
RPM<-read.csv("C:/Users/DASLAB Hareland 3/Desktop/data/RPM.csv", header = F)
WOB<-read.csv("C:/Users/DASLAB Hareland 3/Desktop/data/WOB.csv", header = F)

#Area needed to be covered ANC
ANC<-matrix(0,nrow = 9,ncol = 1)
for (i in 1:9){
  
  ANC[i,1]<-WOB[i,1]/(NOC*CCS[i,1])
  
}

##
#Bit Grade calc

#BG(1,1)=w*WOB(1,1)*RPM(1,1)*ABR(1,1)*CCS(1,1);

BG<-matrix(0,nrow = 9,ncol = 1)
BGDc<-matrix(0,nrow = 9,ncol = 1)
BGDcCos<-matrix(0,nrow = 9,ncol = 1)

BG[1,1]<-0

for (i in 2:9){
  
  BG[i,1]<-w*(WOB[i,1]*RPM[i,1]*ABR[i,1]*CCS[i,1])+BG[i-1,1];
  #BG*Dc/8
  BGDc[i,1]<-BG[i,1]*Dc/8;
  #BG*Dc/8 * cosBR
  BGDcCos[i,1]<-BG[i,1]*Dc*cos(BR*3.1415/180)/8;
  
}

















