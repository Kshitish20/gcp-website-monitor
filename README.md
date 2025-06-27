# GCP Website Monitoring System (Pub/Sub Version)

A serverless website monitoring solution using Google Cloud Platform,without Cloud Monitoring.

 Features
- **Automated checks** every 5 minutes via Cloud Scheduler
- **Pub/Sub triggered** Cloud Function for scalable processing
- **Firestore storage** of all status checks
- **Dynamic website list** configurable via Pub/Sub messages
- **Response time tracking** for each request
- **Simple alerting** through Cloud Function logs

GCP Services Used
| Service
| Cloud Function
| Pub/Sub 
| Firestore
| Cloud Scheduler

**Flow Summary**
Cloud Scheduler → Pub/Sub → Cloud Function → Firestore

Deployment
```bash
# Clone repo
git clone https://github.com/your-username/gcp-website-monitor.git
cd gcp-website-monitor

# Deploy (requires gcloud CLI)
chmod +x infrastructure/deploy.sh
./infrastructure/deploy.sh


## Deployment
```bash
./infrastructure/deploy.sh
```

Manual Test
```bash
gcloud pubsub topics publish website-monitor-trigger \
  --message='{"websites":[{"url":"https://example.com","name":"Test"}]}'
```
