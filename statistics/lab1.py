import numpy as np
import matplotlib.pyplot as plt
from math import sqrt
from scipy import stats


def arr_average(array):
    return sum(array) / len(array)

def arr_variance(array):
    avg = arr_average(array)
    _sum = sum([(x-avg)**2 for x in array])
    return _sum / (len(array)-1)

def median(array):
    n = len(array)
    if (n % 2 == 1): return array[n//2]
    else: return (array[int(n/2)] + array[int(n/2 - 1)]) / 2

def part_A(array):
    x = arr_average(array)
    s2 = arr_variance(array)
    s = sqrt(s2)
    m = median(array)
    return [x, m, s2, s]

def criterium(x1, x2, s1, s2, n1, n2):
    chis = x1 - x2
    sp = sqrt(merged_variance(s1, s2, n1, n2))
    znam = sp * sqrt(1/n1 + 1/n2)
    return chis / znam

def merged_variance(variance1, variance2, n1, n2):
    s1, s2 = variance1, variance2
    chis = (n1-1)*s1 + (n2-1)*s2
    znam = n1 + n2 - 2
    return chis / znam

def hasPassedMeanEquality(t_criterium, df, alpha):
    t = abs(t_criterium) #i think it should be absolute value
    # 1 - stats.t.cdf returns alpha given to T(alpha, defgreesOfFreedom)
    p = 2*(1 - stats.t.cdf(t, df=df))
    if (p > alpha) : return True
    else : return False

def part_B(array1, array2):
    T_value = criterium(arr_average(array1),
                        arr_average(array2),
                        arr_variance(array1),
                        arr_variance(array2),
                        len(array1),
                        len(array2))
    return T_value

def part_C(T_value, deegresFreedom, alpha=0.05):
    return hasPassedMeanEquality(T_value, deegresFreedom, alpha)

def print_A(part_a):
    avg, median, var, dev = part_a
    print(f'середне вибіркове {avg}')
    print(f'медіана {median}')
    print(f'вибіркова дисперсія {var}')
    print(f'середньоквадратичне відхилення {dev}')

def part_D(array1, array2):

    print('Вибірка 1')
    print_A(part_A(array1))
    print()
    print('Вибірка 2')
    print_A(part_A(array2))

    print()
    t = part_B(array1, array2)
    print(f'значення статистичного критерію t {t}')

    print('рівень значущості 0.05')
    df = len(array1) + len(array2) - 2
    choose_h0 = part_C(t, df)

    print()
    if (choose_h0) : print('Приймаємо нульову гіпотезу')
    else: print('Відхиляємо нульову гіпотезу')

def print_start_params(n1, n2, mu1, mu2, sigm1, sigm2):
    print('Терентьєв Гліб, ІТ-91, Варіант 23')
    print(f'розмір першої вибірки {n1}')
    print(f'розмір другої вибірки {n2}')
    print(f'мат сподівання першої вибірки {mu1}')
    print(f'мат сподівання {mu2}')
    print(f'дисперсія першої вибірки {sigm1}')
    print(f'дисперсія другої вибірки {sigm2}')
    print()

def main():
    n1, n2 = 128, 101
    mu, sigma, = 15, 2
    sigma1 = sigma2 = sigma
    mu1 = mu2 = mu
    array1 = np.random.normal(mu1, sigma1, n1)
    array2 = np.random.normal(mu2+2, sigma2, n2)
    print_start_params(n1, n2, mu1, mu2, sigma1, sigma2)
    array1.sort()
    array2.sort()

    part_D(array1, array2)
    plt.close('all')
    #df = pd.DataFrame(array1)
    #plt.figure()
    plt.hist(array1, bins=10)
    plt.show()
    plt.close('all')
    plt.hist(array2, bins=10)
    plt.show()
    #df.plot.hist()

main()
