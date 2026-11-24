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

export default function radioSlotValid01Test() {
  describe('RadioSlotValid01Test', () => {

    /**
     * @tc.name   testRadioSlot0001
     * @tc.number SUB_RADIO_SLOT_0001
     * @tc.desc   slot 0 is valid and keeps its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0001 begin');
      const result: boolean = SlotModel.isValidSlotId(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(0)));
      expect(SlotModel.normalizeSlotId(0)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(0)));
      expect(SlotModel.formatTitle(0)).assertEqual('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0001 end');
    })

    /**
     * @tc.name   testRadioSlot0002
     * @tc.number SUB_RADIO_SLOT_0002
     * @tc.desc   slot 1 is valid and keeps its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0002 begin');
      const result: boolean = SlotModel.isValidSlotId(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(1)));
      expect(SlotModel.normalizeSlotId(1)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(1)));
      expect(SlotModel.formatTitle(1)).assertEqual('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0002 end');
    })

    /**
     * @tc.name   testRadioSlot0003
     * @tc.number SUB_RADIO_SLOT_0003
     * @tc.desc   slot 2 is valid and keeps its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0003 begin');
      const result: boolean = SlotModel.isValidSlotId(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(2)));
      expect(SlotModel.normalizeSlotId(2)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(2)));
      expect(SlotModel.formatTitle(2)).assertEqual('SIM3 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0003 end');
    })

    /**
     * @tc.name   testRadioSlot0004
     * @tc.number SUB_RADIO_SLOT_0004
     * @tc.desc   slot 3 is valid and keeps its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0004 begin');
      const result: boolean = SlotModel.isValidSlotId(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(3)));
      expect(SlotModel.normalizeSlotId(3)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(3)));
      expect(SlotModel.formatTitle(3)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0004 end');
    })

    /**
     * @tc.name   testRadioSlot0005
     * @tc.number SUB_RADIO_SLOT_0005
     * @tc.desc   slot 4 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0005 begin');
      const result: boolean = SlotModel.isValidSlotId(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(4)));
      expect(SlotModel.normalizeSlotId(4)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(4)));
      expect(SlotModel.formatTitle(4)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0005 end');
    })

    /**
     * @tc.name   testRadioSlot0006
     * @tc.number SUB_RADIO_SLOT_0006
     * @tc.desc   slot 5 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0006 begin');
      const result: boolean = SlotModel.isValidSlotId(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(5)));
      expect(SlotModel.normalizeSlotId(5)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(5)));
      expect(SlotModel.formatTitle(5)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0006 end');
    })

    /**
     * @tc.name   testRadioSlot0007
     * @tc.number SUB_RADIO_SLOT_0007
     * @tc.desc   slot 6 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0007 begin');
      const result: boolean = SlotModel.isValidSlotId(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(6)));
      expect(SlotModel.normalizeSlotId(6)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(6)));
      expect(SlotModel.formatTitle(6)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0007 end');
    })

    /**
     * @tc.name   testRadioSlot0008
     * @tc.number SUB_RADIO_SLOT_0008
     * @tc.desc   slot 7 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0008 begin');
      const result: boolean = SlotModel.isValidSlotId(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(7)));
      expect(SlotModel.normalizeSlotId(7)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(7)));
      expect(SlotModel.formatTitle(7)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0008 end');
    })

    /**
     * @tc.name   testRadioSlot0009
     * @tc.number SUB_RADIO_SLOT_0009
     * @tc.desc   slot 8 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0009 begin');
      const result: boolean = SlotModel.isValidSlotId(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(8)));
      expect(SlotModel.normalizeSlotId(8)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(8)));
      expect(SlotModel.formatTitle(8)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0009 end');
    })

    /**
     * @tc.name   testRadioSlot0010
     * @tc.number SUB_RADIO_SLOT_0010
     * @tc.desc   slot 9 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0010 begin');
      const result: boolean = SlotModel.isValidSlotId(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(9)));
      expect(SlotModel.normalizeSlotId(9)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(9)));
      expect(SlotModel.formatTitle(9)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0010 end');
    })

    /**
     * @tc.name   testRadioSlot0011
     * @tc.number SUB_RADIO_SLOT_0011
     * @tc.desc   slot 10 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0011 begin');
      const result: boolean = SlotModel.isValidSlotId(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(10)));
      expect(SlotModel.normalizeSlotId(10)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(10)));
      expect(SlotModel.formatTitle(10)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0011 end');
    })

    /**
     * @tc.name   testRadioSlot0012
     * @tc.number SUB_RADIO_SLOT_0012
     * @tc.desc   slot 11 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0012 begin');
      const result: boolean = SlotModel.isValidSlotId(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(11)));
      expect(SlotModel.normalizeSlotId(11)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(11)));
      expect(SlotModel.formatTitle(11)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0012 end');
    })

    /**
     * @tc.name   testRadioSlot0013
     * @tc.number SUB_RADIO_SLOT_0013
     * @tc.desc   slot 12 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0013 begin');
      const result: boolean = SlotModel.isValidSlotId(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(12)));
      expect(SlotModel.normalizeSlotId(12)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(12)));
      expect(SlotModel.formatTitle(12)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0013 end');
    })

    /**
     * @tc.name   testRadioSlot0014
     * @tc.number SUB_RADIO_SLOT_0014
     * @tc.desc   slot 13 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0014 begin');
      const result: boolean = SlotModel.isValidSlotId(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(13)));
      expect(SlotModel.normalizeSlotId(13)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(13)));
      expect(SlotModel.formatTitle(13)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0014 end');
    })

    /**
     * @tc.name   testRadioSlot0015
     * @tc.number SUB_RADIO_SLOT_0015
     * @tc.desc   slot 14 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0015 begin');
      const result: boolean = SlotModel.isValidSlotId(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(14)));
      expect(SlotModel.normalizeSlotId(14)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(14)));
      expect(SlotModel.formatTitle(14)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0015 end');
    })

    /**
     * @tc.name   testRadioSlot0016
     * @tc.number SUB_RADIO_SLOT_0016
     * @tc.desc   slot 15 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0016 begin');
      const result: boolean = SlotModel.isValidSlotId(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(15)));
      expect(SlotModel.normalizeSlotId(15)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(15)));
      expect(SlotModel.formatTitle(15)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0016 end');
    })

    /**
     * @tc.name   testRadioSlot0017
     * @tc.number SUB_RADIO_SLOT_0017
     * @tc.desc   slot 16 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0017 begin');
      const result: boolean = SlotModel.isValidSlotId(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(16)));
      expect(SlotModel.normalizeSlotId(16)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(16)));
      expect(SlotModel.formatTitle(16)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0017 end');
    })

    /**
     * @tc.name   testRadioSlot0018
     * @tc.number SUB_RADIO_SLOT_0018
     * @tc.desc   slot 17 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0018 begin');
      const result: boolean = SlotModel.isValidSlotId(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(17)));
      expect(SlotModel.normalizeSlotId(17)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(17)));
      expect(SlotModel.formatTitle(17)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0018 end');
    })

    /**
     * @tc.name   testRadioSlot0019
     * @tc.number SUB_RADIO_SLOT_0019
     * @tc.desc   slot 18 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0019 begin');
      const result: boolean = SlotModel.isValidSlotId(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(18)));
      expect(SlotModel.normalizeSlotId(18)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(18)));
      expect(SlotModel.formatTitle(18)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0019 end');
    })

    /**
     * @tc.name   testRadioSlot0020
     * @tc.number SUB_RADIO_SLOT_0020
     * @tc.desc   slot 19 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0020 begin');
      const result: boolean = SlotModel.isValidSlotId(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(19)));
      expect(SlotModel.normalizeSlotId(19)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(19)));
      expect(SlotModel.formatTitle(19)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0020 end');
    })

    /**
     * @tc.name   testRadioSlot0021
     * @tc.number SUB_RADIO_SLOT_0021
     * @tc.desc   slot 20 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0021 begin');
      const result: boolean = SlotModel.isValidSlotId(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(20)));
      expect(SlotModel.normalizeSlotId(20)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(20)));
      expect(SlotModel.formatTitle(20)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0021 end');
    })

    /**
     * @tc.name   testRadioSlot0022
     * @tc.number SUB_RADIO_SLOT_0022
     * @tc.desc   slot 21 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0022 begin');
      const result: boolean = SlotModel.isValidSlotId(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(21)));
      expect(SlotModel.normalizeSlotId(21)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(21)));
      expect(SlotModel.formatTitle(21)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0022 end');
    })

    /**
     * @tc.name   testRadioSlot0023
     * @tc.number SUB_RADIO_SLOT_0023
     * @tc.desc   slot 22 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0023 begin');
      const result: boolean = SlotModel.isValidSlotId(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(22)));
      expect(SlotModel.normalizeSlotId(22)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(22)));
      expect(SlotModel.formatTitle(22)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0023 end');
    })

    /**
     * @tc.name   testRadioSlot0024
     * @tc.number SUB_RADIO_SLOT_0024
     * @tc.desc   slot 23 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0024 begin');
      const result: boolean = SlotModel.isValidSlotId(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(23)));
      expect(SlotModel.normalizeSlotId(23)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(23)));
      expect(SlotModel.formatTitle(23)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0024 end');
    })

    /**
     * @tc.name   testRadioSlot0025
     * @tc.number SUB_RADIO_SLOT_0025
     * @tc.desc   slot 24 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0025 begin');
      const result: boolean = SlotModel.isValidSlotId(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(24)));
      expect(SlotModel.normalizeSlotId(24)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(24)));
      expect(SlotModel.formatTitle(24)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0025 end');
    })

    /**
     * @tc.name   testRadioSlot0026
     * @tc.number SUB_RADIO_SLOT_0026
     * @tc.desc   slot 25 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0026 begin');
      const result: boolean = SlotModel.isValidSlotId(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(25)));
      expect(SlotModel.normalizeSlotId(25)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(25)));
      expect(SlotModel.formatTitle(25)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0026 end');
    })

    /**
     * @tc.name   testRadioSlot0027
     * @tc.number SUB_RADIO_SLOT_0027
     * @tc.desc   slot 26 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0027 begin');
      const result: boolean = SlotModel.isValidSlotId(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(26)));
      expect(SlotModel.normalizeSlotId(26)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(26)));
      expect(SlotModel.formatTitle(26)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0027 end');
    })

    /**
     * @tc.name   testRadioSlot0028
     * @tc.number SUB_RADIO_SLOT_0028
     * @tc.desc   slot 27 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0028 begin');
      const result: boolean = SlotModel.isValidSlotId(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(27)));
      expect(SlotModel.normalizeSlotId(27)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(27)));
      expect(SlotModel.formatTitle(27)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0028 end');
    })

    /**
     * @tc.name   testRadioSlot0029
     * @tc.number SUB_RADIO_SLOT_0029
     * @tc.desc   slot 28 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0029 begin');
      const result: boolean = SlotModel.isValidSlotId(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(28)));
      expect(SlotModel.normalizeSlotId(28)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(28)));
      expect(SlotModel.formatTitle(28)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0029 end');
    })

    /**
     * @tc.name   testRadioSlot0030
     * @tc.number SUB_RADIO_SLOT_0030
     * @tc.desc   slot 29 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0030 begin');
      const result: boolean = SlotModel.isValidSlotId(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(29)));
      expect(SlotModel.normalizeSlotId(29)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(29)));
      expect(SlotModel.formatTitle(29)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0030 end');
    })

    /**
     * @tc.name   testRadioSlot0031
     * @tc.number SUB_RADIO_SLOT_0031
     * @tc.desc   slot 30 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0031 begin');
      const result: boolean = SlotModel.isValidSlotId(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(30)));
      expect(SlotModel.normalizeSlotId(30)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(30)));
      expect(SlotModel.formatTitle(30)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0031 end');
    })

    /**
     * @tc.name   testRadioSlot0032
     * @tc.number SUB_RADIO_SLOT_0032
     * @tc.desc   slot 31 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0032 begin');
      const result: boolean = SlotModel.isValidSlotId(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(31)));
      expect(SlotModel.normalizeSlotId(31)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(31)));
      expect(SlotModel.formatTitle(31)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0032 end');
    })

    /**
     * @tc.name   testRadioSlot0033
     * @tc.number SUB_RADIO_SLOT_0033
     * @tc.desc   slot 32 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0033 begin');
      const result: boolean = SlotModel.isValidSlotId(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(32)));
      expect(SlotModel.normalizeSlotId(32)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(32)));
      expect(SlotModel.formatTitle(32)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0033 end');
    })

    /**
     * @tc.name   testRadioSlot0034
     * @tc.number SUB_RADIO_SLOT_0034
     * @tc.desc   slot 33 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0034 begin');
      const result: boolean = SlotModel.isValidSlotId(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(33)));
      expect(SlotModel.normalizeSlotId(33)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(33)));
      expect(SlotModel.formatTitle(33)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0034 end');
    })

    /**
     * @tc.name   testRadioSlot0035
     * @tc.number SUB_RADIO_SLOT_0035
     * @tc.desc   slot 34 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0035 begin');
      const result: boolean = SlotModel.isValidSlotId(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(34)));
      expect(SlotModel.normalizeSlotId(34)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(34)));
      expect(SlotModel.formatTitle(34)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0035 end');
    })

    /**
     * @tc.name   testRadioSlot0036
     * @tc.number SUB_RADIO_SLOT_0036
     * @tc.desc   slot 35 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0036 begin');
      const result: boolean = SlotModel.isValidSlotId(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(35)));
      expect(SlotModel.normalizeSlotId(35)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(35)));
      expect(SlotModel.formatTitle(35)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0036 end');
    })

    /**
     * @tc.name   testRadioSlot0037
     * @tc.number SUB_RADIO_SLOT_0037
     * @tc.desc   slot 36 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0037 begin');
      const result: boolean = SlotModel.isValidSlotId(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(36)));
      expect(SlotModel.normalizeSlotId(36)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(36)));
      expect(SlotModel.formatTitle(36)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0037 end');
    })

    /**
     * @tc.name   testRadioSlot0038
     * @tc.number SUB_RADIO_SLOT_0038
     * @tc.desc   slot 37 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0038 begin');
      const result: boolean = SlotModel.isValidSlotId(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(37)));
      expect(SlotModel.normalizeSlotId(37)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(37)));
      expect(SlotModel.formatTitle(37)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0038 end');
    })

    /**
     * @tc.name   testRadioSlot0039
     * @tc.number SUB_RADIO_SLOT_0039
     * @tc.desc   slot 38 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0039 begin');
      const result: boolean = SlotModel.isValidSlotId(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(38)));
      expect(SlotModel.normalizeSlotId(38)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(38)));
      expect(SlotModel.formatTitle(38)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0039 end');
    })

    /**
     * @tc.name   testRadioSlot0040
     * @tc.number SUB_RADIO_SLOT_0040
     * @tc.desc   slot 39 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0040 begin');
      const result: boolean = SlotModel.isValidSlotId(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(39)));
      expect(SlotModel.normalizeSlotId(39)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(39)));
      expect(SlotModel.formatTitle(39)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0040 end');
    })

    /**
     * @tc.name   testRadioSlot0041
     * @tc.number SUB_RADIO_SLOT_0041
     * @tc.desc   slot 40 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0041 begin');
      const result: boolean = SlotModel.isValidSlotId(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(40)));
      expect(SlotModel.normalizeSlotId(40)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(40)));
      expect(SlotModel.formatTitle(40)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0041 end');
    })

    /**
     * @tc.name   testRadioSlot0042
     * @tc.number SUB_RADIO_SLOT_0042
     * @tc.desc   slot 41 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0042 begin');
      const result: boolean = SlotModel.isValidSlotId(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(41)));
      expect(SlotModel.normalizeSlotId(41)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(41)));
      expect(SlotModel.formatTitle(41)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0042 end');
    })

    /**
     * @tc.name   testRadioSlot0043
     * @tc.number SUB_RADIO_SLOT_0043
     * @tc.desc   slot 42 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0043 begin');
      const result: boolean = SlotModel.isValidSlotId(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(42)));
      expect(SlotModel.normalizeSlotId(42)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(42)));
      expect(SlotModel.formatTitle(42)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0043 end');
    })

    /**
     * @tc.name   testRadioSlot0044
     * @tc.number SUB_RADIO_SLOT_0044
     * @tc.desc   slot 43 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0044 begin');
      const result: boolean = SlotModel.isValidSlotId(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(43)));
      expect(SlotModel.normalizeSlotId(43)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(43)));
      expect(SlotModel.formatTitle(43)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0044 end');
    })

    /**
     * @tc.name   testRadioSlot0045
     * @tc.number SUB_RADIO_SLOT_0045
     * @tc.desc   slot 44 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0045 begin');
      const result: boolean = SlotModel.isValidSlotId(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(44)));
      expect(SlotModel.normalizeSlotId(44)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(44)));
      expect(SlotModel.formatTitle(44)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0045 end');
    })

    /**
     * @tc.name   testRadioSlot0046
     * @tc.number SUB_RADIO_SLOT_0046
     * @tc.desc   slot 45 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0046 begin');
      const result: boolean = SlotModel.isValidSlotId(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(45)));
      expect(SlotModel.normalizeSlotId(45)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(45)));
      expect(SlotModel.formatTitle(45)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0046 end');
    })

    /**
     * @tc.name   testRadioSlot0047
     * @tc.number SUB_RADIO_SLOT_0047
     * @tc.desc   slot 46 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0047 begin');
      const result: boolean = SlotModel.isValidSlotId(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(46)));
      expect(SlotModel.normalizeSlotId(46)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(46)));
      expect(SlotModel.formatTitle(46)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0047 end');
    })

    /**
     * @tc.name   testRadioSlot0048
     * @tc.number SUB_RADIO_SLOT_0048
     * @tc.desc   slot 47 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0048 begin');
      const result: boolean = SlotModel.isValidSlotId(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(47)));
      expect(SlotModel.normalizeSlotId(47)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(47)));
      expect(SlotModel.formatTitle(47)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0048 end');
    })

    /**
     * @tc.name   testRadioSlot0049
     * @tc.number SUB_RADIO_SLOT_0049
     * @tc.desc   slot 48 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0049 begin');
      const result: boolean = SlotModel.isValidSlotId(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(48)));
      expect(SlotModel.normalizeSlotId(48)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(48)));
      expect(SlotModel.formatTitle(48)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0049 end');
    })

    /**
     * @tc.name   testRadioSlot0050
     * @tc.number SUB_RADIO_SLOT_0050
     * @tc.desc   slot 49 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0050 begin');
      const result: boolean = SlotModel.isValidSlotId(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(49)));
      expect(SlotModel.normalizeSlotId(49)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(49)));
      expect(SlotModel.formatTitle(49)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0050 end');
    })

    /**
     * @tc.name   testRadioSlot0051
     * @tc.number SUB_RADIO_SLOT_0051
     * @tc.desc   slot 50 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0051 begin');
      const result: boolean = SlotModel.isValidSlotId(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(50)));
      expect(SlotModel.normalizeSlotId(50)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(50)));
      expect(SlotModel.formatTitle(50)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0051 end');
    })

    /**
     * @tc.name   testRadioSlot0052
     * @tc.number SUB_RADIO_SLOT_0052
     * @tc.desc   slot 51 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0052 begin');
      const result: boolean = SlotModel.isValidSlotId(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(51)));
      expect(SlotModel.normalizeSlotId(51)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(51)));
      expect(SlotModel.formatTitle(51)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0052 end');
    })

    /**
     * @tc.name   testRadioSlot0053
     * @tc.number SUB_RADIO_SLOT_0053
     * @tc.desc   slot 52 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0053 begin');
      const result: boolean = SlotModel.isValidSlotId(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(52)));
      expect(SlotModel.normalizeSlotId(52)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(52)));
      expect(SlotModel.formatTitle(52)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0053 end');
    })

    /**
     * @tc.name   testRadioSlot0054
     * @tc.number SUB_RADIO_SLOT_0054
     * @tc.desc   slot 53 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0054 begin');
      const result: boolean = SlotModel.isValidSlotId(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(53)));
      expect(SlotModel.normalizeSlotId(53)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(53)));
      expect(SlotModel.formatTitle(53)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0054 end');
    })

    /**
     * @tc.name   testRadioSlot0055
     * @tc.number SUB_RADIO_SLOT_0055
     * @tc.desc   slot 54 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0055 begin');
      const result: boolean = SlotModel.isValidSlotId(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(54)));
      expect(SlotModel.normalizeSlotId(54)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(54)));
      expect(SlotModel.formatTitle(54)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0055 end');
    })

    /**
     * @tc.name   testRadioSlot0056
     * @tc.number SUB_RADIO_SLOT_0056
     * @tc.desc   slot 55 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0056 begin');
      const result: boolean = SlotModel.isValidSlotId(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(55)));
      expect(SlotModel.normalizeSlotId(55)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(55)));
      expect(SlotModel.formatTitle(55)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0056 end');
    })

    /**
     * @tc.name   testRadioSlot0057
     * @tc.number SUB_RADIO_SLOT_0057
     * @tc.desc   slot 56 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0057 begin');
      const result: boolean = SlotModel.isValidSlotId(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(56)));
      expect(SlotModel.normalizeSlotId(56)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(56)));
      expect(SlotModel.formatTitle(56)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0057 end');
    })

    /**
     * @tc.name   testRadioSlot0058
     * @tc.number SUB_RADIO_SLOT_0058
     * @tc.desc   slot 57 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0058 begin');
      const result: boolean = SlotModel.isValidSlotId(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(57)));
      expect(SlotModel.normalizeSlotId(57)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(57)));
      expect(SlotModel.formatTitle(57)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0058 end');
    })

    /**
     * @tc.name   testRadioSlot0059
     * @tc.number SUB_RADIO_SLOT_0059
     * @tc.desc   slot 58 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0059 begin');
      const result: boolean = SlotModel.isValidSlotId(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(58)));
      expect(SlotModel.normalizeSlotId(58)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(58)));
      expect(SlotModel.formatTitle(58)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0059 end');
    })

    /**
     * @tc.name   testRadioSlot0060
     * @tc.number SUB_RADIO_SLOT_0060
     * @tc.desc   slot 59 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0060 begin');
      const result: boolean = SlotModel.isValidSlotId(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(59)));
      expect(SlotModel.normalizeSlotId(59)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(59)));
      expect(SlotModel.formatTitle(59)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0060 end');
    })

    /**
     * @tc.name   testRadioSlot0061
     * @tc.number SUB_RADIO_SLOT_0061
     * @tc.desc   slot 60 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0061 begin');
      const result: boolean = SlotModel.isValidSlotId(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(60)));
      expect(SlotModel.normalizeSlotId(60)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(60)));
      expect(SlotModel.formatTitle(60)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0061 end');
    })

    /**
     * @tc.name   testRadioSlot0062
     * @tc.number SUB_RADIO_SLOT_0062
     * @tc.desc   slot 61 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0062 begin');
      const result: boolean = SlotModel.isValidSlotId(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(61)));
      expect(SlotModel.normalizeSlotId(61)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(61)));
      expect(SlotModel.formatTitle(61)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0062 end');
    })

    /**
     * @tc.name   testRadioSlot0063
     * @tc.number SUB_RADIO_SLOT_0063
     * @tc.desc   slot 62 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0063 begin');
      const result: boolean = SlotModel.isValidSlotId(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(62)));
      expect(SlotModel.normalizeSlotId(62)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(62)));
      expect(SlotModel.formatTitle(62)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0063 end');
    })

    /**
     * @tc.name   testRadioSlot0064
     * @tc.number SUB_RADIO_SLOT_0064
     * @tc.desc   slot 63 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0064 begin');
      const result: boolean = SlotModel.isValidSlotId(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(63)));
      expect(SlotModel.normalizeSlotId(63)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(63)));
      expect(SlotModel.formatTitle(63)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0064 end');
    })

    /**
     * @tc.name   testRadioSlot0065
     * @tc.number SUB_RADIO_SLOT_0065
     * @tc.desc   slot 64 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0065 begin');
      const result: boolean = SlotModel.isValidSlotId(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(64)));
      expect(SlotModel.normalizeSlotId(64)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(64)));
      expect(SlotModel.formatTitle(64)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0065 end');
    })

    /**
     * @tc.name   testRadioSlot0066
     * @tc.number SUB_RADIO_SLOT_0066
     * @tc.desc   slot 65 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0066 begin');
      const result: boolean = SlotModel.isValidSlotId(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(65)));
      expect(SlotModel.normalizeSlotId(65)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(65)));
      expect(SlotModel.formatTitle(65)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0066 end');
    })

    /**
     * @tc.name   testRadioSlot0067
     * @tc.number SUB_RADIO_SLOT_0067
     * @tc.desc   slot 66 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0067 begin');
      const result: boolean = SlotModel.isValidSlotId(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(66)));
      expect(SlotModel.normalizeSlotId(66)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(66)));
      expect(SlotModel.formatTitle(66)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0067 end');
    })

    /**
     * @tc.name   testRadioSlot0068
     * @tc.number SUB_RADIO_SLOT_0068
     * @tc.desc   slot 67 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0068 begin');
      const result: boolean = SlotModel.isValidSlotId(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(67)));
      expect(SlotModel.normalizeSlotId(67)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(67)));
      expect(SlotModel.formatTitle(67)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0068 end');
    })

    /**
     * @tc.name   testRadioSlot0069
     * @tc.number SUB_RADIO_SLOT_0069
     * @tc.desc   slot 68 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0069 begin');
      const result: boolean = SlotModel.isValidSlotId(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(68)));
      expect(SlotModel.normalizeSlotId(68)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(68)));
      expect(SlotModel.formatTitle(68)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0069 end');
    })

    /**
     * @tc.name   testRadioSlot0070
     * @tc.number SUB_RADIO_SLOT_0070
     * @tc.desc   slot 69 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0070 begin');
      const result: boolean = SlotModel.isValidSlotId(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(69)));
      expect(SlotModel.normalizeSlotId(69)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(69)));
      expect(SlotModel.formatTitle(69)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0070 end');
    })

    /**
     * @tc.name   testRadioSlot0071
     * @tc.number SUB_RADIO_SLOT_0071
     * @tc.desc   slot 70 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0071 begin');
      const result: boolean = SlotModel.isValidSlotId(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(70)));
      expect(SlotModel.normalizeSlotId(70)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(70)));
      expect(SlotModel.formatTitle(70)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0071 end');
    })

    /**
     * @tc.name   testRadioSlot0072
     * @tc.number SUB_RADIO_SLOT_0072
     * @tc.desc   slot 71 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0072 begin');
      const result: boolean = SlotModel.isValidSlotId(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(71)));
      expect(SlotModel.normalizeSlotId(71)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(71)));
      expect(SlotModel.formatTitle(71)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0072 end');
    })

    /**
     * @tc.name   testRadioSlot0073
     * @tc.number SUB_RADIO_SLOT_0073
     * @tc.desc   slot 72 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0073 begin');
      const result: boolean = SlotModel.isValidSlotId(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(72)));
      expect(SlotModel.normalizeSlotId(72)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(72)));
      expect(SlotModel.formatTitle(72)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0073 end');
    })

    /**
     * @tc.name   testRadioSlot0074
     * @tc.number SUB_RADIO_SLOT_0074
     * @tc.desc   slot 73 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0074 begin');
      const result: boolean = SlotModel.isValidSlotId(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(73)));
      expect(SlotModel.normalizeSlotId(73)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(73)));
      expect(SlotModel.formatTitle(73)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0074 end');
    })

    /**
     * @tc.name   testRadioSlot0075
     * @tc.number SUB_RADIO_SLOT_0075
     * @tc.desc   slot -1 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0075 begin');
      const result: boolean = SlotModel.isValidSlotId(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(-1)));
      expect(SlotModel.normalizeSlotId(-1)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(-1)));
      expect(SlotModel.formatTitle(-1)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0075 end');
    })

    /**
     * @tc.name   testRadioSlot0076
     * @tc.number SUB_RADIO_SLOT_0076
     * @tc.desc   slot -2 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0076 begin');
      const result: boolean = SlotModel.isValidSlotId(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(-2)));
      expect(SlotModel.normalizeSlotId(-2)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(-2)));
      expect(SlotModel.formatTitle(-2)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0076 end');
    })

    /**
     * @tc.name   testRadioSlot0077
     * @tc.number SUB_RADIO_SLOT_0077
     * @tc.desc   slot -100 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0077 begin');
      const result: boolean = SlotModel.isValidSlotId(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(-100)));
      expect(SlotModel.normalizeSlotId(-100)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(-100)));
      expect(SlotModel.formatTitle(-100)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0077 end');
    })

    /**
     * @tc.name   testRadioSlot0078
     * @tc.number SUB_RADIO_SLOT_0078
     * @tc.desc   slot 0.5 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0078 begin');
      const result: boolean = SlotModel.isValidSlotId(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(0.5)));
      expect(SlotModel.normalizeSlotId(0.5)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(0.5)));
      expect(SlotModel.formatTitle(0.5)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0078 end');
    })

    /**
     * @tc.name   testRadioSlot0079
     * @tc.number SUB_RADIO_SLOT_0079
     * @tc.desc   slot 1.5 is invalid and normalizes to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0079 begin');
      const result: boolean = SlotModel.isValidSlotId(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(1.5)));
      expect(SlotModel.normalizeSlotId(1.5)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(1.5)));
      expect(SlotModel.formatTitle(1.5)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0079 end');
    })

    /**
     * @tc.name   testRadioSlot0080
     * @tc.number SUB_RADIO_SLOT_0080
     * @tc.desc   负槽位号非法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlot0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0080 begin');
      const anchorResult: boolean = SlotModel.isValidSlotId(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String(false));
      expect(anchorResult).assertEqual(false);
      expect(SlotModel.normalizeSlotId(-1)).assertEqual(0);
      expect(anchorResult === true || anchorResult === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlot0080 end');
    })
  })
}
