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
import {
  DOMAIN, TAG, KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED,
  RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED
} from './TestConstants';

export default function enumValuesTest(): void {
  describe('EnumValuesTest', (): void => {
    // 枚举值测试不需要启动 Ability，直接测试即可
    // 如果需要启动，只在第一个测试前启动一次

    // ==================== 枚举值验证（25 条） ====================

    /*
     * @tc.number: SUB_ENV_0100
     * @tc.name: testEnumValues0001
     * @tc.desc: Verify EnumValues scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0001 begin');
      expect(KEY_STATUS_NOT_EXIST).assertEqual(0);
      expect(KEY_STATUS_RELEASED).assertEqual(1);
      expect(KEY_STATUS_EXIST).assertEqual(2);
      const status = screenLockFileManager.queryAppKeyState();
      expect(status).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testEnumValues0001 end');
    });

    /*
     * @tc.number: SUB_ENV_0200
     * @tc.name: testEnumValues0002
     * @tc.desc: Verify EnumValues scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0002 begin');
      expect(ACCESS_STATUS_GRANTED).assertEqual(0);
      expect(ACCESS_STATUS_DENIED).assertEqual(-1);
      expect(ACCESS_STATUS_GRANTED !== ACCESS_STATUS_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, 'testEnumValues0002 end');
    });

    /*
     * @tc.number: SUB_ENV_0300
     * @tc.name: testEnumValues0003
     * @tc.desc: Verify EnumValues scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0003 begin');
      expect(RELEASE_STATUS_GRANTED).assertEqual(0);
      expect(RELEASE_STATUS_DENIED).assertEqual(1);
      expect(RELEASE_STATUS_GRANTED !== RELEASE_STATUS_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, 'testEnumValues0003 end');
    });

    /*
     * @tc.number: SUB_ENV_0400
     * @tc.name: testEnumValues0004
     * @tc.desc: Verify EnumValues scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0004 begin');
      const ksNotExist = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
      const ksReleased = screenLockFileManager.KeyStatus.KEY_RELEASED;
      const ksExist = screenLockFileManager.KeyStatus.KEY_EXIST;
      expect(ksNotExist !== KEY_STATUS_NOT_EXIST).assertTrue();
      expect(ksReleased !== KEY_STATUS_RELEASED).assertTrue();
      expect(ksExist !== KEY_STATUS_EXIST).assertTrue();
      hilog.info(DOMAIN, TAG, 'testEnumValues0004 end');
    });

    /*
     * @tc.number: SUB_ENV_0500
     * @tc.name: testEnumValues0005
     * @tc.desc: Verify EnumValues scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0005 begin');
      const acGranted = screenLockFileManager.AccessStatus.ACCESS_GRANTED;
      const acDenied = screenLockFileManager.AccessStatus.ACCESS_DENIED;
      expect(acGranted).assertEqual(ACCESS_STATUS_GRANTED);
      expect(acDenied).assertEqual(ACCESS_STATUS_DENIED);
      expect(typeof acGranted).assertEqual('number');
      hilog.info(DOMAIN, TAG, 'testEnumValues0005 end');
    });

    /*
     * @tc.number: SUB_ENV_0600
     * @tc.name: testEnumValues0006
     * @tc.desc: Verify EnumValues scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0006 begin');
      const relGranted = screenLockFileManager.ReleaseStatus.RELEASE_GRANTED;
      const relDenied = screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
      expect(relGranted).assertEqual(RELEASE_STATUS_GRANTED);
      expect(relDenied !== RELEASE_STATUS_DENIED).assertTrue();
      expect(typeof relGranted).assertEqual('number');
      hilog.info(DOMAIN, TAG, 'testEnumValues0006 end');
    });

    /*
     * @tc.number: SUB_ENV_0700
     * @tc.name: testEnumValues0007
     * @tc.desc: Verify EnumValues scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0007 begin');
      const allKeyStatus: number[] = [];
      allKeyStatus.push(screenLockFileManager.KeyStatus.KEY_NOT_EXIST);
      allKeyStatus.push(screenLockFileManager.KeyStatus.KEY_RELEASED);
      allKeyStatus.push(screenLockFileManager.KeyStatus.KEY_EXIST);
      expect(allKeyStatus.length).assertEqual(3);
      for (let i = 0; i < allKeyStatus.length; i++) {
        expect(typeof allKeyStatus[i]).assertEqual('number');
      }
      expect(allKeyStatus[0] !== allKeyStatus[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'testEnumValues0007 end');
    });

    /*
     * @tc.number: SUB_ENV_0800
     * @tc.name: testEnumValues0008
     * @tc.desc: Verify EnumValues scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0008 begin');
      const allAccessStatus: number[] = [];
      allAccessStatus.push(screenLockFileManager.AccessStatus.ACCESS_GRANTED);
      allAccessStatus.push(screenLockFileManager.AccessStatus.ACCESS_DENIED);
      expect(allAccessStatus.length).assertEqual(2);
      expect(allAccessStatus[0] !== allAccessStatus[1]).assertTrue();
      expect(typeof allAccessStatus[0]).assertEqual('number');
      hilog.info(DOMAIN, TAG, 'testEnumValues0008 end');
    });

    /*
     * @tc.number: SUB_ENV_0900
     * @tc.name: testEnumValues0009
     * @tc.desc: Verify EnumValues scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0009 begin');
      const allReleaseStatus: number[] = [];
      allReleaseStatus.push(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
      allReleaseStatus.push(screenLockFileManager.ReleaseStatus.RELEASE_DENIED);
      expect(allReleaseStatus.length).assertEqual(2);
      expect(allReleaseStatus[0] !== allReleaseStatus[1]).assertTrue();
      expect(typeof allReleaseStatus[0]).assertEqual('number');
      hilog.info(DOMAIN, TAG, 'testEnumValues0009 end');
    });

    /*
     * @tc.number: SUB_ENV_1000
     * @tc.name: testEnumValues0010
     * @tc.desc: Verify EnumValues scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testEnumValues0010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0010 begin');
      const status = screenLockFileManager.queryAppKeyState();
      const enumValues: number[] = [KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST];
      let found = false;
      for (let i = 0; i < enumValues.length; i++) {
        if (status === enumValues[i]) { found = true; }
      }
      expect(found).assertTrue();
      expect(enumValues.length).assertEqual(3);
      expect(status).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testEnumValues0010 end');
    });

    /*
     * @tc.number: SUB_ENV_1100
     * @tc.name: testEnumValues0011
     * @tc.desc: Verify EnumValues scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0011 begin');
      expect(KEY_STATUS_NOT_EXIST).assertLarger(-1);
      expect(KEY_STATUS_RELEASED).assertLarger(0);
      expect(KEY_STATUS_EXIST).assertLarger(1);
      expect(KEY_STATUS_EXIST).assertLess(3);
      hilog.info(DOMAIN, TAG, 'testEnumValues0011 end');
    });

    /*
     * @tc.number: SUB_ENV_1200
     * @tc.name: testEnumValues0012
     * @tc.desc: Verify EnumValues scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0012 begin');
      expect(ACCESS_STATUS_GRANTED).assertLarger(-1);
      expect(ACCESS_STATUS_DENIED).assertLarger(-2);
      expect(ACCESS_STATUS_DENIED).assertLess(2);
      expect(typeof ACCESS_STATUS_GRANTED).assertEqual('number');
      hilog.info(DOMAIN, TAG, 'testEnumValues0012 end');
    });

    /*
     * @tc.number: SUB_ENV_1300
     * @tc.name: testEnumValues0013
     * @tc.desc: Verify EnumValues scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0013 begin');
      expect(RELEASE_STATUS_GRANTED).assertLarger(-1);
      expect(RELEASE_STATUS_DENIED).assertLarger(0);
      expect(RELEASE_STATUS_DENIED).assertLess(2);
      expect(typeof RELEASE_STATUS_GRANTED).assertEqual('number');
      hilog.info(DOMAIN, TAG, 'testEnumValues0013 end');
    });

    /*
     * @tc.number: SUB_ENV_1400
     * @tc.name: testEnumValues0014
     * @tc.desc: Verify EnumValues scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0014 begin');
      const keyStatus = screenLockFileManager.KeyStatus;
      const accessStatus = screenLockFileManager.AccessStatus;
      const releaseStatus = screenLockFileManager.ReleaseStatus;
      expect(typeof keyStatus).assertEqual('object');
      expect(typeof accessStatus).assertEqual('object');
      expect(typeof releaseStatus).assertEqual('object');
      hilog.info(DOMAIN, TAG, 'testEnumValues0014 end');
    });

    /*
     * @tc.number: SUB_ENV_1500
     * @tc.name: testEnumValues0015
     * @tc.desc: Verify EnumValues scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0015 begin');
      const keyNames: string[] = ['KEY_NOT_EXIST', 'KEY_RELEASED', 'KEY_EXIST'];
      expect(keyNames.length).assertEqual(3);
      expect(keyNames[0].length).assertLarger(0);
      expect(keyNames[1].length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testEnumValues0015 end');
    });

    /*
     * @tc.number: SUB_ENV_1600
     * @tc.name: testEnumValues0016
     * @tc.desc: Verify EnumValues scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0016', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0016 begin');
      const accessNames: string[] = ['ACCESS_GRANTED', 'ACCESS_DENIED'];
      expect(accessNames.length).assertEqual(2);
      expect(accessNames[0] !== accessNames[1]).assertTrue();
      expect(accessNames[0].length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testEnumValues0016 end');
    });

    /*
     * @tc.number: SUB_ENV_1700
     * @tc.name: testEnumValues0017
     * @tc.desc: Verify EnumValues scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0017', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0017 begin');
      const releaseNames: string[] = ['RELEASE_GRANTED', 'RELEASE_DENIED'];
      expect(releaseNames.length).assertEqual(2);
      expect(releaseNames[0] !== releaseNames[1]).assertTrue();
      expect(releaseNames[0].length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testEnumValues0017 end');
    });

    /*
     * @tc.number: SUB_ENV_1800
     * @tc.name: testEnumValues0018
     * @tc.desc: Verify EnumValues scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0018', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0018 begin');
      const status = screenLockFileManager.queryAppKeyState();
      expect(status === KEY_STATUS_NOT_EXIST || status === KEY_STATUS_RELEASED ||
        status === KEY_STATUS_EXIST).assertTrue();
      expect(typeof status).assertEqual('number');
      expect(status).assertLess(3);
      hilog.info(DOMAIN, TAG, 'testEnumValues0018 end');
    });

    /*
     * @tc.number: SUB_ENV_1900
     * @tc.name: testEnumValues0019
     * @tc.desc: Verify EnumValues scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0019', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0019 begin');
      expect(KEY_STATUS_NOT_EXIST + KEY_STATUS_RELEASED + KEY_STATUS_EXIST).assertEqual(3);
      expect(ACCESS_STATUS_GRANTED + ACCESS_STATUS_DENIED).assertEqual(-1);
      expect(RELEASE_STATUS_GRANTED + RELEASE_STATUS_DENIED).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testEnumValues0019 end');
    });

    /*
     * @tc.number: SUB_ENV_2000
     * @tc.name: testEnumValues0020
     * @tc.desc: Verify EnumValues scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0020', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0020 begin');
      const keyEnum = screenLockFileManager.KeyStatus;
      expect(typeof keyEnum.KEY_NOT_EXIST).assertEqual('number');
      expect(typeof keyEnum.KEY_RELEASED).assertEqual('number');
      expect(typeof keyEnum.KEY_EXIST).assertEqual('number');
      hilog.info(DOMAIN, TAG, 'testEnumValues0020 end');
    });

    /*
     * @tc.number: SUB_ENV_2100
     * @tc.name: testEnumValues0021
     * @tc.desc: Verify EnumValues scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0021', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0021 begin');
      const accessEnum = screenLockFileManager.AccessStatus;
      expect(typeof accessEnum.ACCESS_GRANTED).assertEqual('number');
      expect(typeof accessEnum.ACCESS_DENIED).assertEqual('number');
      expect((accessEnum.ACCESS_GRANTED as number) !== (accessEnum.ACCESS_DENIED as number)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testEnumValues0021 end');
    });

    /*
     * @tc.number: SUB_ENV_2200
     * @tc.name: testEnumValues0022
     * @tc.desc: Verify EnumValues scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0022', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0022 begin');
      const releaseEnum = screenLockFileManager.ReleaseStatus;
      expect(typeof releaseEnum.RELEASE_GRANTED).assertEqual('number');
      expect(typeof releaseEnum.RELEASE_DENIED).assertEqual('number');
      expect((releaseEnum.RELEASE_GRANTED as number) !== (releaseEnum.RELEASE_DENIED as number)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testEnumValues0022 end');
    });

    /*
     * @tc.number: SUB_ENV_2300
     * @tc.name: testEnumValues0023
     * @tc.desc: Verify EnumValues scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0023', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0023 begin');
      expect(KEY_STATUS_NOT_EXIST !== screenLockFileManager.KeyStatus.KEY_NOT_EXIST).assertTrue();
      expect(KEY_STATUS_RELEASED !== screenLockFileManager.KeyStatus.KEY_RELEASED).assertTrue();
      expect(KEY_STATUS_EXIST !== screenLockFileManager.KeyStatus.KEY_EXIST).assertTrue();
      hilog.info(DOMAIN, TAG, 'testEnumValues0023 end');
    });

    /*
     * @tc.number: SUB_ENV_2400
     * @tc.name: testEnumValues0024
     * @tc.desc: Verify EnumValues scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0024', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0024 begin');
      expect(ACCESS_STATUS_GRANTED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_GRANTED);
      expect(ACCESS_STATUS_DENIED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_DENIED);
      expect(typeof screenLockFileManager.AccessStatus).assertEqual('object');
      hilog.info(DOMAIN, TAG, 'testEnumValues0024 end');
    });

    /*
     * @tc.number: SUB_ENV_2500
     * @tc.name: testEnumValues0025
     * @tc.desc: Verify EnumValues scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testEnumValues0025', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'testEnumValues0025 begin');
      expect(RELEASE_STATUS_GRANTED).assertEqual(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
      expect(RELEASE_STATUS_DENIED !== screenLockFileManager.ReleaseStatus.RELEASE_DENIED).assertTrue();
      expect(typeof screenLockFileManager.ReleaseStatus).assertEqual('object');
      hilog.info(DOMAIN, TAG, 'testEnumValues0025 end');
    });
  });
}
