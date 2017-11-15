function [ Hist ] = CalNormalizedHSVHist( Im, HbinNum, SbinNum, VbinNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Hist = zeros(1, HbinNum*SbinNum*VbinNum);

A = rgb2hsv(Im);

H = uint8(255*A(:,:,1));
S = uint8(255*A(:,:,2));
V = uint8(255*A(:,:,3));

hss = max(H(:))/HbinNum;
sss = max(S(:))/SbinNum;
vss = max(V(:))/VbinNum;

totcount = 0;

for vi = 0:VbinNum-1
    for sj = 0:SbinNum-1
        for hk = 0:HbinNum-1
            count = 0;
            for r = 1:size(Im,1)
                for c = 1:size(Im,2)
                    if( hk*hss <= Im(r,c,1) && Im(r,c,1) < hk*hss+hss+1)
                        if( sj*sss <= Im(r,c,2) && Im(r,c,2) < sj*sss+sss+1)
                            if( vi*vss <= Im(r,c,3) && Im(r,c,3) < vi*vss+vss+1)
                                count = count + 1;
                            end
                        end
                    end
                end
            end
            totcount =totcount+count;
            Hist( vi*SbinNum*HbinNum+sj*HbinNum+hk +1 ) = count/(size(Im,1)*size(Im,2));
            disp(vi*SbinNum*HbinNum+sj*HbinNum+hk +1);
        end
    end
end
disp(totcount);
disp(size(Im,1)*size(Im,2));
end

