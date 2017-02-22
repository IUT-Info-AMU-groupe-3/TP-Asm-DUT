#include <iostream>

int function Recherche (save[], int k, n);{
  for(int i=0; i<=n && save[i] != k; ++i) {};
  return i;
}
int main (void){
  int n=9;
  int save [] {0, 0, 0, 0, 0, 0, 0, 1, 2, 3};
  cout << Recherche (save[], 1, 9);
  return 0;
}
