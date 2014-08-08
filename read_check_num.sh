#!/bin/bash
TIMEOUT_DEF=45

echo "시간을 입력해주세요. (기본값=$TIMEOUT_DEF)"
read -r TIMEOUT

# Check NON INPUT
if [ -z "$TIMEOUT" ]
then
    echo "입력값이 없어 기본값=$TIMEOUT_DEF 으로 설정하였습니다."
    TIMEOUT=$TIMEOUT_DEF
fi

# Check is_num()
RET=${TIMEOUT//[0-9]/}
if [ -n "$RET" ]
then
    echo "숫자가 아님. 종료합니다."
    exit 0
fi

# Check less then 15
if [ $TIMEOUT -le 15 ]
then
    echo "15초 이하는 값으로 적절하지 않습니다."
    exit -1
fi

echo $TIMEOUT "으로 시간이 설정되었습니다."
