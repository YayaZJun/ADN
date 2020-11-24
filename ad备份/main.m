[N,gamma,epsilon] = deal(15000,2.8,0.001);%N=10,gamma=2.1,epsilon=0.001
nodeActivity = plrnd(gamma,epsilon,[1,N]);
%dlmwrite('5000nodeactivity2.5.txt',nodeActivity,'delimiter',',','precision',4,'newline','pc')
[T,m,eta] = deal(5000,1,1); %T=20，m=50，eta=10 T是轮数、m是每一个活跃节点要连接的边数、eta是计算ai的
net = ActivityDriven(nodeActivity,T,m,eta);