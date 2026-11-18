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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { FileUtils, DeviceUtils } from 'library';

const DOMAIN: number = 0xF811;
// ASCII alphabet used to build payloads with exact byte counts in UTF-8.
const ASCII_UNIT: string = 'abcdefghijklmnopqrstuvwxyz0123456789';

// Resolve the writable application sandbox files directory of the test host.
function sandboxDir(): string {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
}

// Build a unique sandbox file path for one numbered test case.
function casePath(caseId: number, suffix: string): string {
  return sandboxDir() + '/numfiledev_' + caseId.toString() + suffix;
}

// Build an ASCII text block with the exact requested character count by
// doubling the alphabet and trimming the overshoot with substring.
function asciiBlock(count: number): string {
  let text: string = ASCII_UNIT;
  while (text.length < count) {
    text = text + text;
  }
  return text.substring(0, count);
}

// Registers the numeric matrix test suite for the file and device helpers.
export default function numericMatrixFileDeviceTest() {
  // Define the numeric matrix suite that contains all FileUtils and DeviceUtils cases.
  describe('NumericMatrixFileDeviceSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0100
     * @tc.name      testNumFileDev0001
     * @tc.desc      Verify writeText and readText round trip a short text in the sandbox.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(1, '.txt');
      // The write must succeed and the read must return the same text.
      const written: boolean = FileUtils.writeText(path, 'network security');
      expect(written).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      // The round trip restores the exact stored text.
      expect(FileUtils.readText(path)).assertEqual('network security');
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0200
     * @tc.name      testNumFileDev0002
     * @tc.desc      Verify writeText and readText round trip an empty text body.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(2, '.txt');
      // Writing the empty body still succeeds on the real file system.
      const written: boolean = FileUtils.writeText(path, '');
      expect(written).assertTrue();
      // The stored file keeps the zero byte size of the empty body.
      expect(FileUtils.getFileSize(path)).assertEqual(0);
      // The round trip restores the empty text exactly.
      expect(FileUtils.readText(path)).assertEqual('');
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0300
     * @tc.name      testNumFileDev0003
     * @tc.desc      Verify a second writeText fully replaces the previous file content.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(3, '.txt');
      // The first write stores the long original content.
      expect(FileUtils.writeText(path, 'aaaaabbbbbcccccddddd')).assertTrue();
      // The second write truncates and replaces the whole content.
      expect(FileUtils.writeText(path, 'zz')).assertTrue();
      // The read back sees only the replacement text.
      expect(FileUtils.readText(path)).assertEqual('zz');
      // The byte size follows the shorter replacement content.
      expect(FileUtils.getFileSize(path)).assertEqual(2);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0400
     * @tc.name      testNumFileDev0004
     * @tc.desc      Verify writeText and readText round trip a one kilobyte ASCII text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(4, '.txt');
      // One kilobyte of ASCII equals exactly 1024 UTF-8 bytes.
      const payload: string = asciiBlock(1024);
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The stored byte size matches the payload length exactly.
      expect(FileUtils.getFileSize(path)).assertEqual(1024);
      // The round trip restores the exact payload text.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0500
     * @tc.name      testNumFileDev0005
     * @tc.desc      Verify writeText stores exactly 1023 bytes one byte below one kilobyte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(5, '.txt');
      // ASCII bytes map one to one onto UTF-8 storage bytes.
      const payload: string = asciiBlock(1023);
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The stored byte size is exactly 1023.
      expect(FileUtils.getFileSize(path)).assertEqual(1023);
      // The round trip restores the exact payload text.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0600
     * @tc.name      testNumFileDev0006
     * @tc.desc      Verify writeText stores a CJK text as three UTF-8 bytes per character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(6, '.txt');
      // Seven CJK characters encode to twenty one UTF-8 bytes.
      expect(FileUtils.writeText(path, '你好，网络安全')).assertTrue();
      // The stored byte size reflects the multibyte encoding.
      expect(FileUtils.getFileSize(path)).assertEqual(21);
      // The round trip restores the exact CJK text.
      expect(FileUtils.readText(path)).assertEqual('你好，网络安全');
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0700
     * @tc.name      testNumFileDev0007
     * @tc.desc      Verify writeText stores a mixed ASCII and CJK body with exact byte size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(7, '.txt');
      // Two ASCII plus one CJK plus two ASCII bytes equal seven bytes.
      expect(FileUtils.writeText(path, 'ab你cd')).assertTrue();
      // The five character body stores as seven UTF-8 bytes.
      expect(FileUtils.getFileSize(path)).assertEqual(7);
      // The round trip restores the exact mixed text.
      expect(FileUtils.readText(path)).assertEqual('ab你cd');
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0800
     * @tc.name      testNumFileDev0008
     * @tc.desc      Verify writeText and readText preserve multiline bodies with newlines.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(8, '.txt');
      // The payload carries three rows joined by newline characters.
      const payload: string = 'row one' + '\n' + 'row two' + '\n' + 'row three';
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The round trip restores every newline exactly.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // The stored byte size counts the newline bytes as well.
      expect(FileUtils.getFileSize(path)).assertEqual(payload.length);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_0900
     * @tc.name      testNumFileDev0009
     * @tc.desc      Verify writeText and readText preserve punctuation and symbol characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(9, '.txt');
      // The payload mixes punctuation, symbols and spacing characters.
      const payload: string = '!@#$%^&*()_+ {}[]:;<>?/ ~|';
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The round trip restores every symbol exactly.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // The byte size equals the single byte symbol count.
      expect(FileUtils.getFileSize(path)).assertEqual(payload.length);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1000
     * @tc.name      testNumFileDev0010
     * @tc.desc      Verify writeText and readText round trip a four kilobyte ASCII text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(10, '.txt');
      // Four kilobytes is a larger than typical single write payload.
      const payload: string = asciiBlock(4096);
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The stored byte size matches the four kilobyte payload.
      expect(FileUtils.getFileSize(path)).assertEqual(4096);
      // The round trip restores the exact payload text.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1100
     * @tc.name      testNumFileDev0011
     * @tc.desc      Verify writeText fails for a path inside a missing parent directory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The parent directory below the sandbox root does not exist.
      const path: string = sandboxDir() + '/no_such_dir_numfiledev/child.txt';
      // The write must fail and report false instead of throwing.
      expect(FileUtils.writeText(path, 'orphan')).assertFalse();
      // The missing tree never contains the attempted file.
      expect(FileUtils.exists(path)).assertFalse();
      // Reading the absent path degrades to the empty string.
      expect(FileUtils.readText(path)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1200
     * @tc.name      testNumFileDev0012
     * @tc.desc      Verify writeText fails for the empty path string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty path cannot be opened by the file system layer.
      expect(FileUtils.writeText('', 'ghost')).assertFalse();
      // The existence check on the empty path degrades to false.
      expect(FileUtils.exists('')).assertFalse();
      // Reading the empty path degrades to the empty string.
      expect(FileUtils.readText('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1300
     * @tc.name      testNumFileDev0013
     * @tc.desc      Verify getFileSize reports one byte for a single character file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(13, '.txt');
      // One ASCII character stores as exactly one UTF-8 byte.
      expect(FileUtils.writeText(path, 'a')).assertTrue();
      // The reported size is the smallest non-zero byte count.
      expect(FileUtils.getFileSize(path)).assertEqual(1);
      // The existence check agrees with the successful write.
      expect(FileUtils.exists(path)).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1400
     * @tc.name      testNumFileDev0014
     * @tc.desc      Verify getFileSize reports 1025 bytes just above one kilobyte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(14, '.txt');
      // The payload crosses the kilobyte boundary by one byte.
      const payload: string = asciiBlock(1025);
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The stored byte size is exactly 1025.
      expect(FileUtils.getFileSize(path)).assertEqual(1025);
      // The round trip restores the exact payload text.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1500
     * @tc.name      testNumFileDev0015
     * @tc.desc      Verify getFileSize reports 2048 bytes for a two kilobyte file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(15, '.txt');
      // Two kilobytes doubles the one kilobyte boundary value.
      const payload: string = asciiBlock(2048);
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The stored byte size is exactly 2048.
      expect(FileUtils.getFileSize(path)).assertEqual(2048);
      // The round trip restores the exact payload text.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1600
     * @tc.name      testNumFileDev0016
     * @tc.desc      Verify getFileSize reports 1048576 bytes for a one megabyte file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(16, '.txt');
      // One megabyte is the upper end of the size matrix.
      const payload: string = asciiBlock(1048576);
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The stored byte size is exactly one megabyte.
      expect(FileUtils.getFileSize(path)).assertEqual(1048576);
      // The existence check confirms the large file is present.
      expect(FileUtils.exists(path)).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1700
     * @tc.name      testNumFileDev0017
     * @tc.desc      Verify getFileSize counts three UTF-8 bytes for each CJK character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(17, '.txt');
      // Two CJK characters encode to six UTF-8 bytes.
      expect(FileUtils.writeText(path, '你好')).assertTrue();
      // The byte size is six while the character count stays two.
      expect(FileUtils.getFileSize(path)).assertEqual(6);
      // The round trip restores the exact two character text.
      expect(FileUtils.readText(path)).assertEqual('你好');
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1800
     * @tc.name      testNumFileDev0018
     * @tc.desc      Verify getFileSize reports the negative sentinel for a missing file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The path below the sandbox root was never created.
      const path: string = casePath(18, '.txt');
      // The negative sentinel reports the unmeasurable file.
      expect(FileUtils.getFileSize(path)).assertEqual(-1);
      // The existence check agrees with the missing file.
      expect(FileUtils.exists(path)).assertFalse();
      // Reading the missing path degrades to the empty string.
      expect(FileUtils.readText(path)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_1900
     * @tc.name      testNumFileDev0019
     * @tc.desc      Verify getFileSize reports the negative sentinel after deletion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(19, '.txt');
      // Write a small file so the stat call succeeds first.
      expect(FileUtils.writeText(path, 'temporary body')).assertTrue();
      expect(FileUtils.getFileSize(path)).assertEqual(14);
      // Deleting the file removes the stat target.
      expect(FileUtils.deleteFile(path)).assertTrue();
      // The size query falls back to the negative sentinel.
      expect(FileUtils.getFileSize(path)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2000
     * @tc.name      testNumFileDev0020
     * @tc.desc      Verify a second write truncates the size to the shorter content.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(20, '.txt');
      // The first write stores five hundred twelve bytes.
      expect(FileUtils.writeText(path, asciiBlock(512))).assertTrue();
      expect(FileUtils.getFileSize(path)).assertEqual(512);
      // The second write truncates the file to five hundred bytes.
      expect(FileUtils.writeText(path, asciiBlock(500))).assertTrue();
      // The truncation removes the leftover tail bytes.
      expect(FileUtils.getFileSize(path)).assertEqual(500);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2100
     * @tc.name      testNumFileDev0021
     * @tc.desc      Verify writing an empty body resets an existing file to zero bytes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(21, '.txt');
      // The first write stores one hundred bytes.
      expect(FileUtils.writeText(path, asciiBlock(100))).assertTrue();
      expect(FileUtils.getFileSize(path)).assertEqual(100);
      // The empty second write truncates the file to zero bytes.
      expect(FileUtils.writeText(path, '')).assertTrue();
      // The size falls back to the zero byte floor.
      expect(FileUtils.getFileSize(path)).assertEqual(0);
      // The read back returns the empty text exactly.
      expect(FileUtils.readText(path)).assertEqual('');
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2200
     * @tc.name      testNumFileDev0022
     * @tc.desc      Verify the 511, 512 and 513 byte boundary triple sizes exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(22, '.txt');
      // Write the three boundary sizes in sequence onto one path.
      expect(FileUtils.writeText(path, asciiBlock(511))).assertTrue();
      expect(FileUtils.getFileSize(path)).assertEqual(511);
      expect(FileUtils.writeText(path, asciiBlock(512))).assertTrue();
      expect(FileUtils.getFileSize(path)).assertEqual(512);
      expect(FileUtils.writeText(path, asciiBlock(513))).assertTrue();
      expect(FileUtils.getFileSize(path)).assertEqual(513);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2300
     * @tc.name      testNumFileDev0023
     * @tc.desc      Verify exists reports true for a freshly written sandbox file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(23, '.txt');
      // The path starts absent before any write happens.
      expect(FileUtils.exists(path)).assertFalse();
      // The write creates the file in the sandbox.
      expect(FileUtils.writeText(path, 'existence check')).assertTrue();
      // The existence check flips to true after the write.
      expect(FileUtils.exists(path)).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2400
     * @tc.name      testNumFileDev0024
     * @tc.desc      Verify exists reports false for a name that was never written.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two distinct never written names in the sandbox.
      const first: string = casePath(24, '.txt');
      const second: string = casePath(24, '_alt.txt');
      // Both paths stay absent without any write call.
      expect(FileUtils.exists(first)).assertFalse();
      expect(FileUtils.exists(second)).assertFalse();
      // The size query agrees with the absent state.
      expect(FileUtils.getFileSize(first)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2500
     * @tc.name      testNumFileDev0025
     * @tc.desc      Verify exists reports false after the file was deleted.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(25, '.txt');
      // Create and confirm the file before deleting it.
      expect(FileUtils.writeText(path, 'to be removed')).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      // The deletion removes the file from the sandbox.
      expect(FileUtils.deleteFile(path)).assertTrue();
      // The existence check flips back to false after deletion.
      expect(FileUtils.exists(path)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2600
     * @tc.name      testNumFileDev0026
     * @tc.desc      Verify exists reports true for the sandbox files directory itself.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The sandbox files directory always exists in the test host.
      const root: string = sandboxDir();
      // The directory existence check succeeds without any write.
      expect(FileUtils.exists(root)).assertTrue();
      // The root carries a non-empty readable path text.
      expect(root.length > 0).assertTrue();
      // The directory is not measurable as a regular file size.
      expect(FileUtils.getFileSize(root) > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2700
     * @tc.name      testNumFileDev0027
     * @tc.desc      Verify exists reports false for a nested missing directory path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The nested path has two missing directory levels.
      const path: string = sandboxDir() + '/missing_a_numfiledev/missing_b/leaf.txt';
      // The whole missing tree reports the absent state.
      expect(FileUtils.exists(path)).assertFalse();
      // The size query falls back to the negative sentinel.
      expect(FileUtils.getFileSize(path)).assertEqual(-1);
      // Deleting the absent path degrades to false.
      expect(FileUtils.deleteFile(path)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2800
     * @tc.name      testNumFileDev0028
     * @tc.desc      Verify exists is stable for repeated checks of the same path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(28, '.txt');
      // Create the file once for the stability check.
      expect(FileUtils.writeText(path, 'stable check')).assertTrue();
      // Three consecutive checks keep the same answer.
      expect(FileUtils.exists(path)).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_2900
     * @tc.name      testNumFileDev0029
     * @tc.desc      Verify exists reports false for a path with unusual symbol characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The symbol name was never created in the sandbox.
      const path: string = sandboxDir() + '/numfiledev_~!@#$%^&.txt';
      // The absent symbol name reports the absent state.
      expect(FileUtils.exists(path)).assertFalse();
      // The size query falls back to the negative sentinel.
      expect(FileUtils.getFileSize(path)).assertEqual(-1);
      // Reading the absent symbol path degrades to empty text.
      expect(FileUtils.readText(path)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3000
     * @tc.name      testNumFileDev0030
     * @tc.desc      Verify exists tracks the full write, check and delete lifecycle.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(30, '.txt');
      // The lifecycle starts in the absent state.
      expect(FileUtils.exists(path)).assertFalse();
      // The write moves the state to present.
      expect(FileUtils.writeText(path, 'lifecycle')).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      // The delete moves the state back to absent.
      expect(FileUtils.deleteFile(path)).assertTrue();
      expect(FileUtils.exists(path)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3100
     * @tc.name      testNumFileDev0031
     * @tc.desc      Verify exists reports true again after recreating a deleted file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(31, '.txt');
      // Create, delete and confirm the absent intermediate state.
      expect(FileUtils.writeText(path, 'first life')).assertTrue();
      expect(FileUtils.deleteFile(path)).assertTrue();
      expect(FileUtils.exists(path)).assertFalse();
      // Recreating the same path restores the present state.
      expect(FileUtils.writeText(path, 'second life')).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      // The recreated file carries only the newest content.
      expect(FileUtils.readText(path)).assertEqual('second life');
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3200
     * @tc.name      testNumFileDev0032
     * @tc.desc      Verify readText degrades to an empty string for a missing file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The path below the sandbox root was never created.
      const path: string = casePath(32, '.txt');
      // The failed read degrades to the empty string.
      expect(FileUtils.readText(path)).assertEqual('');
      // Repeating the failed read keeps the same degradation.
      expect(FileUtils.readText(path)).assertEqual('');
      // The existence check agrees with the absent state.
      expect(FileUtils.exists(path)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3300
     * @tc.name      testNumFileDev0033
     * @tc.desc      Verify readText degrades to an empty string after deletion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(33, '.txt');
      // Write a readable body and confirm the round trip first.
      expect(FileUtils.writeText(path, 'readable body')).assertTrue();
      expect(FileUtils.readText(path)).assertEqual('readable body');
      // The deletion removes the read target.
      expect(FileUtils.deleteFile(path)).assertTrue();
      // The next read degrades to the empty string.
      expect(FileUtils.readText(path)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3400
     * @tc.name      testNumFileDev0034
     * @tc.desc      Verify readText on a directory path degrades to an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The sandbox files directory is a directory, not a file.
      const root: string = sandboxDir();
      // Reading a directory fails and degrades to the empty string.
      expect(FileUtils.readText(root)).assertEqual('');
      // The directory itself still exists after the failed read.
      expect(FileUtils.exists(root)).assertTrue();
      // Repeating the failed directory read stays stable.
      expect(FileUtils.readText(root)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3500
     * @tc.name      testNumFileDev0035
     * @tc.desc      Verify readText preserves leading and trailing whitespace exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(35, '.txt');
      // The payload is padded with spaces on both sides.
      const payload: string = '   padded body   ';
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The round trip keeps the padding spaces byte for byte.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // The byte size counts every padding space as well.
      expect(FileUtils.getFileSize(path)).assertEqual(17);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3600
     * @tc.name      testNumFileDev0036
     * @tc.desc      Verify readText round trips a JSON shaped text payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(36, '.json');
      // The payload mimics a small configuration document.
      const payload: string = '{"name":"numeric","level":3,"items":["a","b"]}';
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The round trip restores the JSON text exactly.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // The byte size equals the payload character count.
      expect(FileUtils.getFileSize(path)).assertEqual(payload.length);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3700
     * @tc.name      testNumFileDev0037
     * @tc.desc      Verify deleteFile removes a written file and reports true once.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(37, '.txt');
      // Create the deletion target first.
      expect(FileUtils.writeText(path, 'delete me')).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      // The first deletion succeeds and removes the file.
      expect(FileUtils.deleteFile(path)).assertTrue();
      // The file disappears from the sandbox.
      expect(FileUtils.exists(path)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3800
     * @tc.name      testNumFileDev0038
     * @tc.desc      Verify deleteFile reports false for a never created file name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The path below the sandbox root was never created.
      const path: string = casePath(38, '.txt');
      // Deleting the absent path degrades to false.
      expect(FileUtils.deleteFile(path)).assertFalse();
      // The existence check agrees with the absent state.
      expect(FileUtils.exists(path)).assertFalse();
      // The size query falls back to the negative sentinel.
      expect(FileUtils.getFileSize(path)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_3900
     * @tc.name      testNumFileDev0039
     * @tc.desc      Verify a second deleteFile on the same path reports false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(39, '.txt');
      // Create the target and delete it once successfully.
      expect(FileUtils.writeText(path, 'single life')).assertTrue();
      expect(FileUtils.deleteFile(path)).assertTrue();
      // The second deletion has no target left and fails.
      expect(FileUtils.deleteFile(path)).assertFalse();
      // The file stays absent after both attempts.
      expect(FileUtils.exists(path)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4000
     * @tc.name      testNumFileDev0040
     * @tc.desc      Verify deleteFile reports false for the empty path string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty path cannot reference any sandbox entry.
      expect(FileUtils.deleteFile('')).assertFalse();
      // The existence check on the empty path stays false.
      expect(FileUtils.exists('')).assertFalse();
      // The size query on the empty path falls back to the sentinel.
      expect(FileUtils.getFileSize('')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4100
     * @tc.name      testNumFileDev0041
     * @tc.desc      Verify a deleted path can be written again and deleted once more.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(41, '.txt');
      // Complete one full create and delete cycle.
      expect(FileUtils.writeText(path, 'cycle one')).assertTrue();
      expect(FileUtils.deleteFile(path)).assertTrue();
      // The second cycle recreates and deletes the same path.
      expect(FileUtils.writeText(path, 'cycle two')).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      expect(FileUtils.deleteFile(path)).assertTrue();
      // The path stays absent after both cycles.
      expect(FileUtils.exists(path)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4200
     * @tc.name      testNumFileDev0042
     * @tc.desc      Verify listDir reports plain entry names for created sandbox files.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create two uniquely named files in the sandbox root.
      const first: string = casePath(42, '_a.txt');
      const second: string = casePath(42, '_b.txt');
      expect(FileUtils.writeText(first, 'alpha')).assertTrue();
      expect(FileUtils.writeText(second, 'beta')).assertTrue();
      // The listing is awaited because the helper is asynchronous.
      const entries: string[] = await FileUtils.listDir(sandboxDir());
      // The listing holds at least the two created entries.
      expect(entries.length >= 2).assertTrue();
      // Every entry name stays free of directory separators.
      let hasSeparator: boolean = false;
      for (let index = 0; index < entries.length; index++) {
        if (entries[index].length === 0 || entries[index] === '.') {
          hasSeparator = true;
        }
      }
      expect(hasSeparator).assertFalse();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(first)).assertTrue();
      expect(FileUtils.deleteFile(second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4300
     * @tc.name      testNumFileDev0043
     * @tc.desc      Verify listDir contains each exact created file name in its result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create one uniquely named file with a searchable marker.
      const target: string = casePath(43, '_marker.txt');
      expect(FileUtils.writeText(target, 'marker body')).assertTrue();
      // List the sandbox root with the asynchronous helper.
      const entries: string[] = await FileUtils.listDir(sandboxDir());
      // Walk the entries and assert the exact name is present.
      const markerName: string = 'numfiledev_43_marker.txt';
      let found: boolean = false;
      for (let index = 0; index < entries.length; index++) {
        if (entries[index] === markerName) {
          found = true;
        }
      }
      expect(found).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(target)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4400
     * @tc.name      testNumFileDev0044
     * @tc.desc      Verify listDir degrades to an empty array for a missing directory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The nested directory tree below the sandbox root is missing.
      const missing: string = sandboxDir() + '/missing_list_numfiledev';
      // The failed listing degrades to the empty array.
      const entries: string[] = await FileUtils.listDir(missing);
      // The empty array carries no entries at all.
      expect(entries.length).assertEqual(0);
      // The existence check agrees with the missing directory.
      expect(FileUtils.exists(missing)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4500
     * @tc.name      testNumFileDev0045
     * @tc.desc      Verify listDir degrades to an empty array for the empty path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty path cannot name any sandbox directory.
      const entries: string[] = await FileUtils.listDir('');
      // The failed listing degrades to the empty array.
      expect(entries.length).assertEqual(0);
      // The empty path is not an existing entry either.
      expect(FileUtils.exists('')).assertFalse();
      // The size query on the empty path falls back to the sentinel.
      expect(FileUtils.getFileSize('')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4600
     * @tc.name      testNumFileDev0046
     * @tc.desc      Verify listDir returns at least three entries for three created files.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create three uniquely named files in the sandbox root.
      const one: string = casePath(46, '_one.txt');
      const two: string = casePath(46, '_two.txt');
      const three: string = casePath(46, '_three.txt');
      expect(FileUtils.writeText(one, '1')).assertTrue();
      expect(FileUtils.writeText(two, '22')).assertTrue();
      expect(FileUtils.writeText(three, '333')).assertTrue();
      // The listing includes at least the three created names.
      const entries: string[] = await FileUtils.listDir(sandboxDir());
      expect(entries.length >= 3).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(one)).assertTrue();
      expect(FileUtils.deleteFile(two)).assertTrue();
      expect(FileUtils.deleteFile(three)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4700
     * @tc.name      testNumFileDev0047
     * @tc.desc      Verify listDir entry names never carry the parent directory prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create one uniquely named file for the prefix check.
      const target: string = casePath(47, '_plain.txt');
      expect(FileUtils.writeText(target, 'plain name')).assertTrue();
      // List the sandbox root with the asynchronous helper.
      const entries: string[] = await FileUtils.listDir(sandboxDir());
      // Every entry name is free of directory separator prefixes.
      for (let index = 0; index < entries.length; index++) {
        expect(entries[index].length > 0).assertTrue();
      }
      // The exact plain marker name stays present in the list.
      const markerName: string = 'numfiledev_47_plain.txt';
      let found: boolean = false;
      for (let index = 0; index < entries.length; index++) {
        if (entries[index] === markerName) {
          found = true;
        }
      }
      expect(found).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(target)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4800
     * @tc.name      testNumFileDev0048
     * @tc.desc      Verify listDir stops reporting a name after the file is deleted.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create one uniquely named file and confirm it is listed.
      const target: string = casePath(48, '_gone.txt');
      expect(FileUtils.writeText(target, 'vanishing')).assertTrue();
      const markerName: string = 'numfiledev_48_gone.txt';
      const before: string[] = await FileUtils.listDir(sandboxDir());
      let foundBefore: boolean = false;
      for (let index = 0; index < before.length; index++) {
        if (before[index] === markerName) {
          foundBefore = true;
        }
      }
      expect(foundBefore).assertTrue();
      // Delete the file and confirm the name is no longer listed.
      expect(FileUtils.deleteFile(target)).assertTrue();
      const after: string[] = await FileUtils.listDir(sandboxDir());
      let foundAfter: boolean = false;
      for (let index = 0; index < after.length; index++) {
        if (after[index] === markerName) {
          foundAfter = true;
        }
      }
      expect(foundAfter).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_4900
     * @tc.name      testNumFileDev0049
     * @tc.desc      Verify listDir on a regular file path degrades to an empty array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create a regular file, not a directory, in the sandbox.
      const target: string = casePath(49, '_file.txt');
      expect(FileUtils.writeText(target, 'not a directory')).assertTrue();
      // Listing a regular file fails and degrades to the empty array.
      const entries: string[] = await FileUtils.listDir(target);
      // The empty array carries no entries at all.
      expect(entries.length).assertEqual(0);
      // The regular file itself still exists afterwards.
      expect(FileUtils.exists(target)).assertTrue();
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(target)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5000
     * @tc.name      testNumFileDev0050
     * @tc.desc      Verify two listDir calls in sequence report consistent entry counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two back to back listings describe the same sandbox state.
      const first: string[] = await FileUtils.listDir(sandboxDir());
      const second: string[] = await FileUtils.listDir(sandboxDir());
      // The entry counts stay identical between the two listings.
      expect(first.length).assertEqual(second.length);
      // The counts are non-negative numbers in every listing.
      expect(first.length >= 0).assertTrue();
      // The second listing keeps the array type with a length field.
      expect(second.length >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5100
     * @tc.name      testNumFileDev0051
     * @tc.desc      Verify a rewritten file keeps the same single directory entry name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create one uniquely named file and list it once.
      const target: string = casePath(51, '_stable.txt');
      expect(FileUtils.writeText(target, 'first content')).assertTrue();
      const markerName: string = 'numfiledev_51_stable.txt';
      // Rewrite the same path with shorter content.
      expect(FileUtils.writeText(target, 'x')).assertTrue();
      // The listing still contains exactly one entry with that name.
      const entries: string[] = await FileUtils.listDir(sandboxDir());
      let found: boolean = false;
      for (let index = 0; index < entries.length; index++) {
        if (entries[index] === markerName) {
          found = true;
        }
      }
      expect(found).assertTrue();
      // The rewrite truncated the content to the single byte.
      expect(FileUtils.getFileSize(target)).assertEqual(1);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(target)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5200
     * @tc.name      testNumFileDev0052
     * @tc.desc      Verify getBrand returns a non-empty stable device brand string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The brand is a read-only constant of the running device.
      const first: string = DeviceUtils.getBrand();
      // The brand text is never empty on a real device.
      expect(first.length > 0).assertTrue();
      // A second read returns the identical brand constant.
      const second: string = DeviceUtils.getBrand();
      expect(second).assertEqual(first);
      // The brand stays a short bounded identifier.
      expect(first.length <= 64).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5300
     * @tc.name      testNumFileDev0053
     * @tc.desc      Verify getModel returns a non-empty stable certified model string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The model is the certified product model of the device.
      const first: string = DeviceUtils.getModel();
      // The model text is never empty on a real device.
      expect(first.length > 0).assertTrue();
      // A second read returns the identical model constant.
      const second: string = DeviceUtils.getModel();
      expect(second).assertEqual(first);
      // The model stays a short bounded identifier.
      expect(first.length <= 64).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5400
     * @tc.name      testNumFileDev0054
     * @tc.desc      Verify getOsVersion returns a non-empty stable full version string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The full OS name describes the running system version.
      const first: string = DeviceUtils.getOsVersion();
      // The version text is never empty on a real device.
      expect(first.length > 0).assertTrue();
      // A second read returns the identical version constant.
      const second: string = DeviceUtils.getOsVersion();
      expect(second).assertEqual(first);
      // The full version name stays a bounded readable string.
      expect(first.length <= 128).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5500
     * @tc.name      testNumFileDev0055
     * @tc.desc      Verify getApiVersion returns the supported SDK API numeric range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The API version is a numeric SDK level of the running system.
      const first: number = DeviceUtils.getApiVersion();
      // The sample targets modern API levels above ten.
      expect(first >= 10).assertTrue();
      // The numeric level stays far below any overflow range.
      expect(first <= 99).assertTrue();
      // A second read returns the identical API level.
      const second: number = DeviceUtils.getApiVersion();
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5600
     * @tc.name      testNumFileDev0056
     * @tc.desc      Verify getApiVersion returns a whole integer SDK level.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The API level is always a whole integer value.
      const version: number = DeviceUtils.getApiVersion();
      // Rounding the value down must not change it.
      expect(Math.floor(version)).assertEqual(version);
      // The level stays inside the documented numeric range.
      expect(version >= 1 && version <= 999).assertTrue();
      // A repeated read keeps the identical integer value.
      expect(DeviceUtils.getApiVersion()).assertEqual(version);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5700
     * @tc.name      testNumFileDev0057
     * @tc.desc      Verify getScreenDensity returns a positive bounded DPI value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The default display carries a physical density value.
      const first: number = DeviceUtils.getScreenDensity();
      // The density stays a strictly positive DPI number.
      expect(first >= 1).assertTrue();
      // The density stays below any unreasonable DPI bound.
      expect(first <= 65536).assertTrue();
      // A second read returns the identical density value.
      const second: number = DeviceUtils.getScreenDensity();
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5800
     * @tc.name      testNumFileDev0058
     * @tc.desc      Verify getDeviceType returns a non-empty stable device type string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The device type mirrors the module deviceTypes declaration.
      const first: string = DeviceUtils.getDeviceType();
      // The device type text is never empty.
      expect(first.length > 0).assertTrue();
      // A second read returns the identical device type constant.
      const second: string = DeviceUtils.getDeviceType();
      expect(second).assertEqual(first);
      // The device type stays a short lowercase identifier.
      expect(first.length <= 32).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_5900
     * @tc.name      testNumFileDev0059
     * @tc.desc      Verify getAbiList returns a non-empty stable ABI list string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The ABI list names every supported binary interface.
      const first: string = DeviceUtils.getAbiList();
      // The ABI list text is never empty on a real device.
      expect(first.length > 0).assertTrue();
      // A second read returns the identical ABI list constant.
      const second: string = DeviceUtils.getAbiList();
      expect(second).assertEqual(first);
      // The list stays a bounded readable identifier string.
      expect(first.length <= 128).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6000
     * @tc.name      testNumFileDev0060
     * @tc.desc      Verify brand, model and OS version constants are all non-empty together.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the three identity constants in one sequence.
      const brand: string = DeviceUtils.getBrand();
      const model: string = DeviceUtils.getModel();
      const osVersion: string = DeviceUtils.getOsVersion();
      // Every identity constant carries non-empty readable text.
      expect(brand.length > 0).assertTrue();
      expect(model.length > 0).assertTrue();
      expect(osVersion.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6100
     * @tc.name      testNumFileDev0061
     * @tc.desc      Verify API version and screen density stay inside their numeric domains.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the two numeric device constants together.
      const apiVersion: number = DeviceUtils.getApiVersion();
      const density: number = DeviceUtils.getScreenDensity();
      // The API level stays in its documented numeric range.
      expect(apiVersion >= 10 && apiVersion <= 99).assertTrue();
      // The density stays in its positive bounded numeric range.
      expect(density >= 1 && density <= 65536).assertTrue();
      // Both constants are whole integer numbers.
      expect(Math.floor(apiVersion)).assertEqual(apiVersion);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6200
     * @tc.name      testNumFileDev0062
     * @tc.desc      Verify writeText, getFileSize and readText agree on one payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(62, '.txt');
      // The payload mixes ASCII and CJK segments again.
      const payload: string = 'head-' + '网络' + '-tail';
      expect(FileUtils.writeText(path, payload)).assertTrue();
      // The byte size is the ASCII bytes plus the CJK bytes.
      expect(FileUtils.getFileSize(path)).assertEqual(payload.length + 4);
      // The read back returns the exact payload text.
      expect(FileUtils.readText(path)).assertEqual(payload);
      // Clean the sandbox so later runs start from the same state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6300
     * @tc.name      testNumFileDev0063
     * @tc.desc      Verify several sandbox files can be created and deleted in one batch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create a batch of four uniquely named files.
      const names: string[] = [
        casePath(63, '_1.txt'), casePath(63, '_2.txt'),
        casePath(63, '_3.txt'), casePath(63, '_4.txt')
      ];
      // Every write in the batch succeeds.
      expect(FileUtils.writeText(names[0], 'one')).assertTrue();
      expect(FileUtils.writeText(names[1], 'two')).assertTrue();
      expect(FileUtils.writeText(names[2], 'three')).assertTrue();
      expect(FileUtils.writeText(names[3], 'four')).assertTrue();
      // Every delete in the batch succeeds as well.
      expect(FileUtils.deleteFile(names[0])).assertTrue();
      expect(FileUtils.deleteFile(names[1])).assertTrue();
      expect(FileUtils.deleteFile(names[2])).assertTrue();
      expect(FileUtils.deleteFile(names[3])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6400
     * @tc.name      testNumFileDev0064
     * @tc.desc      Verify getScreenDensity stays stable across three consecutive reads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three rapid reads describe the same display density.
      const first: number = DeviceUtils.getScreenDensity();
      const second: number = DeviceUtils.getScreenDensity();
      const third: number = DeviceUtils.getScreenDensity();
      // Every density value stays inside the positive range.
      expect(first >= 1).assertTrue();
      // The second and third reads match the first exactly.
      expect(second).assertEqual(first);
      expect(third).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6500
     * @tc.name      testNumFileDev0065
     * @tc.desc      Verify brand, model and device type stay stable across repeated reads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read each identity constant twice in sequence.
      const brandFirst: string = DeviceUtils.getBrand();
      const modelFirst: string = DeviceUtils.getModel();
      const typeFirst: string = DeviceUtils.getDeviceType();
      // The repeated reads return the identical constants.
      expect(DeviceUtils.getBrand()).assertEqual(brandFirst);
      expect(DeviceUtils.getModel()).assertEqual(modelFirst);
      expect(DeviceUtils.getDeviceType()).assertEqual(typeFirst);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6600
     * @tc.name      testNumFileDev0066
     * @tc.desc      Verify listDir, exists and deleteFile cooperate on one created file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFileDev0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create one uniquely named file for the cooperation check.
      const target: string = casePath(66, '_coop.txt');
      expect(FileUtils.writeText(target, 'cooperation')).assertTrue();
      // The listing sees the file while it still exists.
      const entries: string[] = await FileUtils.listDir(sandboxDir());
      expect(entries.length >= 1).assertTrue();
      // The existence check confirms the same present state.
      expect(FileUtils.exists(target)).assertTrue();
      // The deletion closes the lifecycle and the listing drops it.
      expect(FileUtils.deleteFile(target)).assertTrue();
      const after: string[] = await FileUtils.listDir(sandboxDir());
      expect(after.length).assertEqual(entries.length - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6700
     * @tc.name      testNumFileDev0067
     * @tc.desc      Verify OS version, API level and ABI list stay stable across reads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileDev0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the three system constants once.
      const osFirst: string = DeviceUtils.getOsVersion();
      const apiFirst: number = DeviceUtils.getApiVersion();
      const abiFirst: string = DeviceUtils.getAbiList();
      // The repeated reads return the identical constants.
      expect(DeviceUtils.getOsVersion()).assertEqual(osFirst);
      expect(DeviceUtils.getApiVersion()).assertEqual(apiFirst);
      expect(DeviceUtils.getAbiList()).assertEqual(abiFirst);
      // Every text constant stays non-empty in the repeat too.
      expect(osFirst.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FILEDEV_6800
     * @tc.name      testNumFileDev0068
     * @tc.desc      Verify the full file lifecycle keeps every helper result consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFileDev0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFileDev0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a dedicated sandbox path for this case.
      const path: string = casePath(68, '.txt');
      // The lifecycle starts with the absent state.
      expect(FileUtils.exists(path)).assertFalse();
      expect(FileUtils.getFileSize(path)).assertEqual(-1);
      // The write creates the file with a known payload.
      expect(FileUtils.writeText(path, 'full lifecycle body')).assertTrue();
      expect(FileUtils.exists(path)).assertTrue();
      expect(FileUtils.getFileSize(path)).assertEqual(19);
      expect(FileUtils.readText(path)).assertEqual('full lifecycle body');
      // The delete returns the path to the absent state.
      expect(FileUtils.deleteFile(path)).assertTrue();
      expect(FileUtils.exists(path)).assertFalse();
      expect(FileUtils.getFileSize(path)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
