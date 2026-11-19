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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import { fileIo } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { FileSecurityUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_Security]';
// Lower case hex alphabet accepted for every random hex string.
const HEX_CHARS: string = '0123456789abcdef';
// Well known digest values of the empty text and of the text abc.
const EMPTY_MD5_HEX: string = 'd41d8cd98f00b204e9800998ecf8427e';
const ABC_MD5_HEX: string = '900150983cd24fb0d6963f7d28e17f72';
const ABC_SHA256_HEX: string = 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad';
// Fixed payload written into the sandbox for the write, read and size checks.
const SAMPLE_TEXT: string = 'hello geofence 2026';
// Byte size of SAMPLE_TEXT in UTF-8, all characters are single byte ASCII.
const SAMPLE_TEXT_BYTES: number = 19;
// Fixed payloads used by the copy, rename and directory entry checks.
const COPY_TEXT: string = 'copy rename payload';
const DIR_ENTRY_TEXT: string = 'one entry payload';

// Sandbox cache directory resolved once in beforeAll for all file based cases.
let cacheDir: string = '';

/**
 * Delete one sandbox file during cleanup while ignoring every failure so the
 * original test failure is never masked by a missing file.
 * @param path the sandbox file path to remove when it still exists
 */
async function safeDeleteFile(path: string): Promise<void> {
  try {
    const exists: boolean = await FileSecurityUtil.fileExists(path);
    if (exists) {
      await FileSecurityUtil.deleteFile(path);
    }
  } catch (error) {
    hilog.error(DOMAIN, SUITE_TAG, '%{public}s', 'cleanup, delete failed for ' + path);
  }
}

