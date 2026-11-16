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

export default function flipClockVolumeContact15Test() {
  describe('FlipClockVolumeContact15Test', () => {

    /**
     * @tc.name   testFlipClockVolume150001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0001
     * @tc.desc   Push contact volume batch 15-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 281; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(281);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(280).reminderId).assertEqual(280);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0002
     * @tc.desc   Push contact volume batch 15-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 282; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(282);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(281).reminderId).assertEqual(281);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0003
     * @tc.desc   Push contact volume batch 15-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 283; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(283);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(282).reminderId).assertEqual(282);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0004
     * @tc.desc   Push contact volume batch 15-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 284; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(284);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(283).reminderId).assertEqual(283);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0005
     * @tc.desc   Push contact volume batch 15-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 285; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(285);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(284).reminderId).assertEqual(284);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0006
     * @tc.desc   Push contact volume batch 15-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 286; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(286);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(285).reminderId).assertEqual(285);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0007
     * @tc.desc   Push contact volume batch 15-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 287; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(287);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(286).reminderId).assertEqual(286);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0008
     * @tc.desc   Push contact volume batch 15-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 288; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(288);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(287).reminderId).assertEqual(287);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0009
     * @tc.desc   Push contact volume batch 15-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 289; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(289);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(288).reminderId).assertEqual(288);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0010
     * @tc.desc   Push contact volume batch 15-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 290; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(290);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(289).reminderId).assertEqual(289);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0011
     * @tc.desc   Push contact volume batch 15-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 291; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(291);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(290).reminderId).assertEqual(290);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0012
     * @tc.desc   Push contact volume batch 15-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 292; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(292);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(291).reminderId).assertEqual(291);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0013
     * @tc.desc   Push contact volume batch 15-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 293; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(293);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(292).reminderId).assertEqual(292);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0014
     * @tc.desc   Push contact volume batch 15-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 294; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(294);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(293).reminderId).assertEqual(293);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0015
     * @tc.desc   Push contact volume batch 15-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 295; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(295);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(294).reminderId).assertEqual(294);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0016
     * @tc.desc   Push contact volume batch 15-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 296; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(296);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(295).reminderId).assertEqual(295);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0017
     * @tc.desc   Push contact volume batch 15-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 297; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(297);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(296).reminderId).assertEqual(296);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0018
     * @tc.desc   Push contact volume batch 15-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 298; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(298);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(297).reminderId).assertEqual(297);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0019
     * @tc.desc   Push contact volume batch 15-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 299; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(299);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(298).reminderId).assertEqual(298);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume150020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0020
     * @tc.desc   Push contact volume batch 15-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 300; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(300);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(299).reminderId).assertEqual(299);
      await Promise.resolve();
    })
  })
}
