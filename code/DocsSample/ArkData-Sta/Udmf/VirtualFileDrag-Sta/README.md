# Virtual file drag (static ArkTS (ArkTS 1.2))

[中文说明](README_zh.md)

## Overview

Bundle: `com.samples.virtualfiledragsta`. This Stage sample declares a virtual file or nested directory and supplies its content through UDMF callbacks. The receiver obtains file URIs and leaves further processing to the application.

## UI and usage

The three buttons select a document, a nested directory, or archive extraction on the first read. Drag the blue source area to the file manager or a desktop that accepts files. The green area receives URIs and shows their count; it does not copy files.

## Requirements and dependencies

- An OpenHarmony API 26.1.0 SDK containing the new static interfaces and a ROM implementing virtual file drag are required. SDK declarations alone do not add ROM support.
- Use DevEco Studio and Hvigor with ArkTS 1.2 support. A dynamic-only toolchain cannot build this project. Configure your own development signature; no signing material is included.
- The sample requests no additional permissions. SDK UDMF, file, ArkUI and zlib APIs supply the feature; Hypium 1.0.24 is used only for tests.
- File size must be accurate. Read callbacks return the requested range or reject on failure. Callback providers must remain available while the receiver reads.

## Structure and implementation

Every `.ets` file starts with `'use static';`. Modification times, file sizes and read offsets use `long`; read lengths use `int`. The three scenario buttons, drag source and drop target use the same resources and layout as the dynamic ArkTS and C/C++ samples. The independent bundle name allows all three samples to be installed together.

```text
AppScope/                 Application metadata and vector icon
entry/src/main/           Page, provider, receiver and resources
entry/src/ohosTest/       UI and Provider callback tests
ohosTest.md               Manual and automated test instructions
```

Start with [Index.ets](entry/src/main/ets/pages/Index.ets). See [implementation and API usage](README_zh.md#具体实现) for callback setup, data attachment, drag events and resource lifetimes. See [test instructions](ohosTest.md) for manual cross-application verification. Provider tests also check metadata, nested entries, ranged reads, EOF and rejection. The archive fixture uses one shared preparation task per process; active reads are never cleaned up on drag end. No device execution result is implied by test expectations.

## Download

```shell
git clone --filter=blob:none --sparse --branch OpenHarmony_feature_sta_20260331 https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set code/DocsSample/ArkData-Sta/Udmf/VirtualFileDrag-Sta
```

## Documentation source

This project uses separate `virtual_drag_sta_...` source markers for static API documentation. When a guide references these markers, update its corresponding code snippets together with the source. The dynamic sample's markers are not reused.
