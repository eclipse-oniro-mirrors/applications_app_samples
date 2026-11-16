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

export default function flipClockVolume2Contact30Test() {
  describe('FlipClockVolume2Contact30Test', () => {

    /**
     * @tc.name   testFlipClockVol2300001
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0001
     * @tc.desc   Push second contact volume batch 30-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1181; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1181);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1180).reminderId).assertEqual(1180);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300002
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0002
     * @tc.desc   Push second contact volume batch 30-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1182; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1182);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1181).reminderId).assertEqual(1181);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300003
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0003
     * @tc.desc   Push second contact volume batch 30-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1183; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1183);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1182).reminderId).assertEqual(1182);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300004
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0004
     * @tc.desc   Push second contact volume batch 30-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1184; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1184);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1183).reminderId).assertEqual(1183);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300005
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0005
     * @tc.desc   Push second contact volume batch 30-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1185; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1185);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1184).reminderId).assertEqual(1184);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300006
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0006
     * @tc.desc   Push second contact volume batch 30-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1186; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1186);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1185).reminderId).assertEqual(1185);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300007
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0007
     * @tc.desc   Push second contact volume batch 30-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1187; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1187);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1186).reminderId).assertEqual(1186);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300008
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0008
     * @tc.desc   Push second contact volume batch 30-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1188; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1188);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1187).reminderId).assertEqual(1187);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300009
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0009
     * @tc.desc   Push second contact volume batch 30-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1189; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1189);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1188).reminderId).assertEqual(1188);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300010
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0010
     * @tc.desc   Push second contact volume batch 30-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1190; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1190);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1189).reminderId).assertEqual(1189);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300011
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0011
     * @tc.desc   Push second contact volume batch 30-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1191; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1191);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1190).reminderId).assertEqual(1190);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300012
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0012
     * @tc.desc   Push second contact volume batch 30-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1192; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1192);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1191).reminderId).assertEqual(1191);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300013
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0013
     * @tc.desc   Push second contact volume batch 30-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1193; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1193);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1192).reminderId).assertEqual(1192);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300014
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0014
     * @tc.desc   Push second contact volume batch 30-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1194; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1194);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1193).reminderId).assertEqual(1193);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300015
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0015
     * @tc.desc   Push second contact volume batch 30-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1195; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1195);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1194).reminderId).assertEqual(1194);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300016
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0016
     * @tc.desc   Push second contact volume batch 30-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1196; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1196);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1195).reminderId).assertEqual(1195);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300017
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0017
     * @tc.desc   Push second contact volume batch 30-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1197; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1197);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1196).reminderId).assertEqual(1196);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300018
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0018
     * @tc.desc   Push second contact volume batch 30-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1198; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1198);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1197).reminderId).assertEqual(1197);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300019
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0019
     * @tc.desc   Push second contact volume batch 30-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1199; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1199);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1198).reminderId).assertEqual(1198);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2300020
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0020
     * @tc.desc   Push second contact volume batch 30-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2300020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1200; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1200);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1199).reminderId).assertEqual(1199);
      await Promise.resolve();
    })
  })
}
