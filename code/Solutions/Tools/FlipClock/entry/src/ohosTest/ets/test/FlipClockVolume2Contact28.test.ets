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

export default function flipClockVolume2Contact28Test() {
  describe('FlipClockVolume2Contact28Test', () => {

    /**
     * @tc.name   testFlipClockVol2280001
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0001
     * @tc.desc   Push second contact volume batch 28-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1141; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1141);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1140).reminderId).assertEqual(1140);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280002
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0002
     * @tc.desc   Push second contact volume batch 28-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1142; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1142);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1141).reminderId).assertEqual(1141);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280003
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0003
     * @tc.desc   Push second contact volume batch 28-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1143; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1143);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1142).reminderId).assertEqual(1142);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280004
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0004
     * @tc.desc   Push second contact volume batch 28-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1144; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1144);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1143).reminderId).assertEqual(1143);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280005
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0005
     * @tc.desc   Push second contact volume batch 28-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1145; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1145);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1144).reminderId).assertEqual(1144);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280006
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0006
     * @tc.desc   Push second contact volume batch 28-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1146; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1146);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1145).reminderId).assertEqual(1145);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280007
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0007
     * @tc.desc   Push second contact volume batch 28-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1147; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1147);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1146).reminderId).assertEqual(1146);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280008
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0008
     * @tc.desc   Push second contact volume batch 28-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1148; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1148);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1147).reminderId).assertEqual(1147);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280009
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0009
     * @tc.desc   Push second contact volume batch 28-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1149; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1149);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1148).reminderId).assertEqual(1148);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280010
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0010
     * @tc.desc   Push second contact volume batch 28-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1150; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1150);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1149).reminderId).assertEqual(1149);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280011
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0011
     * @tc.desc   Push second contact volume batch 28-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1151; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1151);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1150).reminderId).assertEqual(1150);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280012
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0012
     * @tc.desc   Push second contact volume batch 28-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1152; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1152);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1151).reminderId).assertEqual(1151);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280013
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0013
     * @tc.desc   Push second contact volume batch 28-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1153; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1153);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1152).reminderId).assertEqual(1152);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280014
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0014
     * @tc.desc   Push second contact volume batch 28-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1154; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1154);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1153).reminderId).assertEqual(1153);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280015
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0015
     * @tc.desc   Push second contact volume batch 28-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1155; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1155);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1154).reminderId).assertEqual(1154);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280016
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0016
     * @tc.desc   Push second contact volume batch 28-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1156; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1156);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1155).reminderId).assertEqual(1155);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280017
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0017
     * @tc.desc   Push second contact volume batch 28-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1157; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1157);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1156).reminderId).assertEqual(1156);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280018
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0018
     * @tc.desc   Push second contact volume batch 28-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1158; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1158);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1157).reminderId).assertEqual(1157);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280019
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0019
     * @tc.desc   Push second contact volume batch 28-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1159; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1159);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1158).reminderId).assertEqual(1158);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2280020
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0020
     * @tc.desc   Push second contact volume batch 28-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2280020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1160; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1160);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1159).reminderId).assertEqual(1159);
      await Promise.resolve();
    })
  })
}
