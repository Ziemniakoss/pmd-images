# ======== RUN images ===========
run-pmd-full: build-pmd
	docker run -it ziemniakoss/pmd-full

run-pmd-apex: build-pmd-apex
	docker run -it  ziemniakoss/pmd-apex

run-pmd-apex-test: build-pmd-apex-test
	docker run -it --entrypoint=sh ziemniakoss/pmd-apex-test

# ======= BUILD Images ===============
build: build-pmd build-pmd-apex

build-pmd: docker-pmd/Dockerfile
	docker build -t ziemniakoss/pmd-full docker-pmd

build-pmd-apex: build-pmd
	docker build -t ziemniakoss/pmd-apex docker-pmd-apex

build-pmd-apex-test: build-pmd-apex
	docker build -t ziemniakoss/pmd-apex-test docker-pmd-apex-test

# ========= TEST images ===========
test: test-pmd-apex

# ========= PUBLISH images =========
publish: publish-pmd publish-pmd-apex

publish-pmd: #build-pmd
	echo PUBLISHING pmd

publish-pmd-apex: publish-pmd
	echo pmd apex

test-pmd-apex: build-pmd-apex-test
	echo ============ START OF PMD APEX TEST =========
	docker run ziemniakoss/pmd-apex-test
	echo ============ END OF PMD APEX TEST ============
