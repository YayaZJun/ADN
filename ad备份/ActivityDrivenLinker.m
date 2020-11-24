function link = ActivityDrivenLinker(N,m,a0,aLb)
	linkMat = eye(N,'logical'); %����N��N�ĵ�λ����
	link = [];
	for i = 1:N
		a = (rand()<=a0(i)-aLb(i))+aLb(i); %������ɵ������С�ڵ���(����)�Ļ������1
		if a %���a=1��ִ��
			linkCol = find(~linkMat(:,i)); %find()�ҳ������е����з���Ԫ�ص���������������ֵ��������linkCol�У�linkMat(:,i)ȡ�����еĵ�i��
			linkCol = linkCol(randperm(end,min(a*m,end))); %��ǰend�����У����ѡ��min(end, a*m)��
			link    = [link;linkCol,repmat(i,size(linkCol))]; %#ok<AGROW> repmat����һ�������
			linkMat(linkCol,i) = true; 
			linkMat(i,linkCol) = true; %�����1
		end
	end
end