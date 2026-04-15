# NVIDIA Omniverse Developer Resources

This guide covers the developer resources, SDKs, documentation, and workflows available for NVIDIA Omniverse.

## SDKs and Libraries

### Kit SDK

The Kit SDK is the core framework for building custom Omniverse applications:

- **Core Framework**: Manage extensions and plugins efficiently
- **Application Templates**: Pre-configured starting points for new applications
- **Extension System**: Build and integrate custom features
- **UI Framework**: Pre-built user interface components

Resources:
- [Kit SDK Documentation](https://docs.omniverse.nvidia.com/kit/docs/kit-manual/latest/guide/kit_overview.html)
- [Kit App Template](https://github.com/NVIDIA-Omniverse/kit-app-template)
- [NGC Catalog](https://catalog.ngc.nvidia.com/) for enterprise-supported Kit SDK

### OpenUSD Libraries

- **OpenUSD Core**: Open-source framework for 3D interoperability
- **USD Exchange SDK**: Build interoperable USD data exchange solutions
- **SimReady SDK**: Prepare simulation-ready content
- **USD Schema Physics**: USD-native physics schemas

### Omniverse Libraries (Early Access)

- **ovrtx**: GPU-accelerated RTX rendering and sensor simulation
- **ovphysx**: USD-native multiphysics library
- **ovstorage**: Cloud-native asset management APIs

### Additional Libraries

- **PhysX**: Open-source multi-physics SDK
- **Newton Physics**: Open-source physics engine built on Warp
- **NuRec**: APIs and datasets for 3D Gaussian neural simulation

## Documentation

### Developer Overview

- [Omniverse Developer Overview](https://docs.omniverse.nvidia.com/dev-overview/latest/index.html)
- [Platform Overview](https://docs.omniverse.nvidia.com/dev-overview/latest/platform-overview.html)
- [Development Paths](https://docs.omniverse.nvidia.com/dev-overview/latest/dev-paths.html)

### Kit SDK Documentation

- [Kit Manual](https://docs.omniverse.nvidia.com/kit/docs/kit-manual/latest/guide/kit_overview.html)
- [Kit App Template](https://docs.omniverse.nvidia.com/kit/docs/kit-app-template/latest/docs/kit_sdk_overview.html)
- [Stream Application](https://docs.omniverse.nvidia.com/kit/docs/kit-app-template/latest/docs/streaming.html)

### Physics Documentation

- [Omniverse Physics Documentation](https://docs.omniverse.nvidia.com/kit/docs/omni_physics/latest/index.html)
- [PhysX SDK Documentation](https://nvidia-omniverse.github.io/PhysX/physx/5.4.2/index.html)
- [Omniverse Visual Debugger](https://nvidia-omniverse.github.io/PhysX/physx/5.4.2/docs/OmniVisualDebugger.html)

### Isaac Sim Documentation

- [Isaac Sim Documentation](https://docs.isaacsim.omniverse.nvidia.com/latest/index.html)
- [ROS/ROS2 Tutorials](https://docs.isaacsim.omniverse.nvidia.com/latest/ros_ros2_tutorials.html)
- [Robot Setup](https://docs.isaacsim.omniverse.nvidia.com/latest/robot_setup.html)
- [URDF Importer](https://docs.isaacsim.omniverse.nvidia.com/latest/features/environment_setup/ext_omni_isaac_urdf.html)

### Web Development

- [Kit App Streaming](https://docs.omniverse.nvidia.com/ovas/latest/developer/web-development/index.html)
- [Connect to WebRTC Stream](https://docs.omniverse.nvidia.com/ovas/latest/developer/web-development/connect_stream.html)
- [Web Viewer Sample](https://github.com/NVIDIA-Omniverse/web-viewer-sample)

### Learn OpenUSD

- [Learn OpenUSD Curriculum](https://www.nvidia.com/en-us/omniverse/usd/learn/)
- [USD Architecture](https://openusd.org/release/api/usd_page_front.html)
- [USD Examples](https://www PIXAR .com/technologyUSD)

## Code Repositories

### Official NVIDIA Repositories

- [NVIDIA-Omniverse on GitHub](https://github.com/NVIDIA-Omniverse)
- [Kit App Template](https://github.com/NVIDIA-Omniverse/kit-app-template)
- [Web Viewer Sample](https://github.com/NVIDIA-Omniverse/web-viewer-sample)
- [LearnOpenUSD](https://github.com/NVIDIA-Omniverse/LearnOpenUSD)

### Isaac Repositories

- [Isaac Sim](https://github.com/isaac-sim/IsaacSim)
- [Isaac Lab](https://github.com/isaac-sim/IsaacLab)
- [Omniverse Physics](https://github.com/NVIDIA-Omniverse/Omniverse-PhysX)

## Tutorials and Learning Paths

### Learning Paths

- [OpenUSD Learning Path](https://www.nvidia.com/en-us/omniverse/usd/learn/)
- [Digital Twin Learning Path](https://www.nvidia.com/en-us/omniverse/digital-twin/learn/)
- [Robotics Learning Path](https://www.nvidia.com/en-us/omniverse/robotics/learn/)

### Self-Paced Courses

- [Introduction to Robotic Simulations in Isaac Sim](https://learn.nvidia.com/courses/course-detail?course_id=course-v1:DLI+S-OV-03+V1)
- [USD Fundamentals](https://learn.nvidia.com/)

### Developer Courses

- [Omniverse Kit SDK Training](https://learn.nvidia.com/)

## Developer Tools

### Command-Line Tools

- [omni.create.app](https://docs.omniverse.nvidia.com/kit/docs/omni.create.app/latest/docs/index.html): Scaffolds ready-to-run applications

### IDE Integration

- **Python**: Full Python scripting support within Omniverse
- **C++**: Extension development with C++ API
- **Web**: JavaScript/TypeScript for web client development

### Debugging and Profiling

- [Omniverse Visual Debugger](https://nvidia-omniverse.github.io/PhysX/physx/5.4.2/docs/OmniVisualDebugger.html)
- [Physics Inspector](https://docs.omniverse.nvidia.com/kit/docs/omni_physics/latest/extensions/ux/source/omni.physx.ui/docs/dev_guide/joint_inspector.html)
- [Simulation Data Visualizer](https://docs.isaacsim.omniverse.nvidia.com/latest/features/inspections/ext_isaacsim_inspect_physics.html)

## Blueprints and Examples

### Pre-built Blueprints

- [Omniverse DSX Blueprint](https://www.nvidia.com/en-us/omniverse/dsx/): Gigawatt-scale AI factory design
- [Mega Blueprint](https://www.nvidia.com/en-us/omniverse/mega/): Multi-robot fleet simulation
- [Isaac GR00T Blueprint](https://build.nvidia.com/nvidia/isaac-gr00t-synthetic-manipulation): Humanoid robot training

### Sample Projects

- [Residential Lobby](https://docs.omniverse.nvidia.com/connect/latest/use_cases/residential_lobby.html): Multi-person architectural design
- [da Vinci Workshop](https://docs.omniverse.nvidia.com/connect/latest/use_cases/da_vinci_workshop.html): Film production pipeline

## Deployment Resources

### Cloud Deployment

- [AWS Marketplace](https://aws.amazon.com/marketplace/seller-profile?id=c568fe05-e33b-411c-b0ab-047218431da9): Omniverse developer workstations
- [Azure Marketplace](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/nvidia.ov-developer-workstation): Preconfigured Omniverse instances
- [Google Cloud](https://cloud.google.com/): RTX PRO 6000 Blackwell Server Edition

### On-Premises

- [Enterprise Nucleus Server](https://docs.omniverse.nvidia.com/nucleus/latest/enterprise/installation/planning.html): Docker Compose deployment
- [Omniverse Cache](https://docs.omniverse.nvidia.com/nucleus/latest/enterprise/features/caching.html): Distributed caching for performance

## Community and Support

### Developer Forums

- [NVIDIA Developer Forums - Omniverse](https://forums.developer.nvidia.com/c/omniverse/simulation/69)

### Community Channels

- [Discord Server](https://discord.gg/w9VvuYdq)
- [YouTube Channel](https://www.youtube.com/@NVIDIAOmniverse)
- [LinkedIn](https://www.linkedin.com/showcase/nvidiarobotics/)
- [X (Twitter)](https://x.com/NVIDIARobotics)

### Documentation Support

- [NVIDIA Omniverse Docs](https://docs.nvidia.com/omniverse/index.html)
- [Isaac Sim Docs](https://docs.isaacsim.omniverse.nvidia.com/)
- [Omniverse Nucleus Docs](https://docs.omniverse.nvidia.com/nucleus/latest/)

## Getting Started

1. **Download Omniverse**: [Free Standard License](https://www.nvidia.com/en-us/omniverse/download/)
2. **Install Isaac Sim**: Available as a standalone application or via Omniverse Launcher
3. **Set Up Dev Environment**: Configure Kit SDK and extensions
4. **Explore Tutorials**: Work through the learning paths
5. **Join Community**: Engage with other developers on forums and Discord

## Key APIs to Master

- **USD APIs**: Scene description and manipulation
- **Kit SDK APIs**: Application framework and extensions
- **PhysX APIs**: Physics simulation
- **RTX APIs**: Rendering and sensor simulation
- **Nucleus APIs**: Asset management and collaboration
