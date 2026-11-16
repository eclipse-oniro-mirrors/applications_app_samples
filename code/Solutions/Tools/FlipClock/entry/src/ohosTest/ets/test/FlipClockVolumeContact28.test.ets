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

export default function flipClockVolumeContact28Test() {
  describe('FlipClockVolumeContact28Test', () => {

    /**
     * @tc.name   testFlipClockVolume280001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0001
     * @tc.desc   Push contact volume batch 28-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 541; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(541);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(540).reminderId).assertEqual(540);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0002
     * @tc.desc   Push contact volume batch 28-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 542; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(542);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(541).reminderId).assertEqual(541);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0003
     * @tc.desc   Push contact volume batch 28-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 543; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(543);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(542).reminderId).assertEqual(542);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0004
     * @tc.desc   Push contact volume batch 28-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 544; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(544);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(543).reminderId).assertEqual(543);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0005
     * @tc.desc   Push contact volume batch 28-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 545; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(545);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(544).reminderId).assertEqual(544);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0006
     * @tc.desc   Push contact volume batch 28-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 546; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(546);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(545).reminderId).assertEqual(545);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0007
     * @tc.desc   Push contact volume batch 28-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 547; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(547);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(546).reminderId).assertEqual(546);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0008
     * @tc.desc   Push contact volume batch 28-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 548; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(548);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(547).reminderId).assertEqual(547);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0009
     * @tc.desc   Push contact volume batch 28-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 549; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(549);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(548).reminderId).assertEqual(548);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0010
     * @tc.desc   Push contact volume batch 28-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 550; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(550);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(549).reminderId).assertEqual(549);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0011
     * @tc.desc   Push contact volume batch 28-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 551; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(551);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(550).reminderId).assertEqual(550);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0012
     * @tc.desc   Push contact volume batch 28-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 552; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(552);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(551).reminderId).assertEqual(551);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0013
     * @tc.desc   Push contact volume batch 28-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 553; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(553);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(552).reminderId).assertEqual(552);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0014
     * @tc.desc   Push contact volume batch 28-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 554; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(554);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(553).reminderId).assertEqual(553);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0015
     * @tc.desc   Push contact volume batch 28-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 555; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(555);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(554).reminderId).assertEqual(554);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0016
     * @tc.desc   Push contact volume batch 28-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 556; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(556);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(555).reminderId).assertEqual(555);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0017
     * @tc.desc   Push contact volume batch 28-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 557; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(557);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(556).reminderId).assertEqual(556);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0018
     * @tc.desc   Push contact volume batch 28-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 558; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(558);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(557).reminderId).assertEqual(557);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0019
     * @tc.desc   Push contact volume batch 28-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 559; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(559);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(558).reminderId).assertEqual(558);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume280020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_28_0020
     * @tc.desc   Push contact volume batch 28-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume280020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 560; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(560);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(559).reminderId).assertEqual(559);
      await Promise.resolve();
    })
  })
}
