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

export default function flipClockVolume2Contact21Test() {
  describe('FlipClockVolume2Contact21Test', () => {

    /**
     * @tc.name   testFlipClockVol2210001
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0001
     * @tc.desc   Push second contact volume batch 21-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1001; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1001);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1000).reminderId).assertEqual(1000);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210002
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0002
     * @tc.desc   Push second contact volume batch 21-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1002; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1002);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1001).reminderId).assertEqual(1001);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210003
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0003
     * @tc.desc   Push second contact volume batch 21-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1003; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1003);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1002).reminderId).assertEqual(1002);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210004
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0004
     * @tc.desc   Push second contact volume batch 21-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1004; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1004);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1003).reminderId).assertEqual(1003);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210005
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0005
     * @tc.desc   Push second contact volume batch 21-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1005; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1005);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1004).reminderId).assertEqual(1004);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210006
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0006
     * @tc.desc   Push second contact volume batch 21-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1006; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1006);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1005).reminderId).assertEqual(1005);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210007
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0007
     * @tc.desc   Push second contact volume batch 21-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1007; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1007);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1006).reminderId).assertEqual(1006);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210008
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0008
     * @tc.desc   Push second contact volume batch 21-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1008; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1008);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1007).reminderId).assertEqual(1007);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210009
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0009
     * @tc.desc   Push second contact volume batch 21-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1009; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1009);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1008).reminderId).assertEqual(1008);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210010
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0010
     * @tc.desc   Push second contact volume batch 21-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1010; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1010);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1009).reminderId).assertEqual(1009);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210011
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0011
     * @tc.desc   Push second contact volume batch 21-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1011; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1011);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1010).reminderId).assertEqual(1010);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210012
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0012
     * @tc.desc   Push second contact volume batch 21-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1012; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1012);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1011).reminderId).assertEqual(1011);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210013
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0013
     * @tc.desc   Push second contact volume batch 21-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1013; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1013);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1012).reminderId).assertEqual(1012);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210014
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0014
     * @tc.desc   Push second contact volume batch 21-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1014; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1014);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1013).reminderId).assertEqual(1013);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210015
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0015
     * @tc.desc   Push second contact volume batch 21-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1015; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1015);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1014).reminderId).assertEqual(1014);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210016
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0016
     * @tc.desc   Push second contact volume batch 21-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1016; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1016);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1015).reminderId).assertEqual(1015);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210017
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0017
     * @tc.desc   Push second contact volume batch 21-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1017; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1017);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1016).reminderId).assertEqual(1016);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210018
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0018
     * @tc.desc   Push second contact volume batch 21-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1018; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1018);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1017).reminderId).assertEqual(1017);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210019
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0019
     * @tc.desc   Push second contact volume batch 21-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1019; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1019);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1018).reminderId).assertEqual(1018);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2210020
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0020
     * @tc.desc   Push second contact volume batch 21-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2210020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1020; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1020);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1019).reminderId).assertEqual(1019);
      await Promise.resolve();
    })
  })
}
