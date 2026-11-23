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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import resourceManager from '@ohos.resourceManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';

const DOMAIN: number = 0xF812;
const TAG: string = 'NdkRawfileContentCoreTest';
const FULL_TEXT: string = 'rawfile1 content';
const FULL_SIZE: number = 16;
const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const utf8Encoder: util.TextEncoder = util.TextEncoder.create('utf-8');
const utf8Decoder: util.TextDecoder = util.TextDecoder.create('utf-8');

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function createEntryResMgr(): resourceManager.ResourceManager {
  const appContext: common.Context = delegator.getAppContext();
  const moduleContext: common.Context = appContext.createModuleContext('entry');
  return moduleContext.resourceManager;
}

function utf8Bytes(text: string): Uint8Array {
  return utf8Encoder.encodeInto(text);
}

function bytesEqual(left: Uint8Array, right: Uint8Array): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let i: number = 0; i < left.length; i++) {
    if (left[i] !== right[i]) {
      return false;
    }
  }
  return true;
}

function bytesRangeEqual(source: Uint8Array, expected: Uint8Array, start: number): boolean {
  if (start + expected.length > source.length) {
    return false;
  }
  for (let i: number = 0; i < expected.length; i++) {
    if (source[start + i] !== expected[i]) {
      return false;
    }
  }
  return true;
}

function isZeroRange(source: Uint8Array, start: number, end: number): boolean {
  for (let i: number = start; i < end; i++) {
    if (source[i] !== 0) {
      return false;
    }
  }
  return true;
}

