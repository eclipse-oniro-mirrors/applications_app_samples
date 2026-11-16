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

export default function flipClockVolume2Contact16Test() {
  describe('FlipClockVolume2Contact16Test', () => {

    /**
     * @tc.name   testFlipClockVol2160001
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0001
     * @tc.desc   Push second contact volume batch 16-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 901; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(901);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(900).reminderId).assertEqual(900);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160002
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0002
     * @tc.desc   Push second contact volume batch 16-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 902; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(902);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(901).reminderId).assertEqual(901);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160003
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0003
     * @tc.desc   Push second contact volume batch 16-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 903; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(903);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(902).reminderId).assertEqual(902);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160004
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0004
     * @tc.desc   Push second contact volume batch 16-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 904; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(904);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(903).reminderId).assertEqual(903);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160005
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0005
     * @tc.desc   Push second contact volume batch 16-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 905; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(905);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(904).reminderId).assertEqual(904);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160006
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0006
     * @tc.desc   Push second contact volume batch 16-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 906; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(906);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(905).reminderId).assertEqual(905);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160007
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0007
     * @tc.desc   Push second contact volume batch 16-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 907; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(907);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(906).reminderId).assertEqual(906);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160008
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0008
     * @tc.desc   Push second contact volume batch 16-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 908; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(908);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(907).reminderId).assertEqual(907);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160009
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0009
     * @tc.desc   Push second contact volume batch 16-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 909; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(909);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(908).reminderId).assertEqual(908);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160010
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0010
     * @tc.desc   Push second contact volume batch 16-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 910; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(910);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(909).reminderId).assertEqual(909);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160011
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0011
     * @tc.desc   Push second contact volume batch 16-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 911; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(911);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(910).reminderId).assertEqual(910);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160012
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0012
     * @tc.desc   Push second contact volume batch 16-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 912; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(912);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(911).reminderId).assertEqual(911);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160013
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0013
     * @tc.desc   Push second contact volume batch 16-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 913; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(913);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(912).reminderId).assertEqual(912);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160014
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0014
     * @tc.desc   Push second contact volume batch 16-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 914; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(914);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(913).reminderId).assertEqual(913);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160015
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0015
     * @tc.desc   Push second contact volume batch 16-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 915; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(915);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(914).reminderId).assertEqual(914);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160016
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0016
     * @tc.desc   Push second contact volume batch 16-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 916; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(916);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(915).reminderId).assertEqual(915);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160017
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0017
     * @tc.desc   Push second contact volume batch 16-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 917; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(917);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(916).reminderId).assertEqual(916);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160018
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0018
     * @tc.desc   Push second contact volume batch 16-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 918; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(918);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(917).reminderId).assertEqual(917);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160019
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0019
     * @tc.desc   Push second contact volume batch 16-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 919; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(919);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(918).reminderId).assertEqual(918);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2160020
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0020
     * @tc.desc   Push second contact volume batch 16-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 920; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(920);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(919).reminderId).assertEqual(919);
      await Promise.resolve();
    })
  })
}
