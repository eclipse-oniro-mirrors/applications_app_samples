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

export default function flipClockVolume2Contact10Test() {
  describe('FlipClockVolume2Contact10Test', () => {

    /**
     * @tc.name   testFlipClockVol2100001
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0001
     * @tc.desc   Push second contact volume batch 10-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 781; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(781);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(780).reminderId).assertEqual(780);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100002
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0002
     * @tc.desc   Push second contact volume batch 10-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 782; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(782);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(781).reminderId).assertEqual(781);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100003
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0003
     * @tc.desc   Push second contact volume batch 10-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 783; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(783);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(782).reminderId).assertEqual(782);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100004
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0004
     * @tc.desc   Push second contact volume batch 10-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 784; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(784);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(783).reminderId).assertEqual(783);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100005
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0005
     * @tc.desc   Push second contact volume batch 10-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 785; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(785);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(784).reminderId).assertEqual(784);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100006
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0006
     * @tc.desc   Push second contact volume batch 10-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 786; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(786);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(785).reminderId).assertEqual(785);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100007
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0007
     * @tc.desc   Push second contact volume batch 10-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 787; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(787);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(786).reminderId).assertEqual(786);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100008
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0008
     * @tc.desc   Push second contact volume batch 10-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 788; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(788);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(787).reminderId).assertEqual(787);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100009
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0009
     * @tc.desc   Push second contact volume batch 10-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 789; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(789);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(788).reminderId).assertEqual(788);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100010
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0010
     * @tc.desc   Push second contact volume batch 10-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 790; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(790);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(789).reminderId).assertEqual(789);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100011
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0011
     * @tc.desc   Push second contact volume batch 10-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 791; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(791);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(790).reminderId).assertEqual(790);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100012
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0012
     * @tc.desc   Push second contact volume batch 10-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 792; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(792);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(791).reminderId).assertEqual(791);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100013
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0013
     * @tc.desc   Push second contact volume batch 10-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 793; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(793);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(792).reminderId).assertEqual(792);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100014
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0014
     * @tc.desc   Push second contact volume batch 10-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 794; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(794);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(793).reminderId).assertEqual(793);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100015
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0015
     * @tc.desc   Push second contact volume batch 10-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 795; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(795);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(794).reminderId).assertEqual(794);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100016
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0016
     * @tc.desc   Push second contact volume batch 10-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 796; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(796);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(795).reminderId).assertEqual(795);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100017
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0017
     * @tc.desc   Push second contact volume batch 10-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 797; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(797);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(796).reminderId).assertEqual(796);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100018
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0018
     * @tc.desc   Push second contact volume batch 10-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 798; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(798);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(797).reminderId).assertEqual(797);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100019
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0019
     * @tc.desc   Push second contact volume batch 10-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 799; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(799);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(798).reminderId).assertEqual(798);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2100020
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0020
     * @tc.desc   Push second contact volume batch 10-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 800; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(800);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(799).reminderId).assertEqual(799);
      await Promise.resolve();
    })
  })
}
