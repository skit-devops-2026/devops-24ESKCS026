install:
        @echo "No dependencies required"

test:
        bash test/test.sh

build:
        @echo "Static site build successful"

run:
        @echo "Open index.html in browser"

docker-build:
        @echo "Docker build placeholder"

docker-up:
        docker compose up --build