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
%    Q. Al-Tashi et al., �Binary Multi-Objective Grey Wolf Optimizer %
%    for Feature Selection in Classification,� IEEE Access, vol. 8, pp. 
%    106247�106263, 2020.                                           %       %
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

function pop=DetermineDomination(pop)

    npop=numel(pop);
    
    for i=1:npop
        pop(i).Dominated=false;
        for j=1:i-1
            if ~pop(j).Dominated
                if Dominates(pop(i),pop(j))
                    pop(j).Dominated=true;
                elseif Dominates(pop(j),pop(i))
                    pop(i).Dominated=true;
                    break;
                end
            end
        end
    end

end