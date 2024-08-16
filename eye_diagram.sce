// write to the file to generate coefficient settings for the same

no_of_samples_to_observe =  input("no of samples to be observed:");

filename = input("input file name for eye diagram generation:");

//u=mopen('./sampled_noise_output1','r');
u=mopen(filename,'r');
[n data_sampled_count data_sampled_value] = mfscanf(no_of_samples_to_observe,u,"\t%d - %f;\n"); // read(u,c,'((f10.7,'' ; ''))');
//disp(data_sampled_count);
//disp(data_sampled_value);
disp(max(data_sampled_value),"maximum sampled voltage value");
disp(min(data_sampled_value),"minimum sampled voltage value");
sampled_unsigned_int = uint32(data_sampled_value * 100000);
disp(min(sampled_unsigned_int),"minimum transitioned voltage value");
file('close',u);
subplot(2,2,1);
plot(data_sampled_count,data_sampled_value,'r->');
xtitle("EYE_DIAGRAM", "time", "volatage");

//u=mopen('./sampled_tx_output1','r');
//[n data_sampled_count data_sampled_value] = mfscanf(no_of_samples_to_observe,u,"\t%d - %f;\n"); // read(u,c,'((f10.7,'' ; ''))');
////disp(data_sampled_count);
////disp(data_sampled_value);
//disp(max(data_sampled_value),"tx gen1 maximum sampled voltage value");
//disp(min(data_sampled_value),"tx gen1 minimum sampled voltage value");
//file('close',u);
//subplot(2,2,2)
//plot(data_sampled_count,data_sampled_value);
//xtitle("EYE_DIAGRAM TX GEN1", "time", "volatage");
//
//u=mopen('./sampled_noise_output3','r');
//[n data_sampled_count data_sampled_value] = mfscanf(no_of_samples_to_observe,u,"\t%d - %f;\n"); // read(u,c,'((f10.7,'' ; ''))');
////disp(data_sampled_count);
////disp(data_sampled_value);
//disp(max(data_sampled_value),"noise gen3 maximum sampled voltage value");
//disp(min(data_sampled_value),"noise gen3 minimum sampled voltage value");
//sampled_unsigned_int = uint32(data_sampled_value * 100000);
//disp(min(sampled_unsigned_int),"noise gen3 minimum transitioned voltage value");
//file('close',u);
//subplot(2,2,3)
//plot(data_sampled_count,data_sampled_value);
//xtitle("EYE_DIAGRAM NOISED GEN3", "time", "volatage");
//
//u=mopen('./sampled_tx_output3','r');
//[n data_sampled_count data_sampled_value] = mfscanf(no_of_samples_to_observe,u,"\t%d - %f;\n"); // read(u,c,'((f10.7,'' ; ''))');
////disp(data_sampled_count);
////disp(data_sampled_value);
//disp(max(data_sampled_value),"tx gen3 maximum sampled voltage value");
//disp(min(data_sampled_value),"tx gen3 minimum sampled voltage value");
//file('close',u);
//subplot(2,2,4)
//plot(data_sampled_count,data_sampled_value);
//xtitle("EYE_DIAGRAM TX GEN3", "time", "volatage");
