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

export default function flipClockVolumeContact23Test() {
  describe('FlipClockVolumeContact23Test', () => {

    /**
     * @tc.name   testFlipClockVolume230001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0001
     * @tc.desc   Push contact volume batch 23-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 441; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(441);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(440).reminderId).assertEqual(440);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0002
     * @tc.desc   Push contact volume batch 23-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 442; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(442);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(441).reminderId).assertEqual(441);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0003
     * @tc.desc   Push contact volume batch 23-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 443; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(443);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(442).reminderId).assertEqual(442);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0004
     * @tc.desc   Push contact volume batch 23-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 444; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(444);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(443).reminderId).assertEqual(443);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0005
     * @tc.desc   Push contact volume batch 23-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 445; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(445);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(444).reminderId).assertEqual(444);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0006
     * @tc.desc   Push contact volume batch 23-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 446; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(446);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(445).reminderId).assertEqual(445);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0007
     * @tc.desc   Push contact volume batch 23-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 447; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(447);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(446).reminderId).assertEqual(446);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0008
     * @tc.desc   Push contact volume batch 23-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 448; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(448);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(447).reminderId).assertEqual(447);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0009
     * @tc.desc   Push contact volume batch 23-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 449; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(449);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(448).reminderId).assertEqual(448);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0010
     * @tc.desc   Push contact volume batch 23-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 450; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(450);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(449).reminderId).assertEqual(449);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0011
     * @tc.desc   Push contact volume batch 23-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 451; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(451);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(450).reminderId).assertEqual(450);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0012
     * @tc.desc   Push contact volume batch 23-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 452; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(452);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(451).reminderId).assertEqual(451);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0013
     * @tc.desc   Push contact volume batch 23-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 453; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(453);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(452).reminderId).assertEqual(452);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0014
     * @tc.desc   Push contact volume batch 23-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 454; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(454);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(453).reminderId).assertEqual(453);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0015
     * @tc.desc   Push contact volume batch 23-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 455; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(455);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(454).reminderId).assertEqual(454);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0016
     * @tc.desc   Push contact volume batch 23-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 456; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(456);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(455).reminderId).assertEqual(455);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0017
     * @tc.desc   Push contact volume batch 23-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 457; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(457);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(456).reminderId).assertEqual(456);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0018
     * @tc.desc   Push contact volume batch 23-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 458; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(458);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(457).reminderId).assertEqual(457);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0019
     * @tc.desc   Push contact volume batch 23-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 459; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(459);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(458).reminderId).assertEqual(458);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume230020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0020
     * @tc.desc   Push contact volume batch 23-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume230020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 460; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(460);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(459).reminderId).assertEqual(459);
      await Promise.resolve();
    })
  })
}
