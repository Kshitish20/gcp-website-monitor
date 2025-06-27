import requests
import json
from google.cloud import firestore

def website_monitor(event, context):
    """Triggered by Pub/Sub message"""
    db = firestore.Client()
    pubsub_message = json.loads(event['data'].decode('utf-8'))
    
    websites = pubsub_message.get('websites', [
        {"url": "https://google.com", "name": "Google"},
        {"url": "https://example.com", "name": "Example"}
    ])
    
    for site in websites:
        try:
            response = requests.get(site["url"], timeout=5)
            status = "UP" if response.status_code == 200 else "DOWN"
        except:
            status = "DOWN"
        
        db.collection("website_status").add({
            "website": site["name"],
            "url": site["url"],
            "status": status,
            "timestamp": firestore.SERVER_TIMESTAMP
        })
    
    print(f"Checked {len(websites)} sites")
