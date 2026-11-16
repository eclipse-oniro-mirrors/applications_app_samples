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

export default function flipClockVolume2Contact20Test() {
  describe('FlipClockVolume2Contact20Test', () => {

    /**
     * @tc.name   testFlipClockVol2200001
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0001
     * @tc.desc   Push second contact volume batch 20-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 981; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(981);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(980).reminderId).assertEqual(980);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200002
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0002
     * @tc.desc   Push second contact volume batch 20-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 982; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(982);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(981).reminderId).assertEqual(981);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200003
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0003
     * @tc.desc   Push second contact volume batch 20-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 983; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(983);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(982).reminderId).assertEqual(982);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200004
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0004
     * @tc.desc   Push second contact volume batch 20-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 984; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(984);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(983).reminderId).assertEqual(983);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200005
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0005
     * @tc.desc   Push second contact volume batch 20-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 985; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(985);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(984).reminderId).assertEqual(984);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200006
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0006
     * @tc.desc   Push second contact volume batch 20-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 986; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(986);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(985).reminderId).assertEqual(985);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200007
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0007
     * @tc.desc   Push second contact volume batch 20-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 987; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(987);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(986).reminderId).assertEqual(986);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200008
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0008
     * @tc.desc   Push second contact volume batch 20-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 988; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(988);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(987).reminderId).assertEqual(987);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200009
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0009
     * @tc.desc   Push second contact volume batch 20-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 989; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(989);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(988).reminderId).assertEqual(988);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200010
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0010
     * @tc.desc   Push second contact volume batch 20-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 990; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(990);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(989).reminderId).assertEqual(989);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200011
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0011
     * @tc.desc   Push second contact volume batch 20-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 991; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(991);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(990).reminderId).assertEqual(990);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200012
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0012
     * @tc.desc   Push second contact volume batch 20-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 992; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(992);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(991).reminderId).assertEqual(991);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200013
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0013
     * @tc.desc   Push second contact volume batch 20-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 993; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(993);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(992).reminderId).assertEqual(992);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200014
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0014
     * @tc.desc   Push second contact volume batch 20-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 994; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(994);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(993).reminderId).assertEqual(993);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200015
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0015
     * @tc.desc   Push second contact volume batch 20-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 995; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(995);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(994).reminderId).assertEqual(994);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200016
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0016
     * @tc.desc   Push second contact volume batch 20-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 996; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(996);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(995).reminderId).assertEqual(995);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200017
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0017
     * @tc.desc   Push second contact volume batch 20-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 997; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(997);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(996).reminderId).assertEqual(996);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200018
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0018
     * @tc.desc   Push second contact volume batch 20-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 998; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(998);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(997).reminderId).assertEqual(997);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200019
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0019
     * @tc.desc   Push second contact volume batch 20-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 999; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(999);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(998).reminderId).assertEqual(998);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2200020
     * @tc.number SUB_FLIP_CLOCK_VOL2_20_0020
     * @tc.desc   Push second contact volume batch 20-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2200020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1000; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1000);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(999).reminderId).assertEqual(999);
      await Promise.resolve();
    })
  })
}
