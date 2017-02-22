#include <iostream>

int function power (int x, n);{
  if (n<1) 
    return 1;
  else 
    return (x * power(x, n-1));
}

int main (void){
  int x, n;
  cout << "Entier : ";
  cin  >> x;
  cout << "\n" << "Puissance : ";
  cin  >> n;
  cout << "\n" << "Resultat : " << power(x, n);
  return 0;
}
