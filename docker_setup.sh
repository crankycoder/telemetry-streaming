EN=$(ifconfig en0 | grep "inet " | grep -oE '([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)' | head -n 1)
ETH=$(ifconfig eth0 | grep "inet " | grep -oE '([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)' | head -n 1)
INTERNAL_IP=$(hostname -I | awk '{print $1; exit}')

if test -n "$EN"; then
    DOCKER_KAFKA_HOST=$EN
elif test -n "$ETH"; then
    DOCKER_KAFKA_HOST=$ETH
else
    DOCKER_KAFKA_HOST=$INTERNAL_IP
fi

echo $DOCKER_KAFKA_HOST
