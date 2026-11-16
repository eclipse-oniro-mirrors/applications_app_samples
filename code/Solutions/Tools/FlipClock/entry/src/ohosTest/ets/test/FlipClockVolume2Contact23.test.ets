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

export default function flipClockVolume2Contact23Test() {
  describe('FlipClockVolume2Contact23Test', () => {

    /**
     * @tc.name   testFlipClockVol2230001
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0001
     * @tc.desc   Push second contact volume batch 23-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1041; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1041);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1040).reminderId).assertEqual(1040);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230002
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0002
     * @tc.desc   Push second contact volume batch 23-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1042; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1042);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1041).reminderId).assertEqual(1041);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230003
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0003
     * @tc.desc   Push second contact volume batch 23-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1043; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1043);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1042).reminderId).assertEqual(1042);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230004
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0004
     * @tc.desc   Push second contact volume batch 23-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1044; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1044);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1043).reminderId).assertEqual(1043);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230005
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0005
     * @tc.desc   Push second contact volume batch 23-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1045; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1045);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1044).reminderId).assertEqual(1044);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230006
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0006
     * @tc.desc   Push second contact volume batch 23-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1046; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1046);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1045).reminderId).assertEqual(1045);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230007
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0007
     * @tc.desc   Push second contact volume batch 23-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1047; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1047);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1046).reminderId).assertEqual(1046);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230008
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0008
     * @tc.desc   Push second contact volume batch 23-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1048; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1048);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1047).reminderId).assertEqual(1047);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230009
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0009
     * @tc.desc   Push second contact volume batch 23-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1049; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1049);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1048).reminderId).assertEqual(1048);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230010
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0010
     * @tc.desc   Push second contact volume batch 23-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1050; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1050);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1049).reminderId).assertEqual(1049);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230011
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0011
     * @tc.desc   Push second contact volume batch 23-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1051; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1051);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1050).reminderId).assertEqual(1050);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230012
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0012
     * @tc.desc   Push second contact volume batch 23-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1052; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1052);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1051).reminderId).assertEqual(1051);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230013
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0013
     * @tc.desc   Push second contact volume batch 23-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1053; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1053);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1052).reminderId).assertEqual(1052);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230014
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0014
     * @tc.desc   Push second contact volume batch 23-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1054; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1054);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1053).reminderId).assertEqual(1053);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230015
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0015
     * @tc.desc   Push second contact volume batch 23-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1055; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1055);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1054).reminderId).assertEqual(1054);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230016
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0016
     * @tc.desc   Push second contact volume batch 23-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1056; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1056);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1055).reminderId).assertEqual(1055);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230017
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0017
     * @tc.desc   Push second contact volume batch 23-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1057; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1057);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1056).reminderId).assertEqual(1056);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230018
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0018
     * @tc.desc   Push second contact volume batch 23-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1058; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1058);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1057).reminderId).assertEqual(1057);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230019
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0019
     * @tc.desc   Push second contact volume batch 23-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1059; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1059);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1058).reminderId).assertEqual(1058);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2230020
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0020
     * @tc.desc   Push second contact volume batch 23-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1060; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1060);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1059).reminderId).assertEqual(1059);
      await Promise.resolve();
    })
  })
}
