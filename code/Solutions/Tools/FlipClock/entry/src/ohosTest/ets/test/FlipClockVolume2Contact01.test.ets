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

export default function flipClockVolume2Contact01Test() {
  describe('FlipClockVolume2Contact01Test', () => {

    /**
     * @tc.name   testFlipClockVol2010001
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0001
     * @tc.desc   Push second contact volume batch 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 601; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(601);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(600).reminderId).assertEqual(600);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010002
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0002
     * @tc.desc   Push second contact volume batch 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 602; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(602);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(601).reminderId).assertEqual(601);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010003
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0003
     * @tc.desc   Push second contact volume batch 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 603; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(603);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(602).reminderId).assertEqual(602);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010004
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0004
     * @tc.desc   Push second contact volume batch 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 604; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(604);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(603).reminderId).assertEqual(603);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010005
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0005
     * @tc.desc   Push second contact volume batch 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 605; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(605);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(604).reminderId).assertEqual(604);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010006
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0006
     * @tc.desc   Push second contact volume batch 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 606; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(606);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(605).reminderId).assertEqual(605);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010007
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0007
     * @tc.desc   Push second contact volume batch 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 607; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(607);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(606).reminderId).assertEqual(606);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010008
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0008
     * @tc.desc   Push second contact volume batch 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 608; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(608);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(607).reminderId).assertEqual(607);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010009
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0009
     * @tc.desc   Push second contact volume batch 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 609; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(609);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(608).reminderId).assertEqual(608);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010010
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0010
     * @tc.desc   Push second contact volume batch 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 610; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(610);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(609).reminderId).assertEqual(609);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010011
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0011
     * @tc.desc   Push second contact volume batch 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 611; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(611);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(610).reminderId).assertEqual(610);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010012
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0012
     * @tc.desc   Push second contact volume batch 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 612; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(612);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(611).reminderId).assertEqual(611);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010013
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0013
     * @tc.desc   Push second contact volume batch 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 613; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(613);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(612).reminderId).assertEqual(612);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010014
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0014
     * @tc.desc   Push second contact volume batch 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 614; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(614);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(613).reminderId).assertEqual(613);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010015
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0015
     * @tc.desc   Push second contact volume batch 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 615; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(615);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(614).reminderId).assertEqual(614);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010016
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0016
     * @tc.desc   Push second contact volume batch 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 616; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(616);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(615).reminderId).assertEqual(615);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010017
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0017
     * @tc.desc   Push second contact volume batch 1-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 617; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(617);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(616).reminderId).assertEqual(616);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010018
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0018
     * @tc.desc   Push second contact volume batch 1-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 618; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(618);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(617).reminderId).assertEqual(617);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010019
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0019
     * @tc.desc   Push second contact volume batch 1-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 619; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(619);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(618).reminderId).assertEqual(618);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2010020
     * @tc.number SUB_FLIP_CLOCK_VOL2_01_0020
     * @tc.desc   Push second contact volume batch 1-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 620; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(620);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(619).reminderId).assertEqual(619);
      await Promise.resolve();
    })
  })
}
