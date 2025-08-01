start-datalake:
	docker compose -f docker-compose.yml up -d --build minio

stop-datalake:
	docker compose -f docker-compose.yml stop minio
	docker compose -f docker-compose.yml rm -f minio