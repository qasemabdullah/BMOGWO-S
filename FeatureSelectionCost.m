%___________________________________________________________________%
%  Binary Multi-Objective Grey Wolf Optimizer for Feature Selection %
%  in Classification (BMOGWO-S)                                     %
%  Source codes demo version 1.0                                    %
%                                                                   %
%  Developed in MATLAB R2017A                                       %
%                                                                   %
%  Author and programmer: Qasem Al-Tashi                            %
%                                                                   %
%         e-Mail: qasemacc22@gmail.com                              %
%  Co-Authors and advisors 
%      Helmi Md Rais, Said Jadid Abdulkadir, Seyedali Mirjalili,    %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %%
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper:                                                     %
%                                                                   %
%    Q. Al-Tashi et al., “Binary Multi-Objective Grey Wolf Optimizer %
%    for Feature Selection in Classification,” IEEE Access, vol. 8, pp. 
%    106247–106263, 2020.                                           %       %
%                                                                   %
%___________________________________________________________________%

% I acknowledge that this version of MOGWO has been written using
% a large portion of the following code:
%___________________________________________________________________%
%  Multi-Objective Grey Wolf Optimizer (MOGWO)                      %
%  Source codes demo version 1.0                                    %
%                                                                   %
%  Developed in MATLAB R2011b(7.13)                                 %
%                                                                   %
%  Author and programmer: Seyedali Mirjalili                        %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper:                                                     %
%                                                                   %
%    S. Mirjalili, S. Saremi, S. M. Mirjalili, L. Coelho,           %
%    Multi-objective grey wolf optimizer: A novel algorithm for     %
%    multi-criterion optimization, Expert Systems with Applications,%
%    in press, DOI: http://dx.doi.org/10.1016/j.eswa.2015.10.039    %       %
%                                                                   %
%___________________________________________________________________%

% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPML122
% Project Title: Multi-Objective Feature selection using NSGA-II
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [z, out]=FeatureSelectionCost(s,data)

    % Read Data Elements
    x=data.x;
    t=data.t;
    
    % Selected Features
    S=find(s~=0);

    % Number of Selected Features
    nf=numel(S);
    
    % Ratio of Selected Features
    rf=nf/numel(s);
    
    % Selecting Features
    xs=x(:,S);
    %{
    if isempty(xs)
        return
    end
    %}
    % Weights of Train and Test Errors
    wTrain=0.8;
    wTest=1-wTrain;

    % Number of Runs
    nRun=5;
    EE=zeros(1,nRun);
    for r=1:nRun
        % Create and Train ANN
        results=CreateAndTrainANN(xs,t);

        % Calculate Overall Error
        EE(r) = wTrain*results.TrainData.E + wTest*results.TestData.E;
    end
    
    E=mean(EE);
    if isinf(E)
       E=100;
    end
    
    % Calculate Final Cost
    z=[nf
       E];

    % Set Outputs
    out.S=S;
    out.nf=nf;
    out.rf=rf;
    out.E=E;
    out.z=z;
    %out.net=results.net;
    %out.Data=results.Data;
    %out.TrainData=results.TrainData;
    %out.TestData=results.TestData;
    
end