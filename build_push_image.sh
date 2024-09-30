# Set variables
IMAGE_NAME="item-app"
VERSION="v1"
GITHUB_USERNAME="christiantoKape"
GITHUB_REPO="a433-microservices"

# Convert to lowercase
GITHUB_USERNAME_LOWER=$(echo "$GITHUB_USERNAME" | tr '[:upper:]' '[:lower:]')
GITHUB_REPO_LOWER=$(echo "$GITHUB_REPO" | tr '[:upper:]' '[:lower:]')
IMAGE_NAME_LOWER=$(echo "$IMAGE_NAME" | tr '[:upper:]' '[:lower:]')

# 1. Build Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME_LOWER:$VERSION .

# 2. List local images
echo "Listing local Docker images..."
docker images

# 3. Tag the image for GitHub Packages
echo "Tagging image for GitHub Packages..."
docker tag $IMAGE_NAME_LOWER:$VERSION ghcr.io/$GITHUB_USERNAME_LOWER/$GITHUB_REPO_LOWER/$IMAGE_NAME_LOWER:$VERSION

# 4. Login to GitHub Packages
echo "Logging in to GitHub Packages..."
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME_LOWER --password-stdin

# 5. Push the image to GitHub Packages
echo "Pushing image to GitHub Packages..."
docker push ghcr.io/$GITHUB_USERNAME_LOWER/$GITHUB_REPO_LOWER/$IMAGE_NAME_LOWER:$VERSION

echo "Script completed successfully!"