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

export default function flipClockVolume2Contact19Test() {
  describe('FlipClockVolume2Contact19Test', () => {

    /**
     * @tc.name   testFlipClockVol2190001
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0001
     * @tc.desc   Push second contact volume batch 19-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 961; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(961);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(960).reminderId).assertEqual(960);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190002
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0002
     * @tc.desc   Push second contact volume batch 19-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 962; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(962);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(961).reminderId).assertEqual(961);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190003
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0003
     * @tc.desc   Push second contact volume batch 19-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 963; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(963);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(962).reminderId).assertEqual(962);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190004
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0004
     * @tc.desc   Push second contact volume batch 19-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 964; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(964);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(963).reminderId).assertEqual(963);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190005
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0005
     * @tc.desc   Push second contact volume batch 19-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 965; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(965);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(964).reminderId).assertEqual(964);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190006
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0006
     * @tc.desc   Push second contact volume batch 19-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 966; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(966);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(965).reminderId).assertEqual(965);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190007
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0007
     * @tc.desc   Push second contact volume batch 19-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 967; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(967);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(966).reminderId).assertEqual(966);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190008
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0008
     * @tc.desc   Push second contact volume batch 19-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 968; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(968);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(967).reminderId).assertEqual(967);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190009
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0009
     * @tc.desc   Push second contact volume batch 19-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 969; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(969);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(968).reminderId).assertEqual(968);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190010
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0010
     * @tc.desc   Push second contact volume batch 19-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 970; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(970);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(969).reminderId).assertEqual(969);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190011
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0011
     * @tc.desc   Push second contact volume batch 19-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 971; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(971);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(970).reminderId).assertEqual(970);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190012
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0012
     * @tc.desc   Push second contact volume batch 19-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 972; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(972);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(971).reminderId).assertEqual(971);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190013
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0013
     * @tc.desc   Push second contact volume batch 19-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 973; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(973);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(972).reminderId).assertEqual(972);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190014
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0014
     * @tc.desc   Push second contact volume batch 19-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 974; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(974);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(973).reminderId).assertEqual(973);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190015
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0015
     * @tc.desc   Push second contact volume batch 19-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 975; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(975);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(974).reminderId).assertEqual(974);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190016
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0016
     * @tc.desc   Push second contact volume batch 19-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 976; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(976);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(975).reminderId).assertEqual(975);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190017
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0017
     * @tc.desc   Push second contact volume batch 19-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 977; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(977);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(976).reminderId).assertEqual(976);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190018
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0018
     * @tc.desc   Push second contact volume batch 19-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 978; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(978);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(977).reminderId).assertEqual(977);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190019
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0019
     * @tc.desc   Push second contact volume batch 19-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 979; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(979);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(978).reminderId).assertEqual(978);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2190020
     * @tc.number SUB_FLIP_CLOCK_VOL2_19_0020
     * @tc.desc   Push second contact volume batch 19-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2190020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 980; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(980);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(979).reminderId).assertEqual(979);
      await Promise.resolve();
    })
  })
}
