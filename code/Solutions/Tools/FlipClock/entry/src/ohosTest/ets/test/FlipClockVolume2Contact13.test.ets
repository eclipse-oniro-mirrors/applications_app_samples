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
import { ContactSource, Contact } from '../../../main/ets/common/DataSource';

export default function flipClockVolume2Contact13Test() {
  describe('FlipClockVolume2Contact13Test', () => {

    /**
     * @tc.name   testFlipClockVol2130001
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0001
     * @tc.desc   Push second contact volume batch 13-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 841; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(841);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(840).reminderId).assertEqual(840);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130002
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0002
     * @tc.desc   Push second contact volume batch 13-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 842; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(842);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(841).reminderId).assertEqual(841);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130003
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0003
     * @tc.desc   Push second contact volume batch 13-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 843; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(843);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(842).reminderId).assertEqual(842);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130004
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0004
     * @tc.desc   Push second contact volume batch 13-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 844; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(844);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(843).reminderId).assertEqual(843);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130005
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0005
     * @tc.desc   Push second contact volume batch 13-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 845; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(845);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(844).reminderId).assertEqual(844);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130006
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0006
     * @tc.desc   Push second contact volume batch 13-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 846; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(846);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(845).reminderId).assertEqual(845);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130007
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0007
     * @tc.desc   Push second contact volume batch 13-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 847; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(847);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(846).reminderId).assertEqual(846);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130008
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0008
     * @tc.desc   Push second contact volume batch 13-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 848; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(848);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(847).reminderId).assertEqual(847);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130009
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0009
     * @tc.desc   Push second contact volume batch 13-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 849; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(849);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(848).reminderId).assertEqual(848);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130010
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0010
     * @tc.desc   Push second contact volume batch 13-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 850; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(850);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(849).reminderId).assertEqual(849);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130011
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0011
     * @tc.desc   Push second contact volume batch 13-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 851; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(851);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(850).reminderId).assertEqual(850);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130012
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0012
     * @tc.desc   Push second contact volume batch 13-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 852; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(852);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(851).reminderId).assertEqual(851);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130013
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0013
     * @tc.desc   Push second contact volume batch 13-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 853; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(853);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(852).reminderId).assertEqual(852);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130014
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0014
     * @tc.desc   Push second contact volume batch 13-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 854; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(854);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(853).reminderId).assertEqual(853);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130015
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0015
     * @tc.desc   Push second contact volume batch 13-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 855; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(855);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(854).reminderId).assertEqual(854);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130016
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0016
     * @tc.desc   Push second contact volume batch 13-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 856; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(856);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(855).reminderId).assertEqual(855);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130017
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0017
     * @tc.desc   Push second contact volume batch 13-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 857; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(857);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(856).reminderId).assertEqual(856);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130018
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0018
     * @tc.desc   Push second contact volume batch 13-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 858; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(858);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(857).reminderId).assertEqual(857);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130019
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0019
     * @tc.desc   Push second contact volume batch 13-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 859; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(859);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(858).reminderId).assertEqual(858);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2130020
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0020
     * @tc.desc   Push second contact volume batch 13-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2130020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 860; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(860);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(859).reminderId).assertEqual(859);
      await Promise.resolve();
    })
  })
}
