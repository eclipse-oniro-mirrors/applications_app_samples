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

export default function flipClockVolumeContact09Test() {
  describe('FlipClockVolumeContact09Test', () => {

    /**
     * @tc.name   testFlipClockVolume090001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0001
     * @tc.desc   Push contact volume batch 9-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 161; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(161);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(160).reminderId).assertEqual(160);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0002
     * @tc.desc   Push contact volume batch 9-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 162; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(162);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(161).reminderId).assertEqual(161);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0003
     * @tc.desc   Push contact volume batch 9-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 163; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(163);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(162).reminderId).assertEqual(162);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0004
     * @tc.desc   Push contact volume batch 9-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 164; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(164);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(163).reminderId).assertEqual(163);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0005
     * @tc.desc   Push contact volume batch 9-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 165; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(165);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(164).reminderId).assertEqual(164);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0006
     * @tc.desc   Push contact volume batch 9-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 166; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(166);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(165).reminderId).assertEqual(165);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0007
     * @tc.desc   Push contact volume batch 9-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 167; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(167);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(166).reminderId).assertEqual(166);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0008
     * @tc.desc   Push contact volume batch 9-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 168; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(168);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(167).reminderId).assertEqual(167);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0009
     * @tc.desc   Push contact volume batch 9-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 169; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(169);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(168).reminderId).assertEqual(168);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0010
     * @tc.desc   Push contact volume batch 9-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 170; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(170);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(169).reminderId).assertEqual(169);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0011
     * @tc.desc   Push contact volume batch 9-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 171; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(171);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(170).reminderId).assertEqual(170);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0012
     * @tc.desc   Push contact volume batch 9-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 172; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(172);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(171).reminderId).assertEqual(171);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0013
     * @tc.desc   Push contact volume batch 9-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 173; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(173);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(172).reminderId).assertEqual(172);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0014
     * @tc.desc   Push contact volume batch 9-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 174; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(174);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(173).reminderId).assertEqual(173);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0015
     * @tc.desc   Push contact volume batch 9-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 175; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(175);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(174).reminderId).assertEqual(174);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0016
     * @tc.desc   Push contact volume batch 9-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 176; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(176);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(175).reminderId).assertEqual(175);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0017
     * @tc.desc   Push contact volume batch 9-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 177; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(177);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(176).reminderId).assertEqual(176);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0018
     * @tc.desc   Push contact volume batch 9-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 178; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(178);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(177).reminderId).assertEqual(177);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0019
     * @tc.desc   Push contact volume batch 9-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 179; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(179);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(178).reminderId).assertEqual(178);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume090020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_09_0020
     * @tc.desc   Push contact volume batch 9-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume090020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 180; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(180);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(179).reminderId).assertEqual(179);
      await Promise.resolve();
    })
  })
}
