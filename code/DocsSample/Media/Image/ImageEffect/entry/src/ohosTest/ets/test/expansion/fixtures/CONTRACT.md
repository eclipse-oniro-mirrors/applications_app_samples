<!-- Copyright (c) 2026 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. -->

# ImageEffect shared fixture contract

Import from `./fixtures/ImageEffectFixture` from an expansion case. No test is registered here; no helper calls libentry.so or reimplements a filter.

## API (explicit ArkTS types)

- `new FixtureSpec(width: number, height: number, pattern: string, format: string = 'image/png', rgba: number[] = [128,128,128,255], alphaValues: number[] = [0,64,128,255], quality: number = 100)`; public fields match arguments. Supported catalog patterns: `solid`, `opaque-color-quadrants`, `alpha-checker`, `opaque-row-bands-top-distinct-from-bottom`, `opaque-row-bands`, `large-opaque-gray-bands`. Other patterns reject. Dimensions positive integers, at most 4096 each and 16777216 pixels; solid channels/alphas byte-valued; JPEG inputs must be opaque.
- `createFixturePixelMap(spec: FixtureSpec): Promise<image.PixelMap>` creates legal RGBA_8888 input; caller owns result.
- `new FixtureScope(cacheDir: string, caseId: string)` creates an exclusive, non-existing, timestamp/counter-named child of the actual device cache directory. Never pass a fake context path. `directory: string` exposes its owned directory.
- `scope.createFile(spec: FixtureSpec, name: string = 'input.png'): Promise<FixtureFile>` packs via SDK, awaits packing, writes complete bytes, returns `path`, `originalPath` and `originalBytes`. Name is a single safe leaf, not a full path. The original is a byte-identical independent backup, not an oracle computed by the production function.
- `scope.restore(file: FixtureFile): void` restores exact original bytes before each in-place production invocation.
- `scope.ownPixelMap(pixelMap: image.PixelMap): image.PixelMap` / `scope.ownSource(source: image.ImageSource): image.ImageSource` transfer ownership; register each handle only once.
- `scope.dispose(): Promise<void>` attempts all owned releases and removal of only its tracked files/own empty directory in the original order, then propagates the exact first cleanup failure, including `undefined`, without string coercion. Idempotent after its first cleanup attempt; a failed release is not evidence that the native resource was freed. Cases await in `finally` through `CleanupGuard`: a body failure remains primary, while cleanup failure after successful work still fails. Secondary cleanup diagnostics contain no arbitrary error value. Do not register a handle already explicitly released.
- `decodeFileReference(path: string): Promise<image.PixelMap>` and `decodeResourceReference(manager: resourceManager.ResourceManager, resource: Resource): Promise<image.PixelMap>` independently decode through public SDK; internal ImageSource released in finally, returned PixelMap caller-owned. If decode succeeds but releasing its ImageSource fails, the not-yet-delivered PixelMap is also offered release, retaining the source-release failure as primary. Internal optional cleanup-observation arguments do not change existing one-argument callers. Resource manager must be from the real production app context, not an assumed test-resource namespace.
- `normalizePixels(pixelMap: image.PixelMap): Promise<PixelSnapshot>` roundtrips through SDK PNG packing and independent RGBA_8888 decoding, then SDK readPixels with explicit tight stride. Returns `width: number`, `height: number`, `rgba: Uint8Array`; original handle not mutated/released. Normalize both actual and reference; PNG roundtrip canonicalizes SDK pixel-format/alpha behavior, avoiding raw BGRA/premultiplication assumptions. Do not compare alpha fixture bytes directly to source straight-alpha bytes.
- `jpegReference(pixelMap: image.PixelMap, quality: number = 100): Promise<image.PixelMap>` independent SDK encode/decode oracle for identity JPEG output. Returned handle caller-owned; input unchanged. For JPEG-source identity, decode the original JPEG first, then apply this helper to match the production second encoding.
- `isJpegFile(path: string): boolean` checks actual SOI magic and terminal EOI (not extension); read errors propagate.
- `awaitJpegOutput(path: string): Promise<image.PixelMap>` preserves the existing 20-attempt, 25 ms readiness retry interval and terminal-EOI requirement. A cleanup failure is not transient readiness: it propagates immediately with exact primary identity, rather than retrying into a later pass. The budget is not cancellation or proof of native drain.

## Required use and limits

Construct scope from real cacheDir with globally unique catalog caseId. Keep an independent `decodeFileReference(file.originalPath)` alive for input reference, use `file.path` as complete filesystem path to ImageUtils/native APIs. The native entrypoints are synchronous; the existing `awaitJpegOutput` helper retries only readiness as described above and does not cancel work. Await SDK Promise APIs directly; SDK operations themselves have no fabricated local deadline. External runner timeout remains runner responsibility and does not establish completion or authorize cleanup of unfinished work.

All file/native cases must be serial in a process, including queries/custom-filter registration. Scope isolation is not a native global-state lock. Every case restores the original before each comparison invocation. No fake surface ID, no surface creation, no camera helper. NativeBuffer has no initialized observable pixel return; only its bool contract may be asserted.

Filter rows must be complete `Array<Array<string | number>>`, registered nonempty name plus finite numeric value. CustomCrop must produce at least one row with proportion in (0,100]. Never test illegal native parameters. Fixtures do not produce expected filter pixels: use catalog literal expectations, independent SDK geometry/encoding where applicable, or documented statistical assertions. Pure-color JPEG tolerance is catalog 3/4, not arbitrary large thresholds. PixelMap native output is JPEG even for a .png path; assert magic and independently decode. URI output is decoded by magic, without assuming the original extension.

Production evidence: ImageUtils exports getInstance/getPixelMap/getPixelMapByFilePath; its path method takes full paths. ImageEditPage awaits doSavePixel, calls synchronous native methods, then reloads the resulting file; no async output polling facility is needed. Production ImageUtils does not expose/release its internal ImageSource; fixtures cannot repair that leak and must not pretend to own those sources. Shared code never imports production ImageUtils; each case must exercise its assigned actual export itself.

Static source inspection only. No compilation, project execution, SDK commands, build or test run performed.
