
function[C,V]=mykmeans(Data,k)
initial=datasample(Data,k,'Replace',false);
dist=pdist2(Data,initial);
[~,I]=sort(dist,2);
labels=I(:,1);
centroids=zeros(k,2);
while centroids-initial~=0
    initial=centroids;
for i=1:k
    y= labels==i;
    centroids(i,:)=mean(Data(y,:));     
     
end
    dist=pdist2(Data,centroids);
    [~,I]=sort(dist,2);
    labels=I(:,1);
    
end
C=centroids;
V=labels;

hold on
for j=1:k
    m(:,j)=labels==j;
    plot(Data(m(:,j),1),Data(m(:,j),2),'x','color',rand(1,3))
end
plot(centroids(:,1),centroids(:,2),'dr','MarkerSize',5, 'MarkerFaceColor','r')
 grid on
 title('K-means clustering')
end

