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

export default function flipClockVolume2Contact02Test() {
  describe('FlipClockVolume2Contact02Test', () => {

    /**
     * @tc.name   testFlipClockVol2020001
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0001
     * @tc.desc   Push second contact volume batch 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 621; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(621);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(620).reminderId).assertEqual(620);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020002
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0002
     * @tc.desc   Push second contact volume batch 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 622; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(622);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(621).reminderId).assertEqual(621);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020003
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0003
     * @tc.desc   Push second contact volume batch 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 623; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(623);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(622).reminderId).assertEqual(622);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020004
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0004
     * @tc.desc   Push second contact volume batch 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 624; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(624);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(623).reminderId).assertEqual(623);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020005
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0005
     * @tc.desc   Push second contact volume batch 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 625; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(625);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(624).reminderId).assertEqual(624);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020006
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0006
     * @tc.desc   Push second contact volume batch 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 626; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(626);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(625).reminderId).assertEqual(625);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020007
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0007
     * @tc.desc   Push second contact volume batch 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 627; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(627);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(626).reminderId).assertEqual(626);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020008
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0008
     * @tc.desc   Push second contact volume batch 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 628; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(628);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(627).reminderId).assertEqual(627);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020009
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0009
     * @tc.desc   Push second contact volume batch 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 629; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(629);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(628).reminderId).assertEqual(628);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020010
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0010
     * @tc.desc   Push second contact volume batch 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 630; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(630);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(629).reminderId).assertEqual(629);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020011
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0011
     * @tc.desc   Push second contact volume batch 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 631; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(631);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(630).reminderId).assertEqual(630);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020012
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0012
     * @tc.desc   Push second contact volume batch 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 632; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(632);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(631).reminderId).assertEqual(631);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020013
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0013
     * @tc.desc   Push second contact volume batch 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 633; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(633);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(632).reminderId).assertEqual(632);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020014
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0014
     * @tc.desc   Push second contact volume batch 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 634; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(634);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(633).reminderId).assertEqual(633);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020015
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0015
     * @tc.desc   Push second contact volume batch 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 635; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(635);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(634).reminderId).assertEqual(634);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020016
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0016
     * @tc.desc   Push second contact volume batch 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 636; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(636);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(635).reminderId).assertEqual(635);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020017
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0017
     * @tc.desc   Push second contact volume batch 2-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 637; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(637);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(636).reminderId).assertEqual(636);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020018
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0018
     * @tc.desc   Push second contact volume batch 2-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 638; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(638);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(637).reminderId).assertEqual(637);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020019
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0019
     * @tc.desc   Push second contact volume batch 2-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 639; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(639);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(638).reminderId).assertEqual(638);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2020020
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0020
     * @tc.desc   Push second contact volume batch 2-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 640; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(640);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(639).reminderId).assertEqual(639);
      await Promise.resolve();
    })
  })
}
