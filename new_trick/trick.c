#include <stdio.h>
int main(int argc, const char *argv[])
{
  
  FILE *fp = fopen(argv[1], "r");
  int n;
  fscanf(fp, "%d", &n);
  for (int i = 0; i < n; i++) {
    int p;
    int l;
    fscanf(fp, "%d %d", &p, &l);
    int n;
    int m;
    int a[5];
    int b[5];
    fscanf(fp, "%d %d %d %d %d %d", &n, &a[0], &a[1], &a[2], &a[3], &a[4]);
    fscanf(fp, "%d %d %d %d %d %d", &m, &b[0], &b[1], &b[2], &b[3], &b[4]);
  }

  return 0;
}
