[N,gamma,epsilon] = deal(15000,2.8,0.001);%N=10,gamma=2.1,epsilon=0.001
nodeActivity = plrnd(gamma,epsilon,[1,N]);
%dlmwrite('5000nodeactivity2.5.txt',nodeActivity,'delimiter',',','precision',4,'newline','pc')
[T,m,eta] = deal(5000,1,1); %T=20��m=50��eta=10 T��������m��ÿһ����Ծ�ڵ�Ҫ���ӵı�����eta�Ǽ���ai��
net = ActivityDriven(nodeActivity,T,m,eta);