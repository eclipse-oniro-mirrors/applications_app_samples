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
import { SlotModel } from '../../../main/ets/model/SlotModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioSlotTitle01Test() {
  describe('RadioSlotTitle01Test', () => {

    /**
     * @tc.name   testRadioSlotTitle0001
     * @tc.number SUB_RADIO_SLOTTITLE_0001
     * @tc.desc   slot 'SIM1 status' formats with its 1-based label
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0001 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0001 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0002
     * @tc.number SUB_RADIO_SLOTTITLE_0002
     * @tc.desc   slot 'SIM2 status' formats with its 1-based label
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0002 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0002 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0003
     * @tc.number SUB_RADIO_SLOTTITLE_0003
     * @tc.desc   slot 'SIM3 status' formats with its 1-based label
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0003 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM3 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM3 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0003 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0004
     * @tc.number SUB_RADIO_SLOTTITLE_0004
     * @tc.desc   slot 'SIM4 status' formats with its 1-based label
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0004 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0004 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0005
     * @tc.number SUB_RADIO_SLOTTITLE_0005
     * @tc.desc   slot 'SIM0 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0005 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM0 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0005 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0006
     * @tc.number SUB_RADIO_SLOTTITLE_0006
     * @tc.desc   slot 'SIM5 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0006 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM5 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0006 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0007
     * @tc.number SUB_RADIO_SLOTTITLE_0007
     * @tc.desc   slot 'SIM10 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0007 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM10 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0007 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0008
     * @tc.number SUB_RADIO_SLOTTITLE_0008
     * @tc.desc   slot 'sim1 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0008 begin');
      const result: number = SlotModel.slotIndexFromTitle('sim1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0008 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0009
     * @tc.number SUB_RADIO_SLOTTITLE_0009
     * @tc.desc   slot 'SIM1 Status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0009 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 Status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0009 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0010
     * @tc.number SUB_RADIO_SLOTTITLE_0010
     * @tc.desc   slot 'SIM1' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0010 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0010 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0011
     * @tc.number SUB_RADIO_SLOTTITLE_0011
     * @tc.desc   slot 'status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0011 begin');
      const result: number = SlotModel.slotIndexFromTitle('status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0011 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0012
     * @tc.number SUB_RADIO_SLOTTITLE_0012
     * @tc.desc   slot '' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0012 begin');
      const result: number = SlotModel.slotIndexFromTitle('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0012 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0013
     * @tc.number SUB_RADIO_SLOTTITLE_0013
     * @tc.desc   slot ' ' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0013 begin');
      const result: number = SlotModel.slotIndexFromTitle(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0013 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0014
     * @tc.number SUB_RADIO_SLOTTITLE_0014
     * @tc.desc   slot 'SIM1  status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0014 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1  status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0014 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0015
     * @tc.number SUB_RADIO_SLOTTITLE_0015
     * @tc.desc   slot ' SIM1 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0015 begin');
      const result: number = SlotModel.slotIndexFromTitle(' SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0015 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0016
     * @tc.number SUB_RADIO_SLOTTITLE_0016
     * @tc.desc   slot 'SIM1 status ' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0016 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 status ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0016 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0017
     * @tc.number SUB_RADIO_SLOTTITLE_0017
     * @tc.desc   slot 'SIM-1 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0017 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM-1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0017 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0018
     * @tc.number SUB_RADIO_SLOTTITLE_0018
     * @tc.desc   slot 'SIM1_status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0018 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1_status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0018 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0019
     * @tc.number SUB_RADIO_SLOTTITLE_0019
     * @tc.desc   slot 'SIM1 status\n' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0019 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 status\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0019 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0020
     * @tc.number SUB_RADIO_SLOTTITLE_0020
     * @tc.desc   slot 'SIM4 status' formats with its 1-based label
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0020 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0020 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0021
     * @tc.number SUB_RADIO_SLOTTITLE_0021
     * @tc.desc   slot 'SIM5 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0021 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM5 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0021 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0022
     * @tc.number SUB_RADIO_SLOTTITLE_0022
     * @tc.desc   slot 'SIM6 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0022 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM6 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0022 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0023
     * @tc.number SUB_RADIO_SLOTTITLE_0023
     * @tc.desc   slot 'SIM7 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0023 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM7 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0023 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0024
     * @tc.number SUB_RADIO_SLOTTITLE_0024
     * @tc.desc   slot 'SIM8 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0024 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM8 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0024 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0025
     * @tc.number SUB_RADIO_SLOTTITLE_0025
     * @tc.desc   slot 'SIM9 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0025 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM9 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0025 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0026
     * @tc.number SUB_RADIO_SLOTTITLE_0026
     * @tc.desc   slot 'SIM10 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0026 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM10 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0026 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0027
     * @tc.number SUB_RADIO_SLOTTITLE_0027
     * @tc.desc   slot 'SIM11 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0027 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM11 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0027 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0028
     * @tc.number SUB_RADIO_SLOTTITLE_0028
     * @tc.desc   slot 'SIM12 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0028 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM12 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0028 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0029
     * @tc.number SUB_RADIO_SLOTTITLE_0029
     * @tc.desc   slot 'SIM13 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0029 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM13 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0029 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0030
     * @tc.number SUB_RADIO_SLOTTITLE_0030
     * @tc.desc   slot 'SIM14 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0030 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM14 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0030 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0031
     * @tc.number SUB_RADIO_SLOTTITLE_0031
     * @tc.desc   slot 'SIM15 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0031 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM15 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0031 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0032
     * @tc.number SUB_RADIO_SLOTTITLE_0032
     * @tc.desc   slot 'SIM16 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0032 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM16 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0032 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0033
     * @tc.number SUB_RADIO_SLOTTITLE_0033
     * @tc.desc   slot 'SIM17 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0033 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM17 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0033 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0034
     * @tc.number SUB_RADIO_SLOTTITLE_0034
     * @tc.desc   slot 'SIM18 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0034 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM18 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0034 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0035
     * @tc.number SUB_RADIO_SLOTTITLE_0035
     * @tc.desc   slot 'SIM19 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0035 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM19 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0035 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0036
     * @tc.number SUB_RADIO_SLOTTITLE_0036
     * @tc.desc   slot 'SIM20 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0036 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM20 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0036 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0037
     * @tc.number SUB_RADIO_SLOTTITLE_0037
     * @tc.desc   slot 'SIM21 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0037 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM21 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0037 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0038
     * @tc.number SUB_RADIO_SLOTTITLE_0038
     * @tc.desc   slot 'SIM22 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0038 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM22 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0038 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0039
     * @tc.number SUB_RADIO_SLOTTITLE_0039
     * @tc.desc   slot 'SIM23 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0039 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM23 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0039 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0040
     * @tc.number SUB_RADIO_SLOTTITLE_0040
     * @tc.desc   slot 'SIM24 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0040 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM24 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0040 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0041
     * @tc.number SUB_RADIO_SLOTTITLE_0041
     * @tc.desc   slot 'SIM25 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0041 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM25 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0041 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0042
     * @tc.number SUB_RADIO_SLOTTITLE_0042
     * @tc.desc   slot 'SIM26 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0042 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM26 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0042 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0043
     * @tc.number SUB_RADIO_SLOTTITLE_0043
     * @tc.desc   slot 'SIM27 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0043 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM27 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0043 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0044
     * @tc.number SUB_RADIO_SLOTTITLE_0044
     * @tc.desc   slot 'SIM28 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0044 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM28 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0044 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0045
     * @tc.number SUB_RADIO_SLOTTITLE_0045
     * @tc.desc   slot 'SIM29 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0045 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM29 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0045 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0046
     * @tc.number SUB_RADIO_SLOTTITLE_0046
     * @tc.desc   slot 'SIM30 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0046 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM30 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0046 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0047
     * @tc.number SUB_RADIO_SLOTTITLE_0047
     * @tc.desc   slot 'SIM31 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0047 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM31 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0047 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0048
     * @tc.number SUB_RADIO_SLOTTITLE_0048
     * @tc.desc   slot 'SIM32 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0048 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM32 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0048 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0049
     * @tc.number SUB_RADIO_SLOTTITLE_0049
     * @tc.desc   slot 'SIM33 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0049 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM33 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0049 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0050
     * @tc.number SUB_RADIO_SLOTTITLE_0050
     * @tc.desc   slot 'SIM34 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0050 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM34 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0050 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0051
     * @tc.number SUB_RADIO_SLOTTITLE_0051
     * @tc.desc   slot 'SIM35 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0051 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM35 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0051 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0052
     * @tc.number SUB_RADIO_SLOTTITLE_0052
     * @tc.desc   slot 'SIM36 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0052 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM36 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0052 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0053
     * @tc.number SUB_RADIO_SLOTTITLE_0053
     * @tc.desc   slot 'SIM37 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0053 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM37 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0053 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0054
     * @tc.number SUB_RADIO_SLOTTITLE_0054
     * @tc.desc   slot 'SIM38 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0054 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM38 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0054 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0055
     * @tc.number SUB_RADIO_SLOTTITLE_0055
     * @tc.desc   slot 'SIM39 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0055 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM39 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0055 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0056
     * @tc.number SUB_RADIO_SLOTTITLE_0056
     * @tc.desc   slot 'SIM40 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0056 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM40 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0056 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0057
     * @tc.number SUB_RADIO_SLOTTITLE_0057
     * @tc.desc   slot 'SIM41 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0057 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM41 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0057 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0058
     * @tc.number SUB_RADIO_SLOTTITLE_0058
     * @tc.desc   slot 'SIM42 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0058 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM42 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0058 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0059
     * @tc.number SUB_RADIO_SLOTTITLE_0059
     * @tc.desc   slot 'SIM43 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0059 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM43 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0059 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0060
     * @tc.number SUB_RADIO_SLOTTITLE_0060
     * @tc.desc   slot 'SIM44 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0060 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM44 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0060 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0061
     * @tc.number SUB_RADIO_SLOTTITLE_0061
     * @tc.desc   slot 'SIM45 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0061 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM45 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0061 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0062
     * @tc.number SUB_RADIO_SLOTTITLE_0062
     * @tc.desc   slot 'SIM46 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0062 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM46 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0062 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0063
     * @tc.number SUB_RADIO_SLOTTITLE_0063
     * @tc.desc   slot 'SIM47 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0063 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM47 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0063 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0064
     * @tc.number SUB_RADIO_SLOTTITLE_0064
     * @tc.desc   slot 'SIM48 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0064 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM48 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0064 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0065
     * @tc.number SUB_RADIO_SLOTTITLE_0065
     * @tc.desc   slot 'SIM49 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0065 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM49 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0065 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0066
     * @tc.number SUB_RADIO_SLOTTITLE_0066
     * @tc.desc   slot 'SIM50 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0066 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM50 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0066 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0067
     * @tc.number SUB_RADIO_SLOTTITLE_0067
     * @tc.desc   slot 'SIM51 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0067 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM51 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0067 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0068
     * @tc.number SUB_RADIO_SLOTTITLE_0068
     * @tc.desc   slot 'SIM52 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0068 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM52 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0068 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0069
     * @tc.number SUB_RADIO_SLOTTITLE_0069
     * @tc.desc   slot 'SIM53 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0069 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM53 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0069 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0070
     * @tc.number SUB_RADIO_SLOTTITLE_0070
     * @tc.desc   slot 'SIM54 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0070 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM54 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0070 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0071
     * @tc.number SUB_RADIO_SLOTTITLE_0071
     * @tc.desc   slot 'SIM55 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0071 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM55 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0071 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0072
     * @tc.number SUB_RADIO_SLOTTITLE_0072
     * @tc.desc   slot 'SIM56 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0072 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM56 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0072 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0073
     * @tc.number SUB_RADIO_SLOTTITLE_0073
     * @tc.desc   slot 'SIM57 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0073 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM57 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0073 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0074
     * @tc.number SUB_RADIO_SLOTTITLE_0074
     * @tc.desc   slot 'SIM58 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0074 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM58 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0074 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0075
     * @tc.number SUB_RADIO_SLOTTITLE_0075
     * @tc.desc   slot 'SIM59 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0075 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM59 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0075 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0076
     * @tc.number SUB_RADIO_SLOTTITLE_0076
     * @tc.desc   slot 'SIM60 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0076 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM60 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0076 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0077
     * @tc.number SUB_RADIO_SLOTTITLE_0077
     * @tc.desc   slot 'SIM61 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0077 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM61 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0077 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0078
     * @tc.number SUB_RADIO_SLOTTITLE_0078
     * @tc.desc   slot 'SIM62 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0078 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM62 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0078 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0079
     * @tc.number SUB_RADIO_SLOTTITLE_0079
     * @tc.desc   slot 'SIM63 status' formats as generic SIM status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0079 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM63 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0079 end');
    })

    /**
     * @tc.name   testRadioSlotTitle0080
     * @tc.number SUB_RADIO_SLOTTITLE_0080
     * @tc.desc   最大槽位号输出 SIM4 status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotTitle0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0080 begin');
      const anchorResult: string = SlotModel.formatTitle(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(anchorResult));
      expect(anchorResult).assertEqual('SIM4 status');
      expect(SlotModel.slotIndexFromTitle(anchorResult)).assertEqual(3);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotTitle0080 end');
    })
  })
}
