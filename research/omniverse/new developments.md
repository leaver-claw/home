# NVIDIA Omniverse - New Developments (Since 2026-04-15)

## Kit SDK 108.x and 109.x Releases

### Kit SDK 108.0 (August 2025)

**Release Date**: August 2025 (Documentation updated in 2026)

**Key Features**:

1. **RTX Renderer Improvements**
   - Real-Time 2.0 Mode now enabled by default
   - Full path-tracing solution with improved visual fidelity
   - Matches or exceeds performance of Real-Time mode
   - Better handling of transmissive materials like glass

2. **Omniverse Live Streaming Architecture Improvements**
   - Multi-Stream Support: Multiple outgoing/incoming streams to different clients
   - Enhanced Performance: Up to 4K@60fps streaming
   - Improved Observability: SRE requirements for streaming state and QoS metrics
   - Enterprise-grade streaming for Direct Connections, Kit App Streaming, NVCF/OVC 2.0, Cloud Hosted, and Self Hosted deployments

3. **Asset Validator Enhancements**
   - New API for content requirements definition
   - Comprehensive validation rules for USDPhysics
   - Additional validator extensions: Scene Optimizer, PhysX, Isaac Sim
   - Apache 2.0 licensing update

4. **Scene Optimizer Enhancements**
   - New asset validators: Primitive Mesh Identifier, Sparse Mesh Validator, Duplicate Material Checker, Coinciding Meshes Checker
   - New operations: Box Clip, Dice Meshes, Fit Primitives

5. **Major Platform Updates**
   - Pixar USD 25.02 integration (upgraded from USD 24.05)
   - Boost dependency removal from OpenUSD
   - UsdColorSpaceAPI and UsdColorSpaceDefinitionAPI for color space management
   - Full relocates support for complex scene restructuring
   - Optimized sublayer change processing

6. **Python 3.12 Support**
   - Enhanced F-String Parsing (PEP 701)
   - Improved error messages with typo suggestions
   - New Type Annotation Syntax (PEP 695)
   - Advanced Debugging API (PEP 669)

7. **String Safety Enhancements**
   - Multi-stage API upgrade to use safer string_view passing
   - String_view versions of functions added to ITokens, IDictionary, ISettings

**Breaking Changes**:
- USD 25.02 may require updates to existing extensions
- Python 3.12 language changes may require code updates
- Kit SDK migration guide recommended before upgrading

### Kit SDK 108.1 (September 2025)

**Release Date**: September 2025

**Key Features**:

1. **RTX Fixes**
   - Fixed flickering artifacts on systems with multiple GPUs with Warp nodes and FSD enabled
   - Camera focal length clamping corrected for OpenCV pinhole models
   - XR Anchor system now supports USDRT
   - Various crash fixes and performance improvements

2. **USD Exchange Improvements**
   - Global Materials support when instancing is disabled
   - Geometry Prims transformed to bounding box center
   - Display names added to all prims and materials

3. **Fabric Scene Delegate Fixes**
   - PointInstancer updates when prototype transform changes
   - Variant switches now work correctly with FSD enabled
   - Role info now visible on primvars with FSD enabled

### Kit SDK 109.0 (November 2025)

**Release Date**: November 2025

**Key Features**:

1. **Major Platform Updates**
   - NumPy 2.3.1 by default (upgraded from NumPy 1.x)
   - CUDA 12.4.1 SDK update (requires driver >=550.54.15 Linux / >=551.78 Windows)
   - mimalloc as default memory allocator on Windows

2. **Fabric Scene Delegate Now Default**
   - FSD enabled by default (no longer needs explicit .kit configuration)
   - Zero-Copy Memory Sharing: Up to 50% memory savings for mesh/point-heavy stages
   - Fine-Grained Copy-on-Write improvements
   - Breaking change: String Token Safety in Fabric

3. **Performance & Infrastructure**
   - Fabric performance breakthroughs with improved scene representation
   - String safety and security throughout Kit and Carbonite SDK

4. **User Experience Improvements**
   - Customizable camera manipulator with remappable key bindings
   - Support for application-specific camera navigation

5. **Observability & Telemetry**
   - OpenTelemetry integration with OmniMetrics
   - Enhanced metrics functionality and helper tools
   - Support for OTEL_RESOURCE_ATTRIBUTES environment variable
   - Export metrics to OTLP endpoints for monitoring

6. **Rendering & Graphics**
   - Physical Lighting with UsdLux 25.05 specification
   - Customizable camera ISP pipeline with runtime parameter updates
   - Rolling shutter support and runtime motion raytracing toggle
   - Reworked mesh lights sampling and custom projections for projector lights

**Breaking Changes and Compatibility**:
- String Safety APIs may require code updates
- Extension dependencies updated
- CUDA driver requirements increased

### Kit SDK 109.0.1 (December 2025)

**Release Date**: December 2025

**Key Fixes and Improvements**:

1. **Kit SDK Fixes**
   - Python dependency conflict resolved (aiosignal/aiohttp)
   - Camera mismatch issues resolved
   - Various Script Editor and viewport issues fixed

2. **CAD Converter Improvements**
   - STL export fixed
   - IFC file conversion performance improved
   - Up-axis option for STEP file import
   - Surface tolerance UI for triangle count and file size

3. **RTX Fixes**
   - Noise/flickering with DLSS resolved
   - Photometric power regression in sphere lights fixed
   - Various rendering issues with transparent materials and background colors

