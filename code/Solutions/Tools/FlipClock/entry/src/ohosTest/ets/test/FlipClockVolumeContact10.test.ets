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

export default function flipClockVolumeContact10Test() {
  describe('FlipClockVolumeContact10Test', () => {

    /**
     * @tc.name   testFlipClockVolume100001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0001
     * @tc.desc   Push contact volume batch 10-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 181; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(181);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(180).reminderId).assertEqual(180);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0002
     * @tc.desc   Push contact volume batch 10-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 182; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(182);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(181).reminderId).assertEqual(181);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0003
     * @tc.desc   Push contact volume batch 10-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 183; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(183);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(182).reminderId).assertEqual(182);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0004
     * @tc.desc   Push contact volume batch 10-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 184; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(184);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(183).reminderId).assertEqual(183);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0005
     * @tc.desc   Push contact volume batch 10-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 185; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(185);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(184).reminderId).assertEqual(184);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0006
     * @tc.desc   Push contact volume batch 10-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 186; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(186);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(185).reminderId).assertEqual(185);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0007
     * @tc.desc   Push contact volume batch 10-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 187; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(187);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(186).reminderId).assertEqual(186);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0008
     * @tc.desc   Push contact volume batch 10-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 188; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(188);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(187).reminderId).assertEqual(187);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0009
     * @tc.desc   Push contact volume batch 10-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 189; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(189);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(188).reminderId).assertEqual(188);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0010
     * @tc.desc   Push contact volume batch 10-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 190; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(190);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(189).reminderId).assertEqual(189);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0011
     * @tc.desc   Push contact volume batch 10-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 191; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(191);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(190).reminderId).assertEqual(190);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0012
     * @tc.desc   Push contact volume batch 10-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 192; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(192);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(191).reminderId).assertEqual(191);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0013
     * @tc.desc   Push contact volume batch 10-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 193; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(193);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(192).reminderId).assertEqual(192);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0014
     * @tc.desc   Push contact volume batch 10-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 194; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(194);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(193).reminderId).assertEqual(193);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0015
     * @tc.desc   Push contact volume batch 10-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 195; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(195);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(194).reminderId).assertEqual(194);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0016
     * @tc.desc   Push contact volume batch 10-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 196; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(196);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(195).reminderId).assertEqual(195);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0017
     * @tc.desc   Push contact volume batch 10-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 197; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(197);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(196).reminderId).assertEqual(196);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0018
     * @tc.desc   Push contact volume batch 10-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 198; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(198);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(197).reminderId).assertEqual(197);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0019
     * @tc.desc   Push contact volume batch 10-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 199; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(199);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(198).reminderId).assertEqual(198);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume100020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_10_0020
     * @tc.desc   Push contact volume batch 10-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume100020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 200; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(200);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(199).reminderId).assertEqual(199);
      await Promise.resolve();
    })
  })
}
