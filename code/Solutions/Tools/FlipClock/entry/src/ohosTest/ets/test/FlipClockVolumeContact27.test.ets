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

export default function flipClockVolumeContact27Test() {
  describe('FlipClockVolumeContact27Test', () => {

    /**
     * @tc.name   testFlipClockVolume270001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0001
     * @tc.desc   Push contact volume batch 27-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 521; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(521);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(520).reminderId).assertEqual(520);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0002
     * @tc.desc   Push contact volume batch 27-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 522; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(522);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(521).reminderId).assertEqual(521);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0003
     * @tc.desc   Push contact volume batch 27-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 523; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(523);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(522).reminderId).assertEqual(522);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0004
     * @tc.desc   Push contact volume batch 27-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 524; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(524);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(523).reminderId).assertEqual(523);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0005
     * @tc.desc   Push contact volume batch 27-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 525; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(525);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(524).reminderId).assertEqual(524);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0006
     * @tc.desc   Push contact volume batch 27-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 526; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(526);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(525).reminderId).assertEqual(525);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0007
     * @tc.desc   Push contact volume batch 27-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 527; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(527);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(526).reminderId).assertEqual(526);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0008
     * @tc.desc   Push contact volume batch 27-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 528; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(528);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(527).reminderId).assertEqual(527);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0009
     * @tc.desc   Push contact volume batch 27-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 529; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(529);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(528).reminderId).assertEqual(528);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0010
     * @tc.desc   Push contact volume batch 27-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 530; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(530);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(529).reminderId).assertEqual(529);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0011
     * @tc.desc   Push contact volume batch 27-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 531; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(531);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(530).reminderId).assertEqual(530);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0012
     * @tc.desc   Push contact volume batch 27-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 532; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(532);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(531).reminderId).assertEqual(531);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0013
     * @tc.desc   Push contact volume batch 27-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 533; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(533);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(532).reminderId).assertEqual(532);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0014
     * @tc.desc   Push contact volume batch 27-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 534; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(534);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(533).reminderId).assertEqual(533);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0015
     * @tc.desc   Push contact volume batch 27-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 535; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(535);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(534).reminderId).assertEqual(534);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0016
     * @tc.desc   Push contact volume batch 27-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 536; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(536);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(535).reminderId).assertEqual(535);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0017
     * @tc.desc   Push contact volume batch 27-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 537; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(537);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(536).reminderId).assertEqual(536);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0018
     * @tc.desc   Push contact volume batch 27-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 538; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(538);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(537).reminderId).assertEqual(537);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0019
     * @tc.desc   Push contact volume batch 27-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 539; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(539);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(538).reminderId).assertEqual(538);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume270020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_27_0020
     * @tc.desc   Push contact volume batch 27-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume270020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 540; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(540);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(539).reminderId).assertEqual(539);
      await Promise.resolve();
    })
  })
}
