#include <stdio.h>
#include "asm.h"


int main() {

//  unsigned int exames[6]={0xACB4F503,0xACB4F501,0x0BB89CF2,0x00C8FF03,0xBAF0E0DD,0x38F0FF05};
unsigned int exames[5]={0xACB4F521,0x0BB89CF2,0x00C8FF03,0xBAF0E0DD,0x78F0FF05};
unsigned int aprovados2[5]={0};
unsigned int notas[5];
unsigned int x=0;

  for(int i=0;i<5;i++){
    notas[i]=pontuacao(exames[i]);
  }      
  
  x = aprovados (notas,5,aprovados2);

  printf("Aprovados:%d\n",x);


  for(int i=0;i<5;i++){
    printf("Resultado de 0x%08x: %d Nota Final: %d\n",exames[i],notas[i],aprovados2[i]);
  }

  
  return 0;

}

/*
8bits: Escolha multipla cada bit vale 2 pontos
grupo 1: 16-23
grupo 2: 8-15
grupo 3: 0-7
4bits: valor de 0 a 15 cada
grupo 4: 28-31
grupo 5: 24-27


*/
