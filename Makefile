deploy_monitoring:
	helm upgrade prometheus-operator stable/prometheus-operator --install --namespace monitoring -f helm-charts/prometheus-operator/values.yaml -f helm-charts/prometheus-operator/dashboards.yaml -f helm-charts/prometheus-operator/secrets.yaml
	kubectl apply -f k8s-manifests/servicemonitors

deploy_influxdb:
	kubectl apply -f k8s-manifests/influxdb

deploy_varken:
	kubectl apply -f k8s-manifests/varken

deploy_issuer:
	kubectl apply -f clusterissuer.yaml
