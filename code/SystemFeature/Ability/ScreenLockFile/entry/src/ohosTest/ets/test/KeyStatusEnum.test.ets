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

import { describe, expect, it } from '@ohos/hypium';
import { screenLockFileManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function keyStatusEnumTest(): void {
  describe('KeyStatusEnumTest', (): void => {

    // ==================== KeyStatus 枚举值验证（30 条） ====================

    /*
     * @tc.number: SUB_KSE_0100
     * @tc.name: testKeyStatusEnum0001
     * @tc.desc: Verify KeyStatusEnum scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0001');
      const keyNotExist: number = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
      const keyReleased: number = screenLockFileManager.KeyStatus.KEY_RELEASED;
      const keyExist: number = screenLockFileManager.KeyStatus.KEY_EXIST;
      expect(typeof keyNotExist).assertEqual('number');
      expect(typeof keyReleased).assertEqual('number');
      expect(typeof keyExist).assertEqual('number');
      expect(keyNotExist !== keyReleased).assertTrue();
      expect(keyReleased !== keyExist).assertTrue();
      expect(typeof screenLockFileManager.KeyStatus).assertEqual('object');
      sharedDriver.hilogEnd('testKeyStatusEnum0001');
    });

    /*
     * @tc.number: SUB_KSE_0200
     * @tc.name: testKeyStatusEnum0002
     * @tc.desc: Verify KeyStatusEnum scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0002');
      expect(KEY_STATUS_NOT_EXIST).assertEqual(0);
      expect(KEY_STATUS_RELEASED).assertEqual(1);
      expect(KEY_STATUS_EXIST).assertEqual(2);
      expect(KEY_STATUS_NOT_EXIST !== KEY_STATUS_EXIST).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0002');
    });

    /*
     * @tc.number: SUB_KSE_0300
     * @tc.name: testKeyStatusEnum0003
     * @tc.desc: Verify KeyStatusEnum scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0003');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      expect(status).assertLarger(-1);
      sharedDriver.hilogEnd('testKeyStatusEnum0003');
    });

    /*
     * @tc.number: SUB_KSE_0400
     * @tc.name: testKeyStatusEnum0004
     * @tc.desc: Verify KeyStatusEnum scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0004');
      const name: string = testHelper.getKeyStatusName(KEY_STATUS_NOT_EXIST);
      expect(name).assertEqual('KEY_NOT_EXIST');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0004');
    });

    /*
     * @tc.number: SUB_KSE_0500
     * @tc.name: testKeyStatusEnum0005
     * @tc.desc: Verify KeyStatusEnum scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0005');
      const name: string = testHelper.getKeyStatusName(KEY_STATUS_RELEASED);
      expect(name).assertEqual('KEY_RELEASED');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0005');
    });

    /*
     * @tc.number: SUB_KSE_0600
     * @tc.name: testKeyStatusEnum0006
     * @tc.desc: Verify KeyStatusEnum scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0006');
      const name: string = testHelper.getKeyStatusName(KEY_STATUS_EXIST);
      expect(name).assertEqual('KEY_EXIST');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0006');
    });

    /*
     * @tc.number: SUB_KSE_0700
     * @tc.name: testKeyStatusEnum0007
     * @tc.desc: Verify KeyStatusEnum scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0007');
      const name: string = testHelper.getKeyStatusName(99);
      expect(name).assertEqual('UNKNOWN');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0007');
    });

    /*
     * @tc.number: SUB_KSE_0800
     * @tc.name: testKeyStatusEnum0008
     * @tc.desc: Verify KeyStatusEnum scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0008');
      const notExist: number = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
      const released: number = screenLockFileManager.KeyStatus.KEY_RELEASED;
      const exist: number = screenLockFileManager.KeyStatus.KEY_EXIST;
      expect(notExist !== released).assertTrue();
      expect(released !== exist).assertTrue();
      expect(notExist !== exist).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0008');
    });

    /*
     * @tc.number: SUB_KSE_0900
     * @tc.name: testKeyStatusEnum0009
     * @tc.desc: Verify KeyStatusEnum scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0009');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const name: string = testHelper.getKeyStatusName(status);
      expect(name.length).assertLarger(0);
      const validNames: string[] = ['KEY_NOT_EXIST', 'KEY_RELEASED', 'KEY_EXIST'];
      let found: boolean = false;
      for (let i: number = 0; i < validNames.length; i++) {
        if (name === validNames[i]) { found = true; }
      }
      expect(found).assertTrue();
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0009');
    });

    /*
     * @tc.number: SUB_KSE_1000
     * @tc.name: testKeyStatusEnum0010
     * @tc.desc: Verify KeyStatusEnum scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0010');
      const allValues: number[] = [KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST];
      expect(allValues.length).assertEqual(3);
      for (let i: number = 0; i < allValues.length; i++) {
        expect(typeof allValues[i]).assertEqual('number');
        expect(allValues[i]).assertLarger(-1);
      }
      sharedDriver.hilogEnd('testKeyStatusEnum0010');
    });

    /*
     * @tc.number: SUB_KSE_1100
     * @tc.name: testKeyStatusEnum0011
     * @tc.desc: Verify KeyStatusEnum scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0011');
      const keys: string[] = Object.keys(screenLockFileManager.KeyStatus);
      expect(keys.length).assertEqual(3);
      expect(typeof keys[0]).assertEqual('string');
      expect(keys.length).assertLarger(0);
      sharedDriver.hilogEnd('testKeyStatusEnum0011');
    });

    /*
     * @tc.number: SUB_KSE_1200
     * @tc.name: testKeyStatusEnum0012
     * @tc.desc: Verify KeyStatusEnum scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0012');
      expect(typeof KEY_STATUS_NOT_EXIST).assertEqual('number');
      expect(typeof screenLockFileManager.KeyStatus.KEY_NOT_EXIST).assertEqual('number');
      expect(KEY_STATUS_NOT_EXIST !== KEY_STATUS_EXIST).assertTrue();
      const apiKne: number = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
      const apiKe: number = screenLockFileManager.KeyStatus.KEY_EXIST;
      expect(apiKne !== apiKe).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0012');
    });

    /*
     * @tc.number: SUB_KSE_1300
     * @tc.name: testKeyStatusEnum0013
     * @tc.desc: Verify KeyStatusEnum scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0013');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(typeof s1).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStatusEnum0013');
    });

    /*
     * @tc.number: SUB_KSE_1400
     * @tc.name: testKeyStatusEnum0014
     * @tc.desc: Verify KeyStatusEnum scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const resultText: string = await sharedDriver.clickAndGetResult('queryKeyStateButton', 'operationResult');
      const hasKeyName: boolean = resultText.includes('KEY_NOT_EXIST') || resultText.includes('KEY_RELEASED') ||
        resultText.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      expect(resultText.length).assertLarger(0);
      expect(resultText.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0014');
    });

    /*
     * @tc.number: SUB_KSE_1500
     * @tc.name: testKeyStatusEnum0015
     * @tc.desc: Verify KeyStatusEnum scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0015');
      const names: string[] = [];
      names.push(testHelper.getKeyStatusName(KEY_STATUS_NOT_EXIST));
      names.push(testHelper.getKeyStatusName(KEY_STATUS_RELEASED));
      names.push(testHelper.getKeyStatusName(KEY_STATUS_EXIST));
      expect(names.length).assertEqual(3);
      expect(names[0] !== names[1]).assertTrue();
      expect(names[1] !== names[2]).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0015');
    });

    /*
     * @tc.number: SUB_KSE_1600
     * @tc.name: testKeyStatusEnum0016
     * @tc.desc: Verify KeyStatusEnum scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0016');
      expect(KEY_STATUS_NOT_EXIST + KEY_STATUS_RELEASED + KEY_STATUS_EXIST).assertEqual(3);
      expect(KEY_STATUS_NOT_EXIST).assertLess(KEY_STATUS_RELEASED);
      expect(KEY_STATUS_RELEASED).assertLess(KEY_STATUS_EXIST);
      expect(KEY_STATUS_EXIST).assertLarger(KEY_STATUS_NOT_EXIST);
      sharedDriver.hilogEnd('testKeyStatusEnum0016');
    });

    /*
     * @tc.number: SUB_KSE_1700
     * @tc.name: testKeyStatusEnum0017
     * @tc.desc: Verify KeyStatusEnum scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      const hasKeyName: boolean = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      expect(result.includes('KeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testKeyStatusEnum0017');
    });

    /*
     * @tc.number: SUB_KSE_1800
     * @tc.name: testKeyStatusEnum0018
     * @tc.desc: Verify KeyStatusEnum scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0018');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const name1: string = testHelper.getKeyStatusName(status);
      const name2: string = testHelper.getKeyStatusName(status);
      expect(name1).assertEqual(name2);
      expect(name1.length).assertLarger(0);
      expect(typeof name1).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0018');
    });

    /*
     * @tc.number: SUB_KSE_1900
     * @tc.name: testKeyStatusEnum0019
     * @tc.desc: Verify KeyStatusEnum scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0019');
      const enumObj: Object = screenLockFileManager.KeyStatus;
      expect(typeof enumObj).assertEqual('object');
      expect(enumObj !== null).assertTrue();
      const keys: string[] = Object.keys(enumObj);
      expect(keys.length).assertLarger(0);
      sharedDriver.hilogEnd('testKeyStatusEnum0019');
    });

    /*
     * @tc.number: SUB_KSE_2000
     * @tc.name: testKeyStatusEnum0020
     * @tc.desc: Verify KeyStatusEnum scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0020');
      const values: number[] = [];
      values.push(screenLockFileManager.KeyStatus.KEY_NOT_EXIST);
      values.push(screenLockFileManager.KeyStatus.KEY_RELEASED);
      values.push(screenLockFileManager.KeyStatus.KEY_EXIST);
      const uniqueValues: number[] = [];
      for (let i: number = 0; i < values.length; i++) {
        let isUnique: boolean = true;
        for (let j: number = 0; j < uniqueValues.length; j++) {
          if (values[i] === uniqueValues[j]) { isUnique = false; }
        }
        if (isUnique) { uniqueValues.push(values[i]); }
      }
      expect(uniqueValues.length).assertEqual(3);
      expect(values.length).assertEqual(3);
      expect(uniqueValues.length).assertEqual(values.length);
      sharedDriver.hilogEnd('testKeyStatusEnum0020');
    });

    /*
     * @tc.number: SUB_KSE_2100
     * @tc.name: testKeyStatusEnum0021
     * @tc.desc: Verify KeyStatusEnum scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0021');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(status === KEY_STATUS_NOT_EXIST || status === KEY_STATUS_RELEASED ||
        status === KEY_STATUS_EXIST).assertTrue();
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      sharedDriver.hilogEnd('testKeyStatusEnum0021');
    });

    /*
     * @tc.number: SUB_KSE_2200
     * @tc.name: testKeyStatusEnum0022
     * @tc.desc: Verify KeyStatusEnum scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('queryKeyStateButton', 'operationResult');
      const hasKeyName: boolean = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0022');
    });

    /*
     * @tc.number: SUB_KSE_2300
     * @tc.name: testKeyStatusEnum0023
     * @tc.desc: Verify KeyStatusEnum scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0023');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const name: string = testHelper.getKeyStatusName(status);
      const containsUnderscore: boolean = name.includes('_');
      expect(containsUnderscore).assertTrue();
      expect(name.length).assertLarger(3);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0023');
    });

    /*
     * @tc.number: SUB_KSE_2400
     * @tc.name: testKeyStatusEnum0024
     * @tc.desc: Verify KeyStatusEnum scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0024');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      for (let i: number = 0; i < 5; i++) {
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        expect(s).assertEqual(status);
      }
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStatusEnum0024');
    });

    /*
     * @tc.number: SUB_KSE_2500
     * @tc.name: testKeyStatusEnum0025
     * @tc.desc: Verify KeyStatusEnum scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0025');
      const name0: string = testHelper.getKeyStatusName(0);
      const name1: string = testHelper.getKeyStatusName(1);
      const name2: string = testHelper.getKeyStatusName(2);
      expect(name0 !== name1).assertTrue();
      expect(name1 !== name2).assertTrue();
      expect(name0 !== name2).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0025');
    });

    /*
     * @tc.number: SUB_KSE_2600
     * @tc.name: testKeyStatusEnum0026
     * @tc.desc: Verify KeyStatusEnum scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0026');
      const nameNeg: string = testHelper.getKeyStatusName(-1);
      const nameBig: string = testHelper.getKeyStatusName(100);
      expect(nameNeg).assertEqual('UNKNOWN');
      expect(nameBig).assertEqual('UNKNOWN');
      expect(nameNeg).assertEqual(nameBig);
      sharedDriver.hilogEnd('testKeyStatusEnum0026');
    });

    /*
     * @tc.number: SUB_KSE_2700
     * @tc.name: testKeyStatusEnum0027
     * @tc.desc: Verify KeyStatusEnum scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0027');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('queryKeyStateButton', 'operationResult');
      const hasKeyName: boolean = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0027');
    });

    /*
     * @tc.number: SUB_KSE_2800
     * @tc.name: testKeyStatusEnum0028
     * @tc.desc: Verify KeyStatusEnum scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0028');
      expect(typeof screenLockFileManager.KeyStatus.KEY_NOT_EXIST).assertEqual('number');
      expect(typeof screenLockFileManager.KeyStatus.KEY_RELEASED).assertEqual('number');
      expect(typeof screenLockFileManager.KeyStatus.KEY_EXIST).assertEqual('number');
      const apiKne28: number = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
      const apiKe28: number = screenLockFileManager.KeyStatus.KEY_EXIST;
      expect(apiKne28 !== apiKe28).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0028');
    });

    /*
     * @tc.number: SUB_KSE_2900
     * @tc.name: testKeyStatusEnum0029
     * @tc.desc: Verify KeyStatusEnum scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0029');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const name: string = testHelper.getKeyStatusName(status);
      expect(name.startsWith('KEY_')).assertTrue();
      expect(name.length).assertLarger(4);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStatusEnum0029');
    });

    /*
     * @tc.number: SUB_KSE_3000
     * @tc.name: testKeyStatusEnum0030
     * @tc.desc: Verify KeyStatusEnum scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testKeyStatusEnum0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStatusEnum0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      const hasKeyName: boolean = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testKeyStatusEnum0030');
    });
  });
}
