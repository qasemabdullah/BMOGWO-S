# BMOGWO-S
Binary Multi-Objective Grey Wolf Optimizer for Feature Selection in Classification
MATLAB code for BMOGWO-S: Binary Multi-objective Grey Wolf Optimizer for Feature selection in Classification
Paper Reference - Q. Al-Tashi et al., “Binary Multi-Objective Grey Wolf Optimizer for Feature Selection in Classification,” IEEE Access, vol. 8, pp. 106247–106263, 2020.
Link for algorithm details: Paper
https://ieeexplore.ieee.org/abstract/document/9108264

To Run the code follow the following steps:

BMOGWO-S:

1. To execute the algorithm run BMOGWOS.m file
2. To change the dataset go to LoadData.m file
3. To find the error rate of all features of the data Run ErroRate.m
4. We run BMOGWOS.mat 20 times for each dataset and then we choose the best solution
5. You have to create a folder for each data to stored the non-dominated solution.
6. we averaged the computational time obtained in 20 runs.
7. Noted that the time obtained is in seconds you have to convert it to minutes.
8. We have used only ANN classifier to obtain error rate,you can use other classifiers as well. But, you need to change the CreateAndTrainANN.m file.


Abstract:
Feature selection or dimensionality reduction can be considered as a multi-objective minimization problem with two objectives: minimizing the number of features and minimizing the error rate simultaneously.
Despite being a multi-objective problem, most existing approaches treat feature selection as a single-objective optimization problem. Recently, Multi-objective Grey Wolf optimizer (MOGWO) was proposed to 
solve multi-objective optimization problem. However, MOGWO was originally designed for continuous optimization problems and hence, it cannot be utilized directly to solve multi-objective feature selection 
problems which are inherently discrete in nature. Therefore, in this research, a binary version of MOGWO based on sigmoid transfer function called BMOGWO-S is developed to optimize feature selection problems. 
A wrapper based Artificial Neural Network (ANN) is used to assess the classification performance of a subset of selected features. To validate the performance of the proposed method, 
15 standard benchmark datasets from the UCI repository are employed. The proposed BMOGWO-S was compared with MOGWO with a tanh transfer function and Non-dominated Sorting Genetic Algorithm (NSGA-II) 
and Multi-objective Particle Swarm Optimization (MOPSO). The results showed that the proposed BMOGWO-S can effectively determine a set of non-dominated solutions. 
The proposed method outperforms the existing multi-objective approaches in most cases in terms of features reduction as well as classification error rate while benefiting from a lower computational cost.
![image](https://github.com/qasemabdullah/BMOGWO-S/assets/37542894/db44f0ae-84fd-460e-95c2-64cd8e0f16ac)
