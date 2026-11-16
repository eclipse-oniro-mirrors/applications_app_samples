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

export default function flipClockVolumeContact13Test() {
  describe('FlipClockVolumeContact13Test', () => {

    /**
     * @tc.name   testFlipClockVolume130001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0001
     * @tc.desc   Push contact volume batch 13-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 241; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(241);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(240).reminderId).assertEqual(240);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0002
     * @tc.desc   Push contact volume batch 13-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 242; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(242);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(241).reminderId).assertEqual(241);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0003
     * @tc.desc   Push contact volume batch 13-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 243; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(243);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(242).reminderId).assertEqual(242);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0004
     * @tc.desc   Push contact volume batch 13-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 244; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(244);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(243).reminderId).assertEqual(243);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0005
     * @tc.desc   Push contact volume batch 13-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 245; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(245);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(244).reminderId).assertEqual(244);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0006
     * @tc.desc   Push contact volume batch 13-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 246; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(246);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(245).reminderId).assertEqual(245);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0007
     * @tc.desc   Push contact volume batch 13-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 247; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(247);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(246).reminderId).assertEqual(246);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0008
     * @tc.desc   Push contact volume batch 13-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 248; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(248);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(247).reminderId).assertEqual(247);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0009
     * @tc.desc   Push contact volume batch 13-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 249; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(249);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(248).reminderId).assertEqual(248);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0010
     * @tc.desc   Push contact volume batch 13-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 250; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(250);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(249).reminderId).assertEqual(249);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0011
     * @tc.desc   Push contact volume batch 13-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 251; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(251);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(250).reminderId).assertEqual(250);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0012
     * @tc.desc   Push contact volume batch 13-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 252; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(252);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(251).reminderId).assertEqual(251);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0013
     * @tc.desc   Push contact volume batch 13-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 253; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(253);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(252).reminderId).assertEqual(252);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0014
     * @tc.desc   Push contact volume batch 13-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 254; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(254);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(253).reminderId).assertEqual(253);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0015
     * @tc.desc   Push contact volume batch 13-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 255; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(255);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(254).reminderId).assertEqual(254);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0016
     * @tc.desc   Push contact volume batch 13-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 256; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(256);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(255).reminderId).assertEqual(255);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0017
     * @tc.desc   Push contact volume batch 13-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 257; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(257);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(256).reminderId).assertEqual(256);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0018
     * @tc.desc   Push contact volume batch 13-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 258; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(258);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(257).reminderId).assertEqual(257);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0019
     * @tc.desc   Push contact volume batch 13-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 259; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(259);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(258).reminderId).assertEqual(258);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume130020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0020
     * @tc.desc   Push contact volume batch 13-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume130020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 260; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(260);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(259).reminderId).assertEqual(259);
      await Promise.resolve();
    })
  })
}
