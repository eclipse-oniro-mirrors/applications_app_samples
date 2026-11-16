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

export default function flipClockVolume2Contact27Test() {
  describe('FlipClockVolume2Contact27Test', () => {

    /**
     * @tc.name   testFlipClockVol2270001
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0001
     * @tc.desc   Push second contact volume batch 27-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1121; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1121);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1120).reminderId).assertEqual(1120);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270002
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0002
     * @tc.desc   Push second contact volume batch 27-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1122; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1122);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1121).reminderId).assertEqual(1121);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270003
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0003
     * @tc.desc   Push second contact volume batch 27-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1123; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1123);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1122).reminderId).assertEqual(1122);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270004
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0004
     * @tc.desc   Push second contact volume batch 27-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1124; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1124);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1123).reminderId).assertEqual(1123);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270005
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0005
     * @tc.desc   Push second contact volume batch 27-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1125; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1125);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1124).reminderId).assertEqual(1124);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270006
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0006
     * @tc.desc   Push second contact volume batch 27-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1126; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1126);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1125).reminderId).assertEqual(1125);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270007
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0007
     * @tc.desc   Push second contact volume batch 27-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1127; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1127);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1126).reminderId).assertEqual(1126);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270008
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0008
     * @tc.desc   Push second contact volume batch 27-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1128; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1128);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1127).reminderId).assertEqual(1127);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270009
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0009
     * @tc.desc   Push second contact volume batch 27-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1129; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1129);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1128).reminderId).assertEqual(1128);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270010
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0010
     * @tc.desc   Push second contact volume batch 27-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1130; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1130);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1129).reminderId).assertEqual(1129);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270011
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0011
     * @tc.desc   Push second contact volume batch 27-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1131; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1131);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1130).reminderId).assertEqual(1130);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270012
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0012
     * @tc.desc   Push second contact volume batch 27-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1132; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1132);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1131).reminderId).assertEqual(1131);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270013
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0013
     * @tc.desc   Push second contact volume batch 27-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1133; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1133);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1132).reminderId).assertEqual(1132);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270014
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0014
     * @tc.desc   Push second contact volume batch 27-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1134; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1134);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1133).reminderId).assertEqual(1133);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270015
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0015
     * @tc.desc   Push second contact volume batch 27-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1135; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1135);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1134).reminderId).assertEqual(1134);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270016
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0016
     * @tc.desc   Push second contact volume batch 27-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1136; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1136);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1135).reminderId).assertEqual(1135);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270017
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0017
     * @tc.desc   Push second contact volume batch 27-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1137; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1137);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1136).reminderId).assertEqual(1136);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270018
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0018
     * @tc.desc   Push second contact volume batch 27-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1138; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1138);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1137).reminderId).assertEqual(1137);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270019
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0019
     * @tc.desc   Push second contact volume batch 27-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1139; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1139);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1138).reminderId).assertEqual(1138);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2270020
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0020
     * @tc.desc   Push second contact volume batch 27-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2270020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1140; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1140);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1139).reminderId).assertEqual(1139);
      await Promise.resolve();
    })
  })
}
