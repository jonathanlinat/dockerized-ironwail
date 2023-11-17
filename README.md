<p align="center">
  <img src="https://avatars.githubusercontent.com/u/5121829" alt="Ironwail Logo" height="200">
</p>

<h1 align="center">Dockerized 🐋 Ironwail</h1>

This repository contains the [Ironwail](https://github.com/andrei-drexler/ironwail) source code set up for Docker. Ironwail is a fork of the popular GLQuake descendant [QuakeSpasm](https://sourceforge.net/projects/quakespasm/) with a focus on high performance instead of maximum compatibility, with a few extra features sprinkled on top.

[Docker](https://www.docker.com) is used here to simplify building the application. With Docker, developers can compile and build the application without manually installing all dependencies.

> ⚠️ **Disclaimer**: This setup is currently only compatible with Linux environments.

## Structure of the Project

The project utilizes a `Ironwail` directory, which is a Git clone of the Ironwail source. When the `build.sh` script is run, it compiles the content of the `Ironwail` directory.

```text
.
├── Ironwail/
│   └── build/
│       └── <environment>/
│           └── ...
├── .gitignore
├── build.sh
├── Dockerfile.linux
├── LICENSE
└── README.md
```

## Getting Started

Ensure you have [Docker Engine](https://docs.docker.com/engine/) installed and operational. An alternative user-friendly interface for managing Docker elements is [Docker Desktop](https://docs.docker.com/desktop/).

> ⚠️ **Technical Note**: For an optimized building experience, it may be necessary to adjust your Docker resource allocations, including CPU, Memory, and Disk Space. Increasing these limits in Docker settings can significantly enhance performance, especially for resource-intensive tasks, and avoid failing building processes.

### How to Use

1. Clone this repository:

   ```bash
   git clone https://github.com/jonathanlinat/dockerized-ironwail.git
   ```

2. Navigate to the cloned directory:

   ```bash
   cd dockerized-ironwail
   ```

3. Clone the official Ironwail source code or a fork into this project:

   ```bash
   git clone https://github.com/andrei-drexler/ironwail.git
   ```

   > **Note**: To clone a specific branch, append `-b <branchname>` to the command.

   After this step, you should have a directory named `ironwail`, as shown in the project structure above.

4. Compile the application:

   Open your terminal and execute the following:

   - `<environment>` with `linux`

   ```bash
   ./build.sh <environment>
   ```

   This will initiate the Docker-based build process. The resulting binary will be placed in `ironwail/build/<environment>/`.

With these steps, you can easily compile Ironwail using Docker, ensuring a consistent and streamlined build process.

## License

**Dockerized 🐋 Ironwail** is [MIT licensed](LICENSE).
