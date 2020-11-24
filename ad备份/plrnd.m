function r = plrnd(gamma,epsilon,varargin)
	r = 1./((epsilon-rand(varargin{:}).*(epsilon-epsilon.^gamma))...
		./epsilon.^gamma).^(1./(gamma-1));
end