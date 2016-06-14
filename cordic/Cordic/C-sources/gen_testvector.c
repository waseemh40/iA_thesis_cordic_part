//==============================================================================
// Generate Test Vector for Modelsim
//  
// Angle -pi to pi
// 2's complement -1.9999 to 1.99999
//
// This library is free software; you can redistribute it and/or modify it 
// under the terms of the GNU Lesser General Public License as published 
// by the Free Software Foundation; either version 2.1 of the License, or 
// (at your option) any later version.
//
// This library is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE.   See the GNU Lesser General Public 
// License for more details.   See http://www.gnu.org/copyleft/lesser.txt
//
//------------------------------------------------------------------------------
// Version  Author  Date          Changes
// 0.1      HT      17 July 2000 
//==============================================================================

#include <stdio.h>
#include <stdarg.h>
#include <conio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <math.h>

#define M_PI 3.141592654 							// Not required for BCC

unsigned long D2FS(double x,int bits); 				// signed version
unsigned long INV(unsigned long x, int bits); 		// bit wise inverse
char *        bin2str(unsigned long x, char *str, int bits); 	// display binary

int main(int argc,char **argv)  
{
  int     n;

  char    str[240]="";
  char    s1[80],s2[80],s3[80];
  FILE    *fp=NULL;
  double  angle;
  int 	  bits;    // Resolution

  if (argc<3) {
  	fprintf(stderr, "\nUseage : gen_testvector text_file resolution");
  	fprintf(stderr, "\nExample: gen_testvector testvect.txt 32\n");
  	return(1);   
  }

  if ((fp=fopen(argv[1],"wt"))==NULL) {               // open output file
  	fprintf(stderr, "\nError cannot open output file : %s\n",argv[1]);
  	return(1); 
  }
  bits=atoi(argv[2]);

  printf("\nGenerate Cordic Test Vector");
  printf("\nResults writen to %s",argv[1]);
  printf("\nResolution %d bits",bits);
  printf("\nHABT02\n");

  if (bits>32) {
  	fprintf(stderr, "\nError maximum 32 bits\n");
  	return(1); 
  }

  printf("\nGenerating.......\n");

  for (n=1; n<180; n++) {	

    angle=(((double)n-90.0)/90.0)*0.5*M_PI;

	bin2str(D2FS(angle,bits),s1,bits); 			// convert to binary string for Modelsim
	bin2str(D2FS(sinl(angle),bits),s2,bits); 
  	bin2str(D2FS(cosl(angle),bits),s3,bits);

  	sprintf(str,"%s %s %s\n",s1,s2,s3);  // Write to file
  	 
    printf("Angle=%2.3Lf[%3d] [%08LX] sin=%2.3Lf [%08LX] cos=%2.3Lf [%08LX]\n",angle,n-90,D2FS(angle,bits),sinl(angle), D2FS(sinl(angle),bits),cosl(angle), D2FS(cosl(angle),bits));
    fputs(str,fp);
  }

  fclose(fp);
  printf("\nDone..");
  return(0);
}

/************************************************************************
 Convert unsigned long to binary string
*************************************************************************/
char *  bin2str(unsigned long b, char *str, int bits)
{
 int t;
 unsigned long shift;

 strcpy(str,"");	// empty string

 shift=0x80000000>>(32-bits);

 for (t=0;t<bits;t++) {
     if (b & (shift >> t))  strcat(str,"1");  else strcat(str,"0");
 }

 return &str[0];
}

/************************************************************************
 Convert Double -1.999.. +1.999 to 2's complement fixed point
*************************************************************************/
unsigned long D2FS(double x, int bits)
{
  int n;
  double xt=0.0;
  unsigned long res=0x00000000;
  unsigned long shift;

  xt=fabs(x);

  shift=0x40000000>>(32-bits);

  for (n=0;n<=bits;n++) {
     if ((xt-pow(2.0,-1.0*(double)n))>=0.0) {
       res=res+shift;
       xt=xt-pow(2.0,-1.0*(double)n);
     }
     shift=shift>>1;
  }

  if (x<0.0) res=INV(res,bits)+1;
  return(res&(0xFFFFFFFF>>(32-bits)));
}

/************************************************************************
 bit wise inverse
*************************************************************************/
unsigned long INV(unsigned long x, int bits) 
{
 int n;
 unsigned long shift=0x0;

 shift=0x80000000>>(32-bits);

 for (n=0;n<bits;n++) {
   if ((x & shift)==shift) {
      x=x-shift;
   } else x=x+shift;
     shift=shift>>1;
   }
 return(x);
}
