function net = ActivityDriven(x,T,m,eta)
	fprintf(1,'initializing: ...');
	N = numel(x); %N为元素个数（节点个数）
	net = cell(1,T); %创建一个1×T大小的矩阵
	a0 = eta*x(:); %节点活跃概率
	aLb = floor(a0); %取不大于本身的最大整数？？
    n = [];
	for t = 1:T %轮数循环
        n0 = [];
        disp(t); %命令窗口输出
		link = ActivityDrivenLinker(N,m,a0,aLb);
        a = size(link);
        for i = 1:a(1) %link的行数
            n0 = [n0;t-1];
        end

        n = [n;[n0,link-1]];
        
		net{t} = sparse(link,fliplr(link),true,N,N); %由向量link, fliplr(link)和true生成一个N*N的稀疏矩阵
		fprintf(1,'.');
    end
    disp(n);
    csvwrite('ML1504N5034T1m.csv',n);
	fprintf('\n');
    disp(net)
end