# PG Finder

> Replace every angle-bracket placeholder below. The hygiene check in CI will
> fail until you do.

## Author

| Roll No. | Name | GitHub username |
|---|---|---|
| 24ESKCS026 | Aishwarya Maheshwari | aishwaryaa-11 |

## About

My PG Finder(Stayymate) is a full-stack web application designed to help students find suitable PG accommodations based on Location and budget, along with roomate-finding feature.
My **PG Finder (Stayymate)** is a full-stack web application designed to help students find suitable PG accommodations based on **location and budget**, along with a **roommate-finding feature**. It uses **HTML, CSS, JavaScript, jQuery, Node.js, Express.js, and MongoDB**, with an interactive and user-friendly interface.

## Tech stack

- Frontend: HTML, CSS
- Backend: JavaScript, jQuery, Node.js, Express.js
- Database: MongoDB

## Running locally

```bash
make install
make test
make build
PORT=8000 make run
```

Open `http://localhost:8000` in a browser. The application is a static
frontend; no database or application dependencies are required.

## Docker

Build and run the production image with Docker Compose:

```bash
make docker-build
docker compose up --build -d
curl http://localhost:8080/health
docker compose ps
make docker-down
```

Set `HOST_PORT` to use another local port, for example
`HOST_PORT=9000 docker compose up --build`.

The nginx container listens on the hosting platform’s `PORT` (default `8080`).
`GET /health` returns HTTP 200 and `ok` when the site is being served.

## GitHub Container Registry

The `docker` job in `.github/workflows/ci.yml` builds and publishes
`ghcr.io/skit-devops-2026/devops-24eskcs026` on pushes after tests pass. It uses
the automatically provided `GITHUB_TOKEN` with `contents: read` and
`packages: write`; no secret is hardcoded. Images receive a commit-SHA tag and
`latest` on the default branch.

## Hosting deployment

The exact free-platform deployment and verification steps are in
[`docs/deployment.md`](docs/deployment.md). No public deployment is claimed
until the maintainer creates one and verifies its `/health` URL.

## Monitoring

Prometheus and Grafana configuration is in [`monitoring/`](monitoring/).
Because this is currently a static frontend, it does not expose application
Prometheus metrics. The supplied valid Prometheus configuration monitors
Prometheus itself, and the Grafana provisioning dashboard shows scrape-target
availability without inventing an application metrics endpoint.

## Kubernetes

After publishing the image, apply the manifests to a cluster:

```bash
kubectl apply -f k8s/
kubectl rollout status deployment/pg-finder
kubectl get pods,service pg-finder
kubectl port-forward service/pg-finder 8080:80
curl http://localhost:8080/health
```

For a private GHCR image, create an image pull secret and reference it from the
Deployment; do not commit registry credentials. The Kubernetes Service is
`ClusterIP`, so use an Ingress or `kubectl port-forward` for external access.
