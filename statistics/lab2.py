import numpy as np
import pandas as pd
import networkx as nx
from tabulate import tabulate


class MarkovChain:

    def __init__(self, prob_matrix: pd.DataFrame, init_vector: pd.DataFrame):
        self._prob_matrix = prob_matrix.transpose()
        self._init_vector = init_vector
        self.state = self._find_init_state(init_vector)

    def compute_probs(self, times: int) -> np.ndarray:
        _matrix = np.linalg.matrix_power(self._prob_matrix, times)
        _result = np.matmul(_matrix, self._init_vector.transpose())
        return _result.transpose()

    def next_state(self):
        probs = self._prob_matrix.get(self.state)
        columns = list(self._prob_matrix.columns)
        state = np.random.choice(columns, 1, p=probs)[0]
        self.state = state
        return state

    @staticmethod
    def _find_init_state(init_vector: pd.DataFrame) -> int:
        vector = init_vector.to_numpy()
        if vector.max() != 1: return 'no state'
        pos = vector.argmax()
        return list(init_vector.columns)[pos]


def decor_output(matrix, vector):
    print('\n Given matrix of probabilities \n')
    print(tabulate(matrix, headers='keys', tablefmt='github'))
    print('\n Given initial probabilities vector \n')
    print(tabulate(vector, headers='keys', tablefmt='github'))


def decor_result(time, vector):
    print(f'\n Probabilities of system`s states after {time} steps \n')
    print(tabulate(vector, headers='keys', tablefmt='github'))


def decor_state(chain):
    print('\nlet`s roll the dice:')
    print(chain.next_state())


def main():
    states = np.array(['sleep', 'eat', 'play'])
    start = np.array([1, 0, 0])
    matrix = np.array([[0.1, 0.6, 0.3],
                     [0.8, 0.2, 0],
                     [0.7, 0.3, 0]], dtype=float)

    start = pd.DataFrame(start, index=states, columns=['probs']).transpose()
    matrix = pd.DataFrame(matrix, index=states, columns=states)
    time = 10

    chain = MarkovChain(matrix, start)

    decor_output(matrix, start)
    decor_result(time, chain.compute_probs(time))
    decor_state(chain)

main()
