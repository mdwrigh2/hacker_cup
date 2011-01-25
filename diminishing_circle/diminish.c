#include <stdlib.h>
#include <stdio.h>

struct person {
  struct person* prev;
  struct person* next;
  int index;
};

struct person* setup(int n) {
  struct person* first = malloc(sizeof(struct person));
  first->index = 0;
  struct person* prev = first;
  for(int i = 1; i < n;i++){
    struct person* p = malloc(sizeof(struct person));
    p->prev = prev;
    prev->next = p;
    p->index = i;
    prev = p;
  }
  prev->next = first;
  first->prev = prev;
  return first;
}

struct person* remove_p(struct person* p) {
  p->next->prev = p->prev;
  p->prev->next = p->next;
  struct person* temp = p->prev;
  free(p);
  return temp;
}

struct person* move(int n, struct person* p){
  for(int i = 0; i < n;i++){
    p = p-> next;
  }
  return p;
}

int main(int argc, char* argv[]) {
  int t;
  FILE* file = fopen(argv[1], "r");
  fscanf(file, "%d", &t);
  printf("Number of tests: %d\n", t);
  int n, k;
  for(int i = 0; i < t; i++){
    fscanf(file, "%d %d", &n, &k);
    k++;
    struct person *p = setup(n);
    while(n>1){
      p = move(k%n,p);
      p = remove_p(p);
      n--;
    }
    printf("%d\n", p->index);
  }
}
