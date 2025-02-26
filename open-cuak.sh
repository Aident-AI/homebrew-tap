#!/bin/bash

APP_DIR="$HOME/.open-cuak"
LIBEXEC_DIR="$(dirname "$(realpath "$0")")/../libexec"

setup() {
  echo "Setting up OpenCUAK..."
  mkdir -p "$APP_DIR"
  cp -r "$LIBEXEC_DIR/docker-compose.yml" "$APP_DIR/"
}

start_services() {
  echo "Starting OpenCUAK services..."
  bash "$LIBEXEC_DIR/scripts/quick-start.sh"
}

stop_services() {
  echo "Stopping OpenCUAK services..."
  colima stop
}

restart_services() {
  echo "Restarting OpenCUAK services..."
  bash "$LIBEXEC_DIR/scripts/quick-stop.sh"
  bash "$LIBEXEC_DIR/scripts/quick-start.sh"
}

status() {
  echo "Service Status:"
  echo "  - OpenCUAK: http://localhost:3000"
  echo "  - Supabase Console: http://localhost:8000"
  echo "  - Supabase Credentials: username=admin, password=admin"
}

stats() {
  docker stats
}

case "$1" in
setup) setup ;;
start) start_services ;;
stop) stop_services ;;
restart) restart_services ;;
status) status ;;
stats) stats ;;
*) echo "Usage: open-cuak {setup|start|stop|restart|status|stats}" ;;
esac
