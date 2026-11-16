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

export default function flipClockVolumeContact04Test() {
  describe('FlipClockVolumeContact04Test', () => {

    /**
     * @tc.name   testFlipClockVolume040001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0001
     * @tc.desc   Push contact volume batch 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 61; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(61);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(60).reminderId).assertEqual(60);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0002
     * @tc.desc   Push contact volume batch 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 62; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(62);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(61).reminderId).assertEqual(61);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0003
     * @tc.desc   Push contact volume batch 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 63; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(63);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(62).reminderId).assertEqual(62);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0004
     * @tc.desc   Push contact volume batch 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 64; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(63).reminderId).assertEqual(63);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0005
     * @tc.desc   Push contact volume batch 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 65; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(65);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(64).reminderId).assertEqual(64);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0006
     * @tc.desc   Push contact volume batch 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 66; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(66);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(65).reminderId).assertEqual(65);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0007
     * @tc.desc   Push contact volume batch 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 67; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(67);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(66).reminderId).assertEqual(66);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0008
     * @tc.desc   Push contact volume batch 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 68; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(68);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(67).reminderId).assertEqual(67);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0009
     * @tc.desc   Push contact volume batch 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 69; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(69);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(68).reminderId).assertEqual(68);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0010
     * @tc.desc   Push contact volume batch 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 70; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(70);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(69).reminderId).assertEqual(69);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0011
     * @tc.desc   Push contact volume batch 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 71; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(71);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(70).reminderId).assertEqual(70);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0012
     * @tc.desc   Push contact volume batch 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 72; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(72);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(71).reminderId).assertEqual(71);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0013
     * @tc.desc   Push contact volume batch 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 73; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(73);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(72).reminderId).assertEqual(72);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0014
     * @tc.desc   Push contact volume batch 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 74; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(74);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(73).reminderId).assertEqual(73);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0015
     * @tc.desc   Push contact volume batch 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 75; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(75);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(74).reminderId).assertEqual(74);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0016
     * @tc.desc   Push contact volume batch 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 76; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(76);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(75).reminderId).assertEqual(75);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0017
     * @tc.desc   Push contact volume batch 4-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 77; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(77);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(76).reminderId).assertEqual(76);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0018
     * @tc.desc   Push contact volume batch 4-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 78; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(78);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(77).reminderId).assertEqual(77);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0019
     * @tc.desc   Push contact volume batch 4-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 79; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(79);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(78).reminderId).assertEqual(78);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume040020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_04_0020
     * @tc.desc   Push contact volume batch 4-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 80; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(80);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(79).reminderId).assertEqual(79);
      await Promise.resolve();
    })
  })
}
