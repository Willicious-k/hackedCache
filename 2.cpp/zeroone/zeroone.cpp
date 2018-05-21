#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>
using namespace std;

void solveCase(vector<int> &sumlist, string &question)
{
	int start, end;
	cin >> start >> end;

	if (start > end) {
		int temp = start;
		start = end;
		end = temp;
	}

	bool allzero = false;
	bool allone = false;
	int allonediff = end-start;

	if (sumlist.at(start) == sumlist.at(end) && question.at(start) == '0') {
		allzero = true;
	}
	if (sumlist.at(end)-sumlist.at(start) == allonediff && question.at(start) == '1') {
		allone = true;
	}

	if (allzero || allone) {
		printf("Yes\n");
	} else {
		printf("No\n");
	}
	return;
}

int main(void)
{
	ios::sync_with_stdio(false);
	string question;
	cin >> question;

	vector<int> sumlist;
	int sum = 0;

	for (int i = 0; i< question.size(); i++)
	{
		sum += question.at(i) - '0';
		sumlist.push_back(sum);
	}

	int cases=0;
	cin >> cases;
	while(cases--)
	{
		solveCase(sumlist, question);
	}

	return 0;
}