export default function fileSecurityLogicTest() {
  describe('FileSecurityUtilLogicTest', () => {
    beforeAll(async () => {
      cacheDir = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().cacheDir;
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, cacheDir: ' + cacheDir);
    });

    afterAll(async () => {
      // Remove every file the suite may have produced, then drop the test directory.
      await safeDeleteFile(cacheDir + '/gc_sec_test_write.txt');
      await safeDeleteFile(cacheDir + '/gc_sec_test_copy_src.txt');
      await safeDeleteFile(cacheDir + '/gc_sec_test_copy_dst.txt');
      await safeDeleteFile(cacheDir + '/gc_sec_test_copy_renamed.txt');
      await safeDeleteFile(cacheDir + '/gc_sec_test_dir/one.txt');
      const dirPath: string = cacheDir + '/gc_sec_test_dir';
      try {
        const dirExists: boolean = await fileIo.access(dirPath);
        if (dirExists) {
          await fileIo.rmdir(dirPath);
        }
      } catch (error) {
        hilog.error(DOMAIN, SUITE_TAG, '%{public}s', 'cleanup, rmdir failed for test directory');
      }
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'cleanup, afterAll finished');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_SECURITY_0100
     * @tc.name      testSecurityDigest0001
     * @tc.desc      Verify MD5 and SHA256 digests return the documented lower case hex
     *               values and lengths for known inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityDigest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityDigest0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const emptyMd5: string = await FileSecurityUtil.computeMd5('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'md5 of empty text: ' + emptyMd5);
      expect(emptyMd5).assertEqual(EMPTY_MD5_HEX);

      const abcMd5: string = await FileSecurityUtil.computeMd5('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'md5 of abc: ' + abcMd5);
      expect(abcMd5).assertEqual(ABC_MD5_HEX);
      expect(abcMd5.length).assertEqual(32);

      const abcSha256: string = await FileSecurityUtil.computeSha256('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'sha256 of abc: ' + abcSha256);
      expect(abcSha256).assertEqual(ABC_SHA256_HEX);
      expect(abcSha256.length).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_SECURITY_0200
     * @tc.name      testSecurityBase64RoundTrip0001
     * @tc.desc      Verify Base64 encode and decode round trips restore the original
     *               bytes and stay stable for Chinese text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityBase64RoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityBase64RoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const encoded: string = FileSecurityUtil.base64Encode('GeofenceCheckIn');
      hilog.info(DOMAIN, TAG, '%{public}s', 'encoded text: ' + encoded);
      const decoded: Uint8Array = FileSecurityUtil.base64Decode(encoded);
      hilog.info(DOMAIN, TAG, '%{public}s', 'decoded byte length: ' + decoded.length);
      expect(decoded.length).assertEqual(15);
      expect(decoded[0]).assertEqual(71);
      expect(decoded[8]).assertEqual(67);
      expect(decoded[13]).assertEqual(73);
      expect(decoded[14]).assertEqual(110);

      const encodedFirst: string = FileSecurityUtil.base64Encode('鸿蒙签到');
      const encodedSecond: string = FileSecurityUtil.base64Encode('鸿蒙签到');
      hilog.info(DOMAIN, TAG, '%{public}s', 'chinese encoded length: ' + encodedFirst.length);
      expect(encodedFirst === encodedSecond).assertTrue();
      expect(encodedFirst.length % 4).assertEqual(0);
      const decodedChinese: Uint8Array = FileSecurityUtil.base64Decode(encodedFirst);
      expect(decodedChinese.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_SECURITY_0300
     * @tc.name      testSecurityUuidAndHex0001
     * @tc.desc      Verify generated UUID strings keep the RFC format and random hex
     *               strings keep the requested length and lower case hex alphabet.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityUuidAndHex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityUuidAndHex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const uuidFirst: string = FileSecurityUtil.generateUuid();
      const uuidSecond: string = FileSecurityUtil.generateUuid();
      hilog.info(DOMAIN, TAG, '%{public}s', 'uuid sample: ' + uuidFirst);
      expect(uuidFirst.length).assertEqual(36);
      expect(uuidFirst.split('-').length).assertEqual(5);
      expect(uuidFirst !== uuidSecond).assertTrue();

      const hexFirst: string = FileSecurityUtil.generateRandomHex(8);
      const hexSecond: string = FileSecurityUtil.generateRandomHex(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'hex sample: ' + hexFirst);
      expect(hexFirst.length).assertEqual(16);
      expect(hexFirst !== hexSecond).assertTrue();
      expect(HEX_CHARS.indexOf(hexFirst.charAt(0)) >= 0).assertTrue();
      expect(HEX_CHARS.indexOf(hexFirst.charAt(7)) >= 0).assertTrue();
      expect(HEX_CHARS.indexOf(hexFirst.charAt(15)) >= 0).assertTrue();
      let allHexChars: boolean = true;
      for (let i = 0; i < hexFirst.length; i++) {
        if (HEX_CHARS.indexOf(hexFirst.charAt(i)) < 0) {
          allHexChars = false;
        }
      }
      expect(allHexChars).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_SECURITY_0400
     * @tc.name      testSecurityFileWriteReadDelete0001
     * @tc.desc      Verify writing, reading back, sizing and deleting a sandbox text
     *               file works end to end.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFileWriteReadDelete0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFileWriteReadDelete0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const filePath: string = cacheDir + '/gc_sec_test_write.txt';
      try {
        await FileSecurityUtil.writeTextFile(filePath, SAMPLE_TEXT);
        const existsAfterWrite: boolean = await FileSecurityUtil.fileExists(filePath);
        expect(existsAfterWrite).assertTrue();

        const content: string = await FileSecurityUtil.readTextFile(filePath);
        expect(content).assertEqual(SAMPLE_TEXT);

        const sizeBytes: number = await FileSecurityUtil.getFileSizeBytes(filePath);
        hilog.info(DOMAIN, TAG, '%{public}s', 'file size bytes: ' + sizeBytes);
        expect(sizeBytes).assertEqual(SAMPLE_TEXT_BYTES);

        await FileSecurityUtil.deleteFile(filePath);
        const existsAfterDelete: boolean = await FileSecurityUtil.fileExists(filePath);
        expect(existsAfterDelete).assertFalse();
      } finally {
        await safeDeleteFile(filePath);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_SECURITY_0500
     * @tc.name      testSecurityFileCopyRename0001
     * @tc.desc      Verify copying a sandbox file duplicates its content and size and
     *               renaming moves the copy to the target path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFileCopyRename0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFileCopyRename0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const srcPath: string = cacheDir + '/gc_sec_test_copy_src.txt';
      const dstPath: string = cacheDir + '/gc_sec_test_copy_dst.txt';
      const renamedPath: string = cacheDir + '/gc_sec_test_copy_renamed.txt';
      try {
        await FileSecurityUtil.writeTextFile(srcPath, COPY_TEXT);
        await FileSecurityUtil.copyFile(srcPath, dstPath);
        const srcContent: string = await FileSecurityUtil.readTextFile(srcPath);
        const dstContent: string = await FileSecurityUtil.readTextFile(dstPath);
        expect(dstContent).assertEqual(COPY_TEXT);
        expect(dstContent === srcContent).assertTrue();

        const srcSize: number = await FileSecurityUtil.getFileSizeBytes(srcPath);
        const dstSize: number = await FileSecurityUtil.getFileSizeBytes(dstPath);
        expect(dstSize).assertEqual(srcSize);

        await FileSecurityUtil.renameFile(dstPath, renamedPath);
        const dstExists: boolean = await FileSecurityUtil.fileExists(dstPath);
        const renamedExists: boolean = await FileSecurityUtil.fileExists(renamedPath);
        expect(dstExists).assertFalse();
        expect(renamedExists).assertTrue();
      } finally {
        await safeDeleteFile(srcPath);
        await safeDeleteFile(dstPath);
        await safeDeleteFile(renamedPath);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_SECURITY_0600
     * @tc.name      testSecurityDirOps0001
     * @tc.desc      Verify creating a sandbox directory twice is safe and the directory
     *               listing contains the written entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityDirOps0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityDirOps0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const dirPath: string = cacheDir + '/gc_sec_test_dir';
      const entryPath: string = dirPath + '/one.txt';
      try {
        await FileSecurityUtil.makeDir(dirPath);
        const dirExists: boolean = await FileSecurityUtil.fileExists(dirPath);
        expect(dirExists).assertTrue();

        await FileSecurityUtil.makeDir(dirPath);
        const dirExistsAfterRepeat: boolean = await FileSecurityUtil.fileExists(dirPath);
        expect(dirExistsAfterRepeat).assertTrue();

        await FileSecurityUtil.writeTextFile(entryPath, DIR_ENTRY_TEXT);
        const names: string[] = await FileSecurityUtil.listDirNames(dirPath);
        hilog.info(DOMAIN, TAG, '%{public}s', 'listed entries count: ' + names.length);
        expect(names.length > 0).assertTrue();
        expect(names.indexOf('one.txt') >= 0).assertTrue();
      } finally {
        await safeDeleteFile(entryPath);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
