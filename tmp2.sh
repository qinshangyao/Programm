# tmp2.sh
this line was at master branch;you decide 

printf "%5s %5s %5s %5s %5s %5s %5s %5s\n" "Name","Min","Max","Mean","StdDev","Median","Sum","Cout"  > filterdata.csv
ls ./HelpCaiyu | while read id
do 
	awk -v name=$id 'BEGIN{FS=","} /Cell Number of Voxels/{print name"," $2","$3","$4","$5","$6","$7","$8}' ./HelpCaiyu/$id
done >> filterdata2.csv

