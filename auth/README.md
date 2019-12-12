This directory stores auth files for the clouds and apps developed against.

They can be accessed from `/vagrant/auth/` inside the dev VM.

This directory's gitignore file will prevent the files from accidentally
landing in source control.

To use the key, run:

```bash
gcloud auth activate-service-account --key-file /vagrant/auth/gcr-admin.json
```

Then login to the registry
```bash
gcloud auth configure-docker
```
