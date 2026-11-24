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
import { common } from '@kit.AbilityKit';
import resourceManager from '@ohos.resourceManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';

const DOMAIN: number = 0xF812;
const TAG: string = 'NdkRawfileDescriptorCoreTest';
const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function createEntryResMgr(): resourceManager.ResourceManager {
  const appContext: common.Context = delegator.getAppContext();
  const moduleContext: common.Context = appContext.createModuleContext('entry');
  return moduleContext.resourceManager;
}

export default function ndkRawfileDescriptorCoreTest(): void {
  describe('NdkRawfileDescriptorCoreTest', () => {
    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0301
     * @tc.name      testRawfileDesc0301
     * @tc.desc      Verify every rawfile descriptor field keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0301 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.fd=${typeof desc.fd}, expected='number'`);
      expect(typeof desc.fd).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.offset=${typeof desc.offset}, expected='number'`);
      expect(typeof desc.offset).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.length=${typeof desc.length}, expected='number'`);
      expect(typeof desc.length).assertEqual('number');
      log('testRawfileDesc0301 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0302
     * @tc.name      testRawfileDesc0302
     * @tc.desc      Verify the rawfile.txt descriptor length equals sixteen bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0302 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=16`);
      expect(desc.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.length=${typeof desc.length}, expected='number'`);
      expect(typeof desc.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger desc.length=${desc.length}, expected=0`);
      expect(desc.length).assertLarger(0);
      log('testRawfileDesc0302 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0303
     * @tc.name      testRawfileDesc0303
     * @tc.desc      Verify the descriptor fd is a valid non-negative handle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0303 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual desc.fd=${desc.fd}, expected=0`);
      expect(desc.fd).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.fd=${typeof desc.fd}, expected='number'`);
      expect(typeof desc.fd).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=16`);
      expect(desc.length).assertEqual(16);
      log('testRawfileDesc0303 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0304
     * @tc.name      testRawfileDesc0304
     * @tc.desc      Verify the descriptor offset is a valid non-negative position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0304 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual desc.offset=${desc.offset}, expected=0`);
      expect(desc.offset).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.offset=${typeof desc.offset}, expected='number'`);
      expect(typeof desc.offset).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=16`);
      expect(desc.length).assertEqual(16);
      log('testRawfileDesc0304 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0305
     * @tc.name      testRawfileDesc0305
     * @tc.desc      Verify the native descriptor length matches the ArkTS raw fd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0305 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      const syncDesc: resourceManager.RawFileDescriptor = resMgr.getRawFdSync('rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=syncDesc.length`);
      expect(desc.length).assertEqual(syncDesc.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=16`);
      expect(desc.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual syncDesc.length=${syncDesc.length}, expected=16`);
      expect(syncDesc.length).assertEqual(16);
      log('testRawfileDesc0305 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0306
     * @tc.name      testRawfileDesc0306
     * @tc.desc      Verify the native descriptor offset matches the ArkTS raw fd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0306 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      const syncDesc: resourceManager.RawFileDescriptor = resMgr.getRawFdSync('rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.offset=${desc.offset}, expected=syncDesc.offset`);
      expect(desc.offset).assertEqual(syncDesc.offset);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual desc.offset=${desc.offset}, expected=0`);
      expect(desc.offset).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof syncDesc.offset=${typeof syncDesc.offset}`);
      expect(typeof syncDesc.offset).assertEqual('number');
      log('testRawfileDesc0306 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0307
     * @tc.name      testRawfileDesc0307
     * @tc.desc      Verify repeated descriptor opens keep stable length and offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0307 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const first: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      const second: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=second.length`);
      expect(first.length).assertEqual(second.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.offset=${first.offset}, expected=second.offset`);
      expect(first.offset).assertEqual(second.offset);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=16`);
      expect(first.length).assertEqual(16);
      log('testRawfileDesc0307 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0308
     * @tc.name      testRawfileDesc0308
     * @tc.desc      Verify the nested rawfile2 descriptor length matches the sync fd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0308 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor =
        testNapi.getRawFileDescriptor(resMgr, 'subrawfile/rawfile2.txt');
      const syncDesc: resourceManager.RawFileDescriptor = resMgr.getRawFdSync('subrawfile/rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=syncDesc.length`);
      expect(desc.length).assertEqual(syncDesc.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger desc.length=${desc.length}, expected=0`);
      expect(desc.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.fd=${typeof desc.fd}, expected='number'`);
      expect(typeof desc.fd).assertEqual('number');
      log('testRawfileDesc0308 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0309
     * @tc.name      testRawfileDesc0309
     * @tc.desc      Verify the nested descriptor offset matches the sync fd offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc0309 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor =
        testNapi.getRawFileDescriptor(resMgr, 'subrawfile/rawfile2.txt');
      const syncDesc: resourceManager.RawFileDescriptor = resMgr.getRawFdSync('subrawfile/rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.offset=${desc.offset}, expected=syncDesc.offset`);
      expect(desc.offset).assertEqual(syncDesc.offset);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.offset=${typeof desc.offset}, expected='number'`);
      expect(typeof desc.offset).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=syncDesc.length`);
      expect(desc.length).assertEqual(syncDesc.length);
      log('testRawfileDesc0309 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0310
     * @tc.name      testRawfileDesc640310
     * @tc.desc      Verify every 64-bit descriptor field keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640310 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.fd=${typeof desc.fd}, expected='number'`);
      expect(typeof desc.fd).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.offset=${typeof desc.offset}, expected='number'`);
      expect(typeof desc.offset).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.length=${typeof desc.length}, expected='number'`);
      expect(typeof desc.length).assertEqual('number');
      log('testRawfileDesc640310 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0311
     * @tc.name      testRawfileDesc640311
     * @tc.desc      Verify the rawfile1.txt 64-bit descriptor length is twenty-two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640311 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=22`);
      expect(desc.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.length=${typeof desc.length}, expected='number'`);
      expect(typeof desc.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger desc.length=${desc.length}, expected=0`);
      expect(desc.length).assertLarger(0);
      log('testRawfileDesc640311 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0312
     * @tc.name      testRawfileDesc640312
     * @tc.desc      Verify the 64-bit descriptor fd is a valid non-negative handle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640312 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual desc.fd=${desc.fd}, expected=0`);
      expect(desc.fd).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.fd=${typeof desc.fd}, expected='number'`);
      expect(typeof desc.fd).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=22`);
      expect(desc.length).assertEqual(22);
      log('testRawfileDesc640312 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0313
     * @tc.name      testRawfileDesc640313
     * @tc.desc      Verify the 64-bit descriptor offset is non-negative.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640313 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual desc.offset=${desc.offset}, expected=0`);
      expect(desc.offset).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.offset=${typeof desc.offset}, expected='number'`);
      expect(typeof desc.offset).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=22`);
      expect(desc.length).assertEqual(22);
      log('testRawfileDesc640313 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0314
     * @tc.name      testRawfileDesc640314
     * @tc.desc      Verify the 64-bit descriptor length matches the ArkTS raw fd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640314 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      const syncDesc: resourceManager.RawFileDescriptor = resMgr.getRawFdSync('rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=syncDesc.length`);
      expect(desc.length).assertEqual(syncDesc.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=22`);
      expect(desc.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual syncDesc.length=${syncDesc.length}, expected=22`);
      expect(syncDesc.length).assertEqual(22);
      log('testRawfileDesc640314 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0315
     * @tc.name      testRawfileDesc640315
     * @tc.desc      Verify the 64-bit descriptor offset matches the ArkTS raw fd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640315 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      const syncDesc: resourceManager.RawFileDescriptor = resMgr.getRawFdSync('rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.offset=${desc.offset}, expected=syncDesc.offset`);
      expect(desc.offset).assertEqual(syncDesc.offset);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual desc.offset=${desc.offset}, expected=0`);
      expect(desc.offset).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof syncDesc.offset=${typeof syncDesc.offset}`);
      expect(typeof syncDesc.offset).assertEqual('number');
      log('testRawfileDesc640315 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0316
     * @tc.name      testRawfileDesc640316
     * @tc.desc      Verify repeated 64-bit opens keep stable length and offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640316 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const first: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      const second: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=second.length`);
      expect(first.length).assertEqual(second.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.offset=${first.offset}, expected=second.offset`);
      expect(first.offset).assertEqual(second.offset);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=22`);
      expect(first.length).assertEqual(22);
      log('testRawfileDesc640316 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0317
     * @tc.name      testRawfileDesc640317
     * @tc.desc      Verify the 64-bit API also serves the smaller rawfile.txt.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640317 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=16`);
      expect(desc.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof desc.length=${typeof desc.length}, expected='number'`);
      expect(typeof desc.length).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual desc.fd=${desc.fd}, expected=0`);
      expect(desc.fd).assertLargerOrEqual(0);
      log('testRawfileDesc640317 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0318
     * @tc.name      testRawfileDesc640318
     * @tc.desc      Verify 32-bit and 64-bit descriptors agree on the same file.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileDesc640318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileDesc640318 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const plain: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile1.txt');
      const wide: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.length=${plain.length}, expected=wide.length`);
      expect(plain.length).assertEqual(wide.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.offset=${plain.offset}, expected=wide.offset`);
      expect(plain.offset).assertEqual(wide.offset);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual plain.fd=${plain.fd}, expected=0`);
      expect(plain.fd).assertLargerOrEqual(0);
      log('testRawfileDesc640318 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0319
     * @tc.name      testRawfileRelease0319
     * @tc.desc      Verify releasing a valid rawfile descriptor succeeds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileRelease0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileRelease0319 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      const released: boolean = testNapi.releaseRawFileDescriptor(resMgr, desc);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue released=${released}`);
      expect(released).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof released=${typeof released}, expected='boolean'`);
      expect(typeof released).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=16`);
      expect(desc.length).assertEqual(16);
      log('testRawfileRelease0319 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0321
     * @tc.name      testRawfileRelease0321
     * @tc.desc      Verify releasing a valid 64-bit descriptor succeeds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileRelease0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileRelease0321 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor64(resMgr, 'rawfile1.txt');
      const released: boolean = testNapi.releaseRawFileDescriptor64(resMgr, desc);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue released=${released}`);
      expect(released).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof released=${typeof released}, expected='boolean'`);
      expect(typeof released).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual desc.length=${desc.length}, expected=22`);
      expect(desc.length).assertEqual(22);
      log('testRawfileRelease0321 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0324
     * @tc.name      testRawfileRelease0324
     * @tc.desc      Verify a repeated release returns a boolean without breaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileRelease0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileRelease0324 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue testNapi.releaseRawFileDescriptor(resMgr, desc)`);
      expect(testNapi.releaseRawFileDescriptor(resMgr, desc)).assertTrue();
      const repeated: boolean = testNapi.releaseRawFileDescriptor(resMgr, desc);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof repeated=${typeof repeated}, expected='boolean'`);
      expect(typeof repeated).assertEqual('boolean');
      const fresh: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fresh.length=${fresh.length}, expected=16`);
      expect(fresh.length).assertEqual(16);
      log('testRawfileRelease0324 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_0325
     * @tc.name      testRawfileRelease0325
     * @tc.desc      Verify a fresh descriptor remains obtainable after a release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileRelease0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileRelease0325 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const desc: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue testNapi.releaseRawFileDescriptor(resMgr, desc)`);
      expect(testNapi.releaseRawFileDescriptor(resMgr, desc)).assertTrue();
      const fresh: resourceManager.RawFileDescriptor = testNapi.getRawFileDescriptor(resMgr, 'rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fresh.length=${fresh.length}, expected=16`);
      expect(fresh.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fresh.offset=${fresh.offset}, expected=desc.offset`);
      expect(fresh.offset).assertEqual(desc.offset);
      log('testRawfileRelease0325 end');
    })

  })
}
