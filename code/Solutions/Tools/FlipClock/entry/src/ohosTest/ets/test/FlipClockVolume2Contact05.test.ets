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

export default function flipClockVolume2Contact05Test() {
  describe('FlipClockVolume2Contact05Test', () => {

    /**
     * @tc.name   testFlipClockVol2050001
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0001
     * @tc.desc   Push second contact volume batch 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 681; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(681);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(680).reminderId).assertEqual(680);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050002
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0002
     * @tc.desc   Push second contact volume batch 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 682; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(682);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(681).reminderId).assertEqual(681);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050003
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0003
     * @tc.desc   Push second contact volume batch 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 683; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(683);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(682).reminderId).assertEqual(682);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050004
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0004
     * @tc.desc   Push second contact volume batch 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 684; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(684);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(683).reminderId).assertEqual(683);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050005
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0005
     * @tc.desc   Push second contact volume batch 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 685; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(685);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(684).reminderId).assertEqual(684);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050006
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0006
     * @tc.desc   Push second contact volume batch 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 686; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(686);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(685).reminderId).assertEqual(685);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050007
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0007
     * @tc.desc   Push second contact volume batch 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 687; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(687);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(686).reminderId).assertEqual(686);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050008
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0008
     * @tc.desc   Push second contact volume batch 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 688; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(688);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(687).reminderId).assertEqual(687);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050009
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0009
     * @tc.desc   Push second contact volume batch 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 689; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(689);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(688).reminderId).assertEqual(688);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050010
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0010
     * @tc.desc   Push second contact volume batch 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 690; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(690);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(689).reminderId).assertEqual(689);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050011
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0011
     * @tc.desc   Push second contact volume batch 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 691; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(691);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(690).reminderId).assertEqual(690);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050012
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0012
     * @tc.desc   Push second contact volume batch 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 692; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(692);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(691).reminderId).assertEqual(691);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050013
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0013
     * @tc.desc   Push second contact volume batch 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 693; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(693);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(692).reminderId).assertEqual(692);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050014
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0014
     * @tc.desc   Push second contact volume batch 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 694; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(694);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(693).reminderId).assertEqual(693);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050015
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0015
     * @tc.desc   Push second contact volume batch 5-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 695; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(695);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(694).reminderId).assertEqual(694);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050016
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0016
     * @tc.desc   Push second contact volume batch 5-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 696; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(696);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(695).reminderId).assertEqual(695);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050017
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0017
     * @tc.desc   Push second contact volume batch 5-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 697; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(697);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(696).reminderId).assertEqual(696);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050018
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0018
     * @tc.desc   Push second contact volume batch 5-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 698; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(698);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(697).reminderId).assertEqual(697);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050019
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0019
     * @tc.desc   Push second contact volume batch 5-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 699; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(699);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(698).reminderId).assertEqual(698);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVol2050020
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0020
     * @tc.desc   Push second contact volume batch 5-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 700; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(700);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(699).reminderId).assertEqual(699);
      await Promise.resolve();
    })
  })
}
