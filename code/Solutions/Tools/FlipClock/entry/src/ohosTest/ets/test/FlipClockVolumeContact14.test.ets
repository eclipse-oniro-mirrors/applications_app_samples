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

export default function flipClockVolumeContact14Test() {
  describe('FlipClockVolumeContact14Test', () => {

    /**
     * @tc.name   testFlipClockVolume140001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0001
     * @tc.desc   Push contact volume batch 14-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 261; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(261);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(260).reminderId).assertEqual(260);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0002
     * @tc.desc   Push contact volume batch 14-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 262; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(262);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(261).reminderId).assertEqual(261);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0003
     * @tc.desc   Push contact volume batch 14-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 263; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(263);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(262).reminderId).assertEqual(262);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0004
     * @tc.desc   Push contact volume batch 14-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 264; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(264);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(263).reminderId).assertEqual(263);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0005
     * @tc.desc   Push contact volume batch 14-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 265; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(265);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(264).reminderId).assertEqual(264);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0006
     * @tc.desc   Push contact volume batch 14-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 266; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(266);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(265).reminderId).assertEqual(265);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0007
     * @tc.desc   Push contact volume batch 14-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 267; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(267);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(266).reminderId).assertEqual(266);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0008
     * @tc.desc   Push contact volume batch 14-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 268; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(268);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(267).reminderId).assertEqual(267);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0009
     * @tc.desc   Push contact volume batch 14-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 269; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(269);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(268).reminderId).assertEqual(268);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0010
     * @tc.desc   Push contact volume batch 14-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 270; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(270);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(269).reminderId).assertEqual(269);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0011
     * @tc.desc   Push contact volume batch 14-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 271; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(271);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(270).reminderId).assertEqual(270);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0012
     * @tc.desc   Push contact volume batch 14-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 272; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(272);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(271).reminderId).assertEqual(271);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0013
     * @tc.desc   Push contact volume batch 14-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 273; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(273);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(272).reminderId).assertEqual(272);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0014
     * @tc.desc   Push contact volume batch 14-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 274; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(274);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(273).reminderId).assertEqual(273);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0015
     * @tc.desc   Push contact volume batch 14-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 275; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(275);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(274).reminderId).assertEqual(274);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0016
     * @tc.desc   Push contact volume batch 14-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 276; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(276);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(275).reminderId).assertEqual(275);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0017
     * @tc.desc   Push contact volume batch 14-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 277; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(277);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(276).reminderId).assertEqual(276);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0018
     * @tc.desc   Push contact volume batch 14-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 278; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(278);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(277).reminderId).assertEqual(277);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0019
     * @tc.desc   Push contact volume batch 14-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 279; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(279);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(278).reminderId).assertEqual(278);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume140020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0020
     * @tc.desc   Push contact volume batch 14-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume140020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 280; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(280);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(279).reminderId).assertEqual(279);
      await Promise.resolve();
    })
  })
}
