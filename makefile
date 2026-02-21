start-persist:
	docker compose -f minio.docker-compose.yml up -d

stop-persist:
	docker compose -f minio.docker-compose.yml down
