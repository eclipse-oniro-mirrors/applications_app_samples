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
import { installStates, validEvents, onceEvents } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function stateVolume02Test(): void {
  describe('StateVolume02Test', () => {

    /**
     * @tc.name   testStateVolume020001
     * @tc.number SUB_CCE_STATEV_02_0001
     * @tc.desc   全组合 五键取值 0,2,2,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020001 begin');
      installStates('0,2,2,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(54));
      expect(result.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020001 end');
    })

    /**
     * @tc.name   testStateVolume020002
     * @tc.number SUB_CCE_STATEV_02_0002
     * @tc.desc   全组合 五键取值 0,2,2,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020002 begin');
      installStates('0,2,2,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020002 end');
    })

    /**
     * @tc.name   testStateVolume020003
     * @tc.number SUB_CCE_STATEV_02_0003
     * @tc.desc   全组合 五键取值 0,2,2,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020003 begin');
      installStates('0,2,2,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020003 end');
    })

    /**
     * @tc.name   testStateVolume020004
     * @tc.number SUB_CCE_STATEV_02_0004
     * @tc.desc   全组合 五键取值 0,2,2,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020004 begin');
      installStates('0,2,2,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020004 end');
    })

    /**
     * @tc.name   testStateVolume020005
     * @tc.number SUB_CCE_STATEV_02_0005
     * @tc.desc   全组合 五键取值 1,0,0,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020005 begin');
      installStates('1,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020005 end');
    })

    /**
     * @tc.name   testStateVolume020006
     * @tc.number SUB_CCE_STATEV_02_0006
     * @tc.desc   全组合 五键取值 1,0,0,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020006 begin');
      installStates('1,0,0,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020006 end');
    })

    /**
     * @tc.name   testStateVolume020007
     * @tc.number SUB_CCE_STATEV_02_0007
     * @tc.desc   全组合 五键取值 1,0,0,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020007 begin');
      installStates('1,0,0,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020007 end');
    })

    /**
     * @tc.name   testStateVolume020008
     * @tc.number SUB_CCE_STATEV_02_0008
     * @tc.desc   全组合 五键取值 1,0,0,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020008 begin');
      installStates('1,0,0,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020008 end');
    })

    /**
     * @tc.name   testStateVolume020009
     * @tc.number SUB_CCE_STATEV_02_0009
     * @tc.desc   全组合 五键取值 1,0,0,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020009 begin');
      installStates('1,0,0,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020009 end');
    })

    /**
     * @tc.name   testStateVolume020010
     * @tc.number SUB_CCE_STATEV_02_0010
     * @tc.desc   全组合 五键取值 1,0,0,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020010 begin');
      installStates('1,0,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020010 end');
    })

    /**
     * @tc.name   testStateVolume020011
     * @tc.number SUB_CCE_STATEV_02_0011
     * @tc.desc   全组合 五键取值 1,0,0,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020011 begin');
      installStates('1,0,0,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020011 end');
    })

    /**
     * @tc.name   testStateVolume020012
     * @tc.number SUB_CCE_STATEV_02_0012
     * @tc.desc   全组合 五键取值 1,0,0,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020012 begin');
      installStates('1,0,0,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020012 end');
    })

    /**
     * @tc.name   testStateVolume020013
     * @tc.number SUB_CCE_STATEV_02_0013
     * @tc.desc   全组合 五键取值 1,0,0,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020013 begin');
      installStates('1,0,0,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020013 end');
    })

    /**
     * @tc.name   testStateVolume020014
     * @tc.number SUB_CCE_STATEV_02_0014
     * @tc.desc   全组合 五键取值 1,0,1,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020014 begin');
      installStates('1,0,1,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020014 end');
    })

    /**
     * @tc.name   testStateVolume020015
     * @tc.number SUB_CCE_STATEV_02_0015
     * @tc.desc   全组合 五键取值 1,0,1,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020015 begin');
      installStates('1,0,1,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020015 end');
    })

    /**
     * @tc.name   testStateVolume020016
     * @tc.number SUB_CCE_STATEV_02_0016
     * @tc.desc   全组合 五键取值 1,0,1,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020016 begin');
      installStates('1,0,1,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020016 end');
    })

    /**
     * @tc.name   testStateVolume020017
     * @tc.number SUB_CCE_STATEV_02_0017
     * @tc.desc   全组合 五键取值 1,0,1,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020017 begin');
      installStates('1,0,1,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020017 end');
    })

    /**
     * @tc.name   testStateVolume020018
     * @tc.number SUB_CCE_STATEV_02_0018
     * @tc.desc   全组合 五键取值 1,0,1,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020018 begin');
      installStates('1,0,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020018 end');
    })

    /**
     * @tc.name   testStateVolume020019
     * @tc.number SUB_CCE_STATEV_02_0019
     * @tc.desc   全组合 五键取值 1,0,1,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020019 begin');
      installStates('1,0,1,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020019 end');
    })

    /**
     * @tc.name   testStateVolume020020
     * @tc.number SUB_CCE_STATEV_02_0020
     * @tc.desc   全组合 五键取值 1,0,1,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020020 begin');
      installStates('1,0,1,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020020 end');
    })

    /**
     * @tc.name   testStateVolume020021
     * @tc.number SUB_CCE_STATEV_02_0021
     * @tc.desc   全组合 五键取值 1,0,1,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020021 begin');
      installStates('1,0,1,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020021 end');
    })

    /**
     * @tc.name   testStateVolume020022
     * @tc.number SUB_CCE_STATEV_02_0022
     * @tc.desc   全组合 五键取值 1,0,1,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020022 begin');
      installStates('1,0,1,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020022 end');
    })

    /**
     * @tc.name   testStateVolume020023
     * @tc.number SUB_CCE_STATEV_02_0023
     * @tc.desc   全组合 五键取值 1,0,2,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020023 begin');
      installStates('1,0,2,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020023 end');
    })

    /**
     * @tc.name   testStateVolume020024
     * @tc.number SUB_CCE_STATEV_02_0024
     * @tc.desc   全组合 五键取值 1,0,2,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020024 begin');
      installStates('1,0,2,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020024 end');
    })

    /**
     * @tc.name   testStateVolume020025
     * @tc.number SUB_CCE_STATEV_02_0025
     * @tc.desc   全组合 五键取值 1,0,2,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020025 begin');
      installStates('1,0,2,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020025 end');
    })

    /**
     * @tc.name   testStateVolume020026
     * @tc.number SUB_CCE_STATEV_02_0026
     * @tc.desc   全组合 五键取值 1,0,2,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020026 begin');
      installStates('1,0,2,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020026 end');
    })

    /**
     * @tc.name   testStateVolume020027
     * @tc.number SUB_CCE_STATEV_02_0027
     * @tc.desc   全组合 五键取值 1,0,2,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020027 begin');
      installStates('1,0,2,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020027 end');
    })

    /**
     * @tc.name   testStateVolume020028
     * @tc.number SUB_CCE_STATEV_02_0028
     * @tc.desc   全组合 五键取值 1,0,2,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020028 begin');
      installStates('1,0,2,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020028 end');
    })

    /**
     * @tc.name   testStateVolume020029
     * @tc.number SUB_CCE_STATEV_02_0029
     * @tc.desc   全组合 五键取值 1,0,2,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020029 begin');
      installStates('1,0,2,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020029 end');
    })

    /**
     * @tc.name   testStateVolume020030
     * @tc.number SUB_CCE_STATEV_02_0030
     * @tc.desc   全组合 五键取值 1,0,2,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020030 begin');
      installStates('1,0,2,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020030 end');
    })

    /**
     * @tc.name   testStateVolume020031
     * @tc.number SUB_CCE_STATEV_02_0031
     * @tc.desc   全组合 五键取值 1,0,2,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020031 begin');
      installStates('1,0,2,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020031 end');
    })

    /**
     * @tc.name   testStateVolume020032
     * @tc.number SUB_CCE_STATEV_02_0032
     * @tc.desc   全组合 五键取值 1,1,0,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020032 begin');
      installStates('1,1,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020032 end');
    })

    /**
     * @tc.name   testStateVolume020033
     * @tc.number SUB_CCE_STATEV_02_0033
     * @tc.desc   全组合 五键取值 1,1,0,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020033 begin');
      installStates('1,1,0,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020033 end');
    })

    /**
     * @tc.name   testStateVolume020034
     * @tc.number SUB_CCE_STATEV_02_0034
     * @tc.desc   全组合 五键取值 1,1,0,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020034 begin');
      installStates('1,1,0,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020034 end');
    })

    /**
     * @tc.name   testStateVolume020035
     * @tc.number SUB_CCE_STATEV_02_0035
     * @tc.desc   全组合 五键取值 1,1,0,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020035 begin');
      installStates('1,1,0,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020035 end');
    })

    /**
     * @tc.name   testStateVolume020036
     * @tc.number SUB_CCE_STATEV_02_0036
     * @tc.desc   全组合 五键取值 1,1,0,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020036 begin');
      installStates('1,1,0,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020036 end');
    })

    /**
     * @tc.name   testStateVolume020037
     * @tc.number SUB_CCE_STATEV_02_0037
     * @tc.desc   全组合 五键取值 1,1,0,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020037 begin');
      installStates('1,1,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020037 end');
    })

    /**
     * @tc.name   testStateVolume020038
     * @tc.number SUB_CCE_STATEV_02_0038
     * @tc.desc   全组合 五键取值 1,1,0,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020038 begin');
      installStates('1,1,0,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020038 end');
    })

    /**
     * @tc.name   testStateVolume020039
     * @tc.number SUB_CCE_STATEV_02_0039
     * @tc.desc   全组合 五键取值 1,1,0,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020039 begin');
      installStates('1,1,0,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020039 end');
    })

    /**
     * @tc.name   testStateVolume020040
     * @tc.number SUB_CCE_STATEV_02_0040
     * @tc.desc   全组合 五键取值 1,1,0,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020040 begin');
      installStates('1,1,0,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020040 end');
    })

    /**
     * @tc.name   testStateVolume020041
     * @tc.number SUB_CCE_STATEV_02_0041
     * @tc.desc   全组合 五键取值 1,1,1,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020041 begin');
      installStates('1,1,1,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020041 end');
    })

    /**
     * @tc.name   testStateVolume020042
     * @tc.number SUB_CCE_STATEV_02_0042
     * @tc.desc   全组合 五键取值 1,1,1,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020042 begin');
      installStates('1,1,1,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020042 end');
    })

    /**
     * @tc.name   testStateVolume020043
     * @tc.number SUB_CCE_STATEV_02_0043
     * @tc.desc   全组合 五键取值 1,1,1,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020043 begin');
      installStates('1,1,1,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020043 end');
    })

    /**
     * @tc.name   testStateVolume020044
     * @tc.number SUB_CCE_STATEV_02_0044
     * @tc.desc   全组合 五键取值 1,1,1,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020044 begin');
      installStates('1,1,1,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020044 end');
    })

    /**
     * @tc.name   testStateVolume020045
     * @tc.number SUB_CCE_STATEV_02_0045
     * @tc.desc   全组合 五键取值 1,1,1,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020045 begin');
      installStates('1,1,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020045 end');
    })

    /**
     * @tc.name   testStateVolume020046
     * @tc.number SUB_CCE_STATEV_02_0046
     * @tc.desc   全组合 五键取值 1,1,1,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020046 begin');
      installStates('1,1,1,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020046 end');
    })

    /**
     * @tc.name   testStateVolume020047
     * @tc.number SUB_CCE_STATEV_02_0047
     * @tc.desc   全组合 五键取值 1,1,1,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020047 begin');
      installStates('1,1,1,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020047 end');
    })

    /**
     * @tc.name   testStateVolume020048
     * @tc.number SUB_CCE_STATEV_02_0048
     * @tc.desc   全组合 五键取值 1,1,1,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020048 begin');
      installStates('1,1,1,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020048 end');
    })

    /**
     * @tc.name   testStateVolume020049
     * @tc.number SUB_CCE_STATEV_02_0049
     * @tc.desc   全组合 五键取值 1,1,1,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020049 begin');
      installStates('1,1,1,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020049 end');
    })

    /**
     * @tc.name   testStateVolume020050
     * @tc.number SUB_CCE_STATEV_02_0050
     * @tc.desc   全组合 五键取值 1,1,2,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020050 begin');
      installStates('1,1,2,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020050 end');
    })

    /**
     * @tc.name   testStateVolume020051
     * @tc.number SUB_CCE_STATEV_02_0051
     * @tc.desc   全组合 五键取值 1,1,2,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020051 begin');
      installStates('1,1,2,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020051 end');
    })

    /**
     * @tc.name   testStateVolume020052
     * @tc.number SUB_CCE_STATEV_02_0052
     * @tc.desc   全组合 五键取值 1,1,2,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020052 begin');
      installStates('1,1,2,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020052 end');
    })

    /**
     * @tc.name   testStateVolume020053
     * @tc.number SUB_CCE_STATEV_02_0053
     * @tc.desc   全组合 五键取值 1,1,2,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020053 begin');
      installStates('1,1,2,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020053 end');
    })

    /**
     * @tc.name   testStateVolume020054
     * @tc.number SUB_CCE_STATEV_02_0054
     * @tc.desc   全组合 五键取值 1,1,2,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020054 begin');
      installStates('1,1,2,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020054 end');
    })

    /**
     * @tc.name   testStateVolume020055
     * @tc.number SUB_CCE_STATEV_02_0055
     * @tc.desc   全组合 五键取值 1,1,2,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020055 begin');
      installStates('1,1,2,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020055 end');
    })

    /**
     * @tc.name   testStateVolume020056
     * @tc.number SUB_CCE_STATEV_02_0056
     * @tc.desc   全组合 五键取值 1,1,2,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020056 begin');
      installStates('1,1,2,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020056 end');
    })

    /**
     * @tc.name   testStateVolume020057
     * @tc.number SUB_CCE_STATEV_02_0057
     * @tc.desc   全组合 五键取值 1,1,2,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020057 begin');
      installStates('1,1,2,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020057 end');
    })

    /**
     * @tc.name   testStateVolume020058
     * @tc.number SUB_CCE_STATEV_02_0058
     * @tc.desc   全组合 五键取值 1,1,2,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020058 begin');
      installStates('1,1,2,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020058 end');
    })

    /**
     * @tc.name   testStateVolume020059
     * @tc.number SUB_CCE_STATEV_02_0059
     * @tc.desc   全组合 五键取值 1,2,0,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020059 begin');
      installStates('1,2,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020059 end');
    })

    /**
     * @tc.name   testStateVolume020060
     * @tc.number SUB_CCE_STATEV_02_0060
     * @tc.desc   全组合 五键取值 1,2,0,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020060 begin');
      installStates('1,2,0,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020060 end');
    })

    /**
     * @tc.name   testStateVolume020061
     * @tc.number SUB_CCE_STATEV_02_0061
     * @tc.desc   全组合 五键取值 1,2,0,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020061 begin');
      installStates('1,2,0,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020061 end');
    })

    /**
     * @tc.name   testStateVolume020062
     * @tc.number SUB_CCE_STATEV_02_0062
     * @tc.desc   全组合 五键取值 1,2,0,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020062 begin');
      installStates('1,2,0,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020062 end');
    })

    /**
     * @tc.name   testStateVolume020063
     * @tc.number SUB_CCE_STATEV_02_0063
     * @tc.desc   全组合 五键取值 1,2,0,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020063 begin');
      installStates('1,2,0,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020063 end');
    })

    /**
     * @tc.name   testStateVolume020064
     * @tc.number SUB_CCE_STATEV_02_0064
     * @tc.desc   全组合 五键取值 1,2,0,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020064 begin');
      installStates('1,2,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020064 end');
    })

    /**
     * @tc.name   testStateVolume020065
     * @tc.number SUB_CCE_STATEV_02_0065
     * @tc.desc   全组合 五键取值 1,2,0,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020065 begin');
      installStates('1,2,0,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020065 end');
    })

    /**
     * @tc.name   testStateVolume020066
     * @tc.number SUB_CCE_STATEV_02_0066
     * @tc.desc   全组合 五键取值 1,2,0,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020066 begin');
      installStates('1,2,0,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020066 end');
    })

    /**
     * @tc.name   testStateVolume020067
     * @tc.number SUB_CCE_STATEV_02_0067
     * @tc.desc   全组合 五键取值 1,2,0,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020067 begin');
      installStates('1,2,0,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020067 end');
    })

    /**
     * @tc.name   testStateVolume020068
     * @tc.number SUB_CCE_STATEV_02_0068
     * @tc.desc   全组合 五键取值 1,2,1,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020068 begin');
      installStates('1,2,1,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020068 end');
    })

    /**
     * @tc.name   testStateVolume020069
     * @tc.number SUB_CCE_STATEV_02_0069
     * @tc.desc   全组合 五键取值 1,2,1,0,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020069 begin');
      installStates('1,2,1,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020069 end');
    })

    /**
     * @tc.name   testStateVolume020070
     * @tc.number SUB_CCE_STATEV_02_0070
     * @tc.desc   全组合 五键取值 1,2,1,0,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020070 begin');
      installStates('1,2,1,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020070 end');
    })

    /**
     * @tc.name   testStateVolume020071
     * @tc.number SUB_CCE_STATEV_02_0071
     * @tc.desc   全组合 五键取值 1,2,1,1,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020071 begin');
      installStates('1,2,1,1,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020071 end');
    })

    /**
     * @tc.name   testStateVolume020072
     * @tc.number SUB_CCE_STATEV_02_0072
     * @tc.desc   全组合 五键取值 1,2,1,1,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020072 begin');
      installStates('1,2,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020072 end');
    })

    /**
     * @tc.name   testStateVolume020073
     * @tc.number SUB_CCE_STATEV_02_0073
     * @tc.desc   全组合 五键取值 1,2,1,1,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020073 begin');
      installStates('1,2,1,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020073 end');
    })

    /**
     * @tc.name   testStateVolume020074
     * @tc.number SUB_CCE_STATEV_02_0074
     * @tc.desc   全组合 五键取值 1,2,1,2,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020074 begin');
      installStates('1,2,1,2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020074 end');
    })

    /**
     * @tc.name   testStateVolume020075
     * @tc.number SUB_CCE_STATEV_02_0075
     * @tc.desc   全组合 五键取值 1,2,1,2,1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020075 begin');
      installStates('1,2,1,2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020075 end');
    })

    /**
     * @tc.name   testStateVolume020076
     * @tc.number SUB_CCE_STATEV_02_0076
     * @tc.desc   全组合 五键取值 1,2,1,2,2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020076 begin');
      installStates('1,2,1,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020076 end');
    })

    /**
     * @tc.name   testStateVolume020077
     * @tc.number SUB_CCE_STATEV_02_0077
     * @tc.desc   全组合 五键取值 1,2,2,0,0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020077 begin');
      installStates('1,2,2,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(82));
      expect(result.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020077 end');
    })

    /**
     * @tc.name   testStateVolume020078
     * @tc.number SUB_CCE_STATEV_02_0078
     * @tc.desc   第4键为越界值 99 时有效事件长度等于四键拼接长度
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume020078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020078 begin');
      installStates('0,0,0,99,0');
      const valid: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', valid, 'usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      expect(valid).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      expect(valid.length).assertEqual(101);
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume020078 end');
    })
  })
}
