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

export default function flipClockVolume2Contact12Test() {
  describe('FlipClockVolume2Contact12Test', () => {

    /**
     * @tc.name   testFlipClockVol2120001
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0001
     * @tc.desc   Push second contact volume batch 12-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 821; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(821);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(820).reminderId).assertEqual(820);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120002
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0002
     * @tc.desc   Push second contact volume batch 12-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 822; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(822);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(821).reminderId).assertEqual(821);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120003
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0003
     * @tc.desc   Push second contact volume batch 12-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 823; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(823);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(822).reminderId).assertEqual(822);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120004
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0004
     * @tc.desc   Push second contact volume batch 12-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 824; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(824);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(823).reminderId).assertEqual(823);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120005
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0005
     * @tc.desc   Push second contact volume batch 12-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 825; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(825);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(824).reminderId).assertEqual(824);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120006
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0006
     * @tc.desc   Push second contact volume batch 12-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 826; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(826);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(825).reminderId).assertEqual(825);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120007
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0007
     * @tc.desc   Push second contact volume batch 12-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 827; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(827);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(826).reminderId).assertEqual(826);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120008
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0008
     * @tc.desc   Push second contact volume batch 12-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 828; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(828);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(827).reminderId).assertEqual(827);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120009
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0009
     * @tc.desc   Push second contact volume batch 12-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 829; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(829);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(828).reminderId).assertEqual(828);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120010
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0010
     * @tc.desc   Push second contact volume batch 12-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 830; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(830);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(829).reminderId).assertEqual(829);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120011
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0011
     * @tc.desc   Push second contact volume batch 12-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 831; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(831);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(830).reminderId).assertEqual(830);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120012
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0012
     * @tc.desc   Push second contact volume batch 12-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 832; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(832);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(831).reminderId).assertEqual(831);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120013
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0013
     * @tc.desc   Push second contact volume batch 12-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 833; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(833);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(832).reminderId).assertEqual(832);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120014
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0014
     * @tc.desc   Push second contact volume batch 12-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 834; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(834);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(833).reminderId).assertEqual(833);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120015
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0015
     * @tc.desc   Push second contact volume batch 12-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 835; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(835);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(834).reminderId).assertEqual(834);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120016
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0016
     * @tc.desc   Push second contact volume batch 12-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 836; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(836);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(835).reminderId).assertEqual(835);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120017
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0017
     * @tc.desc   Push second contact volume batch 12-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 837; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(837);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(836).reminderId).assertEqual(836);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120018
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0018
     * @tc.desc   Push second contact volume batch 12-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 838; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(838);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(837).reminderId).assertEqual(837);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120019
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0019
     * @tc.desc   Push second contact volume batch 12-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 839; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(839);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(838).reminderId).assertEqual(838);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2120020
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0020
     * @tc.desc   Push second contact volume batch 12-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 840; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(840);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(839).reminderId).assertEqual(839);
      await Promise.resolve();
    })
  })
}
