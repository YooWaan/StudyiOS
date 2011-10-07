#/bin/sh

CHECK_COMMAND=$1
DAT_FILE="${CHECK_COMMAND}.dat"

if [ -e ${DAT_FILE} ]; then
	rm ${DAT_FILE}
fi

echo "process:${$} -- ${CHECK_COMMAND}"

${CHECK_COMMAND} &
CHECK_PID=$!

data=`ps hlp ${CHECK_PID}`
while [ "${data}" != "" ];
do
	echo $data >> ${DAT_FILE}
	data=`ps hlp ${CHECK_PID}`
done