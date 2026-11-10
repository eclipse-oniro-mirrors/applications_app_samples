# Bluetooth BaseProfile

[中文](README_zh.md) | English

### Introduction

This sample demonstrates how to use the Bluetooth BaseProfile APIs on OpenHarmony. It covers eight classic Bluetooth profiles and provides a complete UI for device scanning, connection management, and profile interaction:

1. **A2DP** (Advanced Audio Distribution Profile): audio streaming and playback control.
2. **HFP** (Hands-Free Profile): call answering, hanging up, and volume control.
3. **HID** (Human Interface Device Profile): input device connection and status display.
4. **PAN** (Personal Area Network Profile): network sharing management.
5. **PBAP** (Phone Book Access Profile): phonebook synchronization.
6. **MAP** (Message Access Profile): message list viewing.
7. **AVRCP** (Audio/Video Remote Control Profile): media playback remote control.
8. **HDP** (Health Device Profile): health data display.

In addition, the sample provides auxiliary pages such as device scanning, bonded devices, connection log, profile statistics, combined scenario, and settings.

### Usage

1. Start the sample application. The home page lists all Bluetooth profile entries.
2. Tap a profile card (for example, **Audio (A2DP)**) to open the corresponding profile page.
3. On each profile page, use the connection button to connect to or disconnect from a device, and use the profile panel (media control, call control, contact sync, etc.) to interact with the profile.
4. Tap **Scan Devices** to discover nearby Bluetooth devices, or **Bonded Devices** to view the paired device list.
5. Tap **Connection Log** or **Statistics** to view connection history and profile usage statistics.

### Project Structure

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                    // Application entry ability
|---pages
|   |---Index.ets                           // Home page with all profile entries
|   |---A2dpPage.ets                        // A2DP audio profile page
|   |---HfpPage.ets                         // HFP hands-free profile page
|   |---HidPage.ets                         // HID input device page
|   |---PanPage.ets                         // PAN network sharing page
|   |---PbapPage.ets                        // PBAP phonebook page
|   |---MapPage.ets                         // MAP message page
|   |---AvrcpPage.ets                       // AVRCP media control page
|   |---HdpPage.ets                         // HDP health device page
|   |---BondedDevicesPage.ets               // Bonded device list page
|   |---ConnectionLogPage.ets               // Connection history page
|   |---ProfileStatisticsPage.ets           // Profile usage statistics page
|   |---CombinedScenarioPage.ets            // Multi-profile combination page
|---components
|   |---AudioStreamControl.ets              // Audio stream control component
|   |---CallControlPanel.ets                // Call control panel component
|   |---MediaControlPanel.ets               // Media control panel component
|   |---BluetoothDeviceCard.ets             // Bluetooth device card component
|   |---ScanResultList.ets                  // Scan result list component
|   |---ProfileStatusIndicator.ets          // Profile status indicator component
library/src/main/ets/
|---bluetooth
|   |---A2dpProfileManager.ts               // A2DP profile manager
|   |---HfpProfileManager.ts                // HFP profile manager
|   |---HidProfileManager.ts                // HID profile manager
|   |---PanProfileManager.ts                // PAN profile manager
|   |---PbapProfileManager.ts               // PBAP profile manager
|   |---MapProfileManager.ts                // MAP profile manager
|   |---AvrcpProfileManager.ts              // AVRCP profile manager
|   |---HdpProfileManager.ts                // HDP profile manager
|---service
|   |---BluetoothScanService.ts             // Bluetooth device scan service
|   |---BluetoothConnectionManager.ts       // Bluetooth connection manager
|   |---A2dpService.ts                      // A2DP service (other profile services are similar)
|---model                                   // Data models for each profile
|---mock                                    // Mock data generators for demonstration
|---constants                               // Bluetooth and page constants
|---utils                                   // Basic, device, network and validation utilities
```

The `entry` module implements the UI pages and components, while the `library` module encapsulates profile managers, services, data models, and utilities. Each profile follows the same layered design: **Manager** (lifecycle and connection management) -> **Service** (profile business logic) -> **Model** (data state).

### Required Permissions

This sample uses mock data to demonstrate profile features and does not declare any permission. To interact with real Bluetooth hardware, declare the following permissions in `entry/src/main/module.json5`:

| Permission | Description | Level |
| ---- | ---- | ---- |
| ohos.permission.USE_BLUETOOTH | Allows an application to view the Bluetooth configuration. | normal |
| ohos.permission.DISCOVER_BLUETOOTH | Allows an application to configure the local Bluetooth, and discover and pair with remote devices. | normal |
| ohos.permission.ACCESS_BLUETOOTH | Allows an application to access Bluetooth and use its capabilities, such as pairing with and connecting to peripheral devices. | normal |

### Dependency

N/A

### Testing

This sample provides ohosTest test suites based on the Hypium framework, covering profile managers, services, models, utilities, and integration scenarios. For details, see [ohosTest.md](ohosTest.md).

### Constraints

1. This sample can only be run on standard-system devices.
2. This sample demonstrates the stage model. The SDK version is 26.0.0 (runtimeOS: OpenHarmony).
3. DevEco Studio 26.0 or later must be used for compilation and running.
4. Real Bluetooth profile interaction requires Bluetooth hardware. The sample provides mock data for UI demonstration.

### Download

To download this project separately, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Connectivity/BluetoothBaseProfile/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
