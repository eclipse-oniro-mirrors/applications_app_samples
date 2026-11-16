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

export default function flipClockVolume2Contact15Test() {
  describe('FlipClockVolume2Contact15Test', () => {

    /**
     * @tc.name   testFlipClockVol2150001
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0001
     * @tc.desc   Push second contact volume batch 15-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 881; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(881);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(880).reminderId).assertEqual(880);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150002
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0002
     * @tc.desc   Push second contact volume batch 15-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 882; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(882);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(881).reminderId).assertEqual(881);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150003
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0003
     * @tc.desc   Push second contact volume batch 15-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 883; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(883);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(882).reminderId).assertEqual(882);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150004
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0004
     * @tc.desc   Push second contact volume batch 15-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 884; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(884);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(883).reminderId).assertEqual(883);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150005
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0005
     * @tc.desc   Push second contact volume batch 15-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 885; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(885);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(884).reminderId).assertEqual(884);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150006
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0006
     * @tc.desc   Push second contact volume batch 15-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 886; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(886);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(885).reminderId).assertEqual(885);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150007
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0007
     * @tc.desc   Push second contact volume batch 15-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 887; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(887);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(886).reminderId).assertEqual(886);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150008
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0008
     * @tc.desc   Push second contact volume batch 15-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 888; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(888);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(887).reminderId).assertEqual(887);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150009
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0009
     * @tc.desc   Push second contact volume batch 15-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 889; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(889);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(888).reminderId).assertEqual(888);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150010
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0010
     * @tc.desc   Push second contact volume batch 15-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 890; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(890);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(889).reminderId).assertEqual(889);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150011
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0011
     * @tc.desc   Push second contact volume batch 15-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 891; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(891);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(890).reminderId).assertEqual(890);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150012
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0012
     * @tc.desc   Push second contact volume batch 15-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 892; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(892);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(891).reminderId).assertEqual(891);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150013
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0013
     * @tc.desc   Push second contact volume batch 15-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 893; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(893);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(892).reminderId).assertEqual(892);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150014
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0014
     * @tc.desc   Push second contact volume batch 15-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 894; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(894);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(893).reminderId).assertEqual(893);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150015
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0015
     * @tc.desc   Push second contact volume batch 15-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 895; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(895);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(894).reminderId).assertEqual(894);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150016
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0016
     * @tc.desc   Push second contact volume batch 15-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 896; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(896);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(895).reminderId).assertEqual(895);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150017
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0017
     * @tc.desc   Push second contact volume batch 15-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 897; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(897);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(896).reminderId).assertEqual(896);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150018
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0018
     * @tc.desc   Push second contact volume batch 15-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 898; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(898);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(897).reminderId).assertEqual(897);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150019
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0019
     * @tc.desc   Push second contact volume batch 15-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 899; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(899);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(898).reminderId).assertEqual(898);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2150020
     * @tc.number SUB_FLIP_CLOCK_VOL2_15_0020
     * @tc.desc   Push second contact volume batch 15-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2150020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 900; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(900);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(899).reminderId).assertEqual(899);
      await Promise.resolve();
    })
  })
}
