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

export default function flipClockVolume2Contact24Test() {
  describe('FlipClockVolume2Contact24Test', () => {

    /**
     * @tc.name   testFlipClockVol2240001
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0001
     * @tc.desc   Push second contact volume batch 24-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1061; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1061);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1060).reminderId).assertEqual(1060);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240002
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0002
     * @tc.desc   Push second contact volume batch 24-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1062; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1062);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1061).reminderId).assertEqual(1061);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240003
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0003
     * @tc.desc   Push second contact volume batch 24-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1063; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1063);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1062).reminderId).assertEqual(1062);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240004
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0004
     * @tc.desc   Push second contact volume batch 24-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1064; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1064);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1063).reminderId).assertEqual(1063);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240005
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0005
     * @tc.desc   Push second contact volume batch 24-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1065; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1065);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1064).reminderId).assertEqual(1064);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240006
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0006
     * @tc.desc   Push second contact volume batch 24-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1066; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1066);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1065).reminderId).assertEqual(1065);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240007
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0007
     * @tc.desc   Push second contact volume batch 24-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1067; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1067);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1066).reminderId).assertEqual(1066);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240008
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0008
     * @tc.desc   Push second contact volume batch 24-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1068; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1068);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1067).reminderId).assertEqual(1067);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240009
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0009
     * @tc.desc   Push second contact volume batch 24-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1069; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1069);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1068).reminderId).assertEqual(1068);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240010
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0010
     * @tc.desc   Push second contact volume batch 24-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1070; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1070);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1069).reminderId).assertEqual(1069);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240011
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0011
     * @tc.desc   Push second contact volume batch 24-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1071; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1071);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1070).reminderId).assertEqual(1070);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240012
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0012
     * @tc.desc   Push second contact volume batch 24-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1072; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1072);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1071).reminderId).assertEqual(1071);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240013
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0013
     * @tc.desc   Push second contact volume batch 24-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1073; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1073);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1072).reminderId).assertEqual(1072);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240014
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0014
     * @tc.desc   Push second contact volume batch 24-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1074; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1074);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1073).reminderId).assertEqual(1073);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240015
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0015
     * @tc.desc   Push second contact volume batch 24-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1075; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1075);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1074).reminderId).assertEqual(1074);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240016
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0016
     * @tc.desc   Push second contact volume batch 24-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1076; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1076);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1075).reminderId).assertEqual(1075);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240017
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0017
     * @tc.desc   Push second contact volume batch 24-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1077; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1077);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1076).reminderId).assertEqual(1076);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240018
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0018
     * @tc.desc   Push second contact volume batch 24-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1078; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1078);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1077).reminderId).assertEqual(1077);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240019
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0019
     * @tc.desc   Push second contact volume batch 24-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1079; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1079);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1078).reminderId).assertEqual(1078);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2240020
     * @tc.number SUB_FLIP_CLOCK_VOL2_24_0020
     * @tc.desc   Push second contact volume batch 24-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2240020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1080; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(1080);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(1079).reminderId).assertEqual(1079);
      await Promise.resolve();
    })
  })
}
