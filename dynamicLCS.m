str1 = 'ABCDGH';
str2 = 'AEDFHR';
lcs = longestCommonSubsequence(str1, str2);
disp(lcs);
function lcs = longestCommonSubsequence(str1, str2)
    % Get the lengths of the input strings
    len1 = length(str1);
    len2 = length(str2);

    % Create a table to store the lengths of LCS
    table = zeros(len1+1, len2+1);

    % Compute the lengths of LCS
    for i = 1:len1
        for j = 1:len2
            if str1(i) == str2(j)
                table(i+1, j+1) = table(i, j) + 1;
            else
                table(i+1, j+1) = max(table(i+1, j), table(i, j+1));
            end
        end
    end

    % Find the LCS by backtracking the table
    lcs = '';
    i = len1;
    j = len2;
    while i > 0 && j > 0
        if str1(i) == str2(j)
            lcs = [str1(i) lcs];
            i = i - 1;
            j = j - 1;
        elseif table(i+1, j) > table(i, j+1)
            j = j - 1;
        else
            i = i - 1;
        end
    end
end
