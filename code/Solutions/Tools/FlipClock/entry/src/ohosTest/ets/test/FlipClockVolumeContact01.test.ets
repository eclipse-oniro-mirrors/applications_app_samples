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

export default function flipClockVolumeContact01Test() {
  describe('FlipClockVolumeContact01Test', () => {

    /**
     * @tc.name   testFlipClockVolume010001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0001
     * @tc.desc   Push contact volume batch 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(0).reminderId).assertEqual(0);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0002
     * @tc.desc   Push contact volume batch 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1).reminderId).assertEqual(1);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0003
     * @tc.desc   Push contact volume batch 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(2).reminderId).assertEqual(2);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0004
     * @tc.desc   Push contact volume batch 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(3).reminderId).assertEqual(3);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0005
     * @tc.desc   Push contact volume batch 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(4).reminderId).assertEqual(4);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0006
     * @tc.desc   Push contact volume batch 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(6);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(5).reminderId).assertEqual(5);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0007
     * @tc.desc   Push contact volume batch 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(7);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(6).reminderId).assertEqual(6);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0008
     * @tc.desc   Push contact volume batch 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(7).reminderId).assertEqual(7);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0009
     * @tc.desc   Push contact volume batch 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 9; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(8).reminderId).assertEqual(8);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0010
     * @tc.desc   Push contact volume batch 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 10; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(10);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(9).reminderId).assertEqual(9);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0011
     * @tc.desc   Push contact volume batch 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 11; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(11);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(10).reminderId).assertEqual(10);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0012
     * @tc.desc   Push contact volume batch 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 12; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(12);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(11).reminderId).assertEqual(11);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0013
     * @tc.desc   Push contact volume batch 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 13; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(13);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(12).reminderId).assertEqual(12);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0014
     * @tc.desc   Push contact volume batch 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 14; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(14);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(13).reminderId).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0015
     * @tc.desc   Push contact volume batch 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 15; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(15);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(14).reminderId).assertEqual(14);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0016
     * @tc.desc   Push contact volume batch 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 16; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(15).reminderId).assertEqual(15);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0017
     * @tc.desc   Push contact volume batch 1-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 17; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(16).reminderId).assertEqual(16);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0018
     * @tc.desc   Push contact volume batch 1-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 18; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(18);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(17).reminderId).assertEqual(17);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0019
     * @tc.desc   Push contact volume batch 1-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 19; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(19);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(18).reminderId).assertEqual(18);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume010020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_01_0020
     * @tc.desc   Push contact volume batch 1-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 20; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(20);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(19).reminderId).assertEqual(19);
      await Promise.resolve();
    })
  })
}
