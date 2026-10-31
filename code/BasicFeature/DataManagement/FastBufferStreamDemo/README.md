# FastBufferStreamDemo

An OpenHarmony sample that demonstrates **efficient buffering and streaming data** with **FastBuffer** (`@ohos.fastbuffer`, API 20+) and **Stream** (`@ohos.util.stream`, API 12+).

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

Zero permissions, no network. Demo files live in the app sandbox and are removed on uninstall.

Verified on RK3568 (dayu200, OpenHarmony 7.0.0.46 Beta1 / API 26); device-side hypium suite: **74 tests, all passing**.

See [README_zh.md](README_zh.md) for the full guide: scene table, project layout, ROM-specific adaptation notes (stream/fastbuffer behavioral quirks on API 26), build/install/test commands, and real-device screenshots under [docs/screenshots/](docs/screenshots/).
