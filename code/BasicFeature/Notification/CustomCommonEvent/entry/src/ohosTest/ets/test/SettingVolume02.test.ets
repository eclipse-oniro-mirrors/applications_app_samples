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

export default function settingVolume02Test(): void {
  describe('SettingVolume02Test', () => {

    beforeAll(async () => {
      await prepareSettingFeature();
    });

    /**
     * @tc.name   testSettingVolume020001
     * @tc.number SUB_CCE_SETTINGV_02_0001
     * @tc.desc   对 WIFI 调 changeState(0) 归一为 0 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020001 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 0);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020001 end');
    })

    /**
     * @tc.name   testSettingVolume020002
     * @tc.number SUB_CCE_SETTINGV_02_0002
     * @tc.desc   对 OFF 调 changeState(0) 归一为 0 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020002 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 0);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020002 end');
    })

    /**
     * @tc.name   testSettingVolume020003
     * @tc.number SUB_CCE_SETTINGV_02_0003
     * @tc.desc   对 ON 调 changeState(0) 归一为 0 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020003 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 0);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020003 end');
    })

    /**
     * @tc.name   testSettingVolume020004
     * @tc.number SUB_CCE_SETTINGV_02_0004
     * @tc.desc   对 LOCK 调 changeState(0) 归一为 0 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020004 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 0);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020004 end');
    })

    /**
     * @tc.name   testSettingVolume020005
     * @tc.number SUB_CCE_SETTINGV_02_0005
     * @tc.desc   对 UNLOCK 调 changeState(0) 归一为 0 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020005 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 0);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020005 end');
    })

    /**
     * @tc.name   testSettingVolume020006
     * @tc.number SUB_CCE_SETTINGV_02_0006
     * @tc.desc   对 WIFI 调 changeState(1) 归一为 1 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020006 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 1);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020006 end');
    })

    /**
     * @tc.name   testSettingVolume020007
     * @tc.number SUB_CCE_SETTINGV_02_0007
     * @tc.desc   对 OFF 调 changeState(1) 归一为 1 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020007 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 1);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020007 end');
    })

    /**
     * @tc.name   testSettingVolume020008
     * @tc.number SUB_CCE_SETTINGV_02_0008
     * @tc.desc   对 ON 调 changeState(1) 归一为 1 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020008 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 1);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020008 end');
    })

    /**
     * @tc.name   testSettingVolume020009
     * @tc.number SUB_CCE_SETTINGV_02_0009
     * @tc.desc   对 LOCK 调 changeState(1) 归一为 1 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020009 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 1);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020009 end');
    })

    /**
     * @tc.name   testSettingVolume020010
     * @tc.number SUB_CCE_SETTINGV_02_0010
     * @tc.desc   对 UNLOCK 调 changeState(1) 归一为 1 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020010 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 1);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020010 end');
    })

    /**
     * @tc.name   testSettingVolume020011
     * @tc.number SUB_CCE_SETTINGV_02_0011
     * @tc.desc   对 WIFI 调 changeState(2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020011 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 2);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020011 end');
    })

    /**
     * @tc.name   testSettingVolume020012
     * @tc.number SUB_CCE_SETTINGV_02_0012
     * @tc.desc   对 OFF 调 changeState(2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020012 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 2);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020012 end');
    })

    /**
     * @tc.name   testSettingVolume020013
     * @tc.number SUB_CCE_SETTINGV_02_0013
     * @tc.desc   对 ON 调 changeState(2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020013 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 2);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020013 end');
    })

    /**
     * @tc.name   testSettingVolume020014
     * @tc.number SUB_CCE_SETTINGV_02_0014
     * @tc.desc   对 LOCK 调 changeState(2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020014 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 2);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020014 end');
    })

    /**
     * @tc.name   testSettingVolume020015
     * @tc.number SUB_CCE_SETTINGV_02_0015
     * @tc.desc   对 UNLOCK 调 changeState(2) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020015 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 2);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020015 end');
    })

    /**
     * @tc.name   testSettingVolume020016
     * @tc.number SUB_CCE_SETTINGV_02_0016
     * @tc.desc   对 WIFI 调 changeState(3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020016 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 3);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020016 end');
    })

    /**
     * @tc.name   testSettingVolume020017
     * @tc.number SUB_CCE_SETTINGV_02_0017
     * @tc.desc   对 OFF 调 changeState(3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020017 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 3);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020017 end');
    })

    /**
     * @tc.name   testSettingVolume020018
     * @tc.number SUB_CCE_SETTINGV_02_0018
     * @tc.desc   对 ON 调 changeState(3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020018 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 3);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020018 end');
    })

    /**
     * @tc.name   testSettingVolume020019
     * @tc.number SUB_CCE_SETTINGV_02_0019
     * @tc.desc   对 LOCK 调 changeState(3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020019 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 3);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020019 end');
    })

    /**
     * @tc.name   testSettingVolume020020
     * @tc.number SUB_CCE_SETTINGV_02_0020
     * @tc.desc   对 UNLOCK 调 changeState(3) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020020 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 3);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020020 end');
    })

    /**
     * @tc.name   testSettingVolume020021
     * @tc.number SUB_CCE_SETTINGV_02_0021
     * @tc.desc   对 WIFI 调 changeState(-1) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020021 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', -1);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020021 end');
    })

    /**
     * @tc.name   testSettingVolume020022
     * @tc.number SUB_CCE_SETTINGV_02_0022
     * @tc.desc   对 OFF 调 changeState(-1) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020022 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', -1);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020022 end');
    })

    /**
     * @tc.name   testSettingVolume020023
     * @tc.number SUB_CCE_SETTINGV_02_0023
     * @tc.desc   对 ON 调 changeState(-1) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020023 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', -1);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020023 end');
    })

    /**
     * @tc.name   testSettingVolume020024
     * @tc.number SUB_CCE_SETTINGV_02_0024
     * @tc.desc   对 LOCK 调 changeState(-1) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020024 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', -1);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020024 end');
    })

    /**
     * @tc.name   testSettingVolume020025
     * @tc.number SUB_CCE_SETTINGV_02_0025
     * @tc.desc   对 UNLOCK 调 changeState(-1) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020025 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', -1);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020025 end');
    })

    /**
     * @tc.name   testSettingVolume020026
     * @tc.number SUB_CCE_SETTINGV_02_0026
     * @tc.desc   对 WIFI 调 changeState(99) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020026 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 99);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020026 end');
    })

    /**
     * @tc.name   testSettingVolume020027
     * @tc.number SUB_CCE_SETTINGV_02_0027
     * @tc.desc   对 OFF 调 changeState(99) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020027 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 99);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020027 end');
    })

    /**
     * @tc.name   testSettingVolume020028
     * @tc.number SUB_CCE_SETTINGV_02_0028
     * @tc.desc   对 ON 调 changeState(99) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020028 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 99);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020028 end');
    })

    /**
     * @tc.name   testSettingVolume020029
     * @tc.number SUB_CCE_SETTINGV_02_0029
     * @tc.desc   对 LOCK 调 changeState(99) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020029 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 99);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020029 end');
    })

    /**
     * @tc.name   testSettingVolume020030
     * @tc.number SUB_CCE_SETTINGV_02_0030
     * @tc.desc   对 UNLOCK 调 changeState(99) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020030 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 99);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020030 end');
    })

    /**
     * @tc.name   testSettingVolume020031
     * @tc.number SUB_CCE_SETTINGV_02_0031
     * @tc.desc   对 WIFI 调 changeState(1000) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020031 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 1000);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020031 end');
    })

    /**
     * @tc.name   testSettingVolume020032
     * @tc.number SUB_CCE_SETTINGV_02_0032
     * @tc.desc   对 OFF 调 changeState(1000) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020032 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 1000);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020032 end');
    })

    /**
     * @tc.name   testSettingVolume020033
     * @tc.number SUB_CCE_SETTINGV_02_0033
     * @tc.desc   对 ON 调 changeState(1000) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020033 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 1000);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020033 end');
    })

    /**
     * @tc.name   testSettingVolume020034
     * @tc.number SUB_CCE_SETTINGV_02_0034
     * @tc.desc   对 LOCK 调 changeState(1000) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020034 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 1000);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020034 end');
    })

    /**
     * @tc.name   testSettingVolume020035
     * @tc.number SUB_CCE_SETTINGV_02_0035
     * @tc.desc   对 UNLOCK 调 changeState(1000) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020035 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 1000);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020035 end');
    })

    /**
     * @tc.name   testSettingVolume020036
     * @tc.number SUB_CCE_SETTINGV_02_0036
     * @tc.desc   对 WIFI 调 changeState(0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020036 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 0.5);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020036 end');
    })

    /**
     * @tc.name   testSettingVolume020037
     * @tc.number SUB_CCE_SETTINGV_02_0037
     * @tc.desc   对 OFF 调 changeState(0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020037 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', 0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020037 end');
    })

    /**
     * @tc.name   testSettingVolume020038
     * @tc.number SUB_CCE_SETTINGV_02_0038
     * @tc.desc   对 ON 调 changeState(0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020038 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', 0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020038 end');
    })

    /**
     * @tc.name   testSettingVolume020039
     * @tc.number SUB_CCE_SETTINGV_02_0039
     * @tc.desc   对 LOCK 调 changeState(0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020039 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', 0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020039 end');
    })

    /**
     * @tc.name   testSettingVolume020040
     * @tc.number SUB_CCE_SETTINGV_02_0040
     * @tc.desc   对 UNLOCK 调 changeState(0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020040 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', 0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020040 end');
    })

    /**
     * @tc.name   testSettingVolume020041
     * @tc.number SUB_CCE_SETTINGV_02_0041
     * @tc.desc   对 WIFI 调 changeState(-0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020041 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', -0.5);
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020041 end');
    })

    /**
     * @tc.name   testSettingVolume020042
     * @tc.number SUB_CCE_SETTINGV_02_0042
     * @tc.desc   对 OFF 调 changeState(-0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020042 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_OFF', -0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020042 end');
    })

    /**
     * @tc.name   testSettingVolume020043
     * @tc.number SUB_CCE_SETTINGV_02_0043
     * @tc.desc   对 ON 调 changeState(-0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020043 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_ON', -0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020043 end');
    })

    /**
     * @tc.name   testSettingVolume020044
     * @tc.number SUB_CCE_SETTINGV_02_0044
     * @tc.desc   对 LOCK 调 changeState(-0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020044 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_LOCKED', -0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020044 end');
    })

    /**
     * @tc.name   testSettingVolume020045
     * @tc.number SUB_CCE_SETTINGV_02_0045
     * @tc.desc   对 UNLOCK 调 changeState(-0.5) 归一为 2 后三判互斥
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020045 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.SCREEN_UNLOCKED', -0.5);
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020045 end');
    })

    /**
     * @tc.name   testSettingVolume020046
     * @tc.number SUB_CCE_SETTINGV_02_0046
     * @tc.desc   重复调用 changeState 以末次为准：0→99→1 最终落 ONCE，非法 99 被归一为 NEVER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020046 begin');
      installStates('2,2,2,2,2');
      changeStateOf('usual.event.wifi.POWER_STATE', 0);
      changeStateOf('usual.event.wifi.POWER_STATE', 99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(checkNever('usual.event.wifi.POWER_STATE')));
      expect(checkNever('usual.event.wifi.POWER_STATE')).assertTrue();
      changeStateOf('usual.event.wifi.POWER_STATE', 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(checkOnce('usual.event.wifi.POWER_STATE')));
      expect(checkOnce('usual.event.wifi.POWER_STATE')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(checkAlways('usual.event.wifi.POWER_STATE')));
      expect(checkAlways('usual.event.wifi.POWER_STATE')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume020046 end');
    })
  })
}
