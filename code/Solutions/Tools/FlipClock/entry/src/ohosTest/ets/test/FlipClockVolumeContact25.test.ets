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

export default function flipClockVolumeContact25Test() {
  describe('FlipClockVolumeContact25Test', () => {

    /**
     * @tc.name   testFlipClockVolume250001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0001
     * @tc.desc   Push contact volume batch 25-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 481; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(481);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(480).reminderId).assertEqual(480);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0002
     * @tc.desc   Push contact volume batch 25-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 482; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(482);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(481).reminderId).assertEqual(481);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0003
     * @tc.desc   Push contact volume batch 25-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 483; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(483);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(482).reminderId).assertEqual(482);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0004
     * @tc.desc   Push contact volume batch 25-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 484; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(484);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(483).reminderId).assertEqual(483);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0005
     * @tc.desc   Push contact volume batch 25-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 485; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(485);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(484).reminderId).assertEqual(484);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0006
     * @tc.desc   Push contact volume batch 25-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 486; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(486);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(485).reminderId).assertEqual(485);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0007
     * @tc.desc   Push contact volume batch 25-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 487; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(487);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(486).reminderId).assertEqual(486);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0008
     * @tc.desc   Push contact volume batch 25-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 488; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(488);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(487).reminderId).assertEqual(487);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0009
     * @tc.desc   Push contact volume batch 25-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 489; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(489);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(488).reminderId).assertEqual(488);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0010
     * @tc.desc   Push contact volume batch 25-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 490; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(490);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(489).reminderId).assertEqual(489);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0011
     * @tc.desc   Push contact volume batch 25-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 491; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(491);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(490).reminderId).assertEqual(490);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0012
     * @tc.desc   Push contact volume batch 25-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 492; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(492);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(491).reminderId).assertEqual(491);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0013
     * @tc.desc   Push contact volume batch 25-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 493; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(493);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(492).reminderId).assertEqual(492);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0014
     * @tc.desc   Push contact volume batch 25-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 494; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(494);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(493).reminderId).assertEqual(493);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0015
     * @tc.desc   Push contact volume batch 25-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 495; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(495);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(494).reminderId).assertEqual(494);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0016
     * @tc.desc   Push contact volume batch 25-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 496; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(496);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(495).reminderId).assertEqual(495);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0017
     * @tc.desc   Push contact volume batch 25-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 497; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(497);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(496).reminderId).assertEqual(496);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0018
     * @tc.desc   Push contact volume batch 25-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 498; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(498);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(497).reminderId).assertEqual(497);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0019
     * @tc.desc   Push contact volume batch 25-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 499; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(499);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(498).reminderId).assertEqual(498);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume250020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0020
     * @tc.desc   Push contact volume batch 25-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume250020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 500; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(500);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(499).reminderId).assertEqual(499);
      await Promise.resolve();
    })
  })
}
