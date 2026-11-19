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
import { installStatesSparse, validEvents, onceEvents } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function stateVolume16Test(): void {
  describe('StateVolume16Test', () => {

    /**
     * @tc.name   testStateVolume160001
     * @tc.number SUB_CCE_STATEV_16_0001
     * @tc.desc   键取值 [0.5,1.5,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160001 begin');
      installStatesSparse('0.5,1.5,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(75));
      expect(result.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160001 end');
    })

    /**
     * @tc.name   testStateVolume160002
     * @tc.number SUB_CCE_STATEV_16_0002
     * @tc.desc   键取值 [0.5,0,1.5,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160002 begin');
      installStatesSparse('0.5,0,1.5,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160002 end');
    })

    /**
     * @tc.name   testStateVolume160003
     * @tc.number SUB_CCE_STATEV_16_0003
     * @tc.desc   键取值 [0.5,0,0,1.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160003 begin');
      installStatesSparse('0.5,0,0,1.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      expect(result.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160003 end');
    })

    /**
     * @tc.name   testStateVolume160004
     * @tc.number SUB_CCE_STATEV_16_0004
     * @tc.desc   键取值 [0.5,0,0,0,1.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160004 begin');
      installStatesSparse('0.5,0,0,0,1.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(70));
      expect(result.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160004 end');
    })

    /**
     * @tc.name   testStateVolume160005
     * @tc.number SUB_CCE_STATEV_16_0005
     * @tc.desc   键取值 [0,0.5,1.5,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160005 begin');
      installStatesSparse('0,0.5,1.5,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(82));
      expect(result.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160005 end');
    })

    /**
     * @tc.name   testStateVolume160006
     * @tc.number SUB_CCE_STATEV_16_0006
     * @tc.desc   键取值 [0,0.5,0,1.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160006 begin');
      installStatesSparse('0,0.5,0,1.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160006 end');
    })

    /**
     * @tc.name   testStateVolume160007
     * @tc.number SUB_CCE_STATEV_16_0007
     * @tc.desc   键取值 [0,0.5,0,0,1.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160007 begin');
      installStatesSparse('0,0.5,0,0,1.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160007 end');
    })

    /**
     * @tc.name   testStateVolume160008
     * @tc.number SUB_CCE_STATEV_16_0008
     * @tc.desc   键取值 [0,0,0.5,1.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160008 begin');
      installStatesSparse('0,0,0.5,1.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160008 end');
    })

    /**
     * @tc.name   testStateVolume160009
     * @tc.number SUB_CCE_STATEV_16_0009
     * @tc.desc   键取值 [0,0,0.5,0,1.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160009 begin');
      installStatesSparse('0,0,0.5,0,1.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160009 end');
    })

    /**
     * @tc.name   testStateVolume160010
     * @tc.number SUB_CCE_STATEV_16_0010
     * @tc.desc   键取值 [0,0,0,0.5,1.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160010 begin');
      installStatesSparse('0,0,0,0.5,1.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160010 end');
    })

    /**
     * @tc.name   testStateVolume160011
     * @tc.number SUB_CCE_STATEV_16_0011
     * @tc.desc   键取值 [0.25,-0.75,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160011 begin');
      installStatesSparse('0.25,-0.75,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(75));
      expect(result.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160011 end');
    })

    /**
     * @tc.name   testStateVolume160012
     * @tc.number SUB_CCE_STATEV_16_0012
     * @tc.desc   键取值 [0.25,0,-0.75,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160012 begin');
      installStatesSparse('0.25,0,-0.75,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160012 end');
    })

    /**
     * @tc.name   testStateVolume160013
     * @tc.number SUB_CCE_STATEV_16_0013
     * @tc.desc   键取值 [0.25,0,0,-0.75,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160013 begin');
      installStatesSparse('0.25,0,0,-0.75,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      expect(result.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160013 end');
    })

    /**
     * @tc.name   testStateVolume160014
     * @tc.number SUB_CCE_STATEV_16_0014
     * @tc.desc   键取值 [0.25,0,0,0,-0.75]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160014 begin');
      installStatesSparse('0.25,0,0,0,-0.75');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(70));
      expect(result.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160014 end');
    })

    /**
     * @tc.name   testStateVolume160015
     * @tc.number SUB_CCE_STATEV_16_0015
     * @tc.desc   键取值 [0,0.25,-0.75,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160015 begin');
      installStatesSparse('0,0.25,-0.75,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(82));
      expect(result.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160015 end');
    })

    /**
     * @tc.name   testStateVolume160016
     * @tc.number SUB_CCE_STATEV_16_0016
     * @tc.desc   键取值 [0,0.25,0,-0.75,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160016 begin');
      installStatesSparse('0,0.25,0,-0.75,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160016 end');
    })

    /**
     * @tc.name   testStateVolume160017
     * @tc.number SUB_CCE_STATEV_16_0017
     * @tc.desc   键取值 [0,0.25,0,0,-0.75]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160017 begin');
      installStatesSparse('0,0.25,0,0,-0.75');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160017 end');
    })

    /**
     * @tc.name   testStateVolume160018
     * @tc.number SUB_CCE_STATEV_16_0018
     * @tc.desc   键取值 [0,0,0.25,-0.75,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160018 begin');
      installStatesSparse('0,0,0.25,-0.75,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160018 end');
    })

    /**
     * @tc.name   testStateVolume160019
     * @tc.number SUB_CCE_STATEV_16_0019
     * @tc.desc   键取值 [0,0,0.25,0,-0.75]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160019 begin');
      installStatesSparse('0,0,0.25,0,-0.75');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160019 end');
    })

    /**
     * @tc.name   testStateVolume160020
     * @tc.number SUB_CCE_STATEV_16_0020
     * @tc.desc   键取值 [0,0,0,0.25,-0.75]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160020 begin');
      installStatesSparse('0,0,0,0.25,-0.75');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160020 end');
    })

    /**
     * @tc.name   testStateVolume160021
     * @tc.number SUB_CCE_STATEV_16_0021
     * @tc.desc   键取值 [2.5,3.5,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160021 begin');
      installStatesSparse('2.5,3.5,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(75));
      expect(result.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160021 end');
    })

    /**
     * @tc.name   testStateVolume160022
     * @tc.number SUB_CCE_STATEV_16_0022
     * @tc.desc   键取值 [2.5,0,3.5,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160022 begin');
      installStatesSparse('2.5,0,3.5,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160022 end');
    })

    /**
     * @tc.name   testStateVolume160023
     * @tc.number SUB_CCE_STATEV_16_0023
     * @tc.desc   键取值 [2.5,0,0,3.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160023 begin');
      installStatesSparse('2.5,0,0,3.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      expect(result.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160023 end');
    })

    /**
     * @tc.name   testStateVolume160024
     * @tc.number SUB_CCE_STATEV_16_0024
     * @tc.desc   键取值 [2.5,0,0,0,3.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160024 begin');
      installStatesSparse('2.5,0,0,0,3.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(70));
      expect(result.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160024 end');
    })

    /**
     * @tc.name   testStateVolume160025
     * @tc.number SUB_CCE_STATEV_16_0025
     * @tc.desc   键取值 [0,2.5,3.5,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160025 begin');
      installStatesSparse('0,2.5,3.5,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(82));
      expect(result.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160025 end');
    })

    /**
     * @tc.name   testStateVolume160026
     * @tc.number SUB_CCE_STATEV_16_0026
     * @tc.desc   键取值 [0,2.5,0,3.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160026 begin');
      installStatesSparse('0,2.5,0,3.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160026 end');
    })

    /**
     * @tc.name   testStateVolume160027
     * @tc.number SUB_CCE_STATEV_16_0027
     * @tc.desc   键取值 [0,2.5,0,0,3.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160027 begin');
      installStatesSparse('0,2.5,0,0,3.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160027 end');
    })

    /**
     * @tc.name   testStateVolume160028
     * @tc.number SUB_CCE_STATEV_16_0028
     * @tc.desc   键取值 [0,0,2.5,3.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160028 begin');
      installStatesSparse('0,0,2.5,3.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160028 end');
    })

    /**
     * @tc.name   testStateVolume160029
     * @tc.number SUB_CCE_STATEV_16_0029
     * @tc.desc   键取值 [0,0,2.5,0,3.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160029 begin');
      installStatesSparse('0,0,2.5,0,3.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160029 end');
    })

    /**
     * @tc.name   testStateVolume160030
     * @tc.number SUB_CCE_STATEV_16_0030
     * @tc.desc   键取值 [0,0,0,2.5,3.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160030 begin');
      installStatesSparse('0,0,0,2.5,3.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160030 end');
    })

    /**
     * @tc.name   testStateVolume160031
     * @tc.number SUB_CCE_STATEV_16_0031
     * @tc.desc   键取值 [0.5,NaN,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160031 begin');
      installStatesSparse('0.5,NaN,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(75));
      expect(result.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160031 end');
    })

    /**
     * @tc.name   testStateVolume160032
     * @tc.number SUB_CCE_STATEV_16_0032
     * @tc.desc   键取值 [0.5,0,NaN,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160032 begin');
      installStatesSparse('0.5,0,NaN,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160032 end');
    })

    /**
     * @tc.name   testStateVolume160033
     * @tc.number SUB_CCE_STATEV_16_0033
     * @tc.desc   键取值 [0.5,0,0,NaN,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160033 begin');
      installStatesSparse('0.5,0,0,NaN,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      expect(result.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160033 end');
    })

    /**
     * @tc.name   testStateVolume160034
     * @tc.number SUB_CCE_STATEV_16_0034
     * @tc.desc   键取值 [0.5,0,0,0,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160034 begin');
      installStatesSparse('0.5,0,0,0,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(70));
      expect(result.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160034 end');
    })

    /**
     * @tc.name   testStateVolume160035
     * @tc.number SUB_CCE_STATEV_16_0035
     * @tc.desc   键取值 [0,0.5,NaN,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160035 begin');
      installStatesSparse('0,0.5,NaN,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(82));
      expect(result.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160035 end');
    })

    /**
     * @tc.name   testStateVolume160036
     * @tc.number SUB_CCE_STATEV_16_0036
     * @tc.desc   键取值 [0,0.5,0,NaN,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160036 begin');
      installStatesSparse('0,0.5,0,NaN,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160036 end');
    })

    /**
     * @tc.name   testStateVolume160037
     * @tc.number SUB_CCE_STATEV_16_0037
     * @tc.desc   键取值 [0,0.5,0,0,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160037 begin');
      installStatesSparse('0,0.5,0,0,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160037 end');
    })

    /**
     * @tc.name   testStateVolume160038
     * @tc.number SUB_CCE_STATEV_16_0038
     * @tc.desc   键取值 [0,0,0.5,NaN,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160038 begin');
      installStatesSparse('0,0,0.5,NaN,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160038 end');
    })

    /**
     * @tc.name   testStateVolume160039
     * @tc.number SUB_CCE_STATEV_16_0039
     * @tc.desc   键取值 [0,0,0.5,0,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160039 begin');
      installStatesSparse('0,0,0.5,0,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160039 end');
    })

    /**
     * @tc.name   testStateVolume160040
     * @tc.number SUB_CCE_STATEV_16_0040
     * @tc.desc   键取值 [0,0,0,0.5,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160040 begin');
      installStatesSparse('0,0,0,0.5,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160040 end');
    })

    /**
     * @tc.name   testStateVolume160041
     * @tc.number SUB_CCE_STATEV_16_0041
     * @tc.desc   键取值 [1.5,Infinity,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160041 begin');
      installStatesSparse('1.5,Infinity,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(75));
      expect(result.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160041 end');
    })

    /**
     * @tc.name   testStateVolume160042
     * @tc.number SUB_CCE_STATEV_16_0042
     * @tc.desc   键取值 [1.5,0,Infinity,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160042 begin');
      installStatesSparse('1.5,0,Infinity,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160042 end');
    })

    /**
     * @tc.name   testStateVolume160043
     * @tc.number SUB_CCE_STATEV_16_0043
     * @tc.desc   键取值 [1.5,0,0,Infinity,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160043 begin');
      installStatesSparse('1.5,0,0,Infinity,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      expect(result.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160043 end');
    })

    /**
     * @tc.name   testStateVolume160044
     * @tc.number SUB_CCE_STATEV_16_0044
     * @tc.desc   键取值 [1.5,0,0,0,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160044 begin');
      installStatesSparse('1.5,0,0,0,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(70));
      expect(result.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160044 end');
    })

    /**
     * @tc.name   testStateVolume160045
     * @tc.number SUB_CCE_STATEV_16_0045
     * @tc.desc   键取值 [0,1.5,Infinity,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160045 begin');
      installStatesSparse('0,1.5,Infinity,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(82));
      expect(result.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160045 end');
    })

    /**
     * @tc.name   testStateVolume160046
     * @tc.number SUB_CCE_STATEV_16_0046
     * @tc.desc   键取值 [0,1.5,0,Infinity,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160046 begin');
      installStatesSparse('0,1.5,0,Infinity,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160046 end');
    })

    /**
     * @tc.name   testStateVolume160047
     * @tc.number SUB_CCE_STATEV_16_0047
     * @tc.desc   键取值 [0,1.5,0,0,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160047 begin');
      installStatesSparse('0,1.5,0,0,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160047 end');
    })

    /**
     * @tc.name   testStateVolume160048
     * @tc.number SUB_CCE_STATEV_16_0048
     * @tc.desc   键取值 [0,0,1.5,Infinity,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160048 begin');
      installStatesSparse('0,0,1.5,Infinity,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160048 end');
    })

    /**
     * @tc.name   testStateVolume160049
     * @tc.number SUB_CCE_STATEV_16_0049
     * @tc.desc   键取值 [0,0,1.5,0,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160049 begin');
      installStatesSparse('0,0,1.5,0,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160049 end');
    })

    /**
     * @tc.name   testStateVolume160050
     * @tc.number SUB_CCE_STATEV_16_0050
     * @tc.desc   键取值 [0,0,0,1.5,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160050 begin');
      installStatesSparse('0,0,0,1.5,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160050 end');
    })

    /**
     * @tc.name   testStateVolume160051
     * @tc.number SUB_CCE_STATEV_16_0051
     * @tc.desc   键取值 [-0.5,4,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160051 begin');
      installStatesSparse('-0.5,4,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(75));
      expect(result.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160051 end');
    })

    /**
     * @tc.name   testStateVolume160052
     * @tc.number SUB_CCE_STATEV_16_0052
     * @tc.desc   键取值 [-0.5,0,4,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160052 begin');
      installStatesSparse('-0.5,0,4,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160052 end');
    })

    /**
     * @tc.name   testStateVolume160053
     * @tc.number SUB_CCE_STATEV_16_0053
     * @tc.desc   键取值 [-0.5,0,0,4,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160053 begin');
      installStatesSparse('-0.5,0,0,4,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      expect(result.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160053 end');
    })

    /**
     * @tc.name   testStateVolume160054
     * @tc.number SUB_CCE_STATEV_16_0054
     * @tc.desc   键取值 [-0.5,0,0,0,4]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160054 begin');
      installStatesSparse('-0.5,0,0,0,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(70));
      expect(result.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160054 end');
    })

    /**
     * @tc.name   testStateVolume160055
     * @tc.number SUB_CCE_STATEV_16_0055
     * @tc.desc   键取值 [0,-0.5,4,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160055 begin');
      installStatesSparse('0,-0.5,4,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(82));
      expect(result.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160055 end');
    })

    /**
     * @tc.name   testStateVolume160056
     * @tc.number SUB_CCE_STATEV_16_0056
     * @tc.desc   键取值 [0,-0.5,0,4,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160056 begin');
      installStatesSparse('0,-0.5,0,4,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(78));
      expect(result.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160056 end');
    })

    /**
     * @tc.name   testStateVolume160057
     * @tc.number SUB_CCE_STATEV_16_0057
     * @tc.desc   键取值 [0,-0.5,0,0,4]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160057 begin');
      installStatesSparse('0,-0.5,0,0,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160057 end');
    })

    /**
     * @tc.name   testStateVolume160058
     * @tc.number SUB_CCE_STATEV_16_0058
     * @tc.desc   键取值 [0,0,-0.5,4,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160058 begin');
      installStatesSparse('0,0,-0.5,4,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(79));
      expect(result.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160058 end');
    })

    /**
     * @tc.name   testStateVolume160059
     * @tc.number SUB_CCE_STATEV_16_0059
     * @tc.desc   键取值 [0,0,-0.5,0,4]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160059 begin');
      installStatesSparse('0,0,-0.5,0,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160059 end');
    })

    /**
     * @tc.name   testStateVolume160060
     * @tc.number SUB_CCE_STATEV_16_0060
     * @tc.desc   键取值 [0,0,0,-0.5,4]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160060 begin');
      installStatesSparse('0,0,0,-0.5,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(73));
      expect(result.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160060 end');
    })

    /**
     * @tc.name   testStateVolume160061
     * @tc.number SUB_CCE_STATEV_16_0061
     * @tc.desc   键取值 [0.5,0,1,2,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160061 begin');
      installStatesSparse('0.5,0,1,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160061 end');
    })

    /**
     * @tc.name   testStateVolume160062
     * @tc.number SUB_CCE_STATEV_16_0062
     * @tc.desc   键取值 [0,1,2,缺,0.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160062 begin');
      installStatesSparse('0,1,2,~,0.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160062 end');
    })

    /**
     * @tc.name   testStateVolume160063
     * @tc.number SUB_CCE_STATEV_16_0063
     * @tc.desc   键取值 [1,2,缺,0.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160063 begin');
      installStatesSparse('1,2,~,0.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160063 end');
    })

    /**
     * @tc.name   testStateVolume160064
     * @tc.number SUB_CCE_STATEV_16_0064
     * @tc.desc   键取值 [2,缺,0.5,0,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160064 begin');
      installStatesSparse('2,~,0.5,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160064 end');
    })

    /**
     * @tc.name   testStateVolume160065
     * @tc.number SUB_CCE_STATEV_16_0065
     * @tc.desc   键取值 [缺,0.5,0,1,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160065 begin');
      installStatesSparse('~,0.5,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160065 end');
    })

    /**
     * @tc.name   testStateVolume160066
     * @tc.number SUB_CCE_STATEV_16_0066
     * @tc.desc   键取值 [-0.5,0,1,2,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160066 begin');
      installStatesSparse('-0.5,0,1,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160066 end');
    })

    /**
     * @tc.name   testStateVolume160067
     * @tc.number SUB_CCE_STATEV_16_0067
     * @tc.desc   键取值 [0,1,2,缺,-0.5]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160067 begin');
      installStatesSparse('0,1,2,~,-0.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160067 end');
    })

    /**
     * @tc.name   testStateVolume160068
     * @tc.number SUB_CCE_STATEV_16_0068
     * @tc.desc   键取值 [1,2,缺,-0.5,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160068 begin');
      installStatesSparse('1,2,~,-0.5,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160068 end');
    })

    /**
     * @tc.name   testStateVolume160069
     * @tc.number SUB_CCE_STATEV_16_0069
     * @tc.desc   键取值 [2,缺,-0.5,0,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160069 begin');
      installStatesSparse('2,~,-0.5,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160069 end');
    })

    /**
     * @tc.name   testStateVolume160070
     * @tc.number SUB_CCE_STATEV_16_0070
     * @tc.desc   键取值 [缺,-0.5,0,1,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160070 begin');
      installStatesSparse('~,-0.5,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160070 end');
    })

    /**
     * @tc.name   testStateVolume160071
     * @tc.number SUB_CCE_STATEV_16_0071
     * @tc.desc   键取值 [0.25,0.25,0.25,0.25,0.25]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160071 begin');
      installStatesSparse('0.25,0.25,0.25,0.25,0.25');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160071 end');
    })

    /**
     * @tc.name   testStateVolume160072
     * @tc.number SUB_CCE_STATEV_16_0072
     * @tc.desc   键取值 [0.75,0.75,0.75,0.75,0.75]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160072 begin');
      installStatesSparse('0.75,0.75,0.75,0.75,0.75');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160072 end');
    })

    /**
     * @tc.name   testStateVolume160073
     * @tc.number SUB_CCE_STATEV_16_0073
     * @tc.desc   键取值 [1.25,1.25,1.25,1.25,1.25]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160073 begin');
      installStatesSparse('1.25,1.25,1.25,1.25,1.25');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160073 end');
    })

    /**
     * @tc.name   testStateVolume160074
     * @tc.number SUB_CCE_STATEV_16_0074
     * @tc.desc   键取值 [-0.75,-0.75,-0.75,-0.75,-0.75]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160074 begin');
      installStatesSparse('-0.75,-0.75,-0.75,-0.75,-0.75');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160074 end');
    })

    /**
     * @tc.name   testStateVolume160075
     * @tc.number SUB_CCE_STATEV_16_0075
     * @tc.desc   键取值 [0.5,0.5,缺,缺,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160075 begin');
      installStatesSparse('0.5,0.5,~,~,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160075 end');
    })

    /**
     * @tc.name   testStateVolume160076
     * @tc.number SUB_CCE_STATEV_16_0076
     * @tc.desc   键取值 [-0.5,缺,NaN,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160076 begin');
      installStatesSparse('-0.5,~,NaN,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160076 end');
    })

    /**
     * @tc.name   testStateVolume160077
     * @tc.number SUB_CCE_STATEV_16_0077
     * @tc.desc   键取值 [1.25,缺,缺,2,2]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160077 begin');
      installStatesSparse('1.25,~,~,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160077 end');
    })

    /**
     * @tc.name   testStateVolume160078
     * @tc.number SUB_CCE_STATEV_16_0078
     * @tc.desc   键取值 [3.5,3.5,3.5,3.5,3.5]（缺=键缺失）时有效事件为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160078 begin');
      installStatesSparse('3.5,3.5,3.5,3.5,3.5');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160078 end');
    })

    /**
     * @tc.name   testStateVolume160079
     * @tc.number SUB_CCE_STATEV_16_0079
     * @tc.desc   双小数键忽略、双缺失跳过、仅 1 键同时入有效与一次性表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume160079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160079 begin');
      installStatesSparse('0.5,-0.5,~,~,1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', validEvents(), 'usual.event.SCREEN_UNLOCKED');
      expect(validEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', onceEvents(), 'usual.event.SCREEN_UNLOCKED');
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(validEvents().length), String(27));
      expect(validEvents().length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume160079 end');
    })
  })
}
