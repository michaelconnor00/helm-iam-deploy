# Docker Image for deploying Helm charts from CI/CD

Use Helm to deploy updates to a Kubernetes cluster in a CI/CD pipeline. Authentication is done using temporary AWS credentials.

## Requirements

- AWS IAM User, set creds as env vars.
- Kube Config as volume ie - `/root/.kube/config`
- Chart Mounted as volume ie - `/root/chart`

## Base Image

This image uses the work already done from https://github.com/dtzar/helm-kubectl.

## Execution

Override the CMD with the helm command and options as needed.
