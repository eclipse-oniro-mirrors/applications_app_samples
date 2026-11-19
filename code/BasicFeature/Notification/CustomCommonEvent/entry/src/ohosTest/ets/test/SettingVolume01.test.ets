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
import { installStates, checkAlways, checkOnce, checkNever } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function settingVolume01Test(): void {
  describe('SettingVolume01Test', () => {

    /**
     * @tc.name   testSettingVolume010001
     * @tc.number SUB_CCE_SETTINGV_01_0001
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=0 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010001 begin');
      installStates('0,0,0,0,0');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010001 end');
    })

    /**
     * @tc.name   testSettingVolume010002
     * @tc.number SUB_CCE_SETTINGV_01_0002
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010002 begin');
      installStates('1,1,1,1,1');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010002 end');
    })

    /**
     * @tc.name   testSettingVolume010003
     * @tc.number SUB_CCE_SETTINGV_01_0003
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=2 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010003 begin');
      installStates('2,2,2,2,2');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('true'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010003 end');
    })

    /**
     * @tc.name   testSettingVolume010004
     * @tc.number SUB_CCE_SETTINGV_01_0004
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=3 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010004 begin');
      installStates('3,3,3,3,3');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010004 end');
    })

    /**
     * @tc.name   testSettingVolume010005
     * @tc.number SUB_CCE_SETTINGV_01_0005
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=99 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010005 begin');
      installStates('99,99,99,99,99');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010005 end');
    })

    /**
     * @tc.name   testSettingVolume010006
     * @tc.number SUB_CCE_SETTINGV_01_0006
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=-1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010006 begin');
      installStates('-1,-1,-1,-1,-1');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010006 end');
    })

    /**
     * @tc.name   testSettingVolume010007
     * @tc.number SUB_CCE_SETTINGV_01_0007
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=1000 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010007 begin');
      installStates('1000,1000,1000,1000,1000');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010007 end');
    })

    /**
     * @tc.name   testSettingVolume010008
     * @tc.number SUB_CCE_SETTINGV_01_0008
     * @tc.desc   usual.event.wifi.POWER_STATE 存储值=7 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010008 begin');
      installStates('7,7,7,7,7');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010008 end');
    })

    /**
     * @tc.name   testSettingVolume010009
     * @tc.number SUB_CCE_SETTINGV_01_0009
     * @tc.desc   usual.event.SCREEN_OFF 存储值=0 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010009 begin');
      installStates('0,0,0,0,0');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010009 end');
    })

    /**
     * @tc.name   testSettingVolume010010
     * @tc.number SUB_CCE_SETTINGV_01_0010
     * @tc.desc   usual.event.SCREEN_OFF 存储值=1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010010 begin');
      installStates('1,1,1,1,1');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010010 end');
    })

    /**
     * @tc.name   testSettingVolume010011
     * @tc.number SUB_CCE_SETTINGV_01_0011
     * @tc.desc   usual.event.SCREEN_OFF 存储值=2 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010011 begin');
      installStates('2,2,2,2,2');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010011 end');
    })

    /**
     * @tc.name   testSettingVolume010012
     * @tc.number SUB_CCE_SETTINGV_01_0012
     * @tc.desc   usual.event.SCREEN_OFF 存储值=3 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010012 begin');
      installStates('3,3,3,3,3');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010012 end');
    })

    /**
     * @tc.name   testSettingVolume010013
     * @tc.number SUB_CCE_SETTINGV_01_0013
     * @tc.desc   usual.event.SCREEN_OFF 存储值=99 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010013 begin');
      installStates('99,99,99,99,99');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010013 end');
    })

    /**
     * @tc.name   testSettingVolume010014
     * @tc.number SUB_CCE_SETTINGV_01_0014
     * @tc.desc   usual.event.SCREEN_OFF 存储值=-1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010014 begin');
      installStates('-1,-1,-1,-1,-1');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010014 end');
    })

    /**
     * @tc.name   testSettingVolume010015
     * @tc.number SUB_CCE_SETTINGV_01_0015
     * @tc.desc   usual.event.SCREEN_OFF 存储值=1000 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010015 begin');
      installStates('1000,1000,1000,1000,1000');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010015 end');
    })

    /**
     * @tc.name   testSettingVolume010016
     * @tc.number SUB_CCE_SETTINGV_01_0016
     * @tc.desc   usual.event.SCREEN_OFF 存储值=7 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010016 begin');
      installStates('7,7,7,7,7');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010016 end');
    })

    /**
     * @tc.name   testSettingVolume010017
     * @tc.number SUB_CCE_SETTINGV_01_0017
     * @tc.desc   usual.event.SCREEN_ON 存储值=0 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010017 begin');
      installStates('0,0,0,0,0');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010017 end');
    })

    /**
     * @tc.name   testSettingVolume010018
     * @tc.number SUB_CCE_SETTINGV_01_0018
     * @tc.desc   usual.event.SCREEN_ON 存储值=1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010018 begin');
      installStates('1,1,1,1,1');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010018 end');
    })

    /**
     * @tc.name   testSettingVolume010019
     * @tc.number SUB_CCE_SETTINGV_01_0019
     * @tc.desc   usual.event.SCREEN_ON 存储值=2 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010019 begin');
      installStates('2,2,2,2,2');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010019 end');
    })

    /**
     * @tc.name   testSettingVolume010020
     * @tc.number SUB_CCE_SETTINGV_01_0020
     * @tc.desc   usual.event.SCREEN_ON 存储值=3 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010020 begin');
      installStates('3,3,3,3,3');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010020 end');
    })

    /**
     * @tc.name   testSettingVolume010021
     * @tc.number SUB_CCE_SETTINGV_01_0021
     * @tc.desc   usual.event.SCREEN_ON 存储值=99 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010021 begin');
      installStates('99,99,99,99,99');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010021 end');
    })

    /**
     * @tc.name   testSettingVolume010022
     * @tc.number SUB_CCE_SETTINGV_01_0022
     * @tc.desc   usual.event.SCREEN_ON 存储值=-1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010022 begin');
      installStates('-1,-1,-1,-1,-1');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010022 end');
    })

    /**
     * @tc.name   testSettingVolume010023
     * @tc.number SUB_CCE_SETTINGV_01_0023
     * @tc.desc   usual.event.SCREEN_ON 存储值=1000 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010023 begin');
      installStates('1000,1000,1000,1000,1000');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010023 end');
    })

    /**
     * @tc.name   testSettingVolume010024
     * @tc.number SUB_CCE_SETTINGV_01_0024
     * @tc.desc   usual.event.SCREEN_ON 存储值=7 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010024 begin');
      installStates('7,7,7,7,7');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010024 end');
    })

    /**
     * @tc.name   testSettingVolume010025
     * @tc.number SUB_CCE_SETTINGV_01_0025
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=0 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010025 begin');
      installStates('0,0,0,0,0');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010025 end');
    })

    /**
     * @tc.name   testSettingVolume010026
     * @tc.number SUB_CCE_SETTINGV_01_0026
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010026 begin');
      installStates('1,1,1,1,1');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010026 end');
    })

    /**
     * @tc.name   testSettingVolume010027
     * @tc.number SUB_CCE_SETTINGV_01_0027
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=2 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010027 begin');
      installStates('2,2,2,2,2');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010027 end');
    })

    /**
     * @tc.name   testSettingVolume010028
     * @tc.number SUB_CCE_SETTINGV_01_0028
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=3 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010028 begin');
      installStates('3,3,3,3,3');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010028 end');
    })

    /**
     * @tc.name   testSettingVolume010029
     * @tc.number SUB_CCE_SETTINGV_01_0029
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=99 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010029 begin');
      installStates('99,99,99,99,99');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010029 end');
    })

    /**
     * @tc.name   testSettingVolume010030
     * @tc.number SUB_CCE_SETTINGV_01_0030
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=-1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010030 begin');
      installStates('-1,-1,-1,-1,-1');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010030 end');
    })

    /**
     * @tc.name   testSettingVolume010031
     * @tc.number SUB_CCE_SETTINGV_01_0031
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=1000 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010031 begin');
      installStates('1000,1000,1000,1000,1000');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010031 end');
    })

    /**
     * @tc.name   testSettingVolume010032
     * @tc.number SUB_CCE_SETTINGV_01_0032
     * @tc.desc   usual.event.SCREEN_LOCKED 存储值=7 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010032 begin');
      installStates('7,7,7,7,7');
      const result: boolean = checkAlways('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_LOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_LOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010032 end');
    })

    /**
     * @tc.name   testSettingVolume010033
     * @tc.number SUB_CCE_SETTINGV_01_0033
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=0 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010033 begin');
      installStates('0,0,0,0,0');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010033 end');
    })

    /**
     * @tc.name   testSettingVolume010034
     * @tc.number SUB_CCE_SETTINGV_01_0034
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010034 begin');
      installStates('1,1,1,1,1');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010034 end');
    })

    /**
     * @tc.name   testSettingVolume010035
     * @tc.number SUB_CCE_SETTINGV_01_0035
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=2 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010035 begin');
      installStates('2,2,2,2,2');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010035 end');
    })

    /**
     * @tc.name   testSettingVolume010036
     * @tc.number SUB_CCE_SETTINGV_01_0036
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=3 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010036 begin');
      installStates('3,3,3,3,3');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010036 end');
    })

    /**
     * @tc.name   testSettingVolume010037
     * @tc.number SUB_CCE_SETTINGV_01_0037
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=99 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010037 begin');
      installStates('99,99,99,99,99');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010037 end');
    })

    /**
     * @tc.name   testSettingVolume010038
     * @tc.number SUB_CCE_SETTINGV_01_0038
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=-1 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010038 begin');
      installStates('-1,-1,-1,-1,-1');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010038 end');
    })

    /**
     * @tc.name   testSettingVolume010039
     * @tc.number SUB_CCE_SETTINGV_01_0039
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=1000 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010039 begin');
      installStates('1000,1000,1000,1000,1000');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010039 end');
    })

    /**
     * @tc.name   testSettingVolume010040
     * @tc.number SUB_CCE_SETTINGV_01_0040
     * @tc.desc   usual.event.SCREEN_UNLOCKED 存储值=7 时三种判定互斥
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010040 begin');
      installStates('7,7,7,7,7');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010040 end');
    })

    /**
     * @tc.name   testSettingVolume010041
     * @tc.number SUB_CCE_SETTINGV_01_0041
     * @tc.desc   混合取值 第3键=2 判定全否
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010041 begin');
      installStates('0,1,2,0,1');
      const result: boolean = checkAlways('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_ON'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_ON'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_ON'))), String('true'));
      expect(String(checkNever('usual.event.SCREEN_ON'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010041 end');
    })

    /**
     * @tc.name   testSettingVolume010042
     * @tc.number SUB_CCE_SETTINGV_01_0042
     * @tc.desc   混合取值 第1键=0 判为常开
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010042 begin');
      installStates('0,1,2,0,1');
      const result: boolean = checkAlways('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkOnce('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.wifi.POWER_STATE'))), String('false'));
      expect(String(checkNever('usual.event.wifi.POWER_STATE'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010042 end');
    })

    /**
     * @tc.name   testSettingVolume010043
     * @tc.number SUB_CCE_SETTINGV_01_0043
     * @tc.desc   混合取值 第2键=1 判为仅一次
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010043 begin');
      installStates('0,1,2,0,1');
      const result: boolean = checkAlways('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_OFF'))), String('true'));
      expect(String(checkOnce('usual.event.SCREEN_OFF'))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_OFF'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_OFF'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010043 end');
    })

    /**
     * @tc.name   testSettingVolume010044
     * @tc.number SUB_CCE_SETTINGV_01_0044
     * @tc.desc   混合非法取值 第5键=7 三种判定全否
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010044 begin');
      installStates('-1,99,3,1000,7');
      const result: boolean = checkAlways('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkOnce('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkOnce('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(checkNever('usual.event.SCREEN_UNLOCKED'))), String('false'));
      expect(String(checkNever('usual.event.SCREEN_UNLOCKED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010044 end');
    })

    /**
     * @tc.name   testSettingVolume010045
     * @tc.number SUB_CCE_SETTINGV_01_0045
     * @tc.desc   未登记的公共事件名在 settings 中无键，三种判定一律为假
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingVolume010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010045 begin');
      installStates('0,1,2,0,1');
      const always: boolean = checkAlways('usual.event.NOT_REGISTERED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(always), 'false');
      expect(String(always)).assertEqual('false');
      expect(String(checkOnce('usual.event.NOT_REGISTERED'))).assertEqual('false');
      expect(String(checkNever('usual.event.NOT_REGISTERED'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingVolume010045 end');
    })
  })
}
