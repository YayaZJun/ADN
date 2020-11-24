function link = ActivityDrivenLinker(N,m,a0,aLb)
	linkMat = eye(N,'logical'); %生成N×N的单位矩阵
	link = [];
	for i = 1:N
		a = (rand()<=a0(i)-aLb(i))+aLb(i); %如果生成的随机数小于等于(成立)的话，输出1
		if a %如果a=1则执行
			linkCol = find(~linkMat(:,i)); %find()找出矩阵中的所有非零元素的索引，并将索引值返回向量linkCol中；linkMat(:,i)取所有行的第i列
			linkCol = linkCol(randperm(end,min(a*m,end))); %将前end个数中，随机选择min(end, a*m)个
			link    = [link;linkCol,repmat(i,size(linkCol))]; %#ok<AGROW> repmat产生一个大矩阵
			linkMat(linkCol,i) = true; 
			linkMat(i,linkCol) = true; %都变成1
		end
	end
end