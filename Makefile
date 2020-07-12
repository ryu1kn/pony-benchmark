SHELL := /bin/bash

time-%:
	echo 'GET http://localhost:8080/health' | vegeta attack -duration 2m | tee result-$*.bin | vegeta report
