/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Matrix suite of the sandbox output store of the shared library.
 * The cases drive the real output directory of the test application: path
 * composition, buffer writes, directory listings, the pure size summation,
 * single file removal and the full clear behaviour.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { SandboxStore, CacheFile } from 'photopickersendable';

/** Log domain shared with the test ability so the streams stay comparable. */
const DOMAIN: number = 0xF811;
// Delegator used once by beforeAll to capture the application context.
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
// Captured once by beforeAll and consumed by every context based case below.
let appContext: common.Context | undefined = undefined;

/**
 * Builds one byte buffer with a deterministic fill pattern.
 * @param length Byte length of the requested buffer.
 * @returns A buffer whose bytes repeat the pattern 0 to 255.
 */
function buildBuffer(length: number): ArrayBuffer {
  // Allocate the raw byte area of the requested size.
  const buffer: ArrayBuffer = new ArrayBuffer(length);
  // Wrap the area in a typed view so single bytes can be written.
  const view: Uint8Array = new Uint8Array(buffer);
  // Fill every byte with a deterministic pattern for later size checks.
  for (let index: number = 0; index < length; index++) {
    view[index] = index % 256;
  }
  // Hand the filled buffer back.
  return buffer;
}

/**
 * Registers every sandbox store matrix case of the sample.
 * Every case owns unique file names prefixed with sbmat_ and the suite
 * clears the output directory once before the first case runs.
 */
