#/bin/sh

CHECK_COMMAND=$*
RUN_COMMAND=$1
DAT_FILE="${RUN_COMMAND}.dat"

if [ -e ${DAT_FILE} ]; then
	rm ${DAT_FILE}
fi

echo "process:${$} -- ${CHECK_COMMAND} data file:${DAT_FILE}"

${CHECK_COMMAND} &> /dev/null &
#${CHECK_COMMAND} &
CHECK_PID=$!

PS_COMMAND="ps hlp ${CHECK_PID}"
data=`${PS_COMMAND}`
datalen=`${PS_COMMAND} | wc -l`

while [ ${datalen} -eq 2 ];
do
	echo $data | tail -n 1 >> ${DAT_FILE}

	sleep 1

	data=`${PS_COMMAND}`
	datalen=`${PS_COMMAND} | wc -l`
done

awk '{printf("%d\t%s\n", NR, $21);}' ${DAT_FILE} > chk.dat

gnuplot plot.sh
