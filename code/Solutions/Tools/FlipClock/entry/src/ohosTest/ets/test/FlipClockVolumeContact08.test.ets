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

export default function flipClockVolumeContact08Test() {
  describe('FlipClockVolumeContact08Test', () => {

    /**
     * @tc.name   testFlipClockVolume080001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0001
     * @tc.desc   Push contact volume batch 8-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 141; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(141);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(140).reminderId).assertEqual(140);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0002
     * @tc.desc   Push contact volume batch 8-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 142; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(142);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(141).reminderId).assertEqual(141);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0003
     * @tc.desc   Push contact volume batch 8-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 143; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(143);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(142).reminderId).assertEqual(142);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0004
     * @tc.desc   Push contact volume batch 8-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 144; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(144);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(143).reminderId).assertEqual(143);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0005
     * @tc.desc   Push contact volume batch 8-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 145; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(145);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(144).reminderId).assertEqual(144);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0006
     * @tc.desc   Push contact volume batch 8-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 146; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(146);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(145).reminderId).assertEqual(145);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0007
     * @tc.desc   Push contact volume batch 8-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 147; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(147);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(146).reminderId).assertEqual(146);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0008
     * @tc.desc   Push contact volume batch 8-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 148; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(148);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(147).reminderId).assertEqual(147);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0009
     * @tc.desc   Push contact volume batch 8-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 149; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(149);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(148).reminderId).assertEqual(148);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0010
     * @tc.desc   Push contact volume batch 8-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 150; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(150);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(149).reminderId).assertEqual(149);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0011
     * @tc.desc   Push contact volume batch 8-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 151; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(151);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(150).reminderId).assertEqual(150);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0012
     * @tc.desc   Push contact volume batch 8-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 152; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(152);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(151).reminderId).assertEqual(151);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0013
     * @tc.desc   Push contact volume batch 8-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 153; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(153);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(152).reminderId).assertEqual(152);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0014
     * @tc.desc   Push contact volume batch 8-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 154; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(154);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(153).reminderId).assertEqual(153);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0015
     * @tc.desc   Push contact volume batch 8-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 155; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(155);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(154).reminderId).assertEqual(154);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0016
     * @tc.desc   Push contact volume batch 8-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 156; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(156);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(155).reminderId).assertEqual(155);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0017
     * @tc.desc   Push contact volume batch 8-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 157; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(157);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(156).reminderId).assertEqual(156);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0018
     * @tc.desc   Push contact volume batch 8-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 158; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(158);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(157).reminderId).assertEqual(157);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0019
     * @tc.desc   Push contact volume batch 8-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 159; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(159);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(158).reminderId).assertEqual(158);
      await Promise.resolve();
    })

    /**
     * @tc.name   testFlipClockVolume080020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_08_0020
     * @tc.desc   Push contact volume batch 8-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 160; index++) { source.pushData(new Contact('key' + index, 'value', index)); }
      expect(source.totalCount()).assertEqual(160);
      expect(source.getData(0).key).assertEqual('key0');
      expect(source.getData(159).reminderId).assertEqual(159);
      await Promise.resolve();
    })
  })
}
