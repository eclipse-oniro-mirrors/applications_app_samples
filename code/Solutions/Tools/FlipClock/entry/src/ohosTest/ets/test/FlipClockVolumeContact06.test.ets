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

export default function flipClockVolumeContact06Test() {
  describe('FlipClockVolumeContact06Test', () => {

    /**
     * @tc.name   testFlipClockVolume060001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0001
     * @tc.desc   Push contact volume batch 6-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 101; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(101);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(100).reminderId).assertEqual(100);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0002
     * @tc.desc   Push contact volume batch 6-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 102; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(102);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(101).reminderId).assertEqual(101);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0003
     * @tc.desc   Push contact volume batch 6-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 103; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(103);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(102).reminderId).assertEqual(102);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0004
     * @tc.desc   Push contact volume batch 6-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 104; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(104);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(103).reminderId).assertEqual(103);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0005
     * @tc.desc   Push contact volume batch 6-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 105; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(105);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(104).reminderId).assertEqual(104);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0006
     * @tc.desc   Push contact volume batch 6-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 106; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(106);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(105).reminderId).assertEqual(105);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0007
     * @tc.desc   Push contact volume batch 6-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 107; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(107);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(106).reminderId).assertEqual(106);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0008
     * @tc.desc   Push contact volume batch 6-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 108; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(108);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(107).reminderId).assertEqual(107);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0009
     * @tc.desc   Push contact volume batch 6-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 109; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(109);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(108).reminderId).assertEqual(108);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0010
     * @tc.desc   Push contact volume batch 6-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 110; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(110);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(109).reminderId).assertEqual(109);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0011
     * @tc.desc   Push contact volume batch 6-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 111; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(111);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(110).reminderId).assertEqual(110);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0012
     * @tc.desc   Push contact volume batch 6-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 112; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(112);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(111).reminderId).assertEqual(111);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0013
     * @tc.desc   Push contact volume batch 6-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 113; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(113);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(112).reminderId).assertEqual(112);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0014
     * @tc.desc   Push contact volume batch 6-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 114; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(114);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(113).reminderId).assertEqual(113);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0015
     * @tc.desc   Push contact volume batch 6-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 115; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(115);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(114).reminderId).assertEqual(114);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0016
     * @tc.desc   Push contact volume batch 6-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 116; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(116);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(115).reminderId).assertEqual(115);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0017
     * @tc.desc   Push contact volume batch 6-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 117; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(117);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(116).reminderId).assertEqual(116);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0018
     * @tc.desc   Push contact volume batch 6-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 118; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(118);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(117).reminderId).assertEqual(117);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0019
     * @tc.desc   Push contact volume batch 6-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 119; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(119);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(118).reminderId).assertEqual(118);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume060020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0020
     * @tc.desc   Push contact volume batch 6-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 120; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(120);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(119).reminderId).assertEqual(119);
      await Promise.resolve();
    })
  })
}
