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

export default function flipClockContactPushEdgeTest() {
  describe('FlipClockContactPushEdgeTest', () => {

    /**
     * @tc.name   testFlipClockContactPushEdge0000
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0000
     * @tc.desc   Push 1 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(1); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(0).reminderId).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockContactPushEdge0001
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0001
     * @tc.desc   Push 2 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(2); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(1).reminderId).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockContactPushEdge0002
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0002
     * @tc.desc   Push 3 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(3); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(2).reminderId).assertEqual(2);
    })

    /**
     * @tc.name   testFlipClockContactPushEdge0003
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0003
     * @tc.desc   Push 4 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(4); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(3).reminderId).assertEqual(3);
    })

    /**
     * @tc.name   testFlipClockContactPushEdge0004
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0004
     * @tc.desc   Push 5 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(5); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(4).reminderId).assertEqual(4);
    })

    /**
     * @tc.name   testFlipClockContactPushEdge0005
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0005
     * @tc.desc   Push 6 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(6); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(5).reminderId).assertEqual(5);
    })

    /**
     * @tc.name   testFlipClockContactPushEdge0006
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0006
     * @tc.desc   Push 7 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(7); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(6).reminderId).assertEqual(6);
    })

    /**
     * @tc.name   testFlipClockContactPushEdge0007
     * @tc.number SUB_FLIP_CLOCK_EDGE_CPUSH_0007
     * @tc.desc   Push 8 contacts and verify fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactPushEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(new Contact('key' + index, 'value' + index, index)); }
      expect(source.totalCount()).assertEqual(8); expect(source.getData(0).key).assertEqual('key0'); expect(source.getData(7).reminderId).assertEqual(7);
    })
  })
}
