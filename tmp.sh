echo "Name,Min,Max,Mean,StdDev,Median,Sum,Cout" > filterdata.csv
ls ./HelpCaiyu | while read id
do 
	awk -v name=$id 'BEGIN{FS=","} NR==9{print name"," $2","$3","$4","$5","$6","$7","$8}' ./HelpCaiyu/$id
done >> filterdata.csv
 