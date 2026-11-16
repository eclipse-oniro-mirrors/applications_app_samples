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

export default function flipClockVolumeContact12Test() {
  describe('FlipClockVolumeContact12Test', () => {

    /**
     * @tc.name   testFlipClockVolume120001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0001
     * @tc.desc   Push contact volume batch 12-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 221; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(221);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(220).reminderId).assertEqual(220);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0002
     * @tc.desc   Push contact volume batch 12-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 222; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(222);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(221).reminderId).assertEqual(221);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0003
     * @tc.desc   Push contact volume batch 12-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 223; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(223);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(222).reminderId).assertEqual(222);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0004
     * @tc.desc   Push contact volume batch 12-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 224; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(224);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(223).reminderId).assertEqual(223);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0005
     * @tc.desc   Push contact volume batch 12-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 225; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(225);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(224).reminderId).assertEqual(224);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0006
     * @tc.desc   Push contact volume batch 12-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 226; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(226);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(225).reminderId).assertEqual(225);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0007
     * @tc.desc   Push contact volume batch 12-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 227; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(227);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(226).reminderId).assertEqual(226);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0008
     * @tc.desc   Push contact volume batch 12-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 228; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(228);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(227).reminderId).assertEqual(227);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0009
     * @tc.desc   Push contact volume batch 12-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 229; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(229);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(228).reminderId).assertEqual(228);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0010
     * @tc.desc   Push contact volume batch 12-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 230; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(230);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(229).reminderId).assertEqual(229);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0011
     * @tc.desc   Push contact volume batch 12-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 231; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(231);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(230).reminderId).assertEqual(230);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0012
     * @tc.desc   Push contact volume batch 12-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 232; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(232);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(231).reminderId).assertEqual(231);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0013
     * @tc.desc   Push contact volume batch 12-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 233; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(233);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(232).reminderId).assertEqual(232);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0014
     * @tc.desc   Push contact volume batch 12-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 234; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(234);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(233).reminderId).assertEqual(233);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0015
     * @tc.desc   Push contact volume batch 12-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 235; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(235);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(234).reminderId).assertEqual(234);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0016
     * @tc.desc   Push contact volume batch 12-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 236; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(236);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(235).reminderId).assertEqual(235);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0017
     * @tc.desc   Push contact volume batch 12-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 237; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(237);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(236).reminderId).assertEqual(236);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0018
     * @tc.desc   Push contact volume batch 12-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 238; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(238);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(237).reminderId).assertEqual(237);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0019
     * @tc.desc   Push contact volume batch 12-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 239; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(239);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(238).reminderId).assertEqual(238);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume120020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0020
     * @tc.desc   Push contact volume batch 12-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume120020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 240; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(240);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(239).reminderId).assertEqual(239);
      await Promise.resolve();
    })
  })
}
