####################################################################################################################
# Setup containers to run Airflow
get-data:
	rm -rf ./data && cp mnt/c/Users/User/Desktop/transaction data/lpetrocelli-czech-financial-dataset-real-anonymized-transactions/lpetrocelli-czech-financial-dataset-real-anonymized-transactions/data . && chmod -R u=rwx,g=rwx,o=rwx data

docker-spin-up:
	docker compose  --env-file env up airflow-init && docker compose --env-file env up --build -d

perms:
	mkdir -p logs plugins temp && sudo chmod -R u=rwx,g=rwx,o=rwx logs plugins temp dags tests migrations spectrum_tables

up: get-data perms docker-spin-up

down:
	docker compose down

sh:
	docker exec -ti webserver bash
