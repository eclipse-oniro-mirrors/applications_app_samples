# CodecCapabilitySample (Obtain Supported Codec Capabilities)

## Introduction

This sample demonstrates how to query the codecs supported by the system and their capability specifications through the OH_AVCapability interfaces of AVCodec Kit. It works with the development guides "Obtain Supported Codecs", "Video Encoding Parameter Configuration for Typical Scenarios", "High-Compression B-Frame Encoding", and "Temporal-Scalable Encoding for Weak-Network Packet Loss Resilience". The sample code is embedded in scenario functions with [Start xxx]/[End xxx] markers so that the documentation can reference it by snippet name.

Main capabilities:

- Query the full codec list (video/audio, encoder/decoder), showing the name, MIME type, hardware/software category, secure decoder flag, and maximum number of instances.
- View the detailed capabilities of a codec: width/height alignment and ranges, frame rate range, bitrate/quality/complexity ranges, bitrate mode support, profiles and levels, pixel formats, long-term reference feature, and audio sample rate and channel ranges.
- Run the scenario examples from the development guide one by one: creating a codec by name, differentiated configuration by category, multi-instance creation, CBR/CQ/SQR/CBRHQ bitrate mode configuration, profile/level checks, size and frame rate checks, and secure decoder filtering.
- Run the scenario examples from the video encoding configuration guides one by one: base parameter configuration for typical scenarios (low latency, CBRHQ, live streaming, offline transcoding), dynamic IDR frame request, B-frame capability check and maximum B-frame count configuration, temporal scalability feature check/configuration/dynamic enable and disable, temporal layer parsing, and LTR capability check and reference frame count configuration.

## Directory Structure

```
CodecCapabilitySample
├── AppScope                             # Application-level configuration
├── entry/src/main/cpp                   # Native code
│   ├── capability
│   │   ├── include                      # Header files
│   │   ├── CapabilityQuery.cpp          # Scenarios: capability instances and codec creation
│   │   ├── CapabilityConfigQuery.cpp    # Scenarios: bitrate modes/complexity/audio params
│   │   ├── CapabilityVideoQuery.cpp     # Scenarios: profile/level/size/frame rate/pixel/DRM
│   │   ├── EncodingConfigQuery.cpp      # Scenarios: encoding parameter configuration
│   │   ├── BFrameQuery.cpp              # Scenarios: B-frame capability check and configuration
│   │   ├── TemporalScalabilityQuery.cpp # Scenarios: temporal scalability and LTR
│   │   ├── CodecList.cpp                # Codec list and detail queries
│   │   └── CapabilityQueryNative.cpp    # NAPI bridge
│   ├── common/dfx                       # Logging and error codes
│   └── types/libcapability              # Native interface declarations
├── entry/src/main/ets                   # Application code
│   ├── common/utils                     # Logging utility
│   ├── controller                       # Controller
│   ├── model                            # Data model
│   ├── entryability                     # Entry ability
│   └── pages                            # Pages
└── entry/src/ohosTest                   # Unit tests
```

## How to Use

1. Open this project in DevEco Studio 26.0.0 Release and connect a device or emulator.
2. Run the app. The home page has two tabs: codec list and scenario verification.
3. On the codec list tab, switch codec categories and tap a codec to view its details.
4. On the scenario tab, tap a scenario to run the corresponding example and view the result.

## Constraints

- This sample can only run on standard systems.
- This sample requires DevEco Studio 26.0.0 Release or later.
- Scenario results are cached to avoid repeatedly creating codec instances; the cache is reset after the app restarts.
