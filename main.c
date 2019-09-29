#include <stdio.h>

int * twoSum(int* nums, int numsSize, int target, int* returnSize)
{
    int* res = (int* )malloc(numsSize);
    int i = 0;
    int j = 0;
    *returnSize = 0;
    for (i = 0; i < numsSize; i++) {
        for (j = i; j < numsSize; j++) {
            if (nums[i] + nums[j] == target) {
                res[0] = nums[i];
                res[1] = nums[j];
                *returnSize = 2;
                return res;
            }
        }
    }
    return res;
}

int main() {

    printf("I want run test\n");

    printf("Hello, World!\n");

    int nums[] = {2, 7, 11, 15};
    int rsize  = 0;
    int *rvale = twoSum(nums, 4, 9, &rsize);

    printf("judge value:\n");
    for (int i = 0; i < rsize; ++i) {
        printf("%d", rvale[i]);
    }

    return 0;
}