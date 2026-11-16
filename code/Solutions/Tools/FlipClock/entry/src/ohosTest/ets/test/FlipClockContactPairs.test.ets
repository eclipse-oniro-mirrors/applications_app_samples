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

export default function flipClockContactPairsTest() {
  describe('FlipClockContactPairsTest', () => {

    /**
     * @tc.name   testFlipClockContactPairs0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0000
     * @tc.desc   Push paired contacts 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(2); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(100);
    })

    /**
     * @tc.name   testFlipClockContactPairs0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0001
     * @tc.desc   Push paired contacts 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(4); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(101);
    })

    /**
     * @tc.name   testFlipClockContactPairs0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0002
     * @tc.desc   Push paired contacts 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(6); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(102);
    })

    /**
     * @tc.name   testFlipClockContactPairs0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0003
     * @tc.desc   Push paired contacts 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(8); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(103);
    })

    /**
     * @tc.name   testFlipClockContactPairs0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0004
     * @tc.desc   Push paired contacts 5 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(10); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(104);
    })

    /**
     * @tc.name   testFlipClockContactPairs0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0005
     * @tc.desc   Push paired contacts 6 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(12); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(105);
    })

    /**
     * @tc.name   testFlipClockContactPairs0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0006
     * @tc.desc   Push paired contacts 7 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(14); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(106);
    })

    /**
     * @tc.name   testFlipClockContactPairs0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_CPAIR_0007
     * @tc.desc   Push paired contacts 8 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPairs0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(new Contact('k' + index, 'v', index)); source.pushData(new Contact('k' + index + 'b', 'v', index + 100)); }
      expect(source.totalCount()).assertEqual(16); expect(source.getData(0).key).assertEqual('k0'); expect(source.getData(source.totalCount() - 1).reminderId).assertEqual(107);
    })
  })
}
