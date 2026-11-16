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

export default function flipClockContactAux02Test() {
  describe('FlipClockContactAux02Test', () => {

    /**
     * @tc.name   testFlipClockAux020001
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0001
     * @tc.desc   Contact auxiliary size 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 15; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(14);
      if (14 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020002
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0002
     * @tc.desc   Contact auxiliary size 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 16; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(15);
      if (15 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020003
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0003
     * @tc.desc   Contact auxiliary size 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 17; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(16);
      if (16 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020004
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0004
     * @tc.desc   Contact auxiliary size 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 18; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(17);
      if (17 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020005
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0005
     * @tc.desc   Contact auxiliary size 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 19; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(18);
      if (18 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020006
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0006
     * @tc.desc   Contact auxiliary size 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 20; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(19);
      if (19 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020007
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0007
     * @tc.desc   Contact auxiliary size 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 21; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(20);
      if (20 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020008
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0008
     * @tc.desc   Contact auxiliary size 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 22; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(21);
      if (21 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020009
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0009
     * @tc.desc   Contact auxiliary size 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 23; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(22);
      if (22 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020010
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0010
     * @tc.desc   Contact auxiliary size 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 24; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(23);
      if (23 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020011
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0011
     * @tc.desc   Contact auxiliary size 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 25; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(24);
      if (24 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020012
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0012
     * @tc.desc   Contact auxiliary size 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 26; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(25);
      if (25 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020013
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0013
     * @tc.desc   Contact auxiliary size 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 27; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(26);
      if (26 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux020014
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0014
     * @tc.desc   Contact auxiliary size 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 28; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(27);
      if (27 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
