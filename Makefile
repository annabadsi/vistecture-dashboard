VERSION=2.0.1
.PHONY: dockerpublish

dockerpublish:
	#echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
	docker build --no-cache -t aoepeople/vistecture-dashboard .
	docker tag aoepeople/vistecture-dashboard:latest aoepeople/vistecture-dashboard:$(VERSION)
	docker push aoepeople/vistecture-dashboard
