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

export default function flipClockVolume2Contact26Test() {
  describe('FlipClockVolume2Contact26Test', () => {

    /**
     * @tc.name   testFlipClockVol2260001
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0001
     * @tc.desc   Push second contact volume batch 26-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1101; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1101);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1100).reminderId).assertEqual(1100);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260002
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0002
     * @tc.desc   Push second contact volume batch 26-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1102; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1102);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1101).reminderId).assertEqual(1101);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260003
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0003
     * @tc.desc   Push second contact volume batch 26-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1103; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1103);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1102).reminderId).assertEqual(1102);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260004
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0004
     * @tc.desc   Push second contact volume batch 26-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1104; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1104);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1103).reminderId).assertEqual(1103);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260005
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0005
     * @tc.desc   Push second contact volume batch 26-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1105; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1105);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1104).reminderId).assertEqual(1104);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260006
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0006
     * @tc.desc   Push second contact volume batch 26-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1106; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1106);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1105).reminderId).assertEqual(1105);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260007
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0007
     * @tc.desc   Push second contact volume batch 26-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1107; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1107);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1106).reminderId).assertEqual(1106);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260008
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0008
     * @tc.desc   Push second contact volume batch 26-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1108; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1108);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1107).reminderId).assertEqual(1107);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260009
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0009
     * @tc.desc   Push second contact volume batch 26-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1109; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1109);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1108).reminderId).assertEqual(1108);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260010
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0010
     * @tc.desc   Push second contact volume batch 26-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1110; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1110);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1109).reminderId).assertEqual(1109);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260011
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0011
     * @tc.desc   Push second contact volume batch 26-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1111; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1111);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1110).reminderId).assertEqual(1110);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260012
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0012
     * @tc.desc   Push second contact volume batch 26-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1112; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1112);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1111).reminderId).assertEqual(1111);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260013
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0013
     * @tc.desc   Push second contact volume batch 26-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1113; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1113);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1112).reminderId).assertEqual(1112);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260014
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0014
     * @tc.desc   Push second contact volume batch 26-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1114; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1114);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1113).reminderId).assertEqual(1113);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260015
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0015
     * @tc.desc   Push second contact volume batch 26-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1115; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1115);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1114).reminderId).assertEqual(1114);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260016
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0016
     * @tc.desc   Push second contact volume batch 26-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1116; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1116);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1115).reminderId).assertEqual(1115);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260017
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0017
     * @tc.desc   Push second contact volume batch 26-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1117; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1117);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1116).reminderId).assertEqual(1116);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260018
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0018
     * @tc.desc   Push second contact volume batch 26-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1118; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1118);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1117).reminderId).assertEqual(1117);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260019
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0019
     * @tc.desc   Push second contact volume batch 26-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1119; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1119);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1118).reminderId).assertEqual(1118);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2260020
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0020
     * @tc.desc   Push second contact volume batch 26-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2260020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1120; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1120);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1119).reminderId).assertEqual(1119);
      await Promise.resolve();
    })
  })
}
