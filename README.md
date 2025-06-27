# GCP Website Monitor (Pub/Sub Version)

## Features
- Pub/Sub triggered checks
- Firestore storage
- 5-minute scheduler
- No metrics

## Deployment
```bash
./infrastructure/deploy.sh
```

## Manual Test
```bash
gcloud pubsub topics publish website-monitor-trigger \
  --message='{"websites":[{"url":"https://example.com","name":"Test"}]}'
```
