#include<stdio.h>
#include<iostream>
using namespace std;

int max(int a,int b,int c){return (((a>b)?a:b)>c)?((a>b)?a:b):c;}

int main(){
    int vec[]={31,-41,59,26,-53,58,97,-93,-23,84};
    int maxsofar4=0,max_ending_here=0;
    for (int i = 0; i < 10; i++)
    {
        max_ending_here=max(max_ending_here+vec[i],0);
        maxsofar4=max(maxsofar4,max_ending_here);
    }
    cout<<maxsofar4<<endl;
}
