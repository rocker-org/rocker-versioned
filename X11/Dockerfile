FROM rocker/r-ver:3.3.3

## R's X11 runtime dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libx11-6 \
    libxss1 \
    libxt6 \
    libxext6 \
    libsm6 \
    libice6 \
    xdg-utils \
  && rm -rf /var/lib/apt/lists/*

