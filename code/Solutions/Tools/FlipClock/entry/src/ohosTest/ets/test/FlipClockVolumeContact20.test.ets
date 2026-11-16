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

export default function flipClockVolumeContact20Test() {
  describe('FlipClockVolumeContact20Test', () => {

    /**
     * @tc.name   testFlipClockVolume200001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0001
     * @tc.desc   Push contact volume batch 20-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 381; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(381);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(380).reminderId).assertEqual(380);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0002
     * @tc.desc   Push contact volume batch 20-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 382; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(382);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(381).reminderId).assertEqual(381);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0003
     * @tc.desc   Push contact volume batch 20-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 383; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(383);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(382).reminderId).assertEqual(382);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0004
     * @tc.desc   Push contact volume batch 20-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 384; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(384);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(383).reminderId).assertEqual(383);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0005
     * @tc.desc   Push contact volume batch 20-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 385; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(385);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(384).reminderId).assertEqual(384);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0006
     * @tc.desc   Push contact volume batch 20-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 386; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(386);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(385).reminderId).assertEqual(385);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0007
     * @tc.desc   Push contact volume batch 20-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 387; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(387);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(386).reminderId).assertEqual(386);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0008
     * @tc.desc   Push contact volume batch 20-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 388; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(388);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(387).reminderId).assertEqual(387);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0009
     * @tc.desc   Push contact volume batch 20-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 389; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(389);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(388).reminderId).assertEqual(388);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0010
     * @tc.desc   Push contact volume batch 20-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 390; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(390);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(389).reminderId).assertEqual(389);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0011
     * @tc.desc   Push contact volume batch 20-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 391; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(391);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(390).reminderId).assertEqual(390);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0012
     * @tc.desc   Push contact volume batch 20-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 392; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(392);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(391).reminderId).assertEqual(391);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0013
     * @tc.desc   Push contact volume batch 20-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 393; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(393);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(392).reminderId).assertEqual(392);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0014
     * @tc.desc   Push contact volume batch 20-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 394; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(394);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(393).reminderId).assertEqual(393);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0015
     * @tc.desc   Push contact volume batch 20-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 395; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(395);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(394).reminderId).assertEqual(394);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0016
     * @tc.desc   Push contact volume batch 20-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 396; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(396);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(395).reminderId).assertEqual(395);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0017
     * @tc.desc   Push contact volume batch 20-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 397; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(397);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(396).reminderId).assertEqual(396);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0018
     * @tc.desc   Push contact volume batch 20-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 398; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(398);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(397).reminderId).assertEqual(397);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0019
     * @tc.desc   Push contact volume batch 20-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 399; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(399);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(398).reminderId).assertEqual(398);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume200020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_20_0020
     * @tc.desc   Push contact volume batch 20-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume200020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 400; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(400);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(399).reminderId).assertEqual(399);
      await Promise.resolve();
    })
  })
}
