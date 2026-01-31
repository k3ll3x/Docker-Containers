To run Ollama in Docker Compose **with AMD GPU support**, you need to use the `ollama/ollama:rocm` image (the ROCm-enabled build) and configure the container to access AMD GPU devices and set appropriate environment variables depending on your AMD GPU architecture.

## Recommended Docker Compose Configuration for AMD GPU

```yaml
version: "3.7"

services:
  ollama:
    container_name: ollama
    image: ollama/ollama:rocm  # ROCm-enabled image for AMD GPUs
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama
      - ./modelfiles:/modelfiles
    devices:
      - /dev/kfd      # AMD kernel driver for compute
      - /dev/dri      # AMD Direct Rendering Infrastructure
    environment:
      # Set this according to your AMD GPU architecture (see table below)
      - HSA_OVERRIDE_GFX_VERSION=10.3.0
      - HIP_VISIBLE_DEVICES=0
      # Optional Ollama config
      - OLLAMA_NUM_PARALLEL=4
      - OLLAMA_MAX_LOADED_MODELS=1
    restart: unless-stopped

volumes:
  ollama_data:
```

## Important Notes:

- **Image**: Use `ollama/ollama:rocm` for AMD GPU support.
- **Devices**: Mount `/dev/kfd` and `/dev/dri` for ROCm GPU access.
- **Environment Variables**:
  - `HSA_OVERRIDE_GFX_VERSION` must match your GPU architecture (see table below).
  - `HIP_VISIBLE_DEVICES=0` to expose GPU 0; adjust if you have multiple GPUs.
- **Volumes**: Persist Ollama data and optionally mount your model files.

## AMD GPU Architecture Versions for `HSA_OVERRIDE_GFX_VERSION`

| AMD Architecture         | `HSA_OVERRIDE_GFX_VERSION` Value |
|-------------------------|----------------------------------|
| GCN 5th gen-based GPUs   | 9.0.0                            |
| RDNA 1-based GPUs        | 10.1.0                           |
| RDNA 2-based GPUs        | 10.3.0                           |
| RDNA 3-based GPUs        | 11.0.0                           |
| RDNA 4-based GPUs        | 12.0.0                           |

*Example*: For a Radeon RX 6600 XT (RDNA 2), use `10.3.0`.

## How to Check Your AMD GPU Architecture

You can check your GPU model and look up its architecture in AMD documentation or use commands like:

```bash
lspci | grep VGA
```

And then cross-reference your GPU model with AMD architecture tables online.

## Additional Setup Tips

- Ensure your **host system has ROCm drivers installed and configured** properly for your AMD GPU.
- You may need to install kernel headers and ROCm packages on your host OS.
- The container requires access to `/dev/kfd` and `/dev/dri` devices — ensure your user has permissions or run Docker with sufficient privileges.
- If you face permission errors, try running Docker with `--privileged` or adjust device permissions.

## Example Docker Run Command (if not using docker-compose)

```bash
docker run -d --restart always \
  --device /dev/kfd \
  --device /dev/dri \
  -e HSA_OVERRIDE_GFX_VERSION=10.3.0 \
  -e HIP_VISIBLE_DEVICES=0 \
  -p 11434:11434 \
  -v ollama_data:/root/.ollama \
  --name ollama \
  ollama/ollama:rocm
```

## Summary

| Config Item                  | Value / Instruction                     |
|-----------------------------|---------------------------------------|
| Docker image                | `ollama/ollama:rocm`                   |
| Devices to expose           | `/dev/kfd`, `/dev/dri`                  |
| Env var `HSA_OVERRIDE_GFX_VERSION` | Set based on AMD GPU architecture (e.g., `10.3.0`) |
| Env var `HIP_VISIBLE_DEVICES`| Usually `0` for first GPU              |
| Volumes                    | Persist Ollama data (`/root/.ollama`)  |
| Ports                      | `11434:11434` for API access            |
| Restart policy             | `unless-stopped`                        |

This setup is confirmed by multiple community sources and official AMD ROCm usage for Docker containers with Ollama[2][5][7].

If you want, I can help you generate a full `docker-compose.yml` file tailored to your AMD GPU model. Just provide your GPU model or architecture!

[1] https://www.reddit.com/r/ollama/comments/1gec1nx/docker_compose_for_amd_users/
[2] https://burakberk.dev/deploying-ollama-open-webui-self-hosted/
[3] https://community.amd.com/t5/ai-discussions/frustrated-about-docker-and-ollama-not-working-with-amd-gpu/m-p/716835
[4] https://hub.docker.com/r/ollama/ollama
[5] https://github.com/endoeduardo/ollama-docker-config
[6] https://www.tmvtech.com/ubuntu-tutorial-ollama-with-amd-gpus/
[7] https://dev.to/kokizzu/ollama-with-amd-gpu-rocm-1p3i
[8] https://dev.to/ajeetraina/running-ollama-with-docker-compose-and-gpus-lkn
[9] https://github.com/likelovewant/ollama-for-amd
[10] https://forums.docker.com/t/ollama-rocm-for-amdgpu-is-not-recognizing-gpu/144333
