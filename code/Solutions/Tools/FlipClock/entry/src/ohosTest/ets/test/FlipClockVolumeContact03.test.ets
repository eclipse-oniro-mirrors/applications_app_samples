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

export default function flipClockVolumeContact03Test() {
  describe('FlipClockVolumeContact03Test', () => {

    /**
     * @tc.name   testFlipClockVolume030001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0001
     * @tc.desc   Push contact volume batch 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 41; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(41);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(40).reminderId).assertEqual(40);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0002
     * @tc.desc   Push contact volume batch 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 42; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(42);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(41).reminderId).assertEqual(41);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0003
     * @tc.desc   Push contact volume batch 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 43; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(43);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(42).reminderId).assertEqual(42);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0004
     * @tc.desc   Push contact volume batch 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 44; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(44);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(43).reminderId).assertEqual(43);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0005
     * @tc.desc   Push contact volume batch 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 45; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(45);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(44).reminderId).assertEqual(44);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0006
     * @tc.desc   Push contact volume batch 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 46; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(46);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(45).reminderId).assertEqual(45);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0007
     * @tc.desc   Push contact volume batch 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 47; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(47);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(46).reminderId).assertEqual(46);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0008
     * @tc.desc   Push contact volume batch 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 48; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(48);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(47).reminderId).assertEqual(47);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0009
     * @tc.desc   Push contact volume batch 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 49; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(49);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(48).reminderId).assertEqual(48);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0010
     * @tc.desc   Push contact volume batch 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 50; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(50);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(49).reminderId).assertEqual(49);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0011
     * @tc.desc   Push contact volume batch 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 51; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(51);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(50).reminderId).assertEqual(50);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0012
     * @tc.desc   Push contact volume batch 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 52; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(52);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(51).reminderId).assertEqual(51);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0013
     * @tc.desc   Push contact volume batch 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 53; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(53);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(52).reminderId).assertEqual(52);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0014
     * @tc.desc   Push contact volume batch 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 54; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(54);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(53).reminderId).assertEqual(53);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0015
     * @tc.desc   Push contact volume batch 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 55; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(55);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(54).reminderId).assertEqual(54);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0016
     * @tc.desc   Push contact volume batch 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 56; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(56);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(55).reminderId).assertEqual(55);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0017
     * @tc.desc   Push contact volume batch 3-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 57; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(57);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(56).reminderId).assertEqual(56);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0018
     * @tc.desc   Push contact volume batch 3-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 58; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(58);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(57).reminderId).assertEqual(57);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0019
     * @tc.desc   Push contact volume batch 3-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 59; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(59);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(58).reminderId).assertEqual(58);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume030020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_03_0020
     * @tc.desc   Push contact volume batch 3-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 60; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(60);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(59).reminderId).assertEqual(59);
      await Promise.resolve();
    })
  })
}
