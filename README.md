# Testing Compiling CUDA Apps on GitHub using Docker Container

## About Codespaces

Specs
```text
OS: Ubuntu 24.04.3 LTS x86_64
Host: Virtual Machine 7.0
Kernel: 6.8.0-1030-azure
CPU: AMD EPYC 7763 (2) @ 3.243GHz
GPU: 00:08.0 Microsoft Corporation Hyper-V virtual VGA (No Physical NVIDIA GPU)
Memory: 1434MiB / 7944MiB
```

## 1. Environment Setup

### Docker in Codespaces

Docker is pre-installed in GitHub Codespaces via the Moby engine. Do not attempt to install `docker-ce` manually as it conflicts with the internal setup.

```bash
docker --version
docker ps
```

### Pulling the CUDA Development Image

We use the official NVIDIA CUDA 11.8 development image on Ubuntu 22.04.

```bash
docker pull nvidia/cuda:11.8.0-devel-ubuntu22.04
```

## 2. Development Workflow

### Creating the Persistent Container

To avoid re-typing long commands, we create a named container (`cuda-build`) and mount the workspace.

```bash
docker run -it -v "$(pwd):/work" -w /work --name cuda-build nvidia/cuda:11.8.0-devel-ubuntu22.04 bash
```

### Resuming Work

If the container is stopped, restart it and attach to the shell:

```bash
docker start -ai cuda-build
```

## 3. Compilation

### Using the Makefile

Inside the container, a `Makefile` is used to manage build flags and architecture targets (defaulting to Ampere `sm_80`).

**To build the project:**

```bash
make
```

**To clean build artifacts:**

```bash
make clean
```

### Manual Compilation

Alternatively, use `nvcc` directly:

```bash
nvcc -arch=sm_80 hello.cu -o build/hello_cuda
```

## 4. Project Structure & Git

* **Source:** `.cu` files are stored in the root.
* **Builds:** Binaries are output to the `build/` directory.
* **Git:** The `build/` directory and compiled binaries are ignored via `.gitignore` to keep the repository clean.

> **Note:** Since Codespaces lacks an NVIDIA GPU, compiled binaries cannot be executed here. They will throw a `cudaErrorNoDevice` error. This environment is for **compilation and syntax checking only**.
