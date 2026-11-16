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

export default function flipClockVolumeContact17Test() {
  describe('FlipClockVolumeContact17Test', () => {

    /**
     * @tc.name   testFlipClockVolume170001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0001
     * @tc.desc   Push contact volume batch 17-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 321; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(321);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(320).reminderId).assertEqual(320);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0002
     * @tc.desc   Push contact volume batch 17-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 322; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(322);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(321).reminderId).assertEqual(321);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0003
     * @tc.desc   Push contact volume batch 17-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 323; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(323);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(322).reminderId).assertEqual(322);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0004
     * @tc.desc   Push contact volume batch 17-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 324; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(324);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(323).reminderId).assertEqual(323);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0005
     * @tc.desc   Push contact volume batch 17-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 325; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(325);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(324).reminderId).assertEqual(324);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0006
     * @tc.desc   Push contact volume batch 17-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 326; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(326);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(325).reminderId).assertEqual(325);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0007
     * @tc.desc   Push contact volume batch 17-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 327; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(327);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(326).reminderId).assertEqual(326);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0008
     * @tc.desc   Push contact volume batch 17-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 328; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(328);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(327).reminderId).assertEqual(327);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0009
     * @tc.desc   Push contact volume batch 17-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 329; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(329);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(328).reminderId).assertEqual(328);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0010
     * @tc.desc   Push contact volume batch 17-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 330; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(330);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(329).reminderId).assertEqual(329);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0011
     * @tc.desc   Push contact volume batch 17-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 331; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(331);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(330).reminderId).assertEqual(330);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0012
     * @tc.desc   Push contact volume batch 17-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 332; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(332);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(331).reminderId).assertEqual(331);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0013
     * @tc.desc   Push contact volume batch 17-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 333; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(333);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(332).reminderId).assertEqual(332);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0014
     * @tc.desc   Push contact volume batch 17-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 334; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(334);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(333).reminderId).assertEqual(333);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0015
     * @tc.desc   Push contact volume batch 17-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 335; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(335);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(334).reminderId).assertEqual(334);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0016
     * @tc.desc   Push contact volume batch 17-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 336; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(336);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(335).reminderId).assertEqual(335);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0017
     * @tc.desc   Push contact volume batch 17-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 337; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(337);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(336).reminderId).assertEqual(336);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0018
     * @tc.desc   Push contact volume batch 17-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 338; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(338);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(337).reminderId).assertEqual(337);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0019
     * @tc.desc   Push contact volume batch 17-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 339; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(339);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(338).reminderId).assertEqual(338);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume170020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0020
     * @tc.desc   Push contact volume batch 17-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 340; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(340);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(339).reminderId).assertEqual(339);
      await Promise.resolve();
    })
  })
}
