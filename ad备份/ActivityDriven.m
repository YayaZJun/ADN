function net = ActivityDriven(x,T,m,eta)
	fprintf(1,'initializing: ...');
	N = numel(x); %NΪԪ�ظ������ڵ������
	net = cell(1,T); %����һ��1��T��С�ľ���
	a0 = eta*x(:); %�ڵ��Ծ����
	aLb = floor(a0); %ȡ�����ڱ���������������
    n = [];
	for t = 1:T %����ѭ��
        n0 = [];
        disp(t); %��������
		link = ActivityDrivenLinker(N,m,a0,aLb);
        a = size(link);
        for i = 1:a(1) %link������
            n0 = [n0;t-1];
        end

        n = [n;[n0,link-1]];
        
		net{t} = sparse(link,fliplr(link),true,N,N); %������link, fliplr(link)��true����һ��N*N��ϡ�����
		fprintf(1,'.');
    end
    disp(n);
    csvwrite('ML1504N5034T1m.csv',n);
	fprintf('\n');
    disp(net)
end