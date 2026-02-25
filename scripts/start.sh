#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting Docker Compose Development environment...${NC}"

# Check if .env.development exists, otherwise fallback to .env
ENV_FILE=".env.development"
if [ ! -f "$ENV_FILE" ]; then
    echo -e "Warning: ${ENV_FILE} not found. Falling back to .env"
    ENV_FILE=".env"
fi

echo -e "Using environment file: ${GREEN}${ENV_FILE}${NC}"

# Run docker-compose with the specified env file and development compose file
docker compose --env-file $ENV_FILE -f docker-compose.dev.yml up --build
