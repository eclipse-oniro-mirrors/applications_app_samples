# Distributed Softbus Conversation Demo

## Overview

This sample demonstrates how to use the distributed softbus conversation APIs to
discover trusted devices, register conversation listeners, and exchange messages
between devices.

Bundle name: `com.example.distributedsoftbusconversationdemo`

## Environment

- OpenHarmony API version 26
- DevEco Studio 6.0.0 Release or later
- Full SDK required for system APIs
- Two or more devices running the same application

## Permissions

- `ohos.permission.DISTRIBUTED_DATASYNC`
- `ohos.permission.sec.ACCESS_UDID`

The permissions above require the corresponding system application signature.

## How to Use

1. Install and launch the application on the target devices.
2. Grant the distributed data sync permission.
3. Tap **Get Trusted Devices** to query trusted devices.
4. Tap **Register Listener** to start receiving messages.
5. Replace `deviceId` in `Index.ets` with the target device network ID or UDID.
6. Tap **Send Message** to send data to the target device.
7. Tap **Unregister Listener** when message receiving is no longer required.

## Source Structure

```text
entry/src/main/ets/
├── entryability/EntryAbility.ets
├── entrybackupability/EntryBackupAbility.ets
└── pages/Index.ets
```

## Testing

Run the automated test suite:

```bash
aa test -b com.example.distributedsoftbusconversationdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 900000
```

See `ohosTest.md` for the registered suites and case counts.
