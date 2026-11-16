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

export default function flipClockVolume2Contact08Test() {
  describe('FlipClockVolume2Contact08Test', () => {

    /**
     * @tc.name   testFlipClockVol2080001
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0001
     * @tc.desc   Push second contact volume batch 8-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 741; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(741);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(740).reminderId).assertEqual(740);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080002
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0002
     * @tc.desc   Push second contact volume batch 8-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 742; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(742);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(741).reminderId).assertEqual(741);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080003
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0003
     * @tc.desc   Push second contact volume batch 8-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 743; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(743);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(742).reminderId).assertEqual(742);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080004
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0004
     * @tc.desc   Push second contact volume batch 8-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 744; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(744);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(743).reminderId).assertEqual(743);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080005
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0005
     * @tc.desc   Push second contact volume batch 8-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 745; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(745);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(744).reminderId).assertEqual(744);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080006
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0006
     * @tc.desc   Push second contact volume batch 8-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 746; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(746);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(745).reminderId).assertEqual(745);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080007
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0007
     * @tc.desc   Push second contact volume batch 8-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 747; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(747);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(746).reminderId).assertEqual(746);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080008
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0008
     * @tc.desc   Push second contact volume batch 8-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 748; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(748);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(747).reminderId).assertEqual(747);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080009
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0009
     * @tc.desc   Push second contact volume batch 8-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 749; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(749);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(748).reminderId).assertEqual(748);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080010
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0010
     * @tc.desc   Push second contact volume batch 8-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 750; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(750);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(749).reminderId).assertEqual(749);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080011
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0011
     * @tc.desc   Push second contact volume batch 8-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 751; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(751);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(750).reminderId).assertEqual(750);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080012
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0012
     * @tc.desc   Push second contact volume batch 8-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 752; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(752);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(751).reminderId).assertEqual(751);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080013
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0013
     * @tc.desc   Push second contact volume batch 8-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 753; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(753);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(752).reminderId).assertEqual(752);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080014
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0014
     * @tc.desc   Push second contact volume batch 8-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 754; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(754);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(753).reminderId).assertEqual(753);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080015
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0015
     * @tc.desc   Push second contact volume batch 8-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 755; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(755);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(754).reminderId).assertEqual(754);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080016
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0016
     * @tc.desc   Push second contact volume batch 8-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 756; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(756);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(755).reminderId).assertEqual(755);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080017
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0017
     * @tc.desc   Push second contact volume batch 8-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 757; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(757);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(756).reminderId).assertEqual(756);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080018
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0018
     * @tc.desc   Push second contact volume batch 8-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 758; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(758);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(757).reminderId).assertEqual(757);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080019
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0019
     * @tc.desc   Push second contact volume batch 8-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 759; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(759);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(758).reminderId).assertEqual(758);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2080020
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0020
     * @tc.desc   Push second contact volume batch 8-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 760; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(760);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(759).reminderId).assertEqual(759);
      await Promise.resolve();
    })
  })
}
