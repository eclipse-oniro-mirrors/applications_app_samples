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

export default function flipClockVolume2Contact17Test() {
  describe('FlipClockVolume2Contact17Test', () => {

    /**
     * @tc.name   testFlipClockVol2170001
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0001
     * @tc.desc   Push second contact volume batch 17-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 921; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(921);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(920).reminderId).assertEqual(920);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170002
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0002
     * @tc.desc   Push second contact volume batch 17-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 922; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(922);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(921).reminderId).assertEqual(921);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170003
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0003
     * @tc.desc   Push second contact volume batch 17-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 923; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(923);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(922).reminderId).assertEqual(922);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170004
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0004
     * @tc.desc   Push second contact volume batch 17-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 924; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(924);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(923).reminderId).assertEqual(923);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170005
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0005
     * @tc.desc   Push second contact volume batch 17-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 925; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(925);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(924).reminderId).assertEqual(924);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170006
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0006
     * @tc.desc   Push second contact volume batch 17-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 926; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(926);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(925).reminderId).assertEqual(925);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170007
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0007
     * @tc.desc   Push second contact volume batch 17-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 927; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(927);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(926).reminderId).assertEqual(926);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170008
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0008
     * @tc.desc   Push second contact volume batch 17-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 928; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(928);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(927).reminderId).assertEqual(927);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170009
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0009
     * @tc.desc   Push second contact volume batch 17-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 929; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(929);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(928).reminderId).assertEqual(928);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170010
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0010
     * @tc.desc   Push second contact volume batch 17-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 930; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(930);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(929).reminderId).assertEqual(929);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170011
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0011
     * @tc.desc   Push second contact volume batch 17-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 931; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(931);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(930).reminderId).assertEqual(930);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170012
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0012
     * @tc.desc   Push second contact volume batch 17-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 932; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(932);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(931).reminderId).assertEqual(931);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170013
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0013
     * @tc.desc   Push second contact volume batch 17-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 933; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(933);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(932).reminderId).assertEqual(932);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170014
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0014
     * @tc.desc   Push second contact volume batch 17-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 934; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(934);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(933).reminderId).assertEqual(933);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170015
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0015
     * @tc.desc   Push second contact volume batch 17-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 935; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(935);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(934).reminderId).assertEqual(934);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170016
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0016
     * @tc.desc   Push second contact volume batch 17-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 936; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(936);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(935).reminderId).assertEqual(935);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170017
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0017
     * @tc.desc   Push second contact volume batch 17-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 937; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(937);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(936).reminderId).assertEqual(936);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170018
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0018
     * @tc.desc   Push second contact volume batch 17-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 938; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(938);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(937).reminderId).assertEqual(937);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170019
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0019
     * @tc.desc   Push second contact volume batch 17-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 939; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(939);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(938).reminderId).assertEqual(938);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2170020
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0020
     * @tc.desc   Push second contact volume batch 17-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2170020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 940; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(940);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(939).reminderId).assertEqual(939);
      await Promise.resolve();
    })
  })
}
