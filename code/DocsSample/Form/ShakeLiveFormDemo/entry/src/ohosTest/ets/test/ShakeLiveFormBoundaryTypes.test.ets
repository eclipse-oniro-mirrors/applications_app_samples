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
import { Constants } from '../../../main/ets/common/Constants';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';

export default function shakeLiveFormBoundaryTypesTest() {
  describe('ShakeLiveFormBoundaryTypesTest', () => {

    /**
     * @tc.name   testShakeBoundary0001
     * @tc.number SUB_SHAKE_BOUNDARY_0001
     * @tc.desc   Boundary type case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'x'.repeat(512); expect(a.onRemoveForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(512);
    })

    /**
     * @tc.name   testShakeBoundary0002
     * @tc.number SUB_SHAKE_BOUNDARY_0002
     * @tc.desc   Boundary type case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'x'.repeat(1024); expect(a.onRemoveForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1024);
    })

    /**
     * @tc.name   testShakeBoundary0003
     * @tc.number SUB_SHAKE_BOUNDARY_0003
     * @tc.desc   Boundary type case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'x'.repeat(1536); expect(a.onRemoveForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1536);
    })

    /**
     * @tc.name   testShakeBoundary0004
     * @tc.number SUB_SHAKE_BOUNDARY_0004
     * @tc.desc   Boundary type case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'x'.repeat(2048); expect(a.onRemoveForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2048);
    })

    /**
     * @tc.name   testShakeBoundary0005
     * @tc.number SUB_SHAKE_BOUNDARY_0005
     * @tc.desc   Boundary type case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const width: number = 250; expect(-Constants.OVERFLOW_LEFT_RATIO * width).assertEqual(-25.0); expect(Constants.OVERFLOW_WIDTH_RATIO * width).assertEqual(300.0);
    })

    /**
     * @tc.name   testShakeBoundary0006
     * @tc.number SUB_SHAKE_BOUNDARY_0006
     * @tc.desc   Boundary type case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const width: number = 300;
      const left: number = -Constants.OVERFLOW_LEFT_RATIO * width;
      const scaled: number = Constants.OVERFLOW_WIDTH_RATIO * width;
      expect(Math.abs(left - (-30)) < 0.000001).assertTrue();
      expect(Math.abs(scaled - 360) < 0.000001).assertTrue();
    })

    /**
     * @tc.name   testShakeBoundary0007
     * @tc.number SUB_SHAKE_BOUNDARY_0007
     * @tc.desc   Boundary type case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const width: number = 350; expect(-Constants.OVERFLOW_LEFT_RATIO * width).assertEqual(-35.0); expect(Constants.OVERFLOW_WIDTH_RATIO * width).assertEqual(420.0);
    })

    /**
     * @tc.name   testShakeBoundary0008
     * @tc.number SUB_SHAKE_BOUNDARY_0008
     * @tc.desc   Boundary type case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBoundary0009
     * @tc.number SUB_SHAKE_BOUNDARY_0009
     * @tc.desc   Boundary type case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeBoundary0010
     * @tc.number SUB_SHAKE_BOUNDARY_0010
     * @tc.desc   Boundary type case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
    })
  })
}
