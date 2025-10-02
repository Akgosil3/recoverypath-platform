# Deployment Instructions for Google Cloud Run

## Prerequisites
- Google Cloud SDK installed
- A Google Cloud project created
- Docker installed

## Steps to Deploy
1. **Authenticate with Google Cloud**:
   ```bash
   gcloud auth login
   ```

2. **Set your project**:
   ```bash
   gcloud config set project YOUR_PROJECT_ID
   ```

3. **Build your container image**:
   ```bash
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/YOUR_IMAGE_NAME
   ```

4. **Deploy to Cloud Run**:
   ```bash
   gcloud run deploy YOUR_SERVICE_NAME --image gcr.io/YOUR_PROJECT_ID/YOUR_IMAGE_NAME --platform managed
   ```

5. **Access your service**: 
   After deployment, you'll receive a URL to access your service.
