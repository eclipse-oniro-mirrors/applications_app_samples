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

export default function flipClockContactAux04Test() {
  describe('FlipClockContactAux04Test', () => {

    /**
     * @tc.name   testFlipClockAux040001
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0001
     * @tc.desc   Contact auxiliary size 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 43; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(42);
      if (42 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040002
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0002
     * @tc.desc   Contact auxiliary size 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 44; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(43);
      if (43 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040003
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0003
     * @tc.desc   Contact auxiliary size 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 45; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(44);
      if (44 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040004
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0004
     * @tc.desc   Contact auxiliary size 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 46; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(45);
      if (45 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040005
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0005
     * @tc.desc   Contact auxiliary size 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 47; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(46);
      if (46 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040006
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0006
     * @tc.desc   Contact auxiliary size 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 48; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(47);
      if (47 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040007
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0007
     * @tc.desc   Contact auxiliary size 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 49; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(48);
      if (48 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040008
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0008
     * @tc.desc   Contact auxiliary size 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 50; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(49);
      if (49 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040009
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0009
     * @tc.desc   Contact auxiliary size 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 51; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(50);
      if (50 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040010
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0010
     * @tc.desc   Contact auxiliary size 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 52; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(51);
      if (51 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040011
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0011
     * @tc.desc   Contact auxiliary size 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 53; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(52);
      if (52 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040012
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0012
     * @tc.desc   Contact auxiliary size 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 54; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(53);
      if (53 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040013
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0013
     * @tc.desc   Contact auxiliary size 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 55; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(54);
      if (54 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux040014
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0014
     * @tc.desc   Contact auxiliary size 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 56; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(55);
      if (55 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
