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

export default function radioSlotReal01Test() {
  describe('RadioSlotReal01Test', () => {

    /**
     * @tc.name   testSlotReal0001
     * @tc.number SUB_RADIO_SLOTREAL_0001
     * @tc.desc   slot id 1 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0001 begin');
      const slotId: number = -3;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0001 end');
    })

    /**
     * @tc.name   testSlotReal0002
     * @tc.number SUB_RADIO_SLOTREAL_0002
     * @tc.desc   slot id 2 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0002 begin');
      const slotId: number = -2;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')));
      expect(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0002 end');
    })

    /**
     * @tc.name   testSlotReal0003
     * @tc.number SUB_RADIO_SLOTREAL_0003
     * @tc.desc   slot id 3 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0003 begin');
      const slotId: number = -1;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.normalizeSlotId(slotId) >= 0));
      expect(SlotModel.normalizeSlotId(slotId) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId) <= 3));
      expect(SlotModel.normalizeSlotId(slotId) <= 3).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0003 end');
    })

    /**
     * @tc.name   testSlotReal0004
     * @tc.number SUB_RADIO_SLOTREAL_0004
     * @tc.desc   slot id 4 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0004 begin');
      const slotId: number = 0;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0004 end');
    })

    /**
     * @tc.name   testSlotReal0005
     * @tc.number SUB_RADIO_SLOTREAL_0005
     * @tc.desc   slot id 5 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0005 begin');
      const slotId: number = 1;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')));
      expect(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0005 end');
    })

    /**
     * @tc.name   testSlotReal0006
     * @tc.number SUB_RADIO_SLOTREAL_0006
     * @tc.desc   slot id 6 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0006 begin');
      const slotId: number = 2;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.normalizeSlotId(slotId) >= 0));
      expect(SlotModel.normalizeSlotId(slotId) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId) <= 3));
      expect(SlotModel.normalizeSlotId(slotId) <= 3).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0006 end');
    })

    /**
     * @tc.name   testSlotReal0007
     * @tc.number SUB_RADIO_SLOTREAL_0007
     * @tc.desc   slot id 7 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0007 begin');
      const slotId: number = 3;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0007 end');
    })

    /**
     * @tc.name   testSlotReal0008
     * @tc.number SUB_RADIO_SLOTREAL_0008
     * @tc.desc   slot id 8 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0008 begin');
      const slotId: number = 4;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')));
      expect(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0008 end');
    })

    /**
     * @tc.name   testSlotReal0009
     * @tc.number SUB_RADIO_SLOTREAL_0009
     * @tc.desc   slot id 9 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0009 begin');
      const slotId: number = 5;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.normalizeSlotId(slotId) >= 0));
      expect(SlotModel.normalizeSlotId(slotId) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId) <= 3));
      expect(SlotModel.normalizeSlotId(slotId) <= 3).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0009 end');
    })

    /**
     * @tc.name   testSlotReal0010
     * @tc.number SUB_RADIO_SLOTREAL_0010
     * @tc.desc   slot id 10 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0010 begin');
      const slotId: number = 0.5;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0010 end');
    })

    /**
     * @tc.name   testSlotReal0011
     * @tc.number SUB_RADIO_SLOTREAL_0011
     * @tc.desc   slot id 11 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0011 begin');
      const slotId: number = 1.5;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')));
      expect(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0011 end');
    })

    /**
     * @tc.name   testSlotReal0012
     * @tc.number SUB_RADIO_SLOTREAL_0012
     * @tc.desc   slot id 12 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0012 begin');
      const slotId: number = 2.5;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.normalizeSlotId(slotId) >= 0));
      expect(SlotModel.normalizeSlotId(slotId) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId) <= 3));
      expect(SlotModel.normalizeSlotId(slotId) <= 3).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0012 end');
    })

    /**
     * @tc.name   testSlotReal0013
     * @tc.number SUB_RADIO_SLOTREAL_0013
     * @tc.desc   slot id 13 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0013 begin');
      const slotId: number = Number.NaN;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0013 end');
    })

    /**
     * @tc.name   testSlotReal0014
     * @tc.number SUB_RADIO_SLOTREAL_0014
     * @tc.desc   slot id 14 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0014 begin');
      const slotId: number = Number.POSITIVE_INFINITY;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')));
      expect(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0014 end');
    })

    /**
     * @tc.name   testSlotReal0015
     * @tc.number SUB_RADIO_SLOTREAL_0015
     * @tc.desc   slot id 15 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0015 begin');
      const slotId: number = Number.NEGATIVE_INFINITY;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.normalizeSlotId(slotId) >= 0));
      expect(SlotModel.normalizeSlotId(slotId) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId) <= 3));
      expect(SlotModel.normalizeSlotId(slotId) <= 3).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0015 end');
    })

    /**
     * @tc.name   testSlotReal0016
     * @tc.number SUB_RADIO_SLOTREAL_0016
     * @tc.desc   slot id 16 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0016 begin');
      const slotId: number = -0;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0016 end');
    })

    /**
     * @tc.name   testSlotReal0017
     * @tc.number SUB_RADIO_SLOTREAL_0017
     * @tc.desc   slot id 17 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0017 begin');
      const slotId: number = 3;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')));
      expect(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0017 end');
    })

    /**
     * @tc.name   testSlotReal0018
     * @tc.number SUB_RADIO_SLOTREAL_0018
     * @tc.desc   slot id 18 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0018 begin');
      const slotId: number = 2;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.normalizeSlotId(slotId) >= 0));
      expect(SlotModel.normalizeSlotId(slotId) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId) <= 3));
      expect(SlotModel.normalizeSlotId(slotId) <= 3).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0018 end');
    })

    /**
     * @tc.name   testSlotReal0019
     * @tc.number SUB_RADIO_SLOTREAL_0019
     * @tc.desc   slot id 19 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0019 begin');
      const slotId: number = 1;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0019 end');
    })

    /**
     * @tc.name   testSlotReal0020
     * @tc.number SUB_RADIO_SLOTREAL_0020
     * @tc.desc   slot id 20 validates, normalizes and formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0020 begin');
      const slotId: number = 0;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')));
      expect(SlotModel.formatTitle(SlotModel.normalizeSlotId(slotId)).startsWith('SIM')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0020 end');
    })

    /**
     * @tc.name   testSlotReal0021
     * @tc.number SUB_RADIO_SLOTREAL_0021
     * @tc.desc   slot title input 1 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0021 begin');
      const title: string = 'SIM1 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0021 end');
    })

    /**
     * @tc.name   testSlotReal0022
     * @tc.number SUB_RADIO_SLOTREAL_0022
     * @tc.desc   slot title input 2 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0022 begin');
      const title: string = 'SIM2 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0022 end');
    })

    /**
     * @tc.name   testSlotReal0023
     * @tc.number SUB_RADIO_SLOTREAL_0023
     * @tc.desc   slot title input 3 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0023 begin');
      const title: string = 'SIM3 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM3 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0023 end');
    })

    /**
     * @tc.name   testSlotReal0024
     * @tc.number SUB_RADIO_SLOTREAL_0024
     * @tc.desc   slot title input 4 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0024 begin');
      const title: string = 'SIM4 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0024 end');
    })

    /**
     * @tc.name   testSlotReal0025
     * @tc.number SUB_RADIO_SLOTREAL_0025
     * @tc.desc   slot title input 5 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0025 begin');
      const title: string = 'SIM5 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0025 end');
    })

    /**
     * @tc.name   testSlotReal0026
     * @tc.number SUB_RADIO_SLOTREAL_0026
     * @tc.desc   slot title input 6 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0026 begin');
      const title: string = 'SIM0 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0026 end');
    })

    /**
     * @tc.name   testSlotReal0027
     * @tc.number SUB_RADIO_SLOTREAL_0027
     * @tc.desc   slot title input 7 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0027 begin');
      const title: string = 'sim1 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0027 end');
    })

    /**
     * @tc.name   testSlotReal0028
     * @tc.number SUB_RADIO_SLOTREAL_0028
     * @tc.desc   slot title input 8 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0028 begin');
      const title: string = 'SIM1 Status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0028 end');
    })

    /**
     * @tc.name   testSlotReal0029
     * @tc.number SUB_RADIO_SLOTREAL_0029
     * @tc.desc   slot title input 9 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0029 begin');
      const title: string = 'SIM1  status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0029 end');
    })

    /**
     * @tc.name   testSlotReal0030
     * @tc.number SUB_RADIO_SLOTREAL_0030
     * @tc.desc   slot title input 10 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0030 begin');
      const title: string = 'SIM1';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0030 end');
    })

    /**
     * @tc.name   testSlotReal0031
     * @tc.number SUB_RADIO_SLOTREAL_0031
     * @tc.desc   slot title input 11 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0031 begin');
      const title: string = ' SIM1 status';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0031 end');
    })

    /**
     * @tc.name   testSlotReal0032
     * @tc.number SUB_RADIO_SLOTREAL_0032
     * @tc.desc   slot title input 12 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0032 begin');
      const title: string = 'SIM1 status ';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0032 end');
    })

    /**
     * @tc.name   testSlotReal0033
     * @tc.number SUB_RADIO_SLOTREAL_0033
     * @tc.desc   slot title input 13 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0033 begin');
      const title: string = '';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(result)));
      expect(SlotModel.isValidSlotId(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0033 end');
    })

    /**
     * @tc.name   testSlotReal0034
     * @tc.number SUB_RADIO_SLOTREAL_0034
     * @tc.desc   slot title input 14 round-trips to its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0034 begin');
      const title: string = '状态';
      const result: number = SlotModel.slotIndexFromTitle(title);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result >= -1 && result <= 3));
      expect(result >= -1 && result <= 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(result)));
      expect(SlotModel.formatTitle(result)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0034 end');
    })

    /**
     * @tc.name   testSlotReal0035
     * @tc.number SUB_RADIO_SLOTREAL_0035
     * @tc.desc   selection mode 1 maps to its documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0035 begin');
      const mode: number = -1;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown' || result === 'automatic' || result === 'manual'));
      expect(result === 'unknown' || result === 'automatic' || result === 'manual').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0035 end');
    })

    /**
     * @tc.name   testSlotReal0036
     * @tc.number SUB_RADIO_SLOTREAL_0036
     * @tc.desc   selection mode 2 maps to its documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0036 begin');
      const mode: number = 0;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.length >= 6));
      expect(result.length >= 6).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0036 end');
    })

    /**
     * @tc.name   testSlotReal0037
     * @tc.number SUB_RADIO_SLOTREAL_0037
     * @tc.desc   selection mode 3 maps to its documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0037 begin');
      const mode: number = 1;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('automatic'));
      expect(result).assertEqual('automatic');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown' || result === 'automatic' || result === 'manual'));
      expect(result === 'unknown' || result === 'automatic' || result === 'manual').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0037 end');
    })

    /**
     * @tc.name   testSlotReal0038
     * @tc.number SUB_RADIO_SLOTREAL_0038
     * @tc.desc   selection mode 4 maps to its documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0038 begin');
      const mode: number = 2;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('manual'));
      expect(result).assertEqual('manual');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.length >= 6));
      expect(result.length >= 6).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0038 end');
    })

    /**
     * @tc.name   testSlotReal0039
     * @tc.number SUB_RADIO_SLOTREAL_0039
     * @tc.desc   selection mode 5 maps to its documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0039 begin');
      const mode: number = 3;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown' || result === 'automatic' || result === 'manual'));
      expect(result === 'unknown' || result === 'automatic' || result === 'manual').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0039 end');
    })

    /**
     * @tc.name   testSlotReal0040
     * @tc.number SUB_RADIO_SLOTREAL_0040
     * @tc.desc   selection mode 6 maps to its documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0040 begin');
      const mode: number = 1.5;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.length >= 6));
      expect(result.length >= 6).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0040 end');
    })

    /**
     * @tc.name   testSlotReal0041
     * @tc.number SUB_RADIO_SLOTREAL_0041
     * @tc.desc   selection mode 7 maps to its documented name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlotReal0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0041 begin');
      const mode: number = NaN;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result === 'unknown' || result === 'automatic' || result === 'manual'));
      expect(result === 'unknown' || result === 'automatic' || result === 'manual').assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlotReal0041 end');
    })

  })
}
