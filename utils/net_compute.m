function output = net_compute(input,net,usegpu)
 
input = im2single(input);
if usegpu==1
    input = gpuArray(input);
   
end
 res    = vl_simplenn(net,input,[],[],'conserveMemory',true,'mode','test');

 output = double(res(end).x);
 if   usegpu==1
 output = gather(output);
 end

 
end