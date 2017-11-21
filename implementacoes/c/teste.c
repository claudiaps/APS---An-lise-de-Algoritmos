#include <stdio.h>
#include <stdlib.h>

int main(){
	char num;
	while(scanf("%c\n", &num) != EOF){
		printf("%c", num);
	}
	return 0;
}