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

export default function stateVolume14Test(): void {
  describe('StateVolume14Test', () => {

    /**
     * @tc.name   testStateVolume140001
     * @tc.number SUB_CCE_STATEV_14_0001
     * @tc.desc   键取值 [-3,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140001 begin');
      installStates('-3,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140001 end');
    })

    /**
     * @tc.name   testStateVolume140002
     * @tc.number SUB_CCE_STATEV_14_0002
     * @tc.desc   键取值 [0,-3,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140002 begin');
      installStates('0,-3,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140002 end');
    })

    /**
     * @tc.name   testStateVolume140003
     * @tc.number SUB_CCE_STATEV_14_0003
     * @tc.desc   键取值 [0,0,-3,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140003 begin');
      installStates('0,0,-3,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140003 end');
    })

    /**
     * @tc.name   testStateVolume140004
     * @tc.number SUB_CCE_STATEV_14_0004
     * @tc.desc   键取值 [0,0,0,-3,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140004 begin');
      installStates('0,0,0,-3,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140004 end');
    })

    /**
     * @tc.name   testStateVolume140005
     * @tc.number SUB_CCE_STATEV_14_0005
     * @tc.desc   键取值 [0,0,0,0,-3]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140005 begin');
      installStates('0,0,0,0,-3');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140005 end');
    })

    /**
     * @tc.name   testStateVolume140006
     * @tc.number SUB_CCE_STATEV_14_0006
     * @tc.desc   键取值 [6,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140006 begin');
      installStates('6,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140006 end');
    })

    /**
     * @tc.name   testStateVolume140007
     * @tc.number SUB_CCE_STATEV_14_0007
     * @tc.desc   键取值 [0,6,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140007 begin');
      installStates('0,6,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140007 end');
    })

    /**
     * @tc.name   testStateVolume140008
     * @tc.number SUB_CCE_STATEV_14_0008
     * @tc.desc   键取值 [0,0,6,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140008 begin');
      installStates('0,0,6,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140008 end');
    })

    /**
     * @tc.name   testStateVolume140009
     * @tc.number SUB_CCE_STATEV_14_0009
     * @tc.desc   键取值 [0,0,0,6,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140009 begin');
      installStates('0,0,0,6,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140009 end');
    })

    /**
     * @tc.name   testStateVolume140010
     * @tc.number SUB_CCE_STATEV_14_0010
     * @tc.desc   键取值 [0,0,0,0,6]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140010 begin');
      installStates('0,0,0,0,6');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140010 end');
    })

    /**
     * @tc.name   testStateVolume140011
     * @tc.number SUB_CCE_STATEV_14_0011
     * @tc.desc   键取值 [7,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140011 begin');
      installStates('7,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140011 end');
    })

    /**
     * @tc.name   testStateVolume140012
     * @tc.number SUB_CCE_STATEV_14_0012
     * @tc.desc   键取值 [0,7,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140012 begin');
      installStates('0,7,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140012 end');
    })

    /**
     * @tc.name   testStateVolume140013
     * @tc.number SUB_CCE_STATEV_14_0013
     * @tc.desc   键取值 [0,0,7,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140013 begin');
      installStates('0,0,7,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140013 end');
    })

    /**
     * @tc.name   testStateVolume140014
     * @tc.number SUB_CCE_STATEV_14_0014
     * @tc.desc   键取值 [0,0,0,7,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140014 begin');
      installStates('0,0,0,7,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140014 end');
    })

    /**
     * @tc.name   testStateVolume140015
     * @tc.number SUB_CCE_STATEV_14_0015
     * @tc.desc   键取值 [0,0,0,0,7]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140015 begin');
      installStates('0,0,0,0,7');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140015 end');
    })

    /**
     * @tc.name   testStateVolume140016
     * @tc.number SUB_CCE_STATEV_14_0016
     * @tc.desc   键取值 [8,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140016 begin');
      installStates('8,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140016 end');
    })

    /**
     * @tc.name   testStateVolume140017
     * @tc.number SUB_CCE_STATEV_14_0017
     * @tc.desc   键取值 [0,8,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140017 begin');
      installStates('0,8,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140017 end');
    })

    /**
     * @tc.name   testStateVolume140018
     * @tc.number SUB_CCE_STATEV_14_0018
     * @tc.desc   键取值 [0,0,8,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140018 begin');
      installStates('0,0,8,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140018 end');
    })

    /**
     * @tc.name   testStateVolume140019
     * @tc.number SUB_CCE_STATEV_14_0019
     * @tc.desc   键取值 [0,0,0,8,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140019 begin');
      installStates('0,0,0,8,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140019 end');
    })

    /**
     * @tc.name   testStateVolume140020
     * @tc.number SUB_CCE_STATEV_14_0020
     * @tc.desc   键取值 [0,0,0,0,8]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140020 begin');
      installStates('0,0,0,0,8');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140020 end');
    })

    /**
     * @tc.name   testStateVolume140021
     * @tc.number SUB_CCE_STATEV_14_0021
     * @tc.desc   键取值 [11,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140021 begin');
      installStates('11,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140021 end');
    })

    /**
     * @tc.name   testStateVolume140022
     * @tc.number SUB_CCE_STATEV_14_0022
     * @tc.desc   键取值 [0,11,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140022 begin');
      installStates('0,11,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140022 end');
    })

    /**
     * @tc.name   testStateVolume140023
     * @tc.number SUB_CCE_STATEV_14_0023
     * @tc.desc   键取值 [0,0,11,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140023 begin');
      installStates('0,0,11,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140023 end');
    })

    /**
     * @tc.name   testStateVolume140024
     * @tc.number SUB_CCE_STATEV_14_0024
     * @tc.desc   键取值 [0,0,0,11,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140024 begin');
      installStates('0,0,0,11,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140024 end');
    })

    /**
     * @tc.name   testStateVolume140025
     * @tc.number SUB_CCE_STATEV_14_0025
     * @tc.desc   键取值 [0,0,0,0,11]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140025 begin');
      installStates('0,0,0,0,11');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140025 end');
    })

    /**
     * @tc.name   testStateVolume140026
     * @tc.number SUB_CCE_STATEV_14_0026
     * @tc.desc   键取值 [20,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140026 begin');
      installStates('20,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140026 end');
    })

    /**
     * @tc.name   testStateVolume140027
     * @tc.number SUB_CCE_STATEV_14_0027
     * @tc.desc   键取值 [0,20,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140027 begin');
      installStates('0,20,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140027 end');
    })

    /**
     * @tc.name   testStateVolume140028
     * @tc.number SUB_CCE_STATEV_14_0028
     * @tc.desc   键取值 [0,0,20,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140028 begin');
      installStates('0,0,20,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140028 end');
    })

    /**
     * @tc.name   testStateVolume140029
     * @tc.number SUB_CCE_STATEV_14_0029
     * @tc.desc   键取值 [0,0,0,20,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140029 begin');
      installStates('0,0,0,20,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140029 end');
    })

    /**
     * @tc.name   testStateVolume140030
     * @tc.number SUB_CCE_STATEV_14_0030
     * @tc.desc   键取值 [0,0,0,0,20]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140030 begin');
      installStates('0,0,0,0,20');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140030 end');
    })

    /**
     * @tc.name   testStateVolume140031
     * @tc.number SUB_CCE_STATEV_14_0031
     * @tc.desc   键取值 [30,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140031 begin');
      installStates('30,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140031 end');
    })

    /**
     * @tc.name   testStateVolume140032
     * @tc.number SUB_CCE_STATEV_14_0032
     * @tc.desc   键取值 [0,30,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140032 begin');
      installStates('0,30,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140032 end');
    })

    /**
     * @tc.name   testStateVolume140033
     * @tc.number SUB_CCE_STATEV_14_0033
     * @tc.desc   键取值 [0,0,30,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140033 begin');
      installStates('0,0,30,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140033 end');
    })

    /**
     * @tc.name   testStateVolume140034
     * @tc.number SUB_CCE_STATEV_14_0034
     * @tc.desc   键取值 [0,0,0,30,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140034 begin');
      installStates('0,0,0,30,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140034 end');
    })

    /**
     * @tc.name   testStateVolume140035
     * @tc.number SUB_CCE_STATEV_14_0035
     * @tc.desc   键取值 [0,0,0,0,30]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140035 begin');
      installStates('0,0,0,0,30');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140035 end');
    })

    /**
     * @tc.name   testStateVolume140036
     * @tc.number SUB_CCE_STATEV_14_0036
     * @tc.desc   键取值 [200,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140036 begin');
      installStates('200,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140036 end');
    })

    /**
     * @tc.name   testStateVolume140037
     * @tc.number SUB_CCE_STATEV_14_0037
     * @tc.desc   键取值 [0,200,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140037 begin');
      installStates('0,200,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140037 end');
    })

    /**
     * @tc.name   testStateVolume140038
     * @tc.number SUB_CCE_STATEV_14_0038
     * @tc.desc   键取值 [0,0,200,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140038 begin');
      installStates('0,0,200,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140038 end');
    })

    /**
     * @tc.name   testStateVolume140039
     * @tc.number SUB_CCE_STATEV_14_0039
     * @tc.desc   键取值 [0,0,0,200,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140039 begin');
      installStates('0,0,0,200,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140039 end');
    })

    /**
     * @tc.name   testStateVolume140040
     * @tc.number SUB_CCE_STATEV_14_0040
     * @tc.desc   键取值 [0,0,0,0,200]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140040 begin');
      installStates('0,0,0,0,200');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140040 end');
    })

    /**
     * @tc.name   testStateVolume140041
     * @tc.number SUB_CCE_STATEV_14_0041
     * @tc.desc   键取值 [-5,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140041 begin');
      installStates('-5,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140041 end');
    })

    /**
     * @tc.name   testStateVolume140042
     * @tc.number SUB_CCE_STATEV_14_0042
     * @tc.desc   键取值 [0,-5,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140042 begin');
      installStates('0,-5,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140042 end');
    })

    /**
     * @tc.name   testStateVolume140043
     * @tc.number SUB_CCE_STATEV_14_0043
     * @tc.desc   键取值 [0,0,-5,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140043 begin');
      installStates('0,0,-5,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140043 end');
    })

    /**
     * @tc.name   testStateVolume140044
     * @tc.number SUB_CCE_STATEV_14_0044
     * @tc.desc   键取值 [0,0,0,-5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140044 begin');
      installStates('0,0,0,-5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140044 end');
    })

    /**
     * @tc.name   testStateVolume140045
     * @tc.number SUB_CCE_STATEV_14_0045
     * @tc.desc   键取值 [0,0,0,0,-5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140045 begin');
      installStates('0,0,0,0,-5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140045 end');
    })

    /**
     * @tc.name   testStateVolume140046
     * @tc.number SUB_CCE_STATEV_14_0046
     * @tc.desc   键取值 [-3,1,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140046 begin');
      installStates('-3,1,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140046 end');
    })

    /**
     * @tc.name   testStateVolume140047
     * @tc.number SUB_CCE_STATEV_14_0047
     * @tc.desc   键取值 [1,-3,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140047 begin');
      installStates('1,-3,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140047 end');
    })

    /**
     * @tc.name   testStateVolume140048
     * @tc.number SUB_CCE_STATEV_14_0048
     * @tc.desc   键取值 [1,1,-3,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140048 begin');
      installStates('1,1,-3,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140048 end');
    })

    /**
     * @tc.name   testStateVolume140049
     * @tc.number SUB_CCE_STATEV_14_0049
     * @tc.desc   键取值 [1,1,1,-3,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140049 begin');
      installStates('1,1,1,-3,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140049 end');
    })

    /**
     * @tc.name   testStateVolume140050
     * @tc.number SUB_CCE_STATEV_14_0050
     * @tc.desc   键取值 [1,1,1,1,-3]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140050 begin');
      installStates('1,1,1,1,-3');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140050 end');
    })

    /**
     * @tc.name   testStateVolume140051
     * @tc.number SUB_CCE_STATEV_14_0051
     * @tc.desc   键取值 [6,1,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140051 begin');
      installStates('6,1,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140051 end');
    })

    /**
     * @tc.name   testStateVolume140052
     * @tc.number SUB_CCE_STATEV_14_0052
     * @tc.desc   键取值 [1,6,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140052 begin');
      installStates('1,6,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140052 end');
    })

    /**
     * @tc.name   testStateVolume140053
     * @tc.number SUB_CCE_STATEV_14_0053
     * @tc.desc   键取值 [1,1,6,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140053 begin');
      installStates('1,1,6,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140053 end');
    })

    /**
     * @tc.name   testStateVolume140054
     * @tc.number SUB_CCE_STATEV_14_0054
     * @tc.desc   键取值 [1,1,1,6,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140054 begin');
      installStates('1,1,1,6,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140054 end');
    })

    /**
     * @tc.name   testStateVolume140055
     * @tc.number SUB_CCE_STATEV_14_0055
     * @tc.desc   键取值 [1,1,1,1,6]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140055 begin');
      installStates('1,1,1,1,6');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140055 end');
    })

    /**
     * @tc.name   testStateVolume140056
     * @tc.number SUB_CCE_STATEV_14_0056
     * @tc.desc   键取值 [20,1,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140056 begin');
      installStates('20,1,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140056 end');
    })

    /**
     * @tc.name   testStateVolume140057
     * @tc.number SUB_CCE_STATEV_14_0057
     * @tc.desc   键取值 [1,20,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140057 begin');
      installStates('1,20,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140057 end');
    })

    /**
     * @tc.name   testStateVolume140058
     * @tc.number SUB_CCE_STATEV_14_0058
     * @tc.desc   键取值 [1,1,20,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140058 begin');
      installStates('1,1,20,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140058 end');
    })

    /**
     * @tc.name   testStateVolume140059
     * @tc.number SUB_CCE_STATEV_14_0059
     * @tc.desc   键取值 [1,1,1,20,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140059 begin');
      installStates('1,1,1,20,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140059 end');
    })

    /**
     * @tc.name   testStateVolume140060
     * @tc.number SUB_CCE_STATEV_14_0060
     * @tc.desc   键取值 [1,1,1,1,20]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140060 begin');
      installStates('1,1,1,1,20');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140060 end');
    })

    /**
     * @tc.name   testStateVolume140061
     * @tc.number SUB_CCE_STATEV_14_0061
     * @tc.desc   键取值 [-3,-3,-3,-3,-3]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140061 begin');
      installStates('-3,-3,-3,-3,-3');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140061 end');
    })

    /**
     * @tc.name   testStateVolume140062
     * @tc.number SUB_CCE_STATEV_14_0062
     * @tc.desc   键取值 [6,6,6,6,6]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140062 begin');
      installStates('6,6,6,6,6');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140062 end');
    })

    /**
     * @tc.name   testStateVolume140063
     * @tc.number SUB_CCE_STATEV_14_0063
     * @tc.desc   键取值 [-5,-5,-5,-5,-5]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140063 begin');
      installStates('-5,-5,-5,-5,-5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140063 end');
    })

    /**
     * @tc.name   testStateVolume140064
     * @tc.number SUB_CCE_STATEV_14_0064
     * @tc.desc   键取值 [200,200,200,200,200]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140064 begin');
      installStates('200,200,200,200,200');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140064 end');
    })

    /**
     * @tc.name   testStateVolume140065
     * @tc.number SUB_CCE_STATEV_14_0065
     * @tc.desc   键取值 [0,0.25,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140065 begin');
      installStates('0,0.25,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140065 end');
    })

    /**
     * @tc.name   testStateVolume140066
     * @tc.number SUB_CCE_STATEV_14_0066
     * @tc.desc   键取值 [0,0,0.25,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140066 begin');
      installStates('0,0,0.25,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140066 end');
    })

    /**
     * @tc.name   testStateVolume140067
     * @tc.number SUB_CCE_STATEV_14_0067
     * @tc.desc   键取值 [0,0.75,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140067 begin');
      installStates('0,0.75,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140067 end');
    })

    /**
     * @tc.name   testStateVolume140068
     * @tc.number SUB_CCE_STATEV_14_0068
     * @tc.desc   键取值 [0,0,0.75,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140068 begin');
      installStates('0,0,0.75,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140068 end');
    })

    /**
     * @tc.name   testStateVolume140069
     * @tc.number SUB_CCE_STATEV_14_0069
     * @tc.desc   键取值 [0,1.25,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140069 begin');
      installStates('0,1.25,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140069 end');
    })

    /**
     * @tc.name   testStateVolume140070
     * @tc.number SUB_CCE_STATEV_14_0070
     * @tc.desc   键取值 [0,0,1.25,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140070 begin');
      installStates('0,0,1.25,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140070 end');
    })

    /**
     * @tc.name   testStateVolume140071
     * @tc.number SUB_CCE_STATEV_14_0071
     * @tc.desc   键取值 [0,3.5,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140071 begin');
      installStates('0,3.5,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140071 end');
    })

    /**
     * @tc.name   testStateVolume140072
     * @tc.number SUB_CCE_STATEV_14_0072
     * @tc.desc   键取值 [0,0,3.5,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140072 begin');
      installStates('0,0,3.5,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140072 end');
    })

    /**
     * @tc.name   testStateVolume140073
     * @tc.number SUB_CCE_STATEV_14_0073
     * @tc.desc   键取值 [0,-1.5,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140073 begin');
      installStates('0,-1.5,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140073 end');
    })

    /**
     * @tc.name   testStateVolume140074
     * @tc.number SUB_CCE_STATEV_14_0074
     * @tc.desc   键取值 [0,0,-1.5,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140074 begin');
      installStates('0,0,-1.5,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140074 end');
    })

    /**
     * @tc.name   testStateVolume140075
     * @tc.number SUB_CCE_STATEV_14_0075
     * @tc.desc   键取值 [0,0,0,-1.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140075 begin');
      installStates('0,0,0,-1.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140075 end');
    })

    /**
     * @tc.name   testStateVolume140076
     * @tc.number SUB_CCE_STATEV_14_0076
     * @tc.desc   键取值 [0,0,-0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140076 begin');
      installStates('0,0,-0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140076 end');
    })

    /**
     * @tc.name   testStateVolume140077
     * @tc.number SUB_CCE_STATEV_14_0077
     * @tc.desc   键取值 [0,0,0,-0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140077 begin');
      installStates('0,0,0,-0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140077 end');
    })

    /**
     * @tc.name   testStateVolume140078
     * @tc.number SUB_CCE_STATEV_14_0078
     * @tc.desc   键取值 [-0,-0,-0,-0,-0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140078 begin');
      installStates('-0,-0,-0,-0,-0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140078 end');
    })

    /**
     * @tc.name   testStateVolume140079
     * @tc.number SUB_CCE_STATEV_14_0079
     * @tc.desc   '-0' 与非法 4 交替时 -0===0 命中 case 0 入有效表，4 键忽略
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume140079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140079 begin');
      installStates('-0,4,-0,4,-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', validEvents(), 'usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      expect(validEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', onceEvents(), '');
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(validEvents().length), String(78));
      expect(validEvents().length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume140079 end');
    })
  })
}
