# Virtual file drag (C/C++)

[中文说明](README_zh.md)

## Overview

Bundle: `com.samples.virtualfiledragc`. This Stage sample declares a virtual file or nested directory and supplies its content through UDMF callbacks. The receiver obtains file URIs and leaves further processing to the application.

## UI and usage

The three buttons select a document, a nested directory, or archive extraction on the first read. Drag the blue source area to the file manager or a desktop that accepts files. The green area receives URIs and shows their count; it does not copy files.

## Requirements and dependencies

- OpenHarmony API 26.1.0 SDK and a ROM implementing virtual file drag are required. SDK declarations alone do not add ROM support.
- Use DevEco Studio with Hvigor 6.0.0 and Stage support. Configure your own development signature; no signing material is included.
- The sample requests no additional permissions. SDK UDMF, file, ArkUI and zlib APIs supply the feature; Hypium 1.0.24 is used only for tests.
- File size must be accurate. Read callbacks return the requested range or reject on failure. Callback providers must remain available while the receiver reads.

## Structure and implementation

```text
AppScope/                 Application metadata and vector icon
entry/src/main/           Page, provider, receiver and resources
entry/src/ohosTest/       Scenario-selection UI tests
ohosTest.md               Manual and automated test instructions
```

Start with [Index.ets](entry/src/main/ets/pages/Index.ets). See [implementation and API usage](README_zh.md#具体实现) for callback setup, data attachment, drag events and resource lifetimes. See [test instructions](ohosTest.md) for manual cross-application verification. No device execution result is implied by test expectations.

## Download

```shell
git clone --filter=blob:none --sparse --branch master https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set code/DocsSample/ArkData/Udmf/VirtualFileDrag_C
```

## Documentation source

The guide uses `virtual_drag_...` source markers. Update the corresponding guide snippets whenever marked source changes.
