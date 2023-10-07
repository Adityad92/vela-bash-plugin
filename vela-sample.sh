#!/usr/bin/env bash

# import method parameter from environment
method=${PARAMETER_METHOD}

# import url parameter from environment
url=${PARAMETER_URL}

# send curl request from provided input
curl \
  -X "${method}" \
  "${url}"
