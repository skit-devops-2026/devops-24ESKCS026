# Deployment and monitoring

## Container deployment

The application is a static frontend served by nginx. The container listens on
`PORT` (default `8080`) and provides `GET /health`, returning HTTP 200 when
nginx is serving the site. This endpoint is used by Compose, Kubernetes, and
hosting-platform health checks.

For a local deployment:

```bash
docker compose up --build -d
curl http://localhost:8080/health
docker compose ps
docker compose down
```

For a free hosting platform that supports Docker (for example Render):

1. Create a new **Web Service** from this GitHub repository.
2. Select **Docker** as the environment; do not set a start command.
3. Set the health-check path to `/health`.
4. Deploy the service. The platform supplies `PORT`; the image listens on it.
5. Verify `https://<assigned-host>/health` returns `ok` and capture a real
   browser screenshot in `docs/screenshots/`.

No external deployment is claimed by this repository. Credentials, account
selection, and the assigned public URL must be supplied by the maintainer.

## Monitoring

`monitoring/prometheus.yml` is a valid Prometheus configuration and monitors
Prometheus itself. The current application is static and exposes no Prometheus
metrics endpoint, so no fabricated application scrape target is configured.
The Grafana provisioning files install a Prometheus datasource and a dashboard
showing scrape-target availability. Run Prometheus and Grafana with their
standard images, mount the `monitoring` directory according to their image
documentation, and verify the dashboard after Prometheus is reachable.

## Deployment evidence

Place a genuine screenshot from the completed hosting deployment at
`docs/screenshots/deployment.png`. Do not create or commit a placeholder image.
