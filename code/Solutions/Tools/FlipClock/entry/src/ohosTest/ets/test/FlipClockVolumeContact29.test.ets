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

export default function flipClockVolumeContact29Test() {
  describe('FlipClockVolumeContact29Test', () => {

    /**
     * @tc.name   testFlipClockVolume290001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0001
     * @tc.desc   Push contact volume batch 29-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 561; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(561);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(560).reminderId).assertEqual(560);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0002
     * @tc.desc   Push contact volume batch 29-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 562; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(562);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(561).reminderId).assertEqual(561);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0003
     * @tc.desc   Push contact volume batch 29-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 563; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(563);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(562).reminderId).assertEqual(562);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0004
     * @tc.desc   Push contact volume batch 29-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 564; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(564);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(563).reminderId).assertEqual(563);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0005
     * @tc.desc   Push contact volume batch 29-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 565; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(565);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(564).reminderId).assertEqual(564);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0006
     * @tc.desc   Push contact volume batch 29-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 566; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(566);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(565).reminderId).assertEqual(565);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0007
     * @tc.desc   Push contact volume batch 29-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 567; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(567);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(566).reminderId).assertEqual(566);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0008
     * @tc.desc   Push contact volume batch 29-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 568; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(568);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(567).reminderId).assertEqual(567);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0009
     * @tc.desc   Push contact volume batch 29-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 569; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(569);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(568).reminderId).assertEqual(568);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0010
     * @tc.desc   Push contact volume batch 29-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 570; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(570);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(569).reminderId).assertEqual(569);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0011
     * @tc.desc   Push contact volume batch 29-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 571; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(571);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(570).reminderId).assertEqual(570);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0012
     * @tc.desc   Push contact volume batch 29-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 572; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(572);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(571).reminderId).assertEqual(571);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0013
     * @tc.desc   Push contact volume batch 29-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 573; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(573);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(572).reminderId).assertEqual(572);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0014
     * @tc.desc   Push contact volume batch 29-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 574; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(574);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(573).reminderId).assertEqual(573);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0015
     * @tc.desc   Push contact volume batch 29-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 575; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(575);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(574).reminderId).assertEqual(574);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0016
     * @tc.desc   Push contact volume batch 29-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 576; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(576);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(575).reminderId).assertEqual(575);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0017
     * @tc.desc   Push contact volume batch 29-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 577; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(577);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(576).reminderId).assertEqual(576);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0018
     * @tc.desc   Push contact volume batch 29-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 578; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(578);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(577).reminderId).assertEqual(577);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0019
     * @tc.desc   Push contact volume batch 29-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 579; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(579);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(578).reminderId).assertEqual(578);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume290020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_29_0020
     * @tc.desc   Push contact volume batch 29-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume290020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 580; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(580);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(579).reminderId).assertEqual(579);
      await Promise.resolve();
    })
  })
}
