function [u,s,is] = unique_switch(a)

    % (1) get the unique rows in "a" (obviously, here, the rows with switched elements are detected as different rows)
    u = unique(a,'rows');

    % (2) get the rows with switched elements 
    j = 1;
    s = [];
    for i = 1 : size(u,1)
       idx = [];
       [~,idx] = ismember(u,u(i,[2 1]),'rows');
       if ~all(idx==0) % if the row of "u" with swtiched elements is present inside "u"
            if isempty(s) % if the "s" array is empty
                       s(j,:) = u(idx~=0,:);
                       j = j + 1;
            else % if the "s" array is not empty
                   if ~ismember(u(idx~=0,:),s,'rows') && ~ismember(fliplr(u(idx~=0,:)),s,'rows') % if the row of "u" is not already present in "s" (also with switched elements)
                       s(j,:) = u(idx~=0,:);
                       j = j + 1;
                   end
            end
       end
    end

    % (3) remove the rows in "u" with switched elements, and get the unique
    % elements of "a", even with switched elements
    idx = [];
    [~,idx] = ismember(s,u,'rows');
    u(idx,:) = [];

    % (4) find rows with switched elements inside "a"
    for i = 1 : size(s,1)
        idx1 = []; 
        idx2 = [];
        [~,idx1] = ismember(a,s(i,[1 2]),'rows');
        [~,idx2] = ismember(a,s(i,[2 1]),'rows');
        is{i} = find(idx1 + idx2);
    end

end