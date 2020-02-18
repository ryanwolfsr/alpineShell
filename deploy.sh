# Build images
docker build -t ryanwolfsr/alpineShell:latest -t ryanwolfsr/alpineShell:$SHA -f ./alpineShell/Dockerfile ./alpineShell

# Push to docker hub #SHA allows for easier updates. It essentially gives a "version" number for the image name in KUBE
docker push ryanwolfsr/alpineShell:latest
docker push ryanwolfsr/alpineShell:$SHA

# Build kubernetes files
kubectl apply -f k8sConfig

# Set image deployment
kubectl set image deployments/alpineShell-deployment alpineShell=ryanwolfsr/alpineShell:$SHA