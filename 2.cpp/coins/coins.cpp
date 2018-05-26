#include <iostream>
using namespace std;

void solveCase(void)
{
	int target = 0;
	int num_denominations = 0;
	cin >> target >> num_denominations;

	int* denominations = new int[num_denominations];
	for (int i = 0; i< num_denominations; i++)
	{
		cin >> denominations[i];
	}

	/* sort denominations here - skip for the first round */

	int** cache = new int*[num_denominations+1];
	for (int i = 0; i<= num_denominations; i++)
	{
		cache[i] = new int[target+1];
	}

	for (int i = 0; i<= num_denominations; i++)
	{
		for (int j = 0; j<= target; j++)
		{
			cache[i][j] = 0;
		}
	}

	for (int i = 0; i<= num_denominations; i++)
	{
		cache[i][0] = 1;
	}

	for (int i = 1; i<= target; i++)
	{
		cache[0][i] = 0;
	}

	for (int i = 1; i<= num_denominations; i++)
	{
		for (int j = 1; j<= target; j++)
		{
			if (denominations[i-1] <= j) {
				cache[i][j] = (cache[i-1][j] + cache[i][j-denominations[i-1]]) % 1000000007;
			} else {
				cache[i][j] = cache[i-1][j];
			}
		}
	}

	cout << cache[num_denominations][target] << endl;

	for (int i = 0; i< num_denominations; i++)
	{
		delete [] cache[i];
	}
	delete [] cache;
	delete [] denominations;
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
