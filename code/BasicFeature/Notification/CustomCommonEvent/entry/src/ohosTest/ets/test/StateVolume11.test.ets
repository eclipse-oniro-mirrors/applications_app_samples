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

export default function stateVolume11Test(): void {
  describe('StateVolume11Test', () => {

    /**
     * @tc.name   testStateVolume110001
     * @tc.number SUB_CCE_STATEV_11_0001
     * @tc.desc   混合态 [4,1,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110001 begin');
      installStatesSparse('4,1,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110001 end');
    })

    /**
     * @tc.name   testStateVolume110002
     * @tc.number SUB_CCE_STATEV_11_0002
     * @tc.desc   混合态 [0,4,2,缺,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110002 begin');
      installStatesSparse('0,4,2,~,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110002 end');
    })

    /**
     * @tc.name   testStateVolume110003
     * @tc.number SUB_CCE_STATEV_11_0003
     * @tc.desc   混合态 [0,1,4,0,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110003 begin');
      installStatesSparse('0,1,4,0,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110003 end');
    })

    /**
     * @tc.name   testStateVolume110004
     * @tc.number SUB_CCE_STATEV_11_0004
     * @tc.desc   混合态 [缺,1,2,4,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110004 begin');
      installStatesSparse('~,1,2,4,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110004 end');
    })

    /**
     * @tc.name   testStateVolume110005
     * @tc.number SUB_CCE_STATEV_11_0005
     * @tc.desc   混合态 [0,缺,2,0,4]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110005 begin');
      installStatesSparse('0,~,2,0,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(54));
      expect(result.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110005 end');
    })

    /**
     * @tc.name   testStateVolume110006
     * @tc.number SUB_CCE_STATEV_11_0006
     * @tc.desc   混合态 [-2,1,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110006 begin');
      installStatesSparse('-2,1,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110006 end');
    })

    /**
     * @tc.name   testStateVolume110007
     * @tc.number SUB_CCE_STATEV_11_0007
     * @tc.desc   混合态 [0,-2,2,缺,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110007 begin');
      installStatesSparse('0,-2,2,~,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110007 end');
    })

    /**
     * @tc.name   testStateVolume110008
     * @tc.number SUB_CCE_STATEV_11_0008
     * @tc.desc   混合态 [0,1,-2,0,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110008 begin');
      installStatesSparse('0,1,-2,0,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110008 end');
    })

    /**
     * @tc.name   testStateVolume110009
     * @tc.number SUB_CCE_STATEV_11_0009
     * @tc.desc   混合态 [缺,1,2,-2,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110009 begin');
      installStatesSparse('~,1,2,-2,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110009 end');
    })

    /**
     * @tc.name   testStateVolume110010
     * @tc.number SUB_CCE_STATEV_11_0010
     * @tc.desc   混合态 [0,缺,2,0,-2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110010 begin');
      installStatesSparse('0,~,2,0,-2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(54));
      expect(result.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110010 end');
    })

    /**
     * @tc.name   testStateVolume110011
     * @tc.number SUB_CCE_STATEV_11_0011
     * @tc.desc   混合态 [NaN,1,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110011 begin');
      installStatesSparse('NaN,1,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110011 end');
    })

    /**
     * @tc.name   testStateVolume110012
     * @tc.number SUB_CCE_STATEV_11_0012
     * @tc.desc   混合态 [0,NaN,2,缺,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110012 begin');
      installStatesSparse('0,NaN,2,~,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110012 end');
    })

    /**
     * @tc.name   testStateVolume110013
     * @tc.number SUB_CCE_STATEV_11_0013
     * @tc.desc   混合态 [0,1,NaN,0,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110013 begin');
      installStatesSparse('0,1,NaN,0,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110013 end');
    })

    /**
     * @tc.name   testStateVolume110014
     * @tc.number SUB_CCE_STATEV_11_0014
     * @tc.desc   混合态 [缺,1,2,NaN,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110014 begin');
      installStatesSparse('~,1,2,NaN,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110014 end');
    })

    /**
     * @tc.name   testStateVolume110015
     * @tc.number SUB_CCE_STATEV_11_0015
     * @tc.desc   混合态 [0,缺,2,0,NaN]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110015 begin');
      installStatesSparse('0,~,2,0,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(54));
      expect(result.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110015 end');
    })

    /**
     * @tc.name   testStateVolume110016
     * @tc.number SUB_CCE_STATEV_11_0016
     * @tc.desc   混合态 [Infinity,1,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110016 begin');
      installStatesSparse('Infinity,1,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      expect(result.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110016 end');
    })

    /**
     * @tc.name   testStateVolume110017
     * @tc.number SUB_CCE_STATEV_11_0017
     * @tc.desc   混合态 [0,Infinity,2,缺,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110017 begin');
      installStatesSparse('0,Infinity,2,~,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110017 end');
    })

    /**
     * @tc.name   testStateVolume110018
     * @tc.number SUB_CCE_STATEV_11_0018
     * @tc.desc   混合态 [0,1,Infinity,0,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110018 begin');
      installStatesSparse('0,1,Infinity,0,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(77));
      expect(result.length).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110018 end');
    })

    /**
     * @tc.name   testStateVolume110019
     * @tc.number SUB_CCE_STATEV_11_0019
     * @tc.desc   混合态 [缺,1,2,Infinity,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110019 begin');
      installStatesSparse('~,1,2,Infinity,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(50));
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110019 end');
    })

    /**
     * @tc.name   testStateVolume110020
     * @tc.number SUB_CCE_STATEV_11_0020
     * @tc.desc   混合态 [0,缺,2,0,Infinity]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110020 begin');
      installStatesSparse('0,~,2,0,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(54));
      expect(result.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110020 end');
    })

    /**
     * @tc.name   testStateVolume110021
     * @tc.number SUB_CCE_STATEV_11_0021
     * @tc.desc   混合态 [0,1,2,缺,4]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110021 begin');
      installStatesSparse('0,1,2,~,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110021 end');
    })

    /**
     * @tc.name   testStateVolume110022
     * @tc.number SUB_CCE_STATEV_11_0022
     * @tc.desc   混合态 [1,2,缺,4,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110022 begin');
      installStatesSparse('1,2,~,4,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110022 end');
    })

    /**
     * @tc.name   testStateVolume110023
     * @tc.number SUB_CCE_STATEV_11_0023
     * @tc.desc   混合态 [2,缺,4,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110023 begin');
      installStatesSparse('2,~,4,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110023 end');
    })

    /**
     * @tc.name   testStateVolume110024
     * @tc.number SUB_CCE_STATEV_11_0024
     * @tc.desc   混合态 [缺,4,0,1,2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110024 begin');
      installStatesSparse('~,4,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110024 end');
    })

    /**
     * @tc.name   testStateVolume110025
     * @tc.number SUB_CCE_STATEV_11_0025
     * @tc.desc   混合态 [4,0,1,2,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110025 begin');
      installStatesSparse('4,0,1,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110025 end');
    })

    /**
     * @tc.name   testStateVolume110026
     * @tc.number SUB_CCE_STATEV_11_0026
     * @tc.desc   混合态 [0,1,2,缺,-2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110026 begin');
      installStatesSparse('0,1,2,~,-2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110026 end');
    })

    /**
     * @tc.name   testStateVolume110027
     * @tc.number SUB_CCE_STATEV_11_0027
     * @tc.desc   混合态 [1,2,缺,-2,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110027 begin');
      installStatesSparse('1,2,~,-2,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110027 end');
    })

    /**
     * @tc.name   testStateVolume110028
     * @tc.number SUB_CCE_STATEV_11_0028
     * @tc.desc   混合态 [2,缺,-2,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110028 begin');
      installStatesSparse('2,~,-2,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110028 end');
    })

    /**
     * @tc.name   testStateVolume110029
     * @tc.number SUB_CCE_STATEV_11_0029
     * @tc.desc   混合态 [缺,-2,0,1,2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110029 begin');
      installStatesSparse('~,-2,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110029 end');
    })

    /**
     * @tc.name   testStateVolume110030
     * @tc.number SUB_CCE_STATEV_11_0030
     * @tc.desc   混合态 [-2,0,1,2,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110030 begin');
      installStatesSparse('-2,0,1,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110030 end');
    })

    /**
     * @tc.name   testStateVolume110031
     * @tc.number SUB_CCE_STATEV_11_0031
     * @tc.desc   混合态 [0,1,2,缺,NaN]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110031 begin');
      installStatesSparse('0,1,2,~,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110031 end');
    })

    /**
     * @tc.name   testStateVolume110032
     * @tc.number SUB_CCE_STATEV_11_0032
     * @tc.desc   混合态 [1,2,缺,NaN,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110032 begin');
      installStatesSparse('1,2,~,NaN,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110032 end');
    })

    /**
     * @tc.name   testStateVolume110033
     * @tc.number SUB_CCE_STATEV_11_0033
     * @tc.desc   混合态 [2,缺,NaN,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110033 begin');
      installStatesSparse('2,~,NaN,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110033 end');
    })

    /**
     * @tc.name   testStateVolume110034
     * @tc.number SUB_CCE_STATEV_11_0034
     * @tc.desc   混合态 [缺,NaN,0,1,2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110034 begin');
      installStatesSparse('~,NaN,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110034 end');
    })

    /**
     * @tc.name   testStateVolume110035
     * @tc.number SUB_CCE_STATEV_11_0035
     * @tc.desc   混合态 [NaN,0,1,2,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110035 begin');
      installStatesSparse('NaN,0,1,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110035 end');
    })

    /**
     * @tc.name   testStateVolume110036
     * @tc.number SUB_CCE_STATEV_11_0036
     * @tc.desc   混合态 [0,1,2,缺,Infinity]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110036 begin');
      installStatesSparse('0,1,2,~,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110036 end');
    })

    /**
     * @tc.name   testStateVolume110037
     * @tc.number SUB_CCE_STATEV_11_0037
     * @tc.desc   混合态 [1,2,缺,Infinity,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110037 begin');
      installStatesSparse('1,2,~,Infinity,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110037 end');
    })

    /**
     * @tc.name   testStateVolume110038
     * @tc.number SUB_CCE_STATEV_11_0038
     * @tc.desc   混合态 [2,缺,Infinity,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110038 begin');
      installStatesSparse('2,~,Infinity,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110038 end');
    })

    /**
     * @tc.name   testStateVolume110039
     * @tc.number SUB_CCE_STATEV_11_0039
     * @tc.desc   混合态 [缺,Infinity,0,1,2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110039 begin');
      installStatesSparse('~,Infinity,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110039 end');
    })

    /**
     * @tc.name   testStateVolume110040
     * @tc.number SUB_CCE_STATEV_11_0040
     * @tc.desc   混合态 [Infinity,0,1,2,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110040 begin');
      installStatesSparse('Infinity,0,1,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110040 end');
    })

    /**
     * @tc.name   testStateVolume110041
     * @tc.number SUB_CCE_STATEV_11_0041
     * @tc.desc   混合态 [0,1,2,缺,9]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110041 begin');
      installStatesSparse('0,1,2,~,9');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110041 end');
    })

    /**
     * @tc.name   testStateVolume110042
     * @tc.number SUB_CCE_STATEV_11_0042
     * @tc.desc   混合态 [1,2,缺,9,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110042 begin');
      installStatesSparse('1,2,~,9,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110042 end');
    })

    /**
     * @tc.name   testStateVolume110043
     * @tc.number SUB_CCE_STATEV_11_0043
     * @tc.desc   混合态 [2,缺,9,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110043 begin');
      installStatesSparse('2,~,9,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110043 end');
    })

    /**
     * @tc.name   testStateVolume110044
     * @tc.number SUB_CCE_STATEV_11_0044
     * @tc.desc   混合态 [缺,9,0,1,2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110044 begin');
      installStatesSparse('~,9,0,1,2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110044 end');
    })

    /**
     * @tc.name   testStateVolume110045
     * @tc.number SUB_CCE_STATEV_11_0045
     * @tc.desc   混合态 [9,0,1,2,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110045 begin');
      installStatesSparse('9,0,1,2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110045 end');
    })

    /**
     * @tc.name   testStateVolume110046
     * @tc.number SUB_CCE_STATEV_11_0046
     * @tc.desc   混合态 [4,-2,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110046 begin');
      installStatesSparse('4,-2,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110046 end');
    })

    /**
     * @tc.name   testStateVolume110047
     * @tc.number SUB_CCE_STATEV_11_0047
     * @tc.desc   混合态 [-2,缺,0,1,4]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110047 begin');
      installStatesSparse('-2,~,0,1,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110047 end');
    })

    /**
     * @tc.name   testStateVolume110048
     * @tc.number SUB_CCE_STATEV_11_0048
     * @tc.desc   混合态 [缺,0,1,4,-2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110048 begin');
      installStatesSparse('~,0,1,4,-2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110048 end');
    })

    /**
     * @tc.name   testStateVolume110049
     * @tc.number SUB_CCE_STATEV_11_0049
     * @tc.desc   混合态 [0,1,4,-2,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110049 begin');
      installStatesSparse('0,1,4,-2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110049 end');
    })

    /**
     * @tc.name   testStateVolume110050
     * @tc.number SUB_CCE_STATEV_11_0050
     * @tc.desc   混合态 [1,4,-2,缺,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110050 begin');
      installStatesSparse('1,4,-2,~,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110050 end');
    })

    /**
     * @tc.name   testStateVolume110051
     * @tc.number SUB_CCE_STATEV_11_0051
     * @tc.desc   混合态 [4,NaN,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110051 begin');
      installStatesSparse('4,NaN,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110051 end');
    })

    /**
     * @tc.name   testStateVolume110052
     * @tc.number SUB_CCE_STATEV_11_0052
     * @tc.desc   混合态 [NaN,缺,0,1,4]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110052 begin');
      installStatesSparse('NaN,~,0,1,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110052 end');
    })

    /**
     * @tc.name   testStateVolume110053
     * @tc.number SUB_CCE_STATEV_11_0053
     * @tc.desc   混合态 [缺,0,1,4,NaN]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110053 begin');
      installStatesSparse('~,0,1,4,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110053 end');
    })

    /**
     * @tc.name   testStateVolume110054
     * @tc.number SUB_CCE_STATEV_11_0054
     * @tc.desc   混合态 [0,1,4,NaN,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110054 begin');
      installStatesSparse('0,1,4,NaN,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110054 end');
    })

    /**
     * @tc.name   testStateVolume110055
     * @tc.number SUB_CCE_STATEV_11_0055
     * @tc.desc   混合态 [1,4,NaN,缺,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110055 begin');
      installStatesSparse('1,4,NaN,~,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110055 end');
    })

    /**
     * @tc.name   testStateVolume110056
     * @tc.number SUB_CCE_STATEV_11_0056
     * @tc.desc   混合态 [NaN,-2,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110056 begin');
      installStatesSparse('NaN,-2,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110056 end');
    })

    /**
     * @tc.name   testStateVolume110057
     * @tc.number SUB_CCE_STATEV_11_0057
     * @tc.desc   混合态 [-2,缺,0,1,NaN]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110057 begin');
      installStatesSparse('-2,~,0,1,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110057 end');
    })

    /**
     * @tc.name   testStateVolume110058
     * @tc.number SUB_CCE_STATEV_11_0058
     * @tc.desc   混合态 [缺,0,1,NaN,-2]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110058 begin');
      installStatesSparse('~,0,1,NaN,-2');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110058 end');
    })

    /**
     * @tc.name   testStateVolume110059
     * @tc.number SUB_CCE_STATEV_11_0059
     * @tc.desc   混合态 [0,1,NaN,-2,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110059 begin');
      installStatesSparse('0,1,NaN,-2,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110059 end');
    })

    /**
     * @tc.name   testStateVolume110060
     * @tc.number SUB_CCE_STATEV_11_0060
     * @tc.desc   混合态 [1,NaN,-2,缺,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110060 begin');
      installStatesSparse('1,NaN,-2,~,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110060 end');
    })

    /**
     * @tc.name   testStateVolume110061
     * @tc.number SUB_CCE_STATEV_11_0061
     * @tc.desc   混合态 [9,Infinity,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110061 begin');
      installStatesSparse('9,Infinity,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110061 end');
    })

    /**
     * @tc.name   testStateVolume110062
     * @tc.number SUB_CCE_STATEV_11_0062
     * @tc.desc   混合态 [Infinity,缺,0,1,9]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110062 begin');
      installStatesSparse('Infinity,~,0,1,9');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110062 end');
    })

    /**
     * @tc.name   testStateVolume110063
     * @tc.number SUB_CCE_STATEV_11_0063
     * @tc.desc   混合态 [缺,0,1,9,Infinity]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110063 begin');
      installStatesSparse('~,0,1,9,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110063 end');
    })

    /**
     * @tc.name   testStateVolume110064
     * @tc.number SUB_CCE_STATEV_11_0064
     * @tc.desc   混合态 [0,1,9,Infinity,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110064 begin');
      installStatesSparse('0,1,9,Infinity,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110064 end');
    })

    /**
     * @tc.name   testStateVolume110065
     * @tc.number SUB_CCE_STATEV_11_0065
     * @tc.desc   混合态 [1,9,Infinity,缺,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110065 begin');
      installStatesSparse('1,9,Infinity,~,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110065 end');
    })

    /**
     * @tc.name   testStateVolume110066
     * @tc.number SUB_CCE_STATEV_11_0066
     * @tc.desc   混合态 [Infinity,4,缺,0,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110066 begin');
      installStatesSparse('Infinity,4,~,0,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_LOCKED,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(53));
      expect(result.length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110066 end');
    })

    /**
     * @tc.name   testStateVolume110067
     * @tc.number SUB_CCE_STATEV_11_0067
     * @tc.desc   混合态 [4,缺,0,1,Infinity]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110067 begin');
      installStatesSparse('4,~,0,1,Infinity');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_ON,usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_LOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_LOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110067 end');
    })

    /**
     * @tc.name   testStateVolume110068
     * @tc.number SUB_CCE_STATEV_11_0068
     * @tc.desc   混合态 [缺,0,1,Infinity,4]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110068 begin');
      installStatesSparse('~,0,1,Infinity,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF,usual.event.SCREEN_ON'));
      expect(result).assertEqual('usual.event.SCREEN_OFF,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_ON'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110068 end');
    })

    /**
     * @tc.name   testStateVolume110069
     * @tc.number SUB_CCE_STATEV_11_0069
     * @tc.desc   混合态 [0,1,Infinity,4,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110069 begin');
      installStatesSparse('0,1,Infinity,4,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_OFF'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(51));
      expect(result.length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110069 end');
    })

    /**
     * @tc.name   testStateVolume110070
     * @tc.number SUB_CCE_STATEV_11_0070
     * @tc.desc   混合态 [1,Infinity,4,缺,0]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110070 begin');
      installStatesSparse('1,Infinity,4,~,0');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      expect(result.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110070 end');
    })

    /**
     * @tc.name   testStateVolume110071
     * @tc.number SUB_CCE_STATEV_11_0071
     * @tc.desc   混合态 [0,缺,缺,缺,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110071 begin');
      installStatesSparse('0,~,~,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110071 end');
    })

    /**
     * @tc.name   testStateVolume110072
     * @tc.number SUB_CCE_STATEV_11_0072
     * @tc.desc   混合态 [1,缺,缺,缺,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110072 begin');
      installStatesSparse('1,~,~,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.wifi.POWER_STATE'));
      expect(result).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.wifi.POWER_STATE'));
      expect(onceEvents()).assertEqual('usual.event.wifi.POWER_STATE');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110072 end');
    })

    /**
     * @tc.name   testStateVolume110073
     * @tc.number SUB_CCE_STATEV_11_0073
     * @tc.desc   混合态 [2,缺,缺,缺,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110073 begin');
      installStatesSparse('2,~,~,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110073 end');
    })

    /**
     * @tc.name   testStateVolume110074
     * @tc.number SUB_CCE_STATEV_11_0074
     * @tc.desc   混合态 [缺,0,缺,缺,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110074 begin');
      installStatesSparse('~,0,~,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_OFF'));
      expect(result).assertEqual('usual.event.SCREEN_OFF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110074 end');
    })

    /**
     * @tc.name   testStateVolume110075
     * @tc.number SUB_CCE_STATEV_11_0075
     * @tc.desc   混合态 [缺,缺,缺,缺,1]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110075 begin');
      installStatesSparse('~,~,~,~,1');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('usual.event.SCREEN_UNLOCKED'));
      expect(result).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String('usual.event.SCREEN_UNLOCKED'));
      expect(onceEvents()).assertEqual('usual.event.SCREEN_UNLOCKED');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110075 end');
    })

    /**
     * @tc.name   testStateVolume110076
     * @tc.number SUB_CCE_STATEV_11_0076
     * @tc.desc   混合态 [4,缺,缺,缺,缺]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110076 begin');
      installStatesSparse('4,~,~,~,~');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110076 end');
    })

    /**
     * @tc.name   testStateVolume110077
     * @tc.number SUB_CCE_STATEV_11_0077
     * @tc.desc   混合态 [缺,缺,缺,缺,NaN]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110077 begin');
      installStatesSparse('~,~,~,~,NaN');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110077 end');
    })

    /**
     * @tc.name   testStateVolume110078
     * @tc.number SUB_CCE_STATEV_11_0078
     * @tc.desc   混合态 [2,2,缺,缺,4]（缺=键缺失）时仅合法 0/1 键入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110078 begin');
      installStatesSparse('2,2,~,~,4');
      const result: string = validEvents();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(onceEvents()), String(''));
      expect(onceEvents()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110078 end');
    })

    /**
     * @tc.name   testStateVolume110079
     * @tc.number SUB_CCE_STATEV_11_0079
     * @tc.desc   合法/缺失/非法同屏时 0 键仅入有效表、1 键入有效与一次性表，其余不入表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateVolume110079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110079 begin');
      installStatesSparse('0,~,1,4,NaN');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', validEvents(), 'usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      expect(validEvents()).assertEqual('usual.event.wifi.POWER_STATE,usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', onceEvents(), 'usual.event.SCREEN_ON');
      expect(onceEvents()).assertEqual('usual.event.SCREEN_ON');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(validEvents().length), String(50));
      expect(validEvents().length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateVolume110079 end');
    })
  })
}
