#include <iostream>
#include <iomanip>
#include <algorithm>
using namespace std;

bool ascending(int i, int j) { return i < j; }
bool descending(int i, int j) { return i > j; }

void solveCase(void)
{
	int listSize = 0;
	cin >> listSize;

	int* AscList = new int[listSize];
	int* DecList = new int[listSize];
	for (int i = 0; i< listSize; i++)
	{
		AscList[i] = 0;
		DecList[i] = 0;
		cin >> AscList[i];
		DecList[i] = AscList[i];
	}

	sort(AscList, AscList+listSize, ascending);
	sort(DecList, DecList+listSize, descending);
	
	double maxScore = 0;
	for (int i = 0; i< listSize; i++)
	{
		AscList[i] += DecList[i];
		if (AscList[i] > maxScore) {
			maxScore = AscList[i];
		}
	}

	cout << fixed << setprecision(1) << (maxScore/2) << endl;
	
	delete[] AscList;
	delete[] DecList;
	return;
}

int main(void)
{
	ios::sync_with_stdio(false);
	int cases=0;
	cin >> cases;
	while(cases--)
	{
		solveCase();
	}
	return 0;
}
