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

export default function flipClockContactAuditTest() {
  describe('FlipClockContactAuditTest', () => {

    /**
     * @tc.name   testFlipClockAudit0001
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0001
     * @tc.desc   Contact audit size 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(0);
      if (0 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0002
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0002
     * @tc.desc   Contact audit size 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(1);
      if (1 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0003
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0003
     * @tc.desc   Contact audit size 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(2);
      if (2 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0004
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0004
     * @tc.desc   Contact audit size 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(3);
      if (3 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0005
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0005
     * @tc.desc   Contact audit size 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(4);
      if (4 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0006
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0006
     * @tc.desc   Contact audit size 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(5);
      if (5 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0007
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0007
     * @tc.desc   Contact audit size 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(6);
      if (6 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0008
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0008
     * @tc.desc   Contact audit size 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(7);
      if (7 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0009
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0009
     * @tc.desc   Contact audit size 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 9; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(8);
      if (8 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0010
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0010
     * @tc.desc   Contact audit size 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 10; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(9);
      if (9 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0011
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0011
     * @tc.desc   Contact audit size 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 11; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(10);
      if (10 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0012
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0012
     * @tc.desc   Contact audit size 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 12; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(11);
      if (11 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0013
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0013
     * @tc.desc   Contact audit size 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 13; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(12);
      if (12 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0014
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0014
     * @tc.desc   Contact audit size 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 14; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(13);
      if (13 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0015
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0015
     * @tc.desc   Contact audit size 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 15; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(14);
      if (14 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAudit0016
     * @tc.number SUB_FLIP_CLOCK_AUDIT_0016
     * @tc.desc   Contact audit size 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAudit0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 16; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(15);
      if (15 > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
