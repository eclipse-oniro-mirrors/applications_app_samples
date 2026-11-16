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

export default function flipClockVolumeContact16Test() {
  describe('FlipClockVolumeContact16Test', () => {

    /**
     * @tc.name   testFlipClockVolume160001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0001
     * @tc.desc   Push contact volume batch 16-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 301; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(301);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(300).reminderId).assertEqual(300);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0002
     * @tc.desc   Push contact volume batch 16-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 302; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(302);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(301).reminderId).assertEqual(301);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0003
     * @tc.desc   Push contact volume batch 16-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 303; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(303);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(302).reminderId).assertEqual(302);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0004
     * @tc.desc   Push contact volume batch 16-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 304; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(304);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(303).reminderId).assertEqual(303);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0005
     * @tc.desc   Push contact volume batch 16-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 305; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(305);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(304).reminderId).assertEqual(304);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0006
     * @tc.desc   Push contact volume batch 16-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 306; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(306);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(305).reminderId).assertEqual(305);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0007
     * @tc.desc   Push contact volume batch 16-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 307; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(307);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(306).reminderId).assertEqual(306);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0008
     * @tc.desc   Push contact volume batch 16-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 308; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(308);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(307).reminderId).assertEqual(307);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0009
     * @tc.desc   Push contact volume batch 16-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 309; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(309);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(308).reminderId).assertEqual(308);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0010
     * @tc.desc   Push contact volume batch 16-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 310; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(310);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(309).reminderId).assertEqual(309);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0011
     * @tc.desc   Push contact volume batch 16-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 311; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(311);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(310).reminderId).assertEqual(310);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0012
     * @tc.desc   Push contact volume batch 16-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 312; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(312);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(311).reminderId).assertEqual(311);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0013
     * @tc.desc   Push contact volume batch 16-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 313; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(313);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(312).reminderId).assertEqual(312);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0014
     * @tc.desc   Push contact volume batch 16-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 314; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(314);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(313).reminderId).assertEqual(313);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0015
     * @tc.desc   Push contact volume batch 16-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 315; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(315);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(314).reminderId).assertEqual(314);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0016
     * @tc.desc   Push contact volume batch 16-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 316; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(316);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(315).reminderId).assertEqual(315);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0017
     * @tc.desc   Push contact volume batch 16-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 317; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(317);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(316).reminderId).assertEqual(316);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0018
     * @tc.desc   Push contact volume batch 16-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 318; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(318);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(317).reminderId).assertEqual(317);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0019
     * @tc.desc   Push contact volume batch 16-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 319; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(319);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(318).reminderId).assertEqual(318);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume160020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0020
     * @tc.desc   Push contact volume batch 16-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 320; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(320);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(319).reminderId).assertEqual(319);
      await Promise.resolve();
    })
  })
}
