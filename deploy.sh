# Build images
docker build -t ryanwolfsr/alpineshell:latest -t ryanwolfsr/alpineShell:$SHA -f ./alpineShell/Dockerfile ./alpineShell

# Push to docker hub #SHA allows for easier updates. It essentially gives a "version" number for the image name in KUBE
docker push ryanwolfsr/alpineshell:latest
docker push ryanwolfsr/alpineshell:$SHA

# Build kubernetes files
kubectl apply -f k8sConfig

# Set image deployment
kubectl set image deployments/alpineshell-deployment alpineShell=ryanwolfsr/alpineshell:$SHA