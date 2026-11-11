# FastBufferStreamDemo

An OpenHarmony sample that demonstrates **efficient buffering and streaming data** with **FastBuffer** (`@ohos.fastbuffer`, API 20+) and **Stream** (`@ohos.util.stream`, API 12+).

## Introduction

The sample compares FastBuffer with the classic Buffer API and shows how to use Readable, Writable, Transform, Duplex and `pipe()` for chunked data processing. Each scene writes a short explanation and its result to the in-page log panel and to hilog, so the behavior can be observed without a debugger.

## Preview

Representative runtime screenshots are stored under [screenshots/](screenshots/):

- [Home and scene buttons](screenshots/1_home.svg)
- [FastBuffer basics](screenshots/2_scene1.svg)
- [Writable backpressure](screenshots/3_scene5.svg)
- [Pipeline and packet scenes](screenshots/4_scene6.svg)

Only the most representative screenshots are linked here; the full sequence is documented in [README_zh.md](README_zh.md).

## Highlights

9 demo scenes covering both kits end to end:

1. FastBuffer basics — create, binary read/write, encoding (utf8/hex/base64), concat, copy, subarray, equals/compare
2. FastBuffer vs Buffer benchmark — same workload, timed side by side with checksum verification
3. Writable — chunked writes to sandbox file, cork/uncork, high-watermark backpressure
4. Readable — chunked consumption, no whole-file loading
5. Full pipeline — Readable → Transform → Writable wired by events
6. Packet toolkit — protocol pack/unpack, CRC32 verification, hexDump, tamper detection
7. TLV stream parsing — magic search with noise, bad-CRC detection, truncation guard
8. pipe() — one-line pipeline `source.pipe(transform).pipe(sink)`
9. Duplex — echo duplex stream, write side uppercases and feeds the read side

## Project structure

```text
FastBufferStreamDemo
├── AppScope
├── entry
│   └── src
│       ├── main/ets
│       │   ├── entryability
│       │   ├── entrybackupability
│       │   ├── model
│       │   │   ├── FastBufferBasics.ets
│       │   │   ├── StreamPipeline.ets
│       │   │   └── utils
│       │   └── pages/Index.ets
│       └── ohosTest/ets/test
├── screenshots
├── README.md
└── README_zh.md
```

## Implementation

- `FastBufferBasics.ets` implements scenes 1, 2, 6 and 7 (buffer operations, benchmark, packet/CRC, TLV parsing).
- `StreamPipeline.ets` implements scenes 3, 4, 5, 8 and 9 on top of `FileWritable` / `FileReadable` from `utils/StreamFileUtil.ets`.
- `pages/Index.ets` is the single page: it creates the demo files under the app sandbox, wires the scene buttons, and renders the log panel.
- Logging is unified in `utils/LogUtil.ets` (hilog + in-page panel). Buffers, files and streams are all created and released inside the sample; no data leaves the sandbox.

## Permissions

No permissions are required. All demo files are created in the application sandbox (`filesDir`), and no network access is used.

## Constraints

- OpenHarmony API 26 (compile/target/compatible SDK 26.0.0), Stage model.
- Built and verified with DevEco Studio 6.1.1 and RK3568 (dayu200, OpenHarmony 7.0.0.46 Beta1 / API 26).
- The device-side Hypium suite has **16 suites / 248 cases**, all passing on device (`Tests run: 248, Failure: 0, Error: 0`).
- ROM-specific stream/fastbuffer behaviors and adaptation notes are documented in [README_zh.md](README_zh.md).

## Download

The project is currently maintained as a standalone directory; copy the `FastBufferStreamDemo` directory to use it. After it is merged into the application samples repository, the project is located at `code/BasicFeature/DataManagement/FastBufferStreamDemo` and can be fetched separately with:

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set code/BasicFeature/DataManagement/FastBufferStreamDemo
```

Open the `FastBufferStreamDemo` root directory in DevEco Studio after fetching.