export default function ndkRawfileContentCoreTest(): void {
  describe('NdkRawfileContentCoreTest', () => {
    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0101
     * @tc.name      testRawfileContent0101
     * @tc.desc      Verify full read of rawfile.txt returns sixteen bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0101 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.byteLength=${bytes.byteLength}, expected=FULL_SIZE`);
      expect(bytes.byteLength).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytes instanceof Uint8Array=${bytes instanceof Uint8Array}`);
      expect(bytes instanceof Uint8Array).assertTrue();
      log('testRawfileContent0101 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0102
     * @tc.name      testRawfileContent0102
     * @tc.desc      Verify full read bytes match the packaged rawfile.txt content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0102 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.byteLength=${bytes.byteLength}, expected=FULL_SIZE`);
      expect(bytes.byteLength).assertEqual(FULL_SIZE);
      log('testRawfileContent0102 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0103
     * @tc.name      testRawfileContent0103
     * @tc.desc      Verify full read decodes to the exact rawfile.txt text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0103 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      const text: string = utf8Decoder.decodeToString(bytes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=FULL_TEXT`);
      expect(text).assertEqual(FULL_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text.length=${text.length}, expected=FULL_SIZE`);
      expect(text.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      log('testRawfileContent0103 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0104
     * @tc.name      testRawfileContent0104
     * @tc.desc      Verify the first and last bytes of the full read are r and t.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0104 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=114`);
      expect(bytes[0]).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[FULL_SIZE - 1]=${bytes[FULL_SIZE - 1]}, expected=116`);
      expect(bytes[FULL_SIZE - 1]).assertEqual(116);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0104 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0105
     * @tc.name      testRawfileContent0105
     * @tc.desc      Verify the full read result is a self-consistent Uint8Array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0105 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytes instanceof Uint8Array=${bytes instanceof Uint8Array}`);
      expect(bytes instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=bytes.byteLength`);
      expect(bytes.length).assertEqual(bytes.byteLength);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof bytes=${typeof bytes}, expected='object'`);
      expect(typeof bytes).assertEqual('object');
      log('testRawfileContent0105 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0106
     * @tc.name      testRawfileContent0106
     * @tc.desc      Verify repeated full reads return identical bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0106 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const first: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      const second: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(first, second)=${bytesEqual(first, second)}`);
      expect(bytesEqual(first, second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=FULL_SIZE`);
      expect(first.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.length=${second.length}, expected=FULL_SIZE`);
      expect(second.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0106 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0107
     * @tc.name      testRawfileContent0107
     * @tc.desc      Verify full reads from a fresh resource manager stay identical.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0107 begin');
      const first: Uint8Array = testNapi.getRawFileContent(createEntryResMgr(), 'rawfile.txt');
      const second: Uint8Array = testNapi.getRawFileContent(createEntryResMgr(), 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(first, second)=${bytesEqual(first, second)}`);
      expect(bytesEqual(first, second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=FULL_SIZE`);
      expect(first.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.length=${second.length}, expected=FULL_SIZE`);
      expect(second.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0107 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0108
     * @tc.name      testRawfileContent0108
     * @tc.desc      Verify the native full read matches the ArkTS sync read bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0108 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      const syncBytes: Uint8Array = resMgr.getRawFileContentSync('rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(bytes, syncBytes)=${bytesEqual(bytes, syncBytes)}`);
      expect(bytesEqual(bytes, syncBytes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual syncBytes.byteLength=${syncBytes.byteLength}`);
      expect(syncBytes.byteLength).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0108 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0109
     * @tc.name      testRawfileContent0109
     * @tc.desc      Verify offset zero reads back the complete file content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0109 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${utf8Decoder.decodeToString(bytes)}`);
      expect(utf8Decoder.decodeToString(bytes)).assertEqual(FULL_TEXT);
      log('testRawfileContent0109 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0110
     * @tc.name      testRawfileContent0110
     * @tc.desc      Verify offset one keeps the tail content and zero pads the end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0110 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesRangeEqual(bytes, utf8Bytes('awfile1 content'), 0)`);
      expect(bytesRangeEqual(bytes, utf8Bytes('awfile1 content'), 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, FULL_SIZE - 1, FULL_SIZE)}`);
      expect(isZeroRange(bytes, FULL_SIZE - 1, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0110 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0111
     * @tc.name      testRawfileContent0111
     * @tc.desc      Verify offset three keeps the file1 content prefix bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0111 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesRangeEqual(bytes, utf8Bytes('file1 content'), 0)`);
      expect(bytesRangeEqual(bytes, utf8Bytes('file1 content'), 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=102`);
      expect(bytes[0]).assertEqual(102);
      log('testRawfileContent0111 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0112
     * @tc.name      testRawfileContent0112
     * @tc.desc      Verify offset three zero pads the last three bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0112 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, FULL_SIZE - 3, FULL_SIZE)}`);
      expect(isZeroRange(bytes, FULL_SIZE - 3, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[FULL_SIZE - 4]=${bytes[FULL_SIZE - 4]}, expected=116`);
      expect(bytes[FULL_SIZE - 4]).assertEqual(116);
      log('testRawfileContent0112 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0113
     * @tc.name      testRawfileContent0113
     * @tc.desc      Verify offset three decoding starts with the shifted text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0113 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 3);
      const text: string = utf8Decoder.decodeToString(bytes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith('file1 content')}`);
      expect(text.startsWith('file1 content')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text.length=${text.length}, expected=FULL_SIZE`);
      expect(text.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      log('testRawfileContent0113 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0114
     * @tc.name      testRawfileContent0114
     * @tc.desc      Verify offset eight keeps the shifted tail and zero pads the rest.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0114 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesRangeEqual(bytes, utf8Bytes(' content'), 0)}`);
      expect(bytesRangeEqual(bytes, utf8Bytes(' content'), 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, 8, FULL_SIZE)}`);
      expect(isZeroRange(bytes, 8, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0114 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0115
     * @tc.name      testRawfileContent0115
     * @tc.desc      Verify offset fifteen exposes the final byte then zero padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0115 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=116`);
      expect(bytes[0]).assertEqual(116);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, 1, FULL_SIZE)}`);
      expect(isZeroRange(bytes, 1, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0115 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0116
     * @tc.name      testRawfileContent0116
     * @tc.desc      Verify reading at the file size boundary yields all zero bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0116 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, 0, FULL_SIZE)}`);
      expect(isZeroRange(bytes, 0, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytes instanceof Uint8Array=${bytes instanceof Uint8Array}`);
      expect(bytes instanceof Uint8Array).assertTrue();
      log('testRawfileContent0116 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0117
     * @tc.name      testRawfileContent0117
     * @tc.desc      Verify an offset beyond the file size falls back to full content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0117 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', FULL_SIZE + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${utf8Decoder.decodeToString(bytes)}`);
      expect(utf8Decoder.decodeToString(bytes)).assertEqual(FULL_TEXT);
      log('testRawfileContent0117 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0118
     * @tc.name      testRawfileContent0118
     * @tc.desc      Verify offset zero with exact length reads back the full content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0118 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 0, FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytes instanceof Uint8Array=${bytes instanceof Uint8Array}`);
      expect(bytes instanceof Uint8Array).assertTrue();
      log('testRawfileContent0118 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0119
     * @tc.name      testRawfileContent0119
     * @tc.desc      Verify a length beyond the file size falls back to full content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0119 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 0, FULL_SIZE + 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${utf8Decoder.decodeToString(bytes)}`);
      expect(utf8Decoder.decodeToString(bytes)).assertEqual(FULL_TEXT);
      log('testRawfileContent0119 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0120
     * @tc.name      testRawfileContent0120
     * @tc.desc      Verify the nested rawfile2 read length matches the ArkTS sync read.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0120 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'subrawfile/rawfile2.txt');
      const syncBytes: Uint8Array = resMgr.getRawFileContentSync('subrawfile/rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=syncBytes.byteLength`);
      expect(bytes.length).assertEqual(syncBytes.byteLength);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger bytes.length=${bytes.length}, expected=0`);
      expect(bytes.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.byteLength=${bytes.byteLength}`);
      expect(bytes.byteLength).assertEqual(syncBytes.byteLength);
      log('testRawfileContent0120 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0121
     * @tc.name      testRawfileContent0121
     * @tc.desc      Verify the nested rawfile2 native read matches the sync read bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0121 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'subrawfile/rawfile2.txt');
      const syncBytes: Uint8Array = resMgr.getRawFileContentSync('subrawfile/rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(bytes, syncBytes)=${bytesEqual(bytes, syncBytes)}`);
      expect(bytesEqual(bytes, syncBytes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger bytes.length=${bytes.length}, expected=0`);
      expect(bytes.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=115`);
      expect(bytes[0]).assertEqual(115);
      log('testRawfileContent0121 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0122
     * @tc.name      testRawfileContent0122
     * @tc.desc      Verify nested rawfile2 offset four keeps the rawfile content prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0122 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const full: Uint8Array = testNapi.getRawFileContent(resMgr, 'subrawfile/rawfile2.txt');
      const shifted: Uint8Array = testNapi.getRawFileContent(resMgr, 'subrawfile/rawfile2.txt', 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesRangeEqual(shifted, utf8Bytes('rawfile content'), 0)`);
      expect(bytesRangeEqual(shifted, utf8Bytes('rawfile content'), 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(shifted, 15, shifted.length)}`);
      expect(isZeroRange(shifted, 15, shifted.length)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual shifted.length=${shifted.length}, expected=full.length`);
      expect(shifted.length).assertEqual(full.length);
      log('testRawfileContent0122 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0123
     * @tc.name      testRawfileContent0123
     * @tc.desc      Verify repeated nested reads return identical bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0123 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const first: Uint8Array = testNapi.getRawFileContent(resMgr, 'subrawfile/rawfile2.txt');
      const second: Uint8Array = testNapi.getRawFileContent(resMgr, 'subrawfile/rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(first, second)=${bytesEqual(first, second)}`);
      expect(bytesEqual(first, second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger first.length=${first.length}, expected=0`);
      expect(first.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first[0]=${first[0]}, expected=115`);
      expect(first[0]).assertEqual(115);
      log('testRawfileContent0123 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0124
     * @tc.name      testRawfileContent0124
     * @tc.desc      Verify every rawfile.txt read keeps the full buffer size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0124 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const atStart: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 0);
      const atEnd: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', FULL_SIZE);
      const beyond: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', FULL_SIZE + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual atStart.length=${atStart.length}, expected=FULL_SIZE`);
      expect(atStart.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual atEnd.length=${atEnd.length}, expected=FULL_SIZE`);
      expect(atEnd.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual beyond.length=${beyond.length}, expected=FULL_SIZE`);
      expect(beyond.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0124 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0125
     * @tc.name      testRawfileContent0125
     * @tc.desc      Verify offset two keeps the shifted tail and zero pads the end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0125 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesRangeEqual(bytes, utf8Bytes('wfile1 content'), 0)`);
      expect(bytesRangeEqual(bytes, utf8Bytes('wfile1 content'), 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, FULL_SIZE - 2, FULL_SIZE)}`);
      expect(isZeroRange(bytes, FULL_SIZE - 2, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent0125 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_0126
     * @tc.name      testRawfileContent0126
     * @tc.desc      Verify the EOF read is empty while the full read carries content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent0126 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const full: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt');
      const atEnd: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile.txt', FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual atEnd[0]=${atEnd[0]}, expected=0`);
      expect(atEnd[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual full[0]=${full[0]}, expected=114`);
      expect(full[0]).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual atEnd.length=${atEnd.length}, expected=full.length`);
      expect(atEnd.length).assertEqual(full.length);
      log('testRawfileContent0126 end');
    })
  })
}
