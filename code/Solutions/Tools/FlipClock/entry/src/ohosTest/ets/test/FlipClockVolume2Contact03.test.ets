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

export default function flipClockVolume2Contact03Test() {
  describe('FlipClockVolume2Contact03Test', () => {

    /**
     * @tc.name   testFlipClockVol2030001
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0001
     * @tc.desc   Push second contact volume batch 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 641; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(641);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(640).reminderId).assertEqual(640);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030002
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0002
     * @tc.desc   Push second contact volume batch 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 642; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(642);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(641).reminderId).assertEqual(641);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030003
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0003
     * @tc.desc   Push second contact volume batch 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 643; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(643);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(642).reminderId).assertEqual(642);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030004
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0004
     * @tc.desc   Push second contact volume batch 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 644; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(644);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(643).reminderId).assertEqual(643);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030005
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0005
     * @tc.desc   Push second contact volume batch 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 645; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(645);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(644).reminderId).assertEqual(644);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030006
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0006
     * @tc.desc   Push second contact volume batch 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 646; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(646);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(645).reminderId).assertEqual(645);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030007
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0007
     * @tc.desc   Push second contact volume batch 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 647; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(647);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(646).reminderId).assertEqual(646);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030008
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0008
     * @tc.desc   Push second contact volume batch 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 648; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(648);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(647).reminderId).assertEqual(647);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030009
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0009
     * @tc.desc   Push second contact volume batch 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 649; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(649);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(648).reminderId).assertEqual(648);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030010
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0010
     * @tc.desc   Push second contact volume batch 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 650; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(650);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(649).reminderId).assertEqual(649);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030011
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0011
     * @tc.desc   Push second contact volume batch 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 651; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(651);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(650).reminderId).assertEqual(650);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030012
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0012
     * @tc.desc   Push second contact volume batch 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 652; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(652);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(651).reminderId).assertEqual(651);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030013
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0013
     * @tc.desc   Push second contact volume batch 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 653; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(653);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(652).reminderId).assertEqual(652);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030014
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0014
     * @tc.desc   Push second contact volume batch 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 654; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(654);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(653).reminderId).assertEqual(653);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030015
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0015
     * @tc.desc   Push second contact volume batch 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 655; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(655);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(654).reminderId).assertEqual(654);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030016
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0016
     * @tc.desc   Push second contact volume batch 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 656; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(656);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(655).reminderId).assertEqual(655);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030017
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0017
     * @tc.desc   Push second contact volume batch 3-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 657; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(657);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(656).reminderId).assertEqual(656);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030018
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0018
     * @tc.desc   Push second contact volume batch 3-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 658; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(658);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(657).reminderId).assertEqual(657);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030019
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0019
     * @tc.desc   Push second contact volume batch 3-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 659; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(659);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(658).reminderId).assertEqual(658);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2030020
     * @tc.number SUB_FLIP_CLOCK_VOL2_03_0020
     * @tc.desc   Push second contact volume batch 3-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 660; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(660);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(659).reminderId).assertEqual(659);
      await Promise.resolve();
    })
  })
}
