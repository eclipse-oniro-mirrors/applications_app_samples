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

export default function flipClockVolume2Contact18Test() {
  describe('FlipClockVolume2Contact18Test', () => {

    /**
     * @tc.name   testFlipClockVol2180001
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0001
     * @tc.desc   Push second contact volume batch 18-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 941; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(941);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(940).reminderId).assertEqual(940);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180002
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0002
     * @tc.desc   Push second contact volume batch 18-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 942; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(942);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(941).reminderId).assertEqual(941);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180003
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0003
     * @tc.desc   Push second contact volume batch 18-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 943; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(943);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(942).reminderId).assertEqual(942);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180004
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0004
     * @tc.desc   Push second contact volume batch 18-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 944; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(944);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(943).reminderId).assertEqual(943);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180005
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0005
     * @tc.desc   Push second contact volume batch 18-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 945; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(945);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(944).reminderId).assertEqual(944);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180006
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0006
     * @tc.desc   Push second contact volume batch 18-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 946; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(946);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(945).reminderId).assertEqual(945);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180007
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0007
     * @tc.desc   Push second contact volume batch 18-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 947; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(947);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(946).reminderId).assertEqual(946);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180008
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0008
     * @tc.desc   Push second contact volume batch 18-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 948; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(948);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(947).reminderId).assertEqual(947);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180009
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0009
     * @tc.desc   Push second contact volume batch 18-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 949; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(949);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(948).reminderId).assertEqual(948);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180010
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0010
     * @tc.desc   Push second contact volume batch 18-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 950; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(950);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(949).reminderId).assertEqual(949);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180011
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0011
     * @tc.desc   Push second contact volume batch 18-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 951; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(951);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(950).reminderId).assertEqual(950);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180012
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0012
     * @tc.desc   Push second contact volume batch 18-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 952; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(952);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(951).reminderId).assertEqual(951);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180013
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0013
     * @tc.desc   Push second contact volume batch 18-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 953; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(953);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(952).reminderId).assertEqual(952);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180014
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0014
     * @tc.desc   Push second contact volume batch 18-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 954; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(954);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(953).reminderId).assertEqual(953);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180015
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0015
     * @tc.desc   Push second contact volume batch 18-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 955; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(955);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(954).reminderId).assertEqual(954);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180016
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0016
     * @tc.desc   Push second contact volume batch 18-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 956; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(956);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(955).reminderId).assertEqual(955);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180017
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0017
     * @tc.desc   Push second contact volume batch 18-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 957; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(957);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(956).reminderId).assertEqual(956);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180018
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0018
     * @tc.desc   Push second contact volume batch 18-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 958; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(958);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(957).reminderId).assertEqual(957);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180019
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0019
     * @tc.desc   Push second contact volume batch 18-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 959; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(959);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(958).reminderId).assertEqual(958);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2180020
     * @tc.number SUB_FLIP_CLOCK_VOL2_18_0020
     * @tc.desc   Push second contact volume batch 18-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2180020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 960; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(960);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(959).reminderId).assertEqual(959);
      await Promise.resolve();
    })
  })
}
