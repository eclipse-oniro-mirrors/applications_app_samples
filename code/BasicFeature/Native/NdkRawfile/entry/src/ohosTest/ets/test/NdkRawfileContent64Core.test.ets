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
const TAG: string = 'NdkRawfileContent64CoreTest';
const FULL_TEXT: string = 'rawfile content for 64';
const FULL_SIZE: number = 22;
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

export default function ndkRawfileContent64CoreTest(): void {
  describe('NdkRawfileContent64CoreTest', () => {
    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0201
     * @tc.name      testRawfileContent640201
     * @tc.desc      Verify the 64-bit full read of rawfile1.txt returns 22 bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640201 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytes instanceof Uint8Array=${bytes instanceof Uint8Array}`);
      expect(bytes instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.byteLength=${bytes.byteLength}, expected=FULL_SIZE`);
      expect(bytes.byteLength).assertEqual(FULL_SIZE);
      log('testRawfileContent640201 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0202
     * @tc.name      testRawfileContent640202
     * @tc.desc      Verify the 64-bit full read bytes match the packaged text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640202 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.byteLength=${bytes.byteLength}`);
      expect(bytes.byteLength).assertEqual(utf8Bytes(FULL_TEXT).length);
      log('testRawfileContent640202 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0203
     * @tc.name      testRawfileContent640203
     * @tc.desc      Verify the 64-bit full read decodes to the packaged text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640203 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      const text: string = utf8Decoder.decodeToString(bytes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=FULL_TEXT`);
      expect(text).assertEqual(FULL_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text.length=${text.length}, expected=FULL_SIZE`);
      expect(text.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      log('testRawfileContent640203 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0204
     * @tc.name      testRawfileContent640204
     * @tc.desc      Verify the 64-bit read result keeps the typed array contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640204 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytes instanceof Uint8Array=${bytes instanceof Uint8Array}`);
      expect(bytes instanceof Uint8Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=bytes.byteLength`);
      expect(bytes.length).assertEqual(bytes.byteLength);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof bytes=${typeof bytes}, expected='object'`);
      expect(typeof bytes).assertEqual('object');
      log('testRawfileContent640204 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0205
     * @tc.name      testRawfileContent640205
     * @tc.desc      Verify repeated 64-bit reads return identical bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640205 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const first: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      const second: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(first, second)=${bytesEqual(first, second)}`);
      expect(bytesEqual(first, second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=FULL_SIZE`);
      expect(first.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.length=${second.length}, expected=FULL_SIZE`);
      expect(second.length).assertEqual(FULL_SIZE);
      log('testRawfileContent640205 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0206
     * @tc.name      testRawfileContent640206
     * @tc.desc      Verify a fresh resource manager yields identical 64-bit bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640206 begin');
      const first: Uint8Array = testNapi.getRawFileContent64(createEntryResMgr(), 'rawfile1.txt');
      const second: Uint8Array = testNapi.getRawFileContent64(createEntryResMgr(), 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(first, second)=${bytesEqual(first, second)}`);
      expect(bytesEqual(first, second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=FULL_SIZE`);
      expect(first.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.length=${second.length}, expected=FULL_SIZE`);
      expect(second.length).assertEqual(FULL_SIZE);
      log('testRawfileContent640206 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0207
     * @tc.name      testRawfileContent640207
     * @tc.desc      Verify the 64-bit read matches the ArkTS sync read bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640207 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      const syncBytes: Uint8Array = resMgr.getRawFileContentSync('rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(bytes, syncBytes)=${bytesEqual(bytes, syncBytes)}`);
      expect(bytesEqual(bytes, syncBytes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=syncBytes.byteLength`);
      expect(bytes.length).assertEqual(syncBytes.byteLength);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual syncBytes.byteLength=${syncBytes.byteLength}`);
      expect(syncBytes.byteLength).assertEqual(FULL_SIZE);
      log('testRawfileContent640207 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0208
     * @tc.name      testRawfileContent640208
     * @tc.desc      Verify offset zero equals the full 64-bit content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640208 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${utf8Decoder.decodeToString(bytes)}`);
      expect(utf8Decoder.decodeToString(bytes)).assertEqual(FULL_TEXT);
      log('testRawfileContent640208 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0209
     * @tc.name      testRawfileContent640209
     * @tc.desc      Verify offset eight keeps the content for 64 prefix bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640209 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesRangeEqual(bytes, utf8Bytes('content for 64'), 0)`);
      expect(bytesRangeEqual(bytes, utf8Bytes('content for 64'), 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=99`);
      expect(bytes[0]).assertEqual(99);
      log('testRawfileContent640209 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0210
     * @tc.name      testRawfileContent640210
     * @tc.desc      Verify offset eight zero pads the final eight bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640210 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, 14, FULL_SIZE)}`);
      expect(isZeroRange(bytes, 14, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[13]=${bytes[13]}, expected=52`);
      expect(bytes[13]).assertEqual(52);
      log('testRawfileContent640210 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0211
     * @tc.name      testRawfileContent640211
     * @tc.desc      Verify offset twenty-one keeps the final digit and pads the rest.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640211 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', FULL_SIZE - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=52`);
      expect(bytes[0]).assertEqual(52);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, 1, FULL_SIZE)}`);
      expect(isZeroRange(bytes, 1, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent640211 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0212
     * @tc.name      testRawfileContent640212
     * @tc.desc      Verify reading at EOF through the 64-bit API yields zeros.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640212 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, 0, FULL_SIZE)}`);
      expect(isZeroRange(bytes, 0, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytes instanceof Uint8Array=${bytes instanceof Uint8Array}`);
      expect(bytes instanceof Uint8Array).assertTrue();
      log('testRawfileContent640212 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0213
     * @tc.name      testRawfileContent640213
     * @tc.desc      Verify an offset beyond EOF falls back to the full content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640213 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', FULL_SIZE + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${utf8Decoder.decodeToString(bytes)}`);
      expect(utf8Decoder.decodeToString(bytes)).assertEqual(FULL_TEXT);
      log('testRawfileContent640213 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0214
     * @tc.name      testRawfileContent640214
     * @tc.desc      Verify an explicit full length returns the complete content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640214 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', 0, FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.byteLength=${bytes.byteLength}, expected=FULL_SIZE`);
      expect(bytes.byteLength).assertEqual(FULL_SIZE);
      log('testRawfileContent640214 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0215
     * @tc.name      testRawfileContent640215
     * @tc.desc      Verify a length beyond the file size falls back to full content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640215 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', 0, FULL_SIZE + 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${bytesEqual(bytes, utf8Bytes(FULL_TEXT))}`);
      expect(bytesEqual(bytes, utf8Bytes(FULL_TEXT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${utf8Decoder.decodeToString(bytes)}`);
      expect(utf8Decoder.decodeToString(bytes)).assertEqual(FULL_TEXT);
      log('testRawfileContent640215 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0216
     * @tc.name      testRawfileContent640216
     * @tc.desc      Verify offset one keeps the shifted tail and pads one zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640216 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesRangeEqual(bytes, utf8Bytes('awfile content for 64'), 0)`);
      expect(bytesRangeEqual(bytes, utf8Bytes('awfile content for 64'), 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${isZeroRange(bytes, FULL_SIZE - 1, FULL_SIZE)}`);
      expect(isZeroRange(bytes, FULL_SIZE - 1, FULL_SIZE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=FULL_SIZE`);
      expect(bytes.length).assertEqual(FULL_SIZE);
      log('testRawfileContent640216 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0217
     * @tc.name      testRawfileContent640217
     * @tc.desc      Verify the offset eight read decodes with the expected prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640217 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', 8);
      const text: string = utf8Decoder.decodeToString(bytes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith('content for 64')}`);
      expect(text.startsWith('content for 64')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text.length=${text.length}, expected=FULL_SIZE`);
      expect(text.length).assertEqual(FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      log('testRawfileContent640217 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0218
     * @tc.name      testRawfileContent640218
     * @tc.desc      Verify 32-bit and 64-bit full reads agree on the same file.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640218 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const plain: Uint8Array = testNapi.getRawFileContent(resMgr, 'rawfile1.txt');
      const wide: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(plain, wide)=${bytesEqual(plain, wide)}`);
      expect(bytesEqual(plain, wide)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.length=${plain.length}, expected=wide.length`);
      expect(plain.length).assertEqual(wide.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue plain instanceof Uint8Array && wide instanceof Uint8Array`);
      expect(plain instanceof Uint8Array && wide instanceof Uint8Array).assertTrue();
      log('testRawfileContent640218 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0219
     * @tc.name      testRawfileContent640219
     * @tc.desc      Verify the EOF read is empty while the full read starts with r.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640219 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const full: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt');
      const atEnd: Uint8Array = testNapi.getRawFileContent64(resMgr, 'rawfile1.txt', FULL_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual atEnd[0]=${atEnd[0]}, expected=0`);
      expect(atEnd[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual full[0]=${full[0]}, expected=114`);
      expect(full[0]).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual atEnd.length=${atEnd.length}, expected=full.length`);
      expect(atEnd.length).assertEqual(full.length);
      log('testRawfileContent640219 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_0220
     * @tc.name      testRawfileContent640220
     * @tc.desc      Verify the 64-bit API reads the nested rawfile2 file correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileContent640220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileContent640220 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const bytes: Uint8Array = testNapi.getRawFileContent64(resMgr, 'subrawfile/rawfile2.txt');
      const syncBytes: Uint8Array = resMgr.getRawFileContentSync('subrawfile/rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bytesEqual(bytes, syncBytes)=${bytesEqual(bytes, syncBytes)}`);
      expect(bytesEqual(bytes, syncBytes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=syncBytes.byteLength`);
      expect(bytes.length).assertEqual(syncBytes.byteLength);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=115`);
      expect(bytes[0]).assertEqual(115);
      log('testRawfileContent640220 end');
    })
  })
}
