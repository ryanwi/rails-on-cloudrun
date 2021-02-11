# Rails on Cloud Run

https://cloud.google.com/run/docs/quickstarts/build-and-deploy#ruby

## Build and push the container image

```
gcloud builds submit --tag gcr.io/[project-id]/rails-on-cloudrun
```

## Deploy the container image to Cloud Run

```
gcloud run deploy --image gcr.io/[project-id]/rails-on-cloudrun --platform managed \
 --set-env-vars "RAILS_MASTER_KEY=[secret]" \
 --set-env-vars "RAILS_ENV=production"
```

## Environment variables

Set any default environment variables in the Dockerfile with

```
ENV KEY1=VALUE1,KEY2=VALUE2
```

Generate a SECRET_KEY_BASE

```
rake secret
```
