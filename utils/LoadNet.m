function net = LoadNet(modelName , epoch ,  usegpu)
%RESDUAL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

load(fullfile('models',[modelName,'-epoch-',num2str(epoch),'.mat']));
net = vl_simplenn_tidy(net); 
net.layers = net.layers(1:end-1);
net = vl_simplenn_tidy(net); 

if usegpu == 1
    net = vl_simplenn_move(net,'gpu');
end

end

