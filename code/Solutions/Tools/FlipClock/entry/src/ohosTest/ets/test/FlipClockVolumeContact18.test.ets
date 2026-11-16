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

export default function flipClockVolumeContact18Test() {
  describe('FlipClockVolumeContact18Test', () => {

    /**
     * @tc.name   testFlipClockVolume180001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0001
     * @tc.desc   Push contact volume batch 18-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 341; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(341);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(340).reminderId).assertEqual(340);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0002
     * @tc.desc   Push contact volume batch 18-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 342; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(342);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(341).reminderId).assertEqual(341);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0003
     * @tc.desc   Push contact volume batch 18-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 343; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(343);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(342).reminderId).assertEqual(342);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0004
     * @tc.desc   Push contact volume batch 18-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 344; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(344);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(343).reminderId).assertEqual(343);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0005
     * @tc.desc   Push contact volume batch 18-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 345; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(345);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(344).reminderId).assertEqual(344);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0006
     * @tc.desc   Push contact volume batch 18-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 346; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(346);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(345).reminderId).assertEqual(345);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0007
     * @tc.desc   Push contact volume batch 18-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 347; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(347);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(346).reminderId).assertEqual(346);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0008
     * @tc.desc   Push contact volume batch 18-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 348; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(348);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(347).reminderId).assertEqual(347);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0009
     * @tc.desc   Push contact volume batch 18-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 349; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(349);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(348).reminderId).assertEqual(348);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0010
     * @tc.desc   Push contact volume batch 18-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 350; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(350);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(349).reminderId).assertEqual(349);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0011
     * @tc.desc   Push contact volume batch 18-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 351; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(351);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(350).reminderId).assertEqual(350);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0012
     * @tc.desc   Push contact volume batch 18-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 352; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(352);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(351).reminderId).assertEqual(351);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0013
     * @tc.desc   Push contact volume batch 18-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 353; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(353);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(352).reminderId).assertEqual(352);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0014
     * @tc.desc   Push contact volume batch 18-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 354; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(354);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(353).reminderId).assertEqual(353);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0015
     * @tc.desc   Push contact volume batch 18-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 355; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(355);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(354).reminderId).assertEqual(354);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0016
     * @tc.desc   Push contact volume batch 18-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 356; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(356);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(355).reminderId).assertEqual(355);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0017
     * @tc.desc   Push contact volume batch 18-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 357; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(357);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(356).reminderId).assertEqual(356);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0018
     * @tc.desc   Push contact volume batch 18-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 358; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(358);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(357).reminderId).assertEqual(357);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0019
     * @tc.desc   Push contact volume batch 18-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 359; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(359);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(358).reminderId).assertEqual(358);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume180020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0020
     * @tc.desc   Push contact volume batch 18-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume180020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 360; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(360);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(359).reminderId).assertEqual(359);
      await Promise.resolve();
    })
  })
}