4. **Hub Improvements**
   - Error logging changed from Error/Warning to Info level for missing omniverse.toml

## New NVIDIA Omniverse Libraries (April 2026)

### Overview: Modular Library Architecture

**Announcement Date**: April 2026 (GTC 2026 follow-up)

NVIDIA introduced a modular, library-based architecture alongside the existing Omniverse platform to enable easier integration of physical AI capabilities into existing applications.

### Core Libraries:

1. **ovrtx (Early Access)**
   - High-fidelity, high-performance rendering
   - RTX real-time path-tracing and sensor simulation
   - C and Python bindings with thin Python wrapper over C API
   - DLPack support for zero-copy data exchange with NumPy, PyTorch, and Warp

2. **ovphysx (Early Access)**
   - High-speed, USD-native physics simulation
   - Standalone library wrapping the PhysX SDK
   - Lightweight, hardware-accelerated physics simulation
   - Enables high-speed data exchange for robotics training and real-time control-loop integration

3. **ovstorage (Early Access)**
   - Unified physical AI data pipelines
   - Connects existing storage and PLM/PDM infrastructure to Omniverse ecosystem
   - API-driven library for distributed data management
   - Kubernetes-ready, headless deployment support

### Key Capabilities:

- **Headless-first architecture**: Deploy without full Omniverse container stack
- **Modular integration**: Embed rendering, physics, and storage directly into existing services
- **DLPack integration**: Zero-copy data transfer with popular ML frameworks
- **MCP server support**: Model Context Protocol servers for LLM-based agent integration

### Use Cases:

- **NVIDIA Isaac Lab**: Transitioning from Kit framework to modular architecture
  - Physics backends: ovphysx or Newton backend powered by MuJoCo-Warp
  - Rendering backends: OVRTX, Isaac RTX, Newton Warp, or lightweight visualizers

- **NVIDIA Omniverse DSX Blueprint**: Digital twin for AI factory reference design

- **Industrial Software Partners**: ABB Robotics, Adobe, Cadence, PTC, Siemens, Synopsys

### Decision Guide:

**Use Omniverse Libraries when**:
- Integrating physical AI capabilities into existing 3D/CAD applications
- Lightweight, headless deployments
- Specialized autonomous agents
- Existing stacks where full platform adoption isn't feasible

**Use Omniverse Kit Framework when**:
- Building feature-rich OpenUSD applications with full UI
- Interactive viewports and multi-component coordination
- Standard app framework with bundled extensions

## Community and Ecosystem Updates

### GitHub Repositories and Developer Resources

**NVIDIA Omniverse GitHub Organization**:
- `NVIDIA-Omniverse/ovrtx`: RTX rendering library
- `NVIDIA-Omniverse/PhysX`: PhysX-based physics library
- `isaac-sim/IsaacSim`: Open-source robot simulation application
- `isaac-sim/OmniIsaacGymEnvs`: Reinforcement Learning Environments
- Various Kit SDK templates and examples

**Omniverse Discord Community**:
- 21,453+ members
- Regular live demos and Q&A sessions
- Community voice chat for developer discussions
- Direct access to Omniverse development team

### Industry Adoption:

**Robotics**:
- ABB Robotics: Embedded Omniverse into RobotStudio with virtual controller
- PTC: Onshape integrated with Isaac Sim for cloud-native robot design
- Siemens: Industrial digital twins at scale with Omniverse libraries

**Industrial Software**:
- Adobe: Strategic partnership announced
- Cadence: Reality Digital Twin Platform integration
- Synopsys: Ecosystem innovation at GTC 2026

**Cloud Platforms**:
- AWS: EC2 with L40S GPUs for Omniverse
- Azure: Physical AI Data Factory Blueprint integration
- Google Cloud: RTX PRO 6000 Blackwell support

## Key Takeaways (April 2026 Updates)

1. **Kit SDK Maturity**: 108.x and 109.x releases show continued platform maturation with focus on performance, scalability, and enterprise readiness

2. **Modular Architecture**: New library approach (ovrtx, ovphysx, ovstorage) enables integration without platform lock-in, addressing developer demand for flexibility

3. **NumPy 2.x Integration**: NumPy 2.3.1 in Kit 109.0 improves compatibility with modern robotics frameworks like Isaac-Newton

4. **Fabric Scene Delegate Default**: FSD now enabled by default, improving performance and simplifying configuration

5. **OpenTelemetry Support**: Enterprise deployments can now export metrics to OTLP endpoints for comprehensive monitoring

6. **Physical AI Focus**: All updates support physical AI development with improved sensor simulation, rendering fidelity, and library integrations

7. **Community Growth**: Discord community now exceeds 21,000 members, reflecting expanding developer adoption

## Sources

- NVIDIA Omniverse Developer Documentation (updated April 2026)
- Kit SDK Release Notes: 108.0, 108.1, 109.0, 109.0.1
- NVIDIA Technical Blog: "Integrate Physical AI Capabilities into Existing Apps with NVIDIA Omniverse Libraries" (April 2026)
- NVIDIA Developer Forums GTC 2026 announcements
- GitHub repositories: NVIDIA-Omniverse, isaac-sim
- NVIDIA Omniverse Discord community

---

*Research conducted on: 2026-04-15*
*Last updated: 2026-04-15*
