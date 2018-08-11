ls ./Imaris | while read id
do
	echo $id
	awk 'BEGIN{FS=","} NR==9{print $0}' ./Imaris/$id 
done > filterdata.csv
