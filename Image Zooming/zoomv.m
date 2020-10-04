t = int64(imread('cameraman.tif'));
[d1,d2] = size(t);
zoomlevel = input('please enter zoom level(2 or 4) :');
adjacency = input('please enter number of effective adjacents(1 , 2 , 4) :');

zero = zeros(d1,1);

%first line is added first , implementation issues
m = [];

for j=1:zoomlevel
      m=[m zero];
end
m = [t(:,1)];
for i=2:d2
    %add enough zeros to fill data when there is no data for interpolation
   for j=1:zoomlevel-1
      m=[m zero];
   end
   m=[m t(:,i)];   
end

%add zeros to the end so we add 0 values when there is no value
for j=1:zoomlevel
   m=[m zero] ;      
end




for j=1:d1
    for i=1:d2*zoomlevel
        %these indexes are original data and already exist (no need to
        %interpolate)
        if rem(i, zoomlevel)== 1
            continue
        
        else
            
            p = 0;
            index = 0;
            x = i;
            x=int64(x);
            points=[];
            % adjacents from one side
            while (p <  (adjacency / 2)) && (x>1)
                x = x - 1;
                if rem(x, zoomlevel) == 1
                    points = [points [x; m(j,x)]];
                    index = index + 1;
                    p = p + 1;
                else
                    continue;
                end
            end

            x = i;
            x=int64(x);
            % adjacents from another side
            while i <  adjacency && x<d2*zoomlevel
                x = x + 1;
                if rem(x, zoomlevel) == 1
                    points = [points [x; m(j,x)]];
                    index = index + 1;
                    p = p + 1;
                else
                    continue
                end
            end
            
            m(j,i) = Vlagrange(i,points(1,:),points(2,:));
            clear points;
        end
     
            
    end  
end


m = uint8(m);
imshow(m);



