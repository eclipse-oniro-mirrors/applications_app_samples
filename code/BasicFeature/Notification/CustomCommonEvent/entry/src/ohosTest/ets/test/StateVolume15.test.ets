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

export default function stateVolume15Test(): void {
  describe('StateVolume15Test', () => {

    /**
     * @tc.name   testStateVolume150001
     * @tc.number SUB_CCE_STATEV_15_0001
     * @tc.desc   键取值 [-2,4,NaN,0,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150001 begin');
      installStatesSparse('-2,4,NaN,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150001 end');
    })

    /**
     * @tc.name   testStateVolume150002
     * @tc.number SUB_CCE_STATEV_15_0002
     * @tc.desc   键取值 [-2,4,0,NaN,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150002 begin');
      installStatesSparse('-2,4,0,NaN,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(49));
      expect(result.length).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150002 end');
    })

    /**
     * @tc.name   testStateVolume150003
     * @tc.number SUB_CCE_STATEV_15_0003
     * @tc.desc   键取值 [-2,4,0,1,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150003 begin');
      installStatesSparse('-2,4,0,1,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150003 end');
    })

    /**
     * @tc.name   testStateVolume150004
     * @tc.number SUB_CCE_STATEV_15_0004
     * @tc.desc   键取值 [-2,0,4,NaN,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150004 begin');
      installStatesSparse('-2,0,4,NaN,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150004 end');
    })

    /**
     * @tc.name   testStateVolume150005
     * @tc.number SUB_CCE_STATEV_15_0005
     * @tc.desc   键取值 [-2,0,4,1,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150005 begin');
      installStatesSparse('-2,0,4,1,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      expect(result.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150005 end');
    })

    /**
     * @tc.name   testStateVolume150006
     * @tc.number SUB_CCE_STATEV_15_0006
     * @tc.desc   键取值 [-2,0,1,4,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150006 begin');
      installStatesSparse('-2,0,1,4,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150006 end');
    })

    /**
     * @tc.name   testStateVolume150007
     * @tc.number SUB_CCE_STATEV_15_0007
     * @tc.desc   键取值 [0,-2,4,NaN,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150007 begin');
      installStatesSparse('0,-2,4,NaN,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150007 end');
    })

    /**
     * @tc.name   testStateVolume150008
     * @tc.number SUB_CCE_STATEV_15_0008
     * @tc.desc   键取值 [0,-2,4,1,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150008 begin');
      installStatesSparse('0,-2,4,1,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(54));
      expect(result.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150008 end');
    })

    /**
     * @tc.name   testStateVolume150009
     * @tc.number SUB_CCE_STATEV_15_0009
     * @tc.desc   键取值 [0,-2,1,4,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150009 begin');
      installStatesSparse('0,-2,1,4,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150009 end');
    })

    /**
     * @tc.name   testStateVolume150010
     * @tc.number SUB_CCE_STATEV_15_0010
     * @tc.desc   键取值 [0,1,-2,4,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150010 begin');
      installStatesSparse('0,1,-2,4,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150010 end');
    })

    /**
     * @tc.name   testStateVolume150011
     * @tc.number SUB_CCE_STATEV_15_0011
     * @tc.desc   键取值 [5,9,Infinity,0,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150011 begin');
      installStatesSparse('5,9,Infinity,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150011 end');
    })

    /**
     * @tc.name   testStateVolume150012
     * @tc.number SUB_CCE_STATEV_15_0012
     * @tc.desc   键取值 [5,9,0,Infinity,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150012 begin');
      installStatesSparse('5,9,0,Infinity,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(49));
      expect(result.length).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150012 end');
    })

    /**
     * @tc.name   testStateVolume150013
     * @tc.number SUB_CCE_STATEV_15_0013
     * @tc.desc   键取值 [5,9,0,1,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150013 begin');
      installStatesSparse('5,9,0,1,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150013 end');
    })

    /**
     * @tc.name   testStateVolume150014
     * @tc.number SUB_CCE_STATEV_15_0014
     * @tc.desc   键取值 [5,0,9,Infinity,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150014 begin');
      installStatesSparse('5,0,9,Infinity,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150014 end');
    })

    /**
     * @tc.name   testStateVolume150015
     * @tc.number SUB_CCE_STATEV_15_0015
     * @tc.desc   键取值 [5,0,9,1,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150015 begin');
      installStatesSparse('5,0,9,1,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      expect(result.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150015 end');
    })

    /**
     * @tc.name   testStateVolume150016
     * @tc.number SUB_CCE_STATEV_15_0016
     * @tc.desc   键取值 [5,0,1,9,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150016 begin');
      installStatesSparse('5,0,1,9,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150016 end');
    })

    /**
     * @tc.name   testStateVolume150017
     * @tc.number SUB_CCE_STATEV_15_0017
     * @tc.desc   键取值 [0,5,9,Infinity,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150017 begin');
      installStatesSparse('0,5,9,Infinity,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150017 end');
    })

    /**
     * @tc.name   testStateVolume150018
     * @tc.number SUB_CCE_STATEV_15_0018
     * @tc.desc   键取值 [0,5,9,1,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150018 begin');
      installStatesSparse('0,5,9,1,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(54));
      expect(result.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150018 end');
    })

    /**
     * @tc.name   testStateVolume150019
     * @tc.number SUB_CCE_STATEV_15_0019
     * @tc.desc   键取值 [0,5,1,9,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150019 begin');
      installStatesSparse('0,5,1,9,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150019 end');
    })

    /**
     * @tc.name   testStateVolume150020
     * @tc.number SUB_CCE_STATEV_15_0020
     * @tc.desc   键取值 [0,1,5,9,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150020 begin');
      installStatesSparse('0,1,5,9,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150020 end');
    })

    /**
     * @tc.name   testStateVolume150021
     * @tc.number SUB_CCE_STATEV_15_0021
     * @tc.desc   键取值 [-0,2,2,2,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150021 begin');
      installStatesSparse('-0,2,2,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150021 end');
    })

    /**
     * @tc.name   testStateVolume150022
     * @tc.number SUB_CCE_STATEV_15_0022
     * @tc.desc   键取值 [2,-0,2,2,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150022 begin');
      installStatesSparse('2,-0,2,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150022 end');
    })

    /**
     * @tc.name   testStateVolume150023
     * @tc.number SUB_CCE_STATEV_15_0023
     * @tc.desc   键取值 [2,2,-0,2,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150023 begin');
      installStatesSparse('2,2,-0,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150023 end');
    })

    /**
     * @tc.name   testStateVolume150024
     * @tc.number SUB_CCE_STATEV_15_0024
     * @tc.desc   键取值 [2,2,2,-0,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150024 begin');
      installStatesSparse('2,2,2,-0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(25));
      expect(result.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150024 end');
    })

    /**
     * @tc.name   testStateVolume150025
     * @tc.number SUB_CCE_STATEV_15_0025
     * @tc.desc   键取值 [2,2,2,2,-0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150025 begin');
      installStatesSparse('2,2,2,2,-0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150025 end');
    })

    /**
     * @tc.name   testStateVolume150026
     * @tc.number SUB_CCE_STATEV_15_0026
     * @tc.desc   键取值 [-0,1,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150026 begin');
      installStatesSparse('-0,1,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150026 end');
    })

    /**
     * @tc.name   testStateVolume150027
     * @tc.number SUB_CCE_STATEV_15_0027
     * @tc.desc   键取值 [1,-0,1,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150027 begin');
      installStatesSparse('1,-0,1,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150027 end');
    })

    /**
     * @tc.name   testStateVolume150028
     * @tc.number SUB_CCE_STATEV_15_0028
     * @tc.desc   键取值 [1,1,-0,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150028 begin');
      installStatesSparse('1,1,-0,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150028 end');
    })

    /**
     * @tc.name   testStateVolume150029
     * @tc.number SUB_CCE_STATEV_15_0029
     * @tc.desc   键取值 [1,1,1,-0,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150029 begin');
      installStatesSparse('1,1,1,-0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150029 end');
    })

    /**
     * @tc.name   testStateVolume150030
     * @tc.number SUB_CCE_STATEV_15_0030
     * @tc.desc   键取值 [1,1,1,1,-0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150030 begin');
      installStatesSparse('1,1,1,1,-0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150030 end');
    })

    /**
     * @tc.name   testStateVolume150031
     * @tc.number SUB_CCE_STATEV_15_0031
     * @tc.desc   键取值 [10000,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150031 begin');
      installStatesSparse('10000,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150031 end');
    })

    /**
     * @tc.name   testStateVolume150032
     * @tc.number SUB_CCE_STATEV_15_0032
     * @tc.desc   键取值 [0,10000,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150032 begin');
      installStatesSparse('0,10000,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150032 end');
    })

    /**
     * @tc.name   testStateVolume150033
     * @tc.number SUB_CCE_STATEV_15_0033
     * @tc.desc   键取值 [0,0,10000,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150033 begin');
      installStatesSparse('0,0,10000,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150033 end');
    })

    /**
     * @tc.name   testStateVolume150034
     * @tc.number SUB_CCE_STATEV_15_0034
     * @tc.desc   键取值 [0,0,0,10000,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150034 begin');
      installStatesSparse('0,0,0,10000,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150034 end');
    })

    /**
     * @tc.name   testStateVolume150035
     * @tc.number SUB_CCE_STATEV_15_0035
     * @tc.desc   键取值 [0,0,0,0,10000]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150035 begin');
      installStatesSparse('0,0,0,0,10000');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150035 end');
    })

    /**
     * @tc.name   testStateVolume150036
     * @tc.number SUB_CCE_STATEV_15_0036
     * @tc.desc   键取值 [99999,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150036 begin');
      installStatesSparse('99999,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150036 end');
    })

    /**
     * @tc.name   testStateVolume150037
     * @tc.number SUB_CCE_STATEV_15_0037
     * @tc.desc   键取值 [0,99999,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150037 begin');
      installStatesSparse('0,99999,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150037 end');
    })

    /**
     * @tc.name   testStateVolume150038
     * @tc.number SUB_CCE_STATEV_15_0038
     * @tc.desc   键取值 [0,0,99999,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150038 begin');
      installStatesSparse('0,0,99999,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150038 end');
    })

    /**
     * @tc.name   testStateVolume150039
     * @tc.number SUB_CCE_STATEV_15_0039
     * @tc.desc   键取值 [0,0,0,99999,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150039 begin');
      installStatesSparse('0,0,0,99999,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150039 end');
    })

    /**
     * @tc.name   testStateVolume150040
     * @tc.number SUB_CCE_STATEV_15_0040
     * @tc.desc   键取值 [0,0,0,0,99999]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150040 begin');
      installStatesSparse('0,0,0,0,99999');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150040 end');
    })

    /**
     * @tc.name   testStateVolume150041
     * @tc.number SUB_CCE_STATEV_15_0041
     * @tc.desc   键取值 [-10000,0,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150041 begin');
      installStatesSparse('-10000,0,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(98));
      expect(result.length).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150041 end');
    })

    /**
     * @tc.name   testStateVolume150042
     * @tc.number SUB_CCE_STATEV_15_0042
     * @tc.desc   键取值 [0,-10000,0,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150042 begin');
      installStatesSparse('0,-10000,0,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150042 end');
    })

    /**
     * @tc.name   testStateVolume150043
     * @tc.number SUB_CCE_STATEV_15_0043
     * @tc.desc   键取值 [0,0,-10000,0,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150043 begin');
      installStatesSparse('0,0,-10000,0,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150043 end');
    })

    /**
     * @tc.name   testStateVolume150044
     * @tc.number SUB_CCE_STATEV_15_0044
     * @tc.desc   键取值 [0,0,0,-10000,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150044 begin');
      installStatesSparse('0,0,0,-10000,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150044 end');
    })

    /**
     * @tc.name   testStateVolume150045
     * @tc.number SUB_CCE_STATEV_15_0045
     * @tc.desc   键取值 [0,0,0,0,-10000]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150045 begin');
      installStatesSparse('0,0,0,0,-10000');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(99));
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150045 end');
    })

    /**
     * @tc.name   testStateVolume150046
     * @tc.number SUB_CCE_STATEV_15_0046
     * @tc.desc   键取值 [2,2,缺,-2,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150046 begin');
      installStatesSparse('2,2,~,-2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150046 end');
    })

    /**
     * @tc.name   testStateVolume150047
     * @tc.number SUB_CCE_STATEV_15_0047
     * @tc.desc   键取值 [2,缺,-2,0,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150047 begin');
      installStatesSparse('2,~,-2,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(25));
      expect(result.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150047 end');
    })

    /**
     * @tc.name   testStateVolume150048
     * @tc.number SUB_CCE_STATEV_15_0048
     * @tc.desc   键取值 [缺,-2,0,2,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150048 begin');
      installStatesSparse('~,-2,0,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150048 end');
    })

    /**
     * @tc.name   testStateVolume150049
     * @tc.number SUB_CCE_STATEV_15_0049
     * @tc.desc   键取值 [-2,0,2,2,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150049 begin');
      installStatesSparse('-2,0,2,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150049 end');
    })

    /**
     * @tc.name   testStateVolume150050
     * @tc.number SUB_CCE_STATEV_15_0050
     * @tc.desc   键取值 [0,2,2,缺,-2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150050 begin');
      installStatesSparse('0,2,2,~,-2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150050 end');
    })

    /**
     * @tc.name   testStateVolume150051
     * @tc.number SUB_CCE_STATEV_15_0051
     * @tc.desc   键取值 [2,2,缺,4,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150051 begin');
      installStatesSparse('2,2,~,4,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150051 end');
    })

    /**
     * @tc.name   testStateVolume150052
     * @tc.number SUB_CCE_STATEV_15_0052
     * @tc.desc   键取值 [2,缺,4,0,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150052 begin');
      installStatesSparse('2,~,4,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(25));
      expect(result.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150052 end');
    })

    /**
     * @tc.name   testStateVolume150053
     * @tc.number SUB_CCE_STATEV_15_0053
     * @tc.desc   键取值 [缺,4,0,2,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150053 begin');
      installStatesSparse('~,4,0,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150053 end');
    })

    /**
     * @tc.name   testStateVolume150054
     * @tc.number SUB_CCE_STATEV_15_0054
     * @tc.desc   键取值 [4,0,2,2,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150054 begin');
      installStatesSparse('4,0,2,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150054 end');
    })

    /**
     * @tc.name   testStateVolume150055
     * @tc.number SUB_CCE_STATEV_15_0055
     * @tc.desc   键取值 [0,2,2,缺,4]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150055 begin');
      installStatesSparse('0,2,2,~,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150055 end');
    })

    /**
     * @tc.name   testStateVolume150056
     * @tc.number SUB_CCE_STATEV_15_0056
     * @tc.desc   键取值 [2,2,缺,NaN,0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150056 begin');
      installStatesSparse('2,2,~,NaN,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150056 end');
    })

    /**
     * @tc.name   testStateVolume150057
     * @tc.number SUB_CCE_STATEV_15_0057
     * @tc.desc   键取值 [2,缺,NaN,0,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150057 begin');
      installStatesSparse('2,~,NaN,0,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(25));
      expect(result.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150057 end');
    })

    /**
     * @tc.name   testStateVolume150058
     * @tc.number SUB_CCE_STATEV_15_0058
     * @tc.desc   键取值 [缺,NaN,0,2,2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150058 begin');
      installStatesSparse('~,NaN,0,2,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150058 end');
    })

    /**
     * @tc.name   testStateVolume150059
     * @tc.number SUB_CCE_STATEV_15_0059
     * @tc.desc   键取值 [NaN,0,2,2,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150059 begin');
      installStatesSparse('NaN,0,2,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150059 end');
    })

    /**
     * @tc.name   testStateVolume150060
     * @tc.number SUB_CCE_STATEV_15_0060
     * @tc.desc   键取值 [0,2,2,缺,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150060 begin');
      installStatesSparse('0,2,2,~,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150060 end');
    })

    /**
     * @tc.name   testStateVolume150061
     * @tc.number SUB_CCE_STATEV_15_0061
     * @tc.desc   键取值 [1,1,缺,缺,-2]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150061 begin');
      installStatesSparse('1,1,~,~,-2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150061 end');
    })

    /**
     * @tc.name   testStateVolume150062
     * @tc.number SUB_CCE_STATEV_15_0062
     * @tc.desc   键取值 [1,缺,缺,-2,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150062 begin');
      installStatesSparse('1,~,~,-2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150062 end');
    })

    /**
     * @tc.name   testStateVolume150063
     * @tc.number SUB_CCE_STATEV_15_0063
     * @tc.desc   键取值 [缺,缺,-2,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150063 begin');
      installStatesSparse('~,~,-2,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150063 end');
    })

    /**
     * @tc.name   testStateVolume150064
     * @tc.number SUB_CCE_STATEV_15_0064
     * @tc.desc   键取值 [缺,-2,1,1,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150064 begin');
      installStatesSparse('~,-2,1,1,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150064 end');
    })

    /**
     * @tc.name   testStateVolume150065
     * @tc.number SUB_CCE_STATEV_15_0065
     * @tc.desc   键取值 [-2,1,1,缺,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150065 begin');
      installStatesSparse('-2,1,1,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150065 end');
    })

    /**
     * @tc.name   testStateVolume150066
     * @tc.number SUB_CCE_STATEV_15_0066
     * @tc.desc   键取值 [1,1,缺,缺,NaN]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150066 begin');
      installStatesSparse('1,1,~,~,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150066 end');
    })

    /**
     * @tc.name   testStateVolume150067
     * @tc.number SUB_CCE_STATEV_15_0067
     * @tc.desc   键取值 [1,缺,缺,NaN,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150067 begin');
      installStatesSparse('1,~,~,NaN,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150067 end');
    })

    /**
     * @tc.name   testStateVolume150068
     * @tc.number SUB_CCE_STATEV_15_0068
     * @tc.desc   键取值 [缺,缺,NaN,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150068 begin');
      installStatesSparse('~,~,NaN,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150068 end');
    })

    /**
     * @tc.name   testStateVolume150069
     * @tc.number SUB_CCE_STATEV_15_0069
     * @tc.desc   键取值 [缺,NaN,1,1,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150069 begin');
      installStatesSparse('~,NaN,1,1,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150069 end');
    })

    /**
     * @tc.name   testStateVolume150070
     * @tc.number SUB_CCE_STATEV_15_0070
     * @tc.desc   键取值 [NaN,1,1,缺,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150070 begin');
      installStatesSparse('NaN,1,1,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150070 end');
    })

    /**
     * @tc.name   testStateVolume150071
     * @tc.number SUB_CCE_STATEV_15_0071
     * @tc.desc   键取值 [1,1,缺,缺,Infinity]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150071 begin');
      installStatesSparse('1,1,~,~,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150071 end');
    })

    /**
     * @tc.name   testStateVolume150072
     * @tc.number SUB_CCE_STATEV_15_0072
     * @tc.desc   键取值 [1,缺,缺,Infinity,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150072 begin');
      installStatesSparse('1,~,~,Infinity,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150072 end');
    })

    /**
     * @tc.name   testStateVolume150073
     * @tc.number SUB_CCE_STATEV_15_0073
     * @tc.desc   键取值 [缺,缺,Infinity,1,1]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150073 begin');
      installStatesSparse('~,~,Infinity,1,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150073 end');
    })

    /**
     * @tc.name   testStateVolume150074
     * @tc.number SUB_CCE_STATEV_15_0074
     * @tc.desc   键取值 [缺,Infinity,1,1,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150074 begin');
      installStatesSparse('~,Infinity,1,1,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150074 end');
    })

    /**
     * @tc.name   testStateVolume150075
     * @tc.number SUB_CCE_STATEV_15_0075
     * @tc.desc   键取值 [Infinity,1,1,缺,缺]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150075 begin');
      installStatesSparse('Infinity,1,1,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150075 end');
    })

    /**
     * @tc.name   testStateVolume150076
     * @tc.number SUB_CCE_STATEV_15_0076
     * @tc.desc   键取值 [0,0,0,缺,-0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150076 begin');
      installStatesSparse('0,0,0,~,-0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150076 end');
    })

    /**
     * @tc.name   testStateVolume150077
     * @tc.number SUB_CCE_STATEV_15_0077
     * @tc.desc   键取值 [1,0,1,0,-0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150077 begin');
      installStatesSparse('1,0,1,0,-0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150077 end');
    })

    /**
     * @tc.name   testStateVolume150078
     * @tc.number SUB_CCE_STATEV_15_0078
     * @tc.desc   键取值 [缺,缺,0,0,-0]（缺=键缺失）时有效事件按序拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150078 begin');
      installStatesSparse('~,~,0,0,-0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(75));
      expect(result.length).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150078 end');
    })

    /**
     * @tc.name   testStateVolume150079
     * @tc.number SUB_CCE_STATEV_15_0079
     * @tc.desc   '-0'/4/缺失/1/2 同屏时 -0 与 1 入有效表、仅 1 入一次性表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume150079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150079 begin');
      installStatesSparse('-0,4,~,1,2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', validEvents(), 'usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      expect(validEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', onceEvents(), 'usual.event.SCREEN_LOCKED');
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(validEvents().length), String(54));
      expect(validEvents().length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume150079 end');
    })
  })
}
