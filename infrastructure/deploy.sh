#!/bin/bash
PROJECT_ID="website-monitor-464107"  

echo "🚀 Setting up Pub/Sub..."
gcloud pubsub topics create website-monitor-trigger --project=$PROJECT_ID

echo "🔧 Deploying Cloud Function..."
gcloud functions deploy website-monitor \
  --project=$PROJECT_ID \
  --runtime python310 \
  --trigger-topic website-monitor-trigger \
  --entry-point website_monitor \
  --region us-central1 \
  --memory 256MB \
  --timeout 60s

echo "⏰ Creating scheduler..."
gcloud scheduler jobs create pubsub monitor-job \
  --project=$PROJECT_ID \
  --location=us-central1 \
  --schedule="*/5 * * * *" \
  --topic=website-monitor-trigger \
  --message-body='{"websites":[{"url":"https://google.com","name":"Google"}]}'

echo "✅ Deployment complete!"
