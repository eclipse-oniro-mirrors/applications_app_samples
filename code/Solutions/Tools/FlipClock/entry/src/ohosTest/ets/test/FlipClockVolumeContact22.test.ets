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

export default function flipClockVolumeContact22Test() {
  describe('FlipClockVolumeContact22Test', () => {

    /**
     * @tc.name   testFlipClockVolume220001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0001
     * @tc.desc   Push contact volume batch 22-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 421; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(421);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(420).reminderId).assertEqual(420);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0002
     * @tc.desc   Push contact volume batch 22-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 422; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(422);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(421).reminderId).assertEqual(421);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0003
     * @tc.desc   Push contact volume batch 22-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 423; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(423);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(422).reminderId).assertEqual(422);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0004
     * @tc.desc   Push contact volume batch 22-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 424; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(424);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(423).reminderId).assertEqual(423);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0005
     * @tc.desc   Push contact volume batch 22-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 425; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(425);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(424).reminderId).assertEqual(424);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0006
     * @tc.desc   Push contact volume batch 22-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 426; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(426);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(425).reminderId).assertEqual(425);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0007
     * @tc.desc   Push contact volume batch 22-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 427; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(427);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(426).reminderId).assertEqual(426);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0008
     * @tc.desc   Push contact volume batch 22-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 428; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(428);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(427).reminderId).assertEqual(427);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0009
     * @tc.desc   Push contact volume batch 22-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 429; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(429);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(428).reminderId).assertEqual(428);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0010
     * @tc.desc   Push contact volume batch 22-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 430; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(430);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(429).reminderId).assertEqual(429);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0011
     * @tc.desc   Push contact volume batch 22-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 431; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(431);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(430).reminderId).assertEqual(430);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0012
     * @tc.desc   Push contact volume batch 22-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 432; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(432);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(431).reminderId).assertEqual(431);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0013
     * @tc.desc   Push contact volume batch 22-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 433; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(433);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(432).reminderId).assertEqual(432);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0014
     * @tc.desc   Push contact volume batch 22-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 434; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(434);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(433).reminderId).assertEqual(433);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0015
     * @tc.desc   Push contact volume batch 22-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 435; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(435);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(434).reminderId).assertEqual(434);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0016
     * @tc.desc   Push contact volume batch 22-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 436; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(436);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(435).reminderId).assertEqual(435);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0017
     * @tc.desc   Push contact volume batch 22-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 437; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(437);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(436).reminderId).assertEqual(436);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0018
     * @tc.desc   Push contact volume batch 22-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 438; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(438);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(437).reminderId).assertEqual(437);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0019
     * @tc.desc   Push contact volume batch 22-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 439; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(439);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(438).reminderId).assertEqual(438);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume220020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_22_0020
     * @tc.desc   Push contact volume batch 22-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume220020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 440; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(440);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(439).reminderId).assertEqual(439);
      await Promise.resolve();
    })
  })
}
