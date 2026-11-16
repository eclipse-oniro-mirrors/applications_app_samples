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

export default function flipClockVolumeContact24Test() {
  describe('FlipClockVolumeContact24Test', () => {

    /**
     * @tc.name   testFlipClockVolume240001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0001
     * @tc.desc   Push contact volume batch 24-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 461; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(461);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(460).reminderId).assertEqual(460);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0002
     * @tc.desc   Push contact volume batch 24-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 462; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(462);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(461).reminderId).assertEqual(461);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0003
     * @tc.desc   Push contact volume batch 24-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 463; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(463);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(462).reminderId).assertEqual(462);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0004
     * @tc.desc   Push contact volume batch 24-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 464; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(464);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(463).reminderId).assertEqual(463);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0005
     * @tc.desc   Push contact volume batch 24-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 465; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(465);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(464).reminderId).assertEqual(464);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0006
     * @tc.desc   Push contact volume batch 24-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 466; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(466);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(465).reminderId).assertEqual(465);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0007
     * @tc.desc   Push contact volume batch 24-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 467; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(467);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(466).reminderId).assertEqual(466);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0008
     * @tc.desc   Push contact volume batch 24-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 468; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(468);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(467).reminderId).assertEqual(467);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0009
     * @tc.desc   Push contact volume batch 24-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 469; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(469);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(468).reminderId).assertEqual(468);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0010
     * @tc.desc   Push contact volume batch 24-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 470; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(470);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(469).reminderId).assertEqual(469);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0011
     * @tc.desc   Push contact volume batch 24-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 471; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(471);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(470).reminderId).assertEqual(470);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0012
     * @tc.desc   Push contact volume batch 24-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 472; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(472);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(471).reminderId).assertEqual(471);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0013
     * @tc.desc   Push contact volume batch 24-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 473; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(473);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(472).reminderId).assertEqual(472);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0014
     * @tc.desc   Push contact volume batch 24-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 474; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(474);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(473).reminderId).assertEqual(473);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0015
     * @tc.desc   Push contact volume batch 24-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 475; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(475);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(474).reminderId).assertEqual(474);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0016
     * @tc.desc   Push contact volume batch 24-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 476; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(476);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(475).reminderId).assertEqual(475);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0017
     * @tc.desc   Push contact volume batch 24-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 477; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(477);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(476).reminderId).assertEqual(476);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0018
     * @tc.desc   Push contact volume batch 24-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 478; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(478);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(477).reminderId).assertEqual(477);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0019
     * @tc.desc   Push contact volume batch 24-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 479; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(479);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(478).reminderId).assertEqual(478);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume240020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0020
     * @tc.desc   Push contact volume batch 24-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume240020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 480; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(480);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(479).reminderId).assertEqual(479);
      await Promise.resolve();
    })
  })
}
