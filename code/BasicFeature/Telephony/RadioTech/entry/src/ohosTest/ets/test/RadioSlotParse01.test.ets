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

export default function radioSlotParse01Test() {
  describe('RadioSlotParse01Test', () => {

    /**
     * @tc.name   testRadioSlotParse0001
     * @tc.number SUB_RADIO_PARSE_0001
     * @tc.desc   title #1 resolves to its slot index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0001 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('known');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0001 end');
    })

    /**
     * @tc.name   testRadioSlotParse0002
     * @tc.number SUB_RADIO_PARSE_0002
     * @tc.desc   title #2 resolves to its slot index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0002 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('known');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0002 end');
    })

    /**
     * @tc.name   testRadioSlotParse0003
     * @tc.number SUB_RADIO_PARSE_0003
     * @tc.desc   title #3 resolves to its slot index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0003 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM3 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('known');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0003 end');
    })

    /**
     * @tc.name   testRadioSlotParse0004
     * @tc.number SUB_RADIO_PARSE_0004
     * @tc.desc   title #4 resolves to its slot index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0004 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('known');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0004 end');
    })

    /**
     * @tc.name   testRadioSlotParse0005
     * @tc.number SUB_RADIO_PARSE_0005
     * @tc.desc   title #5 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0005 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM0 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0005 end');
    })

    /**
     * @tc.name   testRadioSlotParse0006
     * @tc.number SUB_RADIO_PARSE_0006
     * @tc.desc   title #6 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0006 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM5 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0006 end');
    })

    /**
     * @tc.name   testRadioSlotParse0007
     * @tc.number SUB_RADIO_PARSE_0007
     * @tc.desc   title #7 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0007 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM10 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0007 end');
    })

    /**
     * @tc.name   testRadioSlotParse0008
     * @tc.number SUB_RADIO_PARSE_0008
     * @tc.desc   title #8 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0008 begin');
      const result: number = SlotModel.slotIndexFromTitle('sim1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0008 end');
    })

    /**
     * @tc.name   testRadioSlotParse0009
     * @tc.number SUB_RADIO_PARSE_0009
     * @tc.desc   title #9 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0009 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 Status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0009 end');
    })

    /**
     * @tc.name   testRadioSlotParse0010
     * @tc.number SUB_RADIO_PARSE_0010
     * @tc.desc   title #10 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0010 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0010 end');
    })

    /**
     * @tc.name   testRadioSlotParse0011
     * @tc.number SUB_RADIO_PARSE_0011
     * @tc.desc   title #11 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0011 begin');
      const result: number = SlotModel.slotIndexFromTitle('status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0011 end');
    })

    /**
     * @tc.name   testRadioSlotParse0012
     * @tc.number SUB_RADIO_PARSE_0012
     * @tc.desc   title #12 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0012 begin');
      const result: number = SlotModel.slotIndexFromTitle('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0012 end');
    })

    /**
     * @tc.name   testRadioSlotParse0013
     * @tc.number SUB_RADIO_PARSE_0013
     * @tc.desc   title #13 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0013 begin');
      const result: number = SlotModel.slotIndexFromTitle(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0013 end');
    })

    /**
     * @tc.name   testRadioSlotParse0014
     * @tc.number SUB_RADIO_PARSE_0014
     * @tc.desc   title #14 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0014 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1  status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0014 end');
    })

    /**
     * @tc.name   testRadioSlotParse0015
     * @tc.number SUB_RADIO_PARSE_0015
     * @tc.desc   title #15 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0015 begin');
      const result: number = SlotModel.slotIndexFromTitle(' SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0015 end');
    })

    /**
     * @tc.name   testRadioSlotParse0016
     * @tc.number SUB_RADIO_PARSE_0016
     * @tc.desc   title #16 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0016 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 status ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0016 end');
    })

    /**
     * @tc.name   testRadioSlotParse0017
     * @tc.number SUB_RADIO_PARSE_0017
     * @tc.desc   title #17 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0017 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM-1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0017 end');
    })

    /**
     * @tc.name   testRadioSlotParse0018
     * @tc.number SUB_RADIO_PARSE_0018
     * @tc.desc   title #18 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0018 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1_status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0018 end');
    })

    /**
     * @tc.name   testRadioSlotParse0019
     * @tc.number SUB_RADIO_PARSE_0019
     * @tc.desc   title #19 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0019 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM1 status\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0019 end');
    })

    /**
     * @tc.name   testRadioSlotParse0020
     * @tc.number SUB_RADIO_PARSE_0020
     * @tc.desc   title #20 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0020 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM5 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0020 end');
    })

    /**
     * @tc.name   testRadioSlotParse0021
     * @tc.number SUB_RADIO_PARSE_0021
     * @tc.desc   title #21 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0021 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM6 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0021 end');
    })

    /**
     * @tc.name   testRadioSlotParse0022
     * @tc.number SUB_RADIO_PARSE_0022
     * @tc.desc   title #22 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0022 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM7 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0022 end');
    })

    /**
     * @tc.name   testRadioSlotParse0023
     * @tc.number SUB_RADIO_PARSE_0023
     * @tc.desc   title #23 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0023 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM8 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0023 end');
    })

    /**
     * @tc.name   testRadioSlotParse0024
     * @tc.number SUB_RADIO_PARSE_0024
     * @tc.desc   title #24 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0024 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM9 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0024 end');
    })

    /**
     * @tc.name   testRadioSlotParse0025
     * @tc.number SUB_RADIO_PARSE_0025
     * @tc.desc   title #25 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0025 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM10 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0025 end');
    })

    /**
     * @tc.name   testRadioSlotParse0026
     * @tc.number SUB_RADIO_PARSE_0026
     * @tc.desc   title #26 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0026 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM11 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0026 end');
    })

    /**
     * @tc.name   testRadioSlotParse0027
     * @tc.number SUB_RADIO_PARSE_0027
     * @tc.desc   title #27 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0027 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM12 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0027 end');
    })

    /**
     * @tc.name   testRadioSlotParse0028
     * @tc.number SUB_RADIO_PARSE_0028
     * @tc.desc   title #28 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0028 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM13 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0028 end');
    })

    /**
     * @tc.name   testRadioSlotParse0029
     * @tc.number SUB_RADIO_PARSE_0029
     * @tc.desc   title #29 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0029 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM14 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0029 end');
    })

    /**
     * @tc.name   testRadioSlotParse0030
     * @tc.number SUB_RADIO_PARSE_0030
     * @tc.desc   title #30 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0030 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM15 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0030 end');
    })

    /**
     * @tc.name   testRadioSlotParse0031
     * @tc.number SUB_RADIO_PARSE_0031
     * @tc.desc   title #31 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0031 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM16 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0031 end');
    })

    /**
     * @tc.name   testRadioSlotParse0032
     * @tc.number SUB_RADIO_PARSE_0032
     * @tc.desc   title #32 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0032 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM17 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0032 end');
    })

    /**
     * @tc.name   testRadioSlotParse0033
     * @tc.number SUB_RADIO_PARSE_0033
     * @tc.desc   title #33 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0033 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM18 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0033 end');
    })

    /**
     * @tc.name   testRadioSlotParse0034
     * @tc.number SUB_RADIO_PARSE_0034
     * @tc.desc   title #34 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0034 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM19 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0034 end');
    })

    /**
     * @tc.name   testRadioSlotParse0035
     * @tc.number SUB_RADIO_PARSE_0035
     * @tc.desc   title #35 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0035 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM20 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0035 end');
    })

    /**
     * @tc.name   testRadioSlotParse0036
     * @tc.number SUB_RADIO_PARSE_0036
     * @tc.desc   title #36 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0036 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM21 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0036 end');
    })

    /**
     * @tc.name   testRadioSlotParse0037
     * @tc.number SUB_RADIO_PARSE_0037
     * @tc.desc   title #37 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0037 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM22 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0037 end');
    })

    /**
     * @tc.name   testRadioSlotParse0038
     * @tc.number SUB_RADIO_PARSE_0038
     * @tc.desc   title #38 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0038 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM23 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0038 end');
    })

    /**
     * @tc.name   testRadioSlotParse0039
     * @tc.number SUB_RADIO_PARSE_0039
     * @tc.desc   title #39 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0039 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM24 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0039 end');
    })

    /**
     * @tc.name   testRadioSlotParse0040
     * @tc.number SUB_RADIO_PARSE_0040
     * @tc.desc   title #40 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0040 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM25 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0040 end');
    })

    /**
     * @tc.name   testRadioSlotParse0041
     * @tc.number SUB_RADIO_PARSE_0041
     * @tc.desc   title #41 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0041 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM26 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0041 end');
    })

    /**
     * @tc.name   testRadioSlotParse0042
     * @tc.number SUB_RADIO_PARSE_0042
     * @tc.desc   title #42 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0042 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM27 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0042 end');
    })

    /**
     * @tc.name   testRadioSlotParse0043
     * @tc.number SUB_RADIO_PARSE_0043
     * @tc.desc   title #43 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0043 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM28 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0043 end');
    })

    /**
     * @tc.name   testRadioSlotParse0044
     * @tc.number SUB_RADIO_PARSE_0044
     * @tc.desc   title #44 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0044 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM29 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0044 end');
    })

    /**
     * @tc.name   testRadioSlotParse0045
     * @tc.number SUB_RADIO_PARSE_0045
     * @tc.desc   title #45 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0045 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM30 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0045 end');
    })

    /**
     * @tc.name   testRadioSlotParse0046
     * @tc.number SUB_RADIO_PARSE_0046
     * @tc.desc   title #46 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0046 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM31 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0046 end');
    })

    /**
     * @tc.name   testRadioSlotParse0047
     * @tc.number SUB_RADIO_PARSE_0047
     * @tc.desc   title #47 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0047 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM32 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0047 end');
    })

    /**
     * @tc.name   testRadioSlotParse0048
     * @tc.number SUB_RADIO_PARSE_0048
     * @tc.desc   title #48 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0048 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM33 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0048 end');
    })

    /**
     * @tc.name   testRadioSlotParse0049
     * @tc.number SUB_RADIO_PARSE_0049
     * @tc.desc   title #49 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0049 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM34 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0049 end');
    })

    /**
     * @tc.name   testRadioSlotParse0050
     * @tc.number SUB_RADIO_PARSE_0050
     * @tc.desc   title #50 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0050 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM35 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0050 end');
    })

    /**
     * @tc.name   testRadioSlotParse0051
     * @tc.number SUB_RADIO_PARSE_0051
     * @tc.desc   title #51 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0051 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM36 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0051 end');
    })

    /**
     * @tc.name   testRadioSlotParse0052
     * @tc.number SUB_RADIO_PARSE_0052
     * @tc.desc   title #52 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0052 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM37 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0052 end');
    })

    /**
     * @tc.name   testRadioSlotParse0053
     * @tc.number SUB_RADIO_PARSE_0053
     * @tc.desc   title #53 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0053 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM38 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0053 end');
    })

    /**
     * @tc.name   testRadioSlotParse0054
     * @tc.number SUB_RADIO_PARSE_0054
     * @tc.desc   title #54 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0054 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM39 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0054 end');
    })

    /**
     * @tc.name   testRadioSlotParse0055
     * @tc.number SUB_RADIO_PARSE_0055
     * @tc.desc   title #55 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0055 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM40 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0055 end');
    })

    /**
     * @tc.name   testRadioSlotParse0056
     * @tc.number SUB_RADIO_PARSE_0056
     * @tc.desc   title #56 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0056 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM41 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0056 end');
    })

    /**
     * @tc.name   testRadioSlotParse0057
     * @tc.number SUB_RADIO_PARSE_0057
     * @tc.desc   title #57 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0057 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM42 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0057 end');
    })

    /**
     * @tc.name   testRadioSlotParse0058
     * @tc.number SUB_RADIO_PARSE_0058
     * @tc.desc   title #58 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0058 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM43 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0058 end');
    })

    /**
     * @tc.name   testRadioSlotParse0059
     * @tc.number SUB_RADIO_PARSE_0059
     * @tc.desc   title #59 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0059 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM44 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0059 end');
    })

    /**
     * @tc.name   testRadioSlotParse0060
     * @tc.number SUB_RADIO_PARSE_0060
     * @tc.desc   title #60 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0060 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM45 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0060 end');
    })

    /**
     * @tc.name   testRadioSlotParse0061
     * @tc.number SUB_RADIO_PARSE_0061
     * @tc.desc   title #61 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0061 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM46 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0061 end');
    })

    /**
     * @tc.name   testRadioSlotParse0062
     * @tc.number SUB_RADIO_PARSE_0062
     * @tc.desc   title #62 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0062 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM47 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0062 end');
    })

    /**
     * @tc.name   testRadioSlotParse0063
     * @tc.number SUB_RADIO_PARSE_0063
     * @tc.desc   title #63 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0063 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM48 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0063 end');
    })

    /**
     * @tc.name   testRadioSlotParse0064
     * @tc.number SUB_RADIO_PARSE_0064
     * @tc.desc   title #64 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0064 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM49 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0064 end');
    })

    /**
     * @tc.name   testRadioSlotParse0065
     * @tc.number SUB_RADIO_PARSE_0065
     * @tc.desc   title #65 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0065 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM50 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0065 end');
    })

    /**
     * @tc.name   testRadioSlotParse0066
     * @tc.number SUB_RADIO_PARSE_0066
     * @tc.desc   title #66 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0066 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM51 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0066 end');
    })

    /**
     * @tc.name   testRadioSlotParse0067
     * @tc.number SUB_RADIO_PARSE_0067
     * @tc.desc   title #67 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0067 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM52 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0067 end');
    })

    /**
     * @tc.name   testRadioSlotParse0068
     * @tc.number SUB_RADIO_PARSE_0068
     * @tc.desc   title #68 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0068 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM53 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0068 end');
    })

    /**
     * @tc.name   testRadioSlotParse0069
     * @tc.number SUB_RADIO_PARSE_0069
     * @tc.desc   title #69 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0069 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM54 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0069 end');
    })

    /**
     * @tc.name   testRadioSlotParse0070
     * @tc.number SUB_RADIO_PARSE_0070
     * @tc.desc   title #70 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0070 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM55 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0070 end');
    })

    /**
     * @tc.name   testRadioSlotParse0071
     * @tc.number SUB_RADIO_PARSE_0071
     * @tc.desc   title #71 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0071 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM56 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0071 end');
    })

    /**
     * @tc.name   testRadioSlotParse0072
     * @tc.number SUB_RADIO_PARSE_0072
     * @tc.desc   title #72 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0072 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM57 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0072 end');
    })

    /**
     * @tc.name   testRadioSlotParse0073
     * @tc.number SUB_RADIO_PARSE_0073
     * @tc.desc   title #73 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0073 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM58 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0073 end');
    })

    /**
     * @tc.name   testRadioSlotParse0074
     * @tc.number SUB_RADIO_PARSE_0074
     * @tc.desc   title #74 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0074 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM59 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0074 end');
    })

    /**
     * @tc.name   testRadioSlotParse0075
     * @tc.number SUB_RADIO_PARSE_0075
     * @tc.desc   title #75 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0075 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM60 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0075 end');
    })

    /**
     * @tc.name   testRadioSlotParse0076
     * @tc.number SUB_RADIO_PARSE_0076
     * @tc.desc   title #76 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0076 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM61 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0076 end');
    })

    /**
     * @tc.name   testRadioSlotParse0077
     * @tc.number SUB_RADIO_PARSE_0077
     * @tc.desc   title #77 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0077 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM62 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0077 end');
    })

    /**
     * @tc.name   testRadioSlotParse0078
     * @tc.number SUB_RADIO_PARSE_0078
     * @tc.desc   title #78 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0078 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM63 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0078 end');
    })

    /**
     * @tc.name   testRadioSlotParse0079
     * @tc.number SUB_RADIO_PARSE_0079
     * @tc.desc   title #79 resolves to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0079 begin');
      const result: number = SlotModel.slotIndexFromTitle('SIM64 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === -1 ? 'unknown' : 'known'));
      expect(result === -1 ? 'unknown' : 'known').assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0079 end');
    })

    /**
     * @tc.name   testRadioSlotParse0080
     * @tc.number SUB_RADIO_PARSE_0080
     * @tc.desc   超出范围的历史标题不参与反解
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSlotParse0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0080 begin');
      const anchorResult: number = SlotModel.slotIndexFromTitle('SIM9 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String(-1));
      expect(anchorResult).assertEqual(-1);
      expect(anchorResult === -1 ? 'unknown' : 'known').assertEqual('unknown');
      expect(anchorResult >= -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSlotParse0080 end');
    })
  })
}