export default function sandboxStoreMatrixTest() {
  describe('SandboxStoreMatrixTest', () => {
    // Suite tag keeps the setup logs searchable without touching case tags.
    const SUITE_TAG: string = 'SandboxStoreMatrixTest';

    beforeAll(async (): Promise<void> => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' start');
      // The application context resolves the private files directory.
      appContext = delegator.getAppContext();
      // Start from a deterministic empty output directory.
      if (appContext !== undefined) {
        SandboxStore.clear(appContext);
      }
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0100
     * @tc.name      testSandboxMat0001
     * @tc.desc      Verify outputDir composes the outputs folder below the
     *               private files directory of the application.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const dir: string = SandboxStore.outputDir(context);
      // The folder name of the cache layer is outputs.
      expect(dir).assertContain('/outputs');
      // The directory is nested directly below the private files directory.
      expect(dir).assertEqual(context.filesDir + '/outputs');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0200
     * @tc.name      testSandboxMat0002
     * @tc.desc      Verify outputDir creates the directory on first use and a
     *               second call returns the identical stable path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      // The first call creates the directory when it is missing.
      const first: string = SandboxStore.outputDir(context);
      // The directory really exists on the file system now.
      expect(fs.accessSync(first)).assertTrue();
      // The second call returns the identical path without recreating.
      const second: string = SandboxStore.outputDir(context);
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0300
     * @tc.name      testSandboxMat0003
     * @tc.desc      Verify saveBuffer writes a small buffer and returns the
     *               exact target path whose file holds the byte size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_0300.bin';
      const buffer: ArrayBuffer = buildBuffer(4);
      // The write reports the composed target path.
      const path: string = SandboxStore.saveBuffer(context, buffer, fileName);
      expect(path).assertEqual(SandboxStore.outputDir(context) + '/' + fileName);
      // The written file exists with the exact byte size of the buffer.
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.statSync(path).size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0400
     * @tc.name      testSandboxMat0004
     * @tc.desc      Verify saveBuffer writes a one kilobyte buffer whose file
     *               size matches the buffer length exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_0400.bin';
      const buffer: ArrayBuffer = buildBuffer(1024);
      // The one kilobyte write lands inside the output directory.
      const path: string = SandboxStore.saveBuffer(context, buffer, fileName);
      expect(fs.accessSync(path)).assertTrue();
      // The file size equals the buffer length without any padding.
      expect(fs.statSync(path).size).assertEqual(1024);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0500
     * @tc.name      testSandboxMat0005
     * @tc.desc      Verify saveBuffer accepts an empty buffer and produces a
     *               zero byte file inside the output directory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_0500.bin';
      // The empty buffer is a legal write payload.
      const path: string = SandboxStore.saveBuffer(context, new ArrayBuffer(0), fileName);
      expect(fs.accessSync(path)).assertTrue();
      // The resulting file exists but carries zero bytes.
      expect(fs.statSync(path).size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0600
     * @tc.name      testSandboxMat0006
     * @tc.desc      Verify saving twice under one file name truncates the
     *               first content so the file holds the newest size only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_0600.bin';
      // The first write is larger than the second one.
      SandboxStore.saveBuffer(context, buildBuffer(512), fileName);
      const path: string = SandboxStore.saveBuffer(context, buildBuffer(128), fileName);
      // The truncating rewrite leaves only the newest byte size.
      expect(fs.statSync(path).size).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0700
     * @tc.name      testSandboxMat0007
     * @tc.desc      Verify list reports a freshly saved file with its name,
     *               byte size and a positive modification time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_0700.bin';
      SandboxStore.saveBuffer(context, buildBuffer(64), fileName);
      // The listing contains at least the freshly saved entry.
      const files: CacheFile[] = SandboxStore.list(context);
      expect(files.length).assertLargerOrEqual(1);
      // Walk the entries to find the saved file by name.
      let found: boolean = false;
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].name === fileName) {
          found = true;
          expect(files[index].size).assertEqual(64);
          expect(files[index].modifiedTime > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0800
     * @tc.name      testSandboxMat0008
     * @tc.desc      Verify every list entry carries the composed absolute
     *               path of its file inside the output directory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_0800.bin';
      const path: string = SandboxStore.saveBuffer(context, buildBuffer(8), fileName);
      // Find the entry of the saved file inside the listing.
      const files: CacheFile[] = SandboxStore.list(context);
      let entryPath: string = '';
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].name === fileName) {
          entryPath = files[index].path;
        }
      }
      // The stored path equals the composed directory and file name.
      expect(entryPath).assertEqual(path);
      expect(entryPath).assertEqual(SandboxStore.outputDir(context) + '/' + fileName);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_0900
     * @tc.name      testSandboxMat0009
     * @tc.desc      Verify the list is ordered newest first, so every entry
     *               time is larger than or equal to the next entry time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      // Save two files so the listing has at least two candidates.
      SandboxStore.saveBuffer(context, buildBuffer(4), 'sbmat_0900_a.bin');
      SandboxStore.saveBuffer(context, buildBuffer(4), 'sbmat_0900_b.bin');
      const files: CacheFile[] = SandboxStore.list(context);
      expect(files.length).assertLargerOrEqual(2);
      // Every entry time is larger than or equal to the follower time.
      for (let index: number = 0; index + 1 < files.length; index++) {
        expect(files[index].modifiedTime >= files[index + 1].modifiedTime).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1000
     * @tc.name      testSandboxMat0010
     * @tc.desc      Verify totalSize of an empty entry array is the neutral
     *               element zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The pure sum over no entries stays zero.
      const empty: CacheFile[] = [];
      expect(SandboxStore.totalSize(empty)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1100
     * @tc.name      testSandboxMat0011
     * @tc.desc      Verify totalSize of one entry equals the entry size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: CacheFile = new CacheFile('one.bin', '/tmp/one.bin', 777, 1000);
      // The sum over a single entry is the entry size itself.
      const single: CacheFile[] = [entry];
      expect(SandboxStore.totalSize(single)).assertEqual(777);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1200
     * @tc.name      testSandboxMat0012
     * @tc.desc      Verify totalSize sums three entries to the exact total
     *               of their byte sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: CacheFile = new CacheFile('a.bin', '/tmp/a.bin', 100, 1000);
      const second: CacheFile = new CacheFile('b.bin', '/tmp/b.bin', 250, 2000);
      const third: CacheFile = new CacheFile('c.bin', '/tmp/c.bin', 64, 3000);
      // The sum 100 plus 250 plus 64 is 414.
      const many: CacheFile[] = [first, second, third];
      expect(SandboxStore.totalSize(many)).assertEqual(414);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1300
     * @tc.name      testSandboxMat0013
     * @tc.desc      Verify totalSize skips zero size entries without any
     *               special casing, because zero contributes nothing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty1: CacheFile = new CacheFile('e1.bin', '/tmp/e1.bin', 0, 1000);
      const empty2: CacheFile = new CacheFile('e2.bin', '/tmp/e2.bin', 0, 2000);
      const payload: CacheFile = new CacheFile('p.bin', '/tmp/p.bin', 2048, 3000);
      // Two zero entries plus 2048 sum up to 2048.
      const files: CacheFile[] = [empty1, empty2, payload];
      expect(SandboxStore.totalSize(files)).assertEqual(2048);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1400
     * @tc.name      testSandboxMat0014
     * @tc.desc      Verify totalSize keeps exact integer sums for large
     *               megabyte sized entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: CacheFile = new CacheFile('l1.bin', '/tmp/l1.bin', 1000000, 1000);
      const second: CacheFile = new CacheFile('l2.bin', '/tmp/l2.bin', 1000000, 2000);
      const third: CacheFile = new CacheFile('l3.bin', '/tmp/l3.bin', 1000000, 3000);
      // Three one megabyte entries sum up to three million bytes.
      const files: CacheFile[] = [first, second, third];
      expect(SandboxStore.totalSize(files)).assertEqual(3000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1500
     * @tc.name      testSandboxMat0015
     * @tc.desc      Verify remove deletes a written file so the file system
     *               probe and the listing stop reporting it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSandboxMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSandboxMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_1500.bin';
      const path: string = SandboxStore.saveBuffer(context, buildBuffer(16), fileName);
      expect(fs.accessSync(path)).assertTrue();
      // The removal drops the file from the file system.
      SandboxStore.remove(path);
      expect(fs.accessSync(path)).assertFalse();
      // The listing no longer reports the removed file name.
      const files: CacheFile[] = SandboxStore.list(context);
      let found: boolean = false;
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].name === fileName) {
          found = true;
        }
      }
      expect(found).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1600
     * @tc.name      testSandboxMat0016
     * @tc.desc      Verify remove on a never written path throws an Error
     *               instance so callers can report the failure.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      // The path below is never written by this suite.
      const missing: string = SandboxStore.outputDir(context) + '/sbmat_1600_missing.bin';
      let caught: boolean = false;
      let caughtIsError: boolean = false;
      try {
        SandboxStore.remove(missing);
      } catch (err) {
        caught = true;
        // The helper guarantees an Error instance reaches the caller.
        caughtIsError = err instanceof Error;
      }
      expect(caught).assertTrue();
      expect(caughtIsError).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1700
     * @tc.name      testSandboxMat0017
     * @tc.desc      Verify clear removes every file of the output directory
     *               in one call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      // Seed three distinct files for the cleanup.
      SandboxStore.saveBuffer(context, buildBuffer(4), 'sbmat_1700_a.bin');
      SandboxStore.saveBuffer(context, buildBuffer(4), 'sbmat_1700_b.bin');
      SandboxStore.saveBuffer(context, buildBuffer(4), 'sbmat_1700_c.bin');
      const before: CacheFile[] = SandboxStore.list(context);
      expect(before.length).assertLargerOrEqual(3);
      // The clear call empties the whole directory.
      SandboxStore.clear(context);
      const after: CacheFile[] = SandboxStore.list(context);
      expect(after.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1800
     * @tc.name      testSandboxMat0018
     * @tc.desc      Verify list on a cleared directory returns an empty
     *               array whose total size is zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      // Make sure the directory starts empty for this case.
      SandboxStore.clear(context);
      const files: CacheFile[] = SandboxStore.list(context);
      expect(files.length).assertEqual(0);
      // The sum over the empty listing is zero as well.
      expect(SandboxStore.totalSize(files)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_1900
     * @tc.name      testSandboxMat0019
     * @tc.desc      Verify a list entry mirrors the file system metadata: the
     *               byte size and the millisecond modification time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_1900.bin';
      SandboxStore.saveBuffer(context, buildBuffer(32), fileName);
      // Find the entry of the saved file inside the listing.
      const files: CacheFile[] = SandboxStore.list(context);
      let entry: CacheFile | undefined = undefined;
      for (let index: number = 0; index < files.length; index++) {
        if (files[index].name === fileName) {
          entry = files[index];
        }
      }
      expect(entry === undefined).assertFalse();
      if (entry === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      // The kit reports the modification time in seconds, the entry in milliseconds.
      const stat: fs.Stat = fs.statSync(entry.path);
      expect(entry.size).assertEqual(stat.size);
      expect(entry.modifiedTime).assertEqual(stat.mtime * 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_2000
     * @tc.name      testSandboxMat0020
     * @tc.desc      Verify a file can be written again after its removal and
     *               carries the new byte size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSandboxMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSandboxMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      const fileName: string = 'sbmat_2000.bin';
      // Write, remove and write again under the same name.
      const path: string = SandboxStore.saveBuffer(context, buildBuffer(256), fileName);
      SandboxStore.remove(path);
      expect(fs.accessSync(path)).assertFalse();
      const again: string = SandboxStore.saveBuffer(context, buildBuffer(96), fileName);
      expect(again).assertEqual(path);
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.statSync(path).size).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_2100
     * @tc.name      testSandboxMat0021
     * @tc.desc      Verify outputDir stays stable across repeated calls and
     *               always sits below the application files directory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSandboxMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSandboxMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(appContext === undefined).assertFalse();
      if (appContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.Context = appContext;
      // Three repeated calls return the very same path.
      const first: string = SandboxStore.outputDir(context);
      const second: string = SandboxStore.outputDir(context);
      const third: string = SandboxStore.outputDir(context);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      // The path is nested below the private files directory.
      expect(first.startsWith(context.filesDir)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SBMAT_2200
     * @tc.name      testSandboxMat0022
     * @tc.desc      Verify totalSize adds signed entries without clamping so
     *               a negative entry reduces the total exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSandboxMat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSandboxMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const positive: CacheFile = new CacheFile('p.bin', '/tmp/p.bin', 100, 1000);
      const negative: CacheFile = new CacheFile('n.bin', '/tmp/n.bin', -40, 2000);
      const small: CacheFile = new CacheFile('s.bin', '/tmp/s.bin', 60, 3000);
      // The signed sum is 100 minus 40 plus 60 which is 120.
      const files: CacheFile[] = [positive, negative, small];
      expect(SandboxStore.totalSize(files)).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
