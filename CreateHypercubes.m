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

function G=CreateHypercubes(costs,ngrid,alpha)

    nobj=size(costs,1);
    
    empty_grid.Lower=[];
    empty_grid.Upper=[];
    G=repmat(empty_grid,nobj,1);
    
    for j=1:nobj
        
        min_cj=min(costs(j,:));
        max_cj=max(costs(j,:));
        
        dcj=alpha*(max_cj-min_cj);
        
        min_cj=min_cj-dcj;
        max_cj=max_cj+dcj;
        
        gx=linspace(min_cj,max_cj,ngrid-1);
        
        G(j).Lower=[-inf gx];
        G(j).Upper=[gx inf];
        
    end

end