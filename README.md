# jsonplaceholder-node-app

jsonplaceholder-node-app is a Node app that consumes the API Rest https://jsonplaceholder.typicode.com/posts and show data as response in the browser.

## Used Tools

- Node.js 
- Docker with Docker Hub Registry
- GitHub Actions
- Kubernetes (GKE)
- Helm

## Installation locally

Use the package manager [npm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04) to install jsonplaceholder-node-app.

```bash
node app.js
```

This will expose the app under: [localhost:3000](localhost:3000/posts)

Paths available:
- /posts
- /health

## Installing Publicly using GKE and Helm

- Before using the configured GitHub Actions pipeline, you need a GKE Cluster deployed. You can deploy it from [here](https://github.com/Stigma137/jsonplaceholder-node-iac) using Terraform (IaC).

- Specify all the secrets needed: GCP_SA_KEY, GCP_PROJECT_ID, DOCKER_USERNAME, DOCKER_PASSWORD, DOCKER_HUB_TOKEN.

- Make any change to app.js.

- At commit level, you have to app any of the following tags: [dev], [test], [stage] or[prod]. This, in order to deploy in a different Kubernetes namespaces with different values.

- Check http://35.188.123.178:3000/<path> (just dev) to review your changes.

- If you decided to aim to another environment different to dev, yo have to:

```bash
kubectl get svc -n <namespace> -o wide
```
- This way you can get the External IP Address of your current namespace.