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

export default function flipClockVolumeContact02Test() {
  describe('FlipClockVolumeContact02Test', () => {

    /**
     * @tc.name   testFlipClockVolume020001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0001
     * @tc.desc   Push contact volume batch 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 21; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(21);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(20).reminderId).assertEqual(20);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0002
     * @tc.desc   Push contact volume batch 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 22; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(22);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(21).reminderId).assertEqual(21);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0003
     * @tc.desc   Push contact volume batch 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 23; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(23);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(22).reminderId).assertEqual(22);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0004
     * @tc.desc   Push contact volume batch 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 24; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(24);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(23).reminderId).assertEqual(23);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0005
     * @tc.desc   Push contact volume batch 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 25; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(25);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(24).reminderId).assertEqual(24);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0006
     * @tc.desc   Push contact volume batch 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 26; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(26);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(25).reminderId).assertEqual(25);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0007
     * @tc.desc   Push contact volume batch 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 27; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(27);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(26).reminderId).assertEqual(26);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0008
     * @tc.desc   Push contact volume batch 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 28; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(28);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(27).reminderId).assertEqual(27);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0009
     * @tc.desc   Push contact volume batch 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 29; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(29);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(28).reminderId).assertEqual(28);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0010
     * @tc.desc   Push contact volume batch 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 30; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(30);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(29).reminderId).assertEqual(29);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0011
     * @tc.desc   Push contact volume batch 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 31; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(31);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(30).reminderId).assertEqual(30);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0012
     * @tc.desc   Push contact volume batch 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 32; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(31).reminderId).assertEqual(31);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0013
     * @tc.desc   Push contact volume batch 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 33; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(32).reminderId).assertEqual(32);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0014
     * @tc.desc   Push contact volume batch 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 34; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(34);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(33).reminderId).assertEqual(33);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0015
     * @tc.desc   Push contact volume batch 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 35; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(35);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(34).reminderId).assertEqual(34);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0016
     * @tc.desc   Push contact volume batch 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 36; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(36);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(35).reminderId).assertEqual(35);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0017
     * @tc.desc   Push contact volume batch 2-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 37; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(37);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(36).reminderId).assertEqual(36);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0018
     * @tc.desc   Push contact volume batch 2-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 38; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(38);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(37).reminderId).assertEqual(37);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0019
     * @tc.desc   Push contact volume batch 2-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 39; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(39);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(38).reminderId).assertEqual(38);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume020020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_02_0020
     * @tc.desc   Push contact volume batch 2-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 40; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(40);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(39).reminderId).assertEqual(39);
      await Promise.resolve();
    })
  })
}
