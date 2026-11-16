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

export default function flipClockVolume2Contact22Test() {
  describe('FlipClockVolume2Contact22Test', () => {

    /**
     * @tc.name   testFlipClockVol2220001
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0001
     * @tc.desc   Push second contact volume batch 22-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1021; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1021);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1020).reminderId).assertEqual(1020);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220002
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0002
     * @tc.desc   Push second contact volume batch 22-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1022; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1022);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1021).reminderId).assertEqual(1021);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220003
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0003
     * @tc.desc   Push second contact volume batch 22-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1023; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1023);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1022).reminderId).assertEqual(1022);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220004
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0004
     * @tc.desc   Push second contact volume batch 22-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1024; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1024);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1023).reminderId).assertEqual(1023);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220005
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0005
     * @tc.desc   Push second contact volume batch 22-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1025; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1025);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1024).reminderId).assertEqual(1024);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220006
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0006
     * @tc.desc   Push second contact volume batch 22-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1026; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1026);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1025).reminderId).assertEqual(1025);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220007
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0007
     * @tc.desc   Push second contact volume batch 22-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1027; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1027);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1026).reminderId).assertEqual(1026);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220008
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0008
     * @tc.desc   Push second contact volume batch 22-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1028; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1028);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1027).reminderId).assertEqual(1027);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220009
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0009
     * @tc.desc   Push second contact volume batch 22-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1029; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1029);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1028).reminderId).assertEqual(1028);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220010
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0010
     * @tc.desc   Push second contact volume batch 22-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1030; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1030);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1029).reminderId).assertEqual(1029);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220011
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0011
     * @tc.desc   Push second contact volume batch 22-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1031; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1031);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1030).reminderId).assertEqual(1030);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220012
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0012
     * @tc.desc   Push second contact volume batch 22-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1032; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1032);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1031).reminderId).assertEqual(1031);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220013
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0013
     * @tc.desc   Push second contact volume batch 22-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1033; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1033);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1032).reminderId).assertEqual(1032);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220014
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0014
     * @tc.desc   Push second contact volume batch 22-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1034; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1034);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1033).reminderId).assertEqual(1033);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220015
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0015
     * @tc.desc   Push second contact volume batch 22-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1035; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1035);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1034).reminderId).assertEqual(1034);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220016
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0016
     * @tc.desc   Push second contact volume batch 22-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1036; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1036);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1035).reminderId).assertEqual(1035);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220017
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0017
     * @tc.desc   Push second contact volume batch 22-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1037; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1037);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1036).reminderId).assertEqual(1036);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220018
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0018
     * @tc.desc   Push second contact volume batch 22-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1038; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1038);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1037).reminderId).assertEqual(1037);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220019
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0019
     * @tc.desc   Push second contact volume batch 22-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1039; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1039);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1038).reminderId).assertEqual(1038);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2220020
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0020
     * @tc.desc   Push second contact volume batch 22-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2220020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1040; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1040);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1039).reminderId).assertEqual(1039);
      await Promise.resolve();
    })
  })
}
