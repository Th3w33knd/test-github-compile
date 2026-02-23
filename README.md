# Testing Compiling Cuda Apps on Github using Docker Container

## About Codespaces

Specs
```
OS: Ubuntu 24.04.3 LTS x86_64
Host: Virtual Machine 7.0
Kernel: 6.8.0-1030-azure
Uptime: 41 mins
Packages: 667 (dpkg)
Shell: bash 5.2.21
Resolution: 1024x768
Terminal: vscode
CPU: AMD EPYC 7763 (2) @ 3.243GHz
GPU: 00:08.0 Microsoft Corporation Hyper-V virtual VGA
Memory: 1434MiB / 7944MiB
```

1. Checking Git

    ```bash
    ls
    git init
    git add .
    git commit -m "Checking Git"
    git push origin main
    ```

2. Docker in Code Spaces

    Docker is already installed in Codespaces no need to install.

    #### Check Version

    ```bash
    docker --version
    ```