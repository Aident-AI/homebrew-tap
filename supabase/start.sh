#!/bin/bash
set -e # Exit on error

# run from repo root
source ./scripts/detect_docker_compose.sh
DOCKER_COMPOSE_CMD=$(detect_docker_compose) || exit 1

echo "Starting Supabase services..."
cp installer/supabase-docker/.env.example installer/supabase-docker/.env
$DOCKER_COMPOSE_CMD \
  --env-file installer/supabase-docker/.env \
  -f installer/supabase-docker/docker-compose.yml \
  up --force-recreate --pull always -d
