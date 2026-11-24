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

export default function radioSelectionMode01Test() {
  describe('RadioSelectionMode01Test', () => {

    /**
     * @tc.name   testRadioSelMode0001
     * @tc.number SUB_RADIO_SELMODE_0001
     * @tc.desc   selection mode 0 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0001 begin');
      const result: string = SlotModel.selectionModeName(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0001 end');
    })

    /**
     * @tc.name   testRadioSelMode0002
     * @tc.number SUB_RADIO_SELMODE_0002
     * @tc.desc   selection mode 1 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0002 begin');
      const result: string = SlotModel.selectionModeName(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('automatic'));
      expect(result).assertEqual('automatic');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0002 end');
    })

    /**
     * @tc.name   testRadioSelMode0003
     * @tc.number SUB_RADIO_SELMODE_0003
     * @tc.desc   selection mode 2 maps to documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0003 begin');
      const result: string = SlotModel.selectionModeName(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('manual'));
      expect(result).assertEqual('manual');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0003 end');
    })

    /**
     * @tc.name   testRadioSelMode0004
     * @tc.number SUB_RADIO_SELMODE_0004
     * @tc.desc   selection mode 3 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0004 begin');
      const result: string = SlotModel.selectionModeName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0004 end');
    })

    /**
     * @tc.name   testRadioSelMode0005
     * @tc.number SUB_RADIO_SELMODE_0005
     * @tc.desc   selection mode 4 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0005 begin');
      const result: string = SlotModel.selectionModeName(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0005 end');
    })

    /**
     * @tc.name   testRadioSelMode0006
     * @tc.number SUB_RADIO_SELMODE_0006
     * @tc.desc   selection mode 5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0006 begin');
      const result: string = SlotModel.selectionModeName(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0006 end');
    })

    /**
     * @tc.name   testRadioSelMode0007
     * @tc.number SUB_RADIO_SELMODE_0007
     * @tc.desc   selection mode 6 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0007 begin');
      const result: string = SlotModel.selectionModeName(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0007 end');
    })

    /**
     * @tc.name   testRadioSelMode0008
     * @tc.number SUB_RADIO_SELMODE_0008
     * @tc.desc   selection mode 7 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0008 begin');
      const result: string = SlotModel.selectionModeName(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0008 end');
    })

    /**
     * @tc.name   testRadioSelMode0009
     * @tc.number SUB_RADIO_SELMODE_0009
     * @tc.desc   selection mode 8 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0009 begin');
      const result: string = SlotModel.selectionModeName(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0009 end');
    })

    /**
     * @tc.name   testRadioSelMode0010
     * @tc.number SUB_RADIO_SELMODE_0010
     * @tc.desc   selection mode 9 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0010 begin');
      const result: string = SlotModel.selectionModeName(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0010 end');
    })

    /**
     * @tc.name   testRadioSelMode0011
     * @tc.number SUB_RADIO_SELMODE_0011
     * @tc.desc   selection mode 10 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0011 begin');
      const result: string = SlotModel.selectionModeName(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0011 end');
    })

    /**
     * @tc.name   testRadioSelMode0012
     * @tc.number SUB_RADIO_SELMODE_0012
     * @tc.desc   selection mode 11 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0012 begin');
      const result: string = SlotModel.selectionModeName(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0012 end');
    })

    /**
     * @tc.name   testRadioSelMode0013
     * @tc.number SUB_RADIO_SELMODE_0013
     * @tc.desc   selection mode 12 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0013 begin');
      const result: string = SlotModel.selectionModeName(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0013 end');
    })

    /**
     * @tc.name   testRadioSelMode0014
     * @tc.number SUB_RADIO_SELMODE_0014
     * @tc.desc   selection mode 13 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0014 begin');
      const result: string = SlotModel.selectionModeName(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0014 end');
    })

    /**
     * @tc.name   testRadioSelMode0015
     * @tc.number SUB_RADIO_SELMODE_0015
     * @tc.desc   selection mode 14 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0015 begin');
      const result: string = SlotModel.selectionModeName(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0015 end');
    })

    /**
     * @tc.name   testRadioSelMode0016
     * @tc.number SUB_RADIO_SELMODE_0016
     * @tc.desc   selection mode 15 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0016 begin');
      const result: string = SlotModel.selectionModeName(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0016 end');
    })

    /**
     * @tc.name   testRadioSelMode0017
     * @tc.number SUB_RADIO_SELMODE_0017
     * @tc.desc   selection mode 16 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0017 begin');
      const result: string = SlotModel.selectionModeName(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0017 end');
    })

    /**
     * @tc.name   testRadioSelMode0018
     * @tc.number SUB_RADIO_SELMODE_0018
     * @tc.desc   selection mode 17 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0018 begin');
      const result: string = SlotModel.selectionModeName(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0018 end');
    })

    /**
     * @tc.name   testRadioSelMode0019
     * @tc.number SUB_RADIO_SELMODE_0019
     * @tc.desc   selection mode 18 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0019 begin');
      const result: string = SlotModel.selectionModeName(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0019 end');
    })

    /**
     * @tc.name   testRadioSelMode0020
     * @tc.number SUB_RADIO_SELMODE_0020
     * @tc.desc   selection mode 19 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0020 begin');
      const result: string = SlotModel.selectionModeName(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0020 end');
    })

    /**
     * @tc.name   testRadioSelMode0021
     * @tc.number SUB_RADIO_SELMODE_0021
     * @tc.desc   selection mode 20 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0021 begin');
      const result: string = SlotModel.selectionModeName(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0021 end');
    })

    /**
     * @tc.name   testRadioSelMode0022
     * @tc.number SUB_RADIO_SELMODE_0022
     * @tc.desc   selection mode 21 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0022 begin');
      const result: string = SlotModel.selectionModeName(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0022 end');
    })

    /**
     * @tc.name   testRadioSelMode0023
     * @tc.number SUB_RADIO_SELMODE_0023
     * @tc.desc   selection mode 22 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0023 begin');
      const result: string = SlotModel.selectionModeName(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0023 end');
    })

    /**
     * @tc.name   testRadioSelMode0024
     * @tc.number SUB_RADIO_SELMODE_0024
     * @tc.desc   selection mode 23 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0024 begin');
      const result: string = SlotModel.selectionModeName(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0024 end');
    })

    /**
     * @tc.name   testRadioSelMode0025
     * @tc.number SUB_RADIO_SELMODE_0025
     * @tc.desc   selection mode 24 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0025 begin');
      const result: string = SlotModel.selectionModeName(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0025 end');
    })

    /**
     * @tc.name   testRadioSelMode0026
     * @tc.number SUB_RADIO_SELMODE_0026
     * @tc.desc   selection mode 25 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0026 begin');
      const result: string = SlotModel.selectionModeName(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0026 end');
    })

    /**
     * @tc.name   testRadioSelMode0027
     * @tc.number SUB_RADIO_SELMODE_0027
     * @tc.desc   selection mode 26 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0027 begin');
      const result: string = SlotModel.selectionModeName(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0027 end');
    })

    /**
     * @tc.name   testRadioSelMode0028
     * @tc.number SUB_RADIO_SELMODE_0028
     * @tc.desc   selection mode 27 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0028 begin');
      const result: string = SlotModel.selectionModeName(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0028 end');
    })

    /**
     * @tc.name   testRadioSelMode0029
     * @tc.number SUB_RADIO_SELMODE_0029
     * @tc.desc   selection mode 28 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0029 begin');
      const result: string = SlotModel.selectionModeName(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0029 end');
    })

    /**
     * @tc.name   testRadioSelMode0030
     * @tc.number SUB_RADIO_SELMODE_0030
     * @tc.desc   selection mode 29 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0030 begin');
      const result: string = SlotModel.selectionModeName(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0030 end');
    })

    /**
     * @tc.name   testRadioSelMode0031
     * @tc.number SUB_RADIO_SELMODE_0031
     * @tc.desc   selection mode 30 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0031 begin');
      const result: string = SlotModel.selectionModeName(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0031 end');
    })

    /**
     * @tc.name   testRadioSelMode0032
     * @tc.number SUB_RADIO_SELMODE_0032
     * @tc.desc   selection mode 31 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0032 begin');
      const result: string = SlotModel.selectionModeName(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0032 end');
    })

    /**
     * @tc.name   testRadioSelMode0033
     * @tc.number SUB_RADIO_SELMODE_0033
     * @tc.desc   selection mode 32 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0033 begin');
      const result: string = SlotModel.selectionModeName(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0033 end');
    })

    /**
     * @tc.name   testRadioSelMode0034
     * @tc.number SUB_RADIO_SELMODE_0034
     * @tc.desc   selection mode 33 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0034 begin');
      const result: string = SlotModel.selectionModeName(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0034 end');
    })

    /**
     * @tc.name   testRadioSelMode0035
     * @tc.number SUB_RADIO_SELMODE_0035
     * @tc.desc   selection mode 34 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0035 begin');
      const result: string = SlotModel.selectionModeName(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0035 end');
    })

    /**
     * @tc.name   testRadioSelMode0036
     * @tc.number SUB_RADIO_SELMODE_0036
     * @tc.desc   selection mode 35 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0036 begin');
      const result: string = SlotModel.selectionModeName(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0036 end');
    })

    /**
     * @tc.name   testRadioSelMode0037
     * @tc.number SUB_RADIO_SELMODE_0037
     * @tc.desc   selection mode 36 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0037 begin');
      const result: string = SlotModel.selectionModeName(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0037 end');
    })

    /**
     * @tc.name   testRadioSelMode0038
     * @tc.number SUB_RADIO_SELMODE_0038
     * @tc.desc   selection mode 37 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0038 begin');
      const result: string = SlotModel.selectionModeName(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0038 end');
    })

    /**
     * @tc.name   testRadioSelMode0039
     * @tc.number SUB_RADIO_SELMODE_0039
     * @tc.desc   selection mode 38 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0039 begin');
      const result: string = SlotModel.selectionModeName(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0039 end');
    })

    /**
     * @tc.name   testRadioSelMode0040
     * @tc.number SUB_RADIO_SELMODE_0040
     * @tc.desc   selection mode 39 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0040 begin');
      const result: string = SlotModel.selectionModeName(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0040 end');
    })

    /**
     * @tc.name   testRadioSelMode0041
     * @tc.number SUB_RADIO_SELMODE_0041
     * @tc.desc   selection mode 40 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0041 begin');
      const result: string = SlotModel.selectionModeName(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0041 end');
    })

    /**
     * @tc.name   testRadioSelMode0042
     * @tc.number SUB_RADIO_SELMODE_0042
     * @tc.desc   selection mode 41 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0042 begin');
      const result: string = SlotModel.selectionModeName(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0042 end');
    })

    /**
     * @tc.name   testRadioSelMode0043
     * @tc.number SUB_RADIO_SELMODE_0043
     * @tc.desc   selection mode 42 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0043 begin');
      const result: string = SlotModel.selectionModeName(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0043 end');
    })

    /**
     * @tc.name   testRadioSelMode0044
     * @tc.number SUB_RADIO_SELMODE_0044
     * @tc.desc   selection mode 43 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0044 begin');
      const result: string = SlotModel.selectionModeName(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0044 end');
    })

    /**
     * @tc.name   testRadioSelMode0045
     * @tc.number SUB_RADIO_SELMODE_0045
     * @tc.desc   selection mode 44 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0045 begin');
      const result: string = SlotModel.selectionModeName(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0045 end');
    })

    /**
     * @tc.name   testRadioSelMode0046
     * @tc.number SUB_RADIO_SELMODE_0046
     * @tc.desc   selection mode 45 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0046 begin');
      const result: string = SlotModel.selectionModeName(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0046 end');
    })

    /**
     * @tc.name   testRadioSelMode0047
     * @tc.number SUB_RADIO_SELMODE_0047
     * @tc.desc   selection mode 46 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0047 begin');
      const result: string = SlotModel.selectionModeName(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0047 end');
    })

    /**
     * @tc.name   testRadioSelMode0048
     * @tc.number SUB_RADIO_SELMODE_0048
     * @tc.desc   selection mode 47 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0048 begin');
      const result: string = SlotModel.selectionModeName(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0048 end');
    })

    /**
     * @tc.name   testRadioSelMode0049
     * @tc.number SUB_RADIO_SELMODE_0049
     * @tc.desc   selection mode 48 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0049 begin');
      const result: string = SlotModel.selectionModeName(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0049 end');
    })

    /**
     * @tc.name   testRadioSelMode0050
     * @tc.number SUB_RADIO_SELMODE_0050
     * @tc.desc   selection mode 49 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0050 begin');
      const result: string = SlotModel.selectionModeName(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0050 end');
    })

    /**
     * @tc.name   testRadioSelMode0051
     * @tc.number SUB_RADIO_SELMODE_0051
     * @tc.desc   selection mode 50 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0051 begin');
      const result: string = SlotModel.selectionModeName(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0051 end');
    })

    /**
     * @tc.name   testRadioSelMode0052
     * @tc.number SUB_RADIO_SELMODE_0052
     * @tc.desc   selection mode 51 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0052 begin');
      const result: string = SlotModel.selectionModeName(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0052 end');
    })

    /**
     * @tc.name   testRadioSelMode0053
     * @tc.number SUB_RADIO_SELMODE_0053
     * @tc.desc   selection mode 52 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0053 begin');
      const result: string = SlotModel.selectionModeName(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0053 end');
    })

    /**
     * @tc.name   testRadioSelMode0054
     * @tc.number SUB_RADIO_SELMODE_0054
     * @tc.desc   selection mode 53 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0054 begin');
      const result: string = SlotModel.selectionModeName(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0054 end');
    })

    /**
     * @tc.name   testRadioSelMode0055
     * @tc.number SUB_RADIO_SELMODE_0055
     * @tc.desc   selection mode 54 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0055 begin');
      const result: string = SlotModel.selectionModeName(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0055 end');
    })

    /**
     * @tc.name   testRadioSelMode0056
     * @tc.number SUB_RADIO_SELMODE_0056
     * @tc.desc   selection mode 55 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0056 begin');
      const result: string = SlotModel.selectionModeName(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0056 end');
    })

    /**
     * @tc.name   testRadioSelMode0057
     * @tc.number SUB_RADIO_SELMODE_0057
     * @tc.desc   selection mode 56 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0057 begin');
      const result: string = SlotModel.selectionModeName(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0057 end');
    })

    /**
     * @tc.name   testRadioSelMode0058
     * @tc.number SUB_RADIO_SELMODE_0058
     * @tc.desc   selection mode 57 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0058 begin');
      const result: string = SlotModel.selectionModeName(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0058 end');
    })

    /**
     * @tc.name   testRadioSelMode0059
     * @tc.number SUB_RADIO_SELMODE_0059
     * @tc.desc   selection mode 58 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0059 begin');
      const result: string = SlotModel.selectionModeName(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0059 end');
    })

    /**
     * @tc.name   testRadioSelMode0060
     * @tc.number SUB_RADIO_SELMODE_0060
     * @tc.desc   selection mode 59 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0060 begin');
      const result: string = SlotModel.selectionModeName(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0060 end');
    })

    /**
     * @tc.name   testRadioSelMode0061
     * @tc.number SUB_RADIO_SELMODE_0061
     * @tc.desc   selection mode 60 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0061 begin');
      const result: string = SlotModel.selectionModeName(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0061 end');
    })

    /**
     * @tc.name   testRadioSelMode0062
     * @tc.number SUB_RADIO_SELMODE_0062
     * @tc.desc   selection mode 61 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0062 begin');
      const result: string = SlotModel.selectionModeName(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0062 end');
    })

    /**
     * @tc.name   testRadioSelMode0063
     * @tc.number SUB_RADIO_SELMODE_0063
     * @tc.desc   selection mode 62 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0063 begin');
      const result: string = SlotModel.selectionModeName(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0063 end');
    })

    /**
     * @tc.name   testRadioSelMode0064
     * @tc.number SUB_RADIO_SELMODE_0064
     * @tc.desc   selection mode 63 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0064 begin');
      const result: string = SlotModel.selectionModeName(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0064 end');
    })

    /**
     * @tc.name   testRadioSelMode0065
     * @tc.number SUB_RADIO_SELMODE_0065
     * @tc.desc   selection mode 64 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0065 begin');
      const result: string = SlotModel.selectionModeName(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0065 end');
    })

    /**
     * @tc.name   testRadioSelMode0066
     * @tc.number SUB_RADIO_SELMODE_0066
     * @tc.desc   selection mode 65 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0066 begin');
      const result: string = SlotModel.selectionModeName(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0066 end');
    })

    /**
     * @tc.name   testRadioSelMode0067
     * @tc.number SUB_RADIO_SELMODE_0067
     * @tc.desc   selection mode 66 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0067 begin');
      const result: string = SlotModel.selectionModeName(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0067 end');
    })

    /**
     * @tc.name   testRadioSelMode0068
     * @tc.number SUB_RADIO_SELMODE_0068
     * @tc.desc   selection mode 67 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0068 begin');
      const result: string = SlotModel.selectionModeName(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0068 end');
    })

    /**
     * @tc.name   testRadioSelMode0069
     * @tc.number SUB_RADIO_SELMODE_0069
     * @tc.desc   selection mode 68 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0069 begin');
      const result: string = SlotModel.selectionModeName(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0069 end');
    })

    /**
     * @tc.name   testRadioSelMode0070
     * @tc.number SUB_RADIO_SELMODE_0070
     * @tc.desc   selection mode 69 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0070 begin');
      const result: string = SlotModel.selectionModeName(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0070 end');
    })

    /**
     * @tc.name   testRadioSelMode0071
     * @tc.number SUB_RADIO_SELMODE_0071
     * @tc.desc   selection mode 70 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0071 begin');
      const result: string = SlotModel.selectionModeName(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0071 end');
    })

    /**
     * @tc.name   testRadioSelMode0072
     * @tc.number SUB_RADIO_SELMODE_0072
     * @tc.desc   selection mode 71 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0072 begin');
      const result: string = SlotModel.selectionModeName(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0072 end');
    })

    /**
     * @tc.name   testRadioSelMode0073
     * @tc.number SUB_RADIO_SELMODE_0073
     * @tc.desc   selection mode 72 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0073 begin');
      const result: string = SlotModel.selectionModeName(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0073 end');
    })

    /**
     * @tc.name   testRadioSelMode0074
     * @tc.number SUB_RADIO_SELMODE_0074
     * @tc.desc   selection mode -1 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0074 begin');
      const result: string = SlotModel.selectionModeName(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0074 end');
    })

    /**
     * @tc.name   testRadioSelMode0075
     * @tc.number SUB_RADIO_SELMODE_0075
     * @tc.desc   selection mode -2 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0075 begin');
      const result: string = SlotModel.selectionModeName(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0075 end');
    })

    /**
     * @tc.name   testRadioSelMode0076
     * @tc.number SUB_RADIO_SELMODE_0076
     * @tc.desc   selection mode -100 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0076 begin');
      const result: string = SlotModel.selectionModeName(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0076 end');
    })

    /**
     * @tc.name   testRadioSelMode0077
     * @tc.number SUB_RADIO_SELMODE_0077
     * @tc.desc   selection mode 0.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0077 begin');
      const result: string = SlotModel.selectionModeName(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0077 end');
    })

    /**
     * @tc.name   testRadioSelMode0078
     * @tc.number SUB_RADIO_SELMODE_0078
     * @tc.desc   selection mode 1.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0078 begin');
      const result: string = SlotModel.selectionModeName(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0078 end');
    })

    /**
     * @tc.name   testRadioSelMode0079
     * @tc.number SUB_RADIO_SELMODE_0079
     * @tc.desc   selection mode 2.5 maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0079 begin');
      const result: string = SlotModel.selectionModeName(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown'));
      expect(result === 'unknown').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0079 end');
    })

    /**
     * @tc.name   testRadioSelMode0080
     * @tc.number SUB_RADIO_SELMODE_0080
     * @tc.desc   手动选网模式映射到 manual
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRadioSelMode0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0080 begin');
      const anchorResult: string = SlotModel.selectionModeName(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorResult), String('manual'));
      expect(anchorResult).assertEqual('manual');
      expect(anchorResult === 'unknown').assertEqual(false);
      expect(anchorResult.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRadioSelMode0080 end');
    })
  })
}
