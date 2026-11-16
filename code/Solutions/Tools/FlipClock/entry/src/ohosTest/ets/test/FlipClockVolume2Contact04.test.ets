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

export default function flipClockVolume2Contact04Test() {
  describe('FlipClockVolume2Contact04Test', () => {

    /**
     * @tc.name   testFlipClockVol2040001
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0001
     * @tc.desc   Push second contact volume batch 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 661; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(661);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(660).reminderId).assertEqual(660);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040002
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0002
     * @tc.desc   Push second contact volume batch 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 662; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(662);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(661).reminderId).assertEqual(661);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040003
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0003
     * @tc.desc   Push second contact volume batch 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 663; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(663);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(662).reminderId).assertEqual(662);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040004
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0004
     * @tc.desc   Push second contact volume batch 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 664; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(664);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(663).reminderId).assertEqual(663);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040005
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0005
     * @tc.desc   Push second contact volume batch 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 665; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(665);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(664).reminderId).assertEqual(664);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040006
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0006
     * @tc.desc   Push second contact volume batch 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 666; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(666);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(665).reminderId).assertEqual(665);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040007
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0007
     * @tc.desc   Push second contact volume batch 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 667; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(667);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(666).reminderId).assertEqual(666);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040008
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0008
     * @tc.desc   Push second contact volume batch 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 668; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(668);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(667).reminderId).assertEqual(667);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040009
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0009
     * @tc.desc   Push second contact volume batch 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 669; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(669);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(668).reminderId).assertEqual(668);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040010
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0010
     * @tc.desc   Push second contact volume batch 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 670; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(670);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(669).reminderId).assertEqual(669);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040011
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0011
     * @tc.desc   Push second contact volume batch 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 671; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(671);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(670).reminderId).assertEqual(670);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040012
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0012
     * @tc.desc   Push second contact volume batch 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 672; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(672);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(671).reminderId).assertEqual(671);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040013
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0013
     * @tc.desc   Push second contact volume batch 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 673; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(673);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(672).reminderId).assertEqual(672);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040014
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0014
     * @tc.desc   Push second contact volume batch 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 674; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(674);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(673).reminderId).assertEqual(673);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040015
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0015
     * @tc.desc   Push second contact volume batch 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 675; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(675);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(674).reminderId).assertEqual(674);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040016
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0016
     * @tc.desc   Push second contact volume batch 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 676; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(676);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(675).reminderId).assertEqual(675);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040017
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0017
     * @tc.desc   Push second contact volume batch 4-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 677; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(677);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(676).reminderId).assertEqual(676);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040018
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0018
     * @tc.desc   Push second contact volume batch 4-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 678; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(678);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(677).reminderId).assertEqual(677);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040019
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0019
     * @tc.desc   Push second contact volume batch 4-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 679; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(679);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(678).reminderId).assertEqual(678);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2040020
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0020
     * @tc.desc   Push second contact volume batch 4-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 680; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(680);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(679).reminderId).assertEqual(679);
      await Promise.resolve();
    })
  })
}
