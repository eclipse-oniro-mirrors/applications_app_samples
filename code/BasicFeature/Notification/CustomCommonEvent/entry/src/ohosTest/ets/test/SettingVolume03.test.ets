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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { installStates, changeStateOf, checkAlways, checkOnce, checkNever, prepareSettingFeature } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function settingVolume03Test(): void {
  describe('SettingVolume03Test', () => {

    beforeAll(async () => {
      await prepareSettingFeature();
    });

    /**
     * @tc.name   testSettingVolume030001
     * @tc.number SUB_CCE_SETTINGV_03_0001
     * @tc.desc   对 WIFI 调 changeState(4) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030001 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 4);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030001 end');
    })

    /**
     * @tc.name   testSettingVolume030002
     * @tc.number SUB_CCE_SETTINGV_03_0002
     * @tc.desc   对 OFF 调 changeState(4) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030002 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 4);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030002 end');
    })

    /**
     * @tc.name   testSettingVolume030003
     * @tc.number SUB_CCE_SETTINGV_03_0003
     * @tc.desc   对 ON 调 changeState(4) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030003 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 4);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030003 end');
    })

    /**
     * @tc.name   testSettingVolume030004
     * @tc.number SUB_CCE_SETTINGV_03_0004
     * @tc.desc   对 LOCK 调 changeState(4) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030004 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 4);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030004 end');
    })

    /**
     * @tc.name   testSettingVolume030005
     * @tc.number SUB_CCE_SETTINGV_03_0005
     * @tc.desc   对 UNLOCK 调 changeState(4) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030005 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 4);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030005 end');
    })

    /**
     * @tc.name   testSettingVolume030006
     * @tc.number SUB_CCE_SETTINGV_03_0006
     * @tc.desc   对 WIFI 调 changeState(5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030006 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 5);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030006 end');
    })

    /**
     * @tc.name   testSettingVolume030007
     * @tc.number SUB_CCE_SETTINGV_03_0007
     * @tc.desc   对 OFF 调 changeState(5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030007 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 5);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030007 end');
    })

    /**
     * @tc.name   testSettingVolume030008
     * @tc.number SUB_CCE_SETTINGV_03_0008
     * @tc.desc   对 ON 调 changeState(5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030008 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 5);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030008 end');
    })

    /**
     * @tc.name   testSettingVolume030009
     * @tc.number SUB_CCE_SETTINGV_03_0009
     * @tc.desc   对 LOCK 调 changeState(5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030009 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 5);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030009 end');
    })

    /**
     * @tc.name   testSettingVolume030010
     * @tc.number SUB_CCE_SETTINGV_03_0010
     * @tc.desc   对 UNLOCK 调 changeState(5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030010 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 5);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030010 end');
    })

    /**
     * @tc.name   testSettingVolume030011
     * @tc.number SUB_CCE_SETTINGV_03_0011
     * @tc.desc   对 WIFI 调 changeState(9) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030011 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 9);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030011 end');
    })

    /**
     * @tc.name   testSettingVolume030012
     * @tc.number SUB_CCE_SETTINGV_03_0012
     * @tc.desc   对 OFF 调 changeState(9) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030012 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 9);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030012 end');
    })

    /**
     * @tc.name   testSettingVolume030013
     * @tc.number SUB_CCE_SETTINGV_03_0013
     * @tc.desc   对 ON 调 changeState(9) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030013 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 9);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030013 end');
    })

    /**
     * @tc.name   testSettingVolume030014
     * @tc.number SUB_CCE_SETTINGV_03_0014
     * @tc.desc   对 LOCK 调 changeState(9) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030014 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 9);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030014 end');
    })

    /**
     * @tc.name   testSettingVolume030015
     * @tc.number SUB_CCE_SETTINGV_03_0015
     * @tc.desc   对 UNLOCK 调 changeState(9) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030015 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 9);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030015 end');
    })

    /**
     * @tc.name   testSettingVolume030016
     * @tc.number SUB_CCE_SETTINGV_03_0016
     * @tc.desc   对 WIFI 调 changeState(10) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030016 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 10);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030016 end');
    })

    /**
     * @tc.name   testSettingVolume030017
     * @tc.number SUB_CCE_SETTINGV_03_0017
     * @tc.desc   对 OFF 调 changeState(10) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030017 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 10);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030017 end');
    })

    /**
     * @tc.name   testSettingVolume030018
     * @tc.number SUB_CCE_SETTINGV_03_0018
     * @tc.desc   对 ON 调 changeState(10) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030018 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 10);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030018 end');
    })

    /**
     * @tc.name   testSettingVolume030019
     * @tc.number SUB_CCE_SETTINGV_03_0019
     * @tc.desc   对 LOCK 调 changeState(10) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030019 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 10);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030019 end');
    })

    /**
     * @tc.name   testSettingVolume030020
     * @tc.number SUB_CCE_SETTINGV_03_0020
     * @tc.desc   对 UNLOCK 调 changeState(10) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030020 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 10);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030020 end');
    })

    /**
     * @tc.name   testSettingVolume030021
     * @tc.number SUB_CCE_SETTINGV_03_0021
     * @tc.desc   对 WIFI 调 changeState(-2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030021 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', -2);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030021 end');
    })

    /**
     * @tc.name   testSettingVolume030022
     * @tc.number SUB_CCE_SETTINGV_03_0022
     * @tc.desc   对 OFF 调 changeState(-2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030022 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', -2);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030022 end');
    })

    /**
     * @tc.name   testSettingVolume030023
     * @tc.number SUB_CCE_SETTINGV_03_0023
     * @tc.desc   对 ON 调 changeState(-2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030023 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', -2);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030023 end');
    })

    /**
     * @tc.name   testSettingVolume030024
     * @tc.number SUB_CCE_SETTINGV_03_0024
     * @tc.desc   对 LOCK 调 changeState(-2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030024 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', -2);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030024 end');
    })

    /**
     * @tc.name   testSettingVolume030025
     * @tc.number SUB_CCE_SETTINGV_03_0025
     * @tc.desc   对 UNLOCK 调 changeState(-2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030025 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', -2);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030025 end');
    })

    /**
     * @tc.name   testSettingVolume030026
     * @tc.number SUB_CCE_SETTINGV_03_0026
     * @tc.desc   对 WIFI 调 changeState(-3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030026 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', -3);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030026 end');
    })

    /**
     * @tc.name   testSettingVolume030027
     * @tc.number SUB_CCE_SETTINGV_03_0027
     * @tc.desc   对 OFF 调 changeState(-3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030027 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', -3);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030027 end');
    })

    /**
     * @tc.name   testSettingVolume030028
     * @tc.number SUB_CCE_SETTINGV_03_0028
     * @tc.desc   对 ON 调 changeState(-3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030028 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', -3);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030028 end');
    })

    /**
     * @tc.name   testSettingVolume030029
     * @tc.number SUB_CCE_SETTINGV_03_0029
     * @tc.desc   对 LOCK 调 changeState(-3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030029 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', -3);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030029 end');
    })

    /**
     * @tc.name   testSettingVolume030030
     * @tc.number SUB_CCE_SETTINGV_03_0030
     * @tc.desc   对 UNLOCK 调 changeState(-3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030030 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', -3);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030030 end');
    })

    /**
     * @tc.name   testSettingVolume030031
     * @tc.number SUB_CCE_SETTINGV_03_0031
     * @tc.desc   对 WIFI 调 changeState(50) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030031 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 50);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030031 end');
    })

    /**
     * @tc.name   testSettingVolume030032
     * @tc.number SUB_CCE_SETTINGV_03_0032
     * @tc.desc   对 OFF 调 changeState(50) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030032 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 50);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030032 end');
    })

    /**
     * @tc.name   testSettingVolume030033
     * @tc.number SUB_CCE_SETTINGV_03_0033
     * @tc.desc   对 ON 调 changeState(50) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030033 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 50);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030033 end');
    })

    /**
     * @tc.name   testSettingVolume030034
     * @tc.number SUB_CCE_SETTINGV_03_0034
     * @tc.desc   对 LOCK 调 changeState(50) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030034 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 50);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030034 end');
    })

    /**
     * @tc.name   testSettingVolume030035
     * @tc.number SUB_CCE_SETTINGV_03_0035
     * @tc.desc   对 UNLOCK 调 changeState(50) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030035 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 50);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030035 end');
    })

    /**
     * @tc.name   testSettingVolume030036
     * @tc.number SUB_CCE_SETTINGV_03_0036
     * @tc.desc   对 WIFI 调 changeState(100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030036 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 100);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030036 end');
    })

    /**
     * @tc.name   testSettingVolume030037
     * @tc.number SUB_CCE_SETTINGV_03_0037
     * @tc.desc   对 OFF 调 changeState(100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030037 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 100);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030037 end');
    })

    /**
     * @tc.name   testSettingVolume030038
     * @tc.number SUB_CCE_SETTINGV_03_0038
     * @tc.desc   对 ON 调 changeState(100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030038 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 100);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030038 end');
    })

    /**
     * @tc.name   testSettingVolume030039
     * @tc.number SUB_CCE_SETTINGV_03_0039
     * @tc.desc   对 LOCK 调 changeState(100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030039 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 100);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030039 end');
    })

    /**
     * @tc.name   testSettingVolume030040
     * @tc.number SUB_CCE_SETTINGV_03_0040
     * @tc.desc   对 UNLOCK 调 changeState(100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030040 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 100);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030040 end');
    })

    /**
     * @tc.name   testSettingVolume030041
     * @tc.number SUB_CCE_SETTINGV_03_0041
     * @tc.desc   对 WIFI 调 changeState(-100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030041 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', -100);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030041 end');
    })

    /**
     * @tc.name   testSettingVolume030042
     * @tc.number SUB_CCE_SETTINGV_03_0042
     * @tc.desc   对 OFF 调 changeState(-100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030042 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', -100);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030042 end');
    })

    /**
     * @tc.name   testSettingVolume030043
     * @tc.number SUB_CCE_SETTINGV_03_0043
     * @tc.desc   对 ON 调 changeState(-100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030043 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', -100);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030043 end');
    })

    /**
     * @tc.name   testSettingVolume030044
     * @tc.number SUB_CCE_SETTINGV_03_0044
     * @tc.desc   对 LOCK 调 changeState(-100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030044 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', -100);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030044 end');
    })

    /**
     * @tc.name   testSettingVolume030045
     * @tc.number SUB_CCE_SETTINGV_03_0045
     * @tc.desc   对 UNLOCK 调 changeState(-100) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030045 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', -100);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030045 end');
    })

    /**
     * @tc.name   testSettingVolume030046
     * @tc.number SUB_CCE_SETTINGV_03_0046
     * @tc.desc   重复调用 changeState 以末次为准：4(NEVER)→0(ALWAYS)→1(ONCE) 逐次覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume030046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030046 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(checkNever('usual.event.wifi.POWER_STATE')));
      expect(checkNever('usual.event.wifi.POWER_STATE')).assertTrue();
      changeStateOf('usual.event.wifi.POWER_STATE', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(checkAlways('usual.event.wifi.POWER_STATE')));
      expect(checkAlways('usual.event.wifi.POWER_STATE')).assertTrue();
      changeStateOf('usual.event.wifi.POWER_STATE', 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(checkOnce('usual.event.wifi.POWER_STATE') && !checkAlways('usual.event.wifi.POWER_STATE')));
      expect(checkOnce('usual.event.wifi.POWER_STATE') && !checkAlways('usual.event.wifi.POWER_STATE')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume030046 end');
    })
  })
}
