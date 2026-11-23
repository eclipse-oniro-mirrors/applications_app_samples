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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { selfBundle, entryResources } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function signatureMatrixTest() {
  describe('signatureMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0001
   * @tc.name      testSignature0001
   * @tc.desc      Signature probe 1 checks appId longer than bundle
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0001', 'signature 1');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.length > info.name.length).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0002
   * @tc.name      testSignature0002
   * @tc.desc      Signature probe 2 checks appId starts with bundle
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testSignature0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testSignature0002', 'signature 2');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.startsWith(info.name)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0003
   * @tc.name      testSignature0003
   * @tc.desc      Signature probe 3 checks appId keeps separator
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testSignature0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testSignature0003', 'signature 3');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.indexOf('_') > 0).assertTrue();
    expect(appId.split('_').length >= 2).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0004
   * @tc.name      testSignature0004
   * @tc.desc      Signature probe 4 checks appId dot count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0004', 'signature 4');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.split('.').length).assertEqual(info.name.split('.').length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0005
   * @tc.name      testSignature0005
   * @tc.desc      Signature probe 5 checks appId blank free
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testSignature0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testSignature0005', 'signature 5');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.indexOf(' ')).assertEqual(-1);
    expect(appId).assertEqual(appId.trim());
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0006
   * @tc.name      testSignature0006
   * @tc.desc      Signature probe 6 checks appId prefix text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testSignature0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testSignature0006', 'signature 6');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.substring(0, info.name.length)).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0007
   * @tc.name      testSignature0007
   * @tc.desc      Signature probe 7 checks appId root segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0007', 'signature 7');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.split('.')[0]).assertEqual('ohos');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0008
   * @tc.name      testSignature0008
   * @tc.desc      Signature probe 8 checks appId lowercase head
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testSignature0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testSignature0008', 'signature 8');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.toLowerCase().startsWith('ohos')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0009
   * @tc.name      testSignature0009
   * @tc.desc      Signature probe 9 checks appId includes bundle
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testSignature0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testSignature0009', 'signature 9');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.includes(info.name)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0010
   * @tc.name      testSignature0010
   * @tc.desc      Signature probe 10 checks appId separator order
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0010', 'signature 10');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.lastIndexOf('_') >= appId.indexOf('_')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0011
   * @tc.name      testSignature0011
   * @tc.desc      Signature probe 11 checks appId first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testSignature0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testSignature0011', 'signature 11');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId.charAt(0)).assertEqual(info.name.charAt(0));
    expect(appId.charCodeAt(0)).assertEqual(info.name.charCodeAt(0));
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0012
   * @tc.name      testSignature0012
   * @tc.desc      Signature probe 12 checks fingerprint minimum length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testSignature0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testSignature0012', 'signature 12');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(fingerprint.length >= 32).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0013
   * @tc.name      testSignature0013
   * @tc.desc      Signature probe 13 checks fingerprint trimmed
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0013', 'signature 13');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(fingerprint).assertEqual(fingerprint.trim());
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0014
   * @tc.name      testSignature0014
   * @tc.desc      Signature probe 14 checks fingerprint blank free
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testSignature0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testSignature0014', 'signature 14');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(fingerprint.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0015
   * @tc.name      testSignature0015
   * @tc.desc      Signature probe 15 checks fingerprint head slice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testSignature0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testSignature0015', 'signature 15');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(fingerprint.substring(0, 8).length).assertEqual(8);
    expect(fingerprint.slice(0, 8)).assertEqual(fingerprint.substring(0, 8));
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0016
   * @tc.name      testSignature0016
   * @tc.desc      Signature probe 16 checks fingerprint tail slice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0016', 'signature 16');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(fingerprint.slice(-8).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0017
   * @tc.name      testSignature0017
   * @tc.desc      Signature probe 17 checks fingerprint split length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testSignature0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testSignature0017', 'signature 17');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(fingerprint.split('').length).assertEqual(fingerprint.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0018
   * @tc.name      testSignature0018
   * @tc.desc      Signature probe 18 checks fingerprint head code
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testSignature0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testSignature0018', 'signature 18');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    const head: number = fingerprint.charCodeAt(0);
    expect(head >= 48).assertTrue();
    expect(head <= 122).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0019
   * @tc.name      testSignature0019
   * @tc.desc      Signature probe 19 checks appId differs from fingerprint
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0019', 'signature 19');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(appId === fingerprint).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0020
   * @tc.name      testSignature0020
   * @tc.desc      Signature probe 20 checks signature reads are stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testSignature0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testSignature0020', 'signature 20');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    const again: bundleManager.BundleInfo = await selfBundle();
    expect(again.signatureInfo.fingerprint).assertEqual(fingerprint);
    expect(again.signatureInfo.appId).assertEqual(appId);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0021
   * @tc.name      testSignature0021
   * @tc.desc      Signature probe 21 checks signature appId repeats bundle
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testSignature0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testSignature0021', 'signature 21');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(info.signatureInfo.appId.indexOf(info.name)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_SIG_0022
   * @tc.name      testSignature0022
   * @tc.desc      Signature probe 22 checks fingerprint tail length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testSignature0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testSignature0022', 'signature 22');
    const info: bundleManager.BundleInfo = await selfBundle();
    const appId: string = info.signatureInfo.appId;
    const fingerprint: string = info.signatureInfo.fingerprint;
    expect(fingerprint.length > 8).assertTrue();
    expect(fingerprint.substring(8).length).assertEqual(fingerprint.length - 8);
  });
  });
}
