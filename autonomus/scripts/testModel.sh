#!/bin/bash
curl -X POST http://localhost:11434/api/generate -d '{
  "model": "mistral",
  "prompt": "Explain the tendency of human nature to collapse of civilizations, and the amnesia turned to legends"
}'
