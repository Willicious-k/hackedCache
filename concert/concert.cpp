#include <iostream>
#include <vector>
#include <queue>
using namespace std;

void solveCase(void)
{
	int n = 0, vs =0, vm = 0;
	cin >> n >> vs >> vm;

	vector<int> nList(n);

	for (int i = 0; i< n; i++)
	{
		cin >> nList[i];
	}
	
	int answer = -1, tempCur = 0, tempAdd = 0, tempMin = 0;

	vector<int> sb(vm+1, 0);
	queue<int> cache;
	cache.push(vs);

	for (vector<int>::iterator it = nList.begin(); it != nList.end(); it++)
	{
		for (vector<int>::iterator jt = sb.begin(); jt != sb.end(); jt++)
		{
			*jt = 0;
		}

		if (cache.size() == 0) {
			answer = -1;
			break;
		}

		for (int i = cache.size(); i > 0; i--)
		{
			tempCur = cache.front();
			cache.pop();
			tempAdd = tempCur + *it;
			tempMin = tempCur - *it;

			if (tempAdd <= vm && sb[tempAdd] == 0) {
				cache.push(tempAdd);
				sb[tempAdd] = 1;
			}

			if (tempMin >= 0 && sb[tempMin] == 0) {
				cache.push(tempMin);
				sb[tempMin] = 1;
			}
		}
	}
	
	while (!cache.empty())
	{
		tempCur = cache.front();
		cache.pop();

		if (tempCur > answer) {
			answer = tempCur;
		}
	}

	cout << answer << endl;
	return;
}

int main(void)
{
	int cases;
	cin >> cases;
	while (cases--)
	{
		solveCase();
	}
	return 0;
}
