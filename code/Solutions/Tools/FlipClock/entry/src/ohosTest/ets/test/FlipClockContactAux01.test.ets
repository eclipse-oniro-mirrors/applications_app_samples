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

export default function flipClockContactAux01Test() {
  describe('FlipClockContactAux01Test', () => {

    /**
     * @tc.name   testFlipClockAux010001
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0001
     * @tc.desc   Contact auxiliary size 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(0);
      if (0 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010002
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0002
     * @tc.desc   Contact auxiliary size 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(1);
      if (1 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010003
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0003
     * @tc.desc   Contact auxiliary size 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(2);
      if (2 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010004
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0004
     * @tc.desc   Contact auxiliary size 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(3);
      if (3 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010005
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0005
     * @tc.desc   Contact auxiliary size 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(4);
      if (4 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010006
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0006
     * @tc.desc   Contact auxiliary size 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(5);
      if (5 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010007
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0007
     * @tc.desc   Contact auxiliary size 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(6);
      if (6 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010008
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0008
     * @tc.desc   Contact auxiliary size 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(7);
      if (7 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010009
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0009
     * @tc.desc   Contact auxiliary size 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 9; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(8);
      if (8 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010010
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0010
     * @tc.desc   Contact auxiliary size 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 10; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(9);
      if (9 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010011
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0011
     * @tc.desc   Contact auxiliary size 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 11; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(10);
      if (10 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010012
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0012
     * @tc.desc   Contact auxiliary size 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 12; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(11);
      if (11 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010013
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0013
     * @tc.desc   Contact auxiliary size 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 13; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(12);
      if (12 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux010014
     * @tc.number SUB_FLIP_CLOCK_AUX_01_0014
     * @tc.desc   Contact auxiliary size 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 14; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(13);
      if (13 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
