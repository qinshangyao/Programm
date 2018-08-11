ls ./Imaris | while read id
do
	awk 'BEGIN{FS=","}{printif %10s,%10s,%10s,%10s,%10s,%10s,%10s,%10s\n,"Name","Min","Max","Mean","StdDev","Median","Sum","Cout"} NR==9{print $1 $2 $3 $4 $5 $6 $7 %8}' ./Imaris/$id 
done > filterdata.csv
