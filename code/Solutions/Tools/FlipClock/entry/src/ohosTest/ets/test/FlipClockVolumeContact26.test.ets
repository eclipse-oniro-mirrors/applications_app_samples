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

export default function flipClockVolumeContact26Test() {
  describe('FlipClockVolumeContact26Test', () => {

    /**
     * @tc.name   testFlipClockVolume260001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0001
     * @tc.desc   Push contact volume batch 26-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 501; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(501);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(500).reminderId).assertEqual(500);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0002
     * @tc.desc   Push contact volume batch 26-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 502; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(502);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(501).reminderId).assertEqual(501);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0003
     * @tc.desc   Push contact volume batch 26-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 503; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(503);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(502).reminderId).assertEqual(502);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0004
     * @tc.desc   Push contact volume batch 26-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 504; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(504);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(503).reminderId).assertEqual(503);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0005
     * @tc.desc   Push contact volume batch 26-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 505; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(505);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(504).reminderId).assertEqual(504);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0006
     * @tc.desc   Push contact volume batch 26-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 506; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(506);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(505).reminderId).assertEqual(505);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0007
     * @tc.desc   Push contact volume batch 26-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 507; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(507);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(506).reminderId).assertEqual(506);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0008
     * @tc.desc   Push contact volume batch 26-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 508; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(508);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(507).reminderId).assertEqual(507);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0009
     * @tc.desc   Push contact volume batch 26-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 509; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(509);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(508).reminderId).assertEqual(508);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0010
     * @tc.desc   Push contact volume batch 26-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 510; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(510);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(509).reminderId).assertEqual(509);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0011
     * @tc.desc   Push contact volume batch 26-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 511; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(511);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(510).reminderId).assertEqual(510);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0012
     * @tc.desc   Push contact volume batch 26-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 512; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(512);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(511).reminderId).assertEqual(511);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0013
     * @tc.desc   Push contact volume batch 26-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 513; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(513);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(512).reminderId).assertEqual(512);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0014
     * @tc.desc   Push contact volume batch 26-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 514; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(514);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(513).reminderId).assertEqual(513);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0015
     * @tc.desc   Push contact volume batch 26-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 515; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(515);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(514).reminderId).assertEqual(514);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0016
     * @tc.desc   Push contact volume batch 26-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 516; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(516);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(515).reminderId).assertEqual(515);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0017
     * @tc.desc   Push contact volume batch 26-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 517; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(517);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(516).reminderId).assertEqual(516);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0018
     * @tc.desc   Push contact volume batch 26-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 518; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(518);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(517).reminderId).assertEqual(517);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0019
     * @tc.desc   Push contact volume batch 26-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 519; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(519);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(518).reminderId).assertEqual(518);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume260020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_26_0020
     * @tc.desc   Push contact volume batch 26-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume260020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 520; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(520);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(519).reminderId).assertEqual(519);
      await Promise.resolve();
    })
  })
}
