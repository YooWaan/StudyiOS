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

data=`ps hlp ${CHECK_PID}`
while [ "${data}" != "" ];
do
	echo $data >> ${DAT_FILE}
	data=`ps hlp ${CHECK_PID}`
done

awk '{printf("%d\t%s\n", NR, $8);}' ${DAT_FILE} > chk.dat

gnuplot plot.sh