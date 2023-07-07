#!/bin/bash

echo -e "123456#{\"finalKey\": \"ABC\", \"eventId\": \"1\", \"value\": 10}\n78910#{\"finalKey\": \"ABC\", \"eventId\": \"2\", \"value\": 20}\n123456#{\"finalKey\": \"TEST\", \"eventId\": \"3\", \"value\": 32}\n78910#{\"finalKey\": \"TEST\", \"eventId\": \"4\", \"value\": 40}" | docker exec -i broker kafka-console-producer --bootstrap-server broker:29092 --topic input-topic --property parse.key=true --property key.separator=#