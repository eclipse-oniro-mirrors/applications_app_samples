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
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';

export default function canvasGameFormBoundaryTest() {
  describe('CanvasGameFormBoundaryTest', () => {

    /**
     * @tc.name   testCanvasFormBoundary001
     * @tc.number SUB_CANVAS_FORM_BOUND_001
     * @tc.desc   Update form with whitespace id of length 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = ' '; expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1);
    })

    /**
     * @tc.name   testCanvasFormBoundary002
     * @tc.number SUB_CANVAS_FORM_BOUND_002
     * @tc.desc   Update form with whitespace id of length 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = '  '; expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2);
    })

    /**
     * @tc.name   testCanvasFormBoundary003
     * @tc.number SUB_CANVAS_FORM_BOUND_003
     * @tc.desc   Update form with whitespace id of length 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = '   '; expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(3);
    })

    /**
     * @tc.name   testCanvasFormBoundary004
     * @tc.number SUB_CANVAS_FORM_BOUND_004
     * @tc.desc   Dispatch long form event message 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const msg: string = 'x'.repeat(512); expect(a.onFormEvent('form-4', msg) === undefined).assertTrue(); expect(msg.length).assertEqual(512);
    })

    /**
     * @tc.name   testCanvasFormBoundary005
     * @tc.number SUB_CANVAS_FORM_BOUND_005
     * @tc.desc   Dispatch long form event message 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const msg: string = 'x'.repeat(640); expect(a.onFormEvent('form-5', msg) === undefined).assertTrue(); expect(msg.length).assertEqual(640);
    })

    /**
     * @tc.name   testCanvasFormBoundary006
     * @tc.number SUB_CANVAS_FORM_BOUND_006
     * @tc.desc   Dispatch long form event message 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const msg: string = 'x'.repeat(768); expect(a.onFormEvent('form-6', msg) === undefined).assertTrue(); expect(msg.length).assertEqual(768);
    })

    /**
     * @tc.name   testCanvasFormBoundary007
     * @tc.number SUB_CANVAS_FORM_BOUND_007
     * @tc.desc   Toggle form visibility repeatedly 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let n: number = 0; n < 1; n++) { expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasFormBoundary008
     * @tc.number SUB_CANVAS_FORM_BOUND_008
     * @tc.desc   Toggle form visibility repeatedly 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let n: number = 0; n < 2; n++) { expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasFormBoundary009
     * @tc.number SUB_CANVAS_FORM_BOUND_009
     * @tc.desc   Toggle form visibility repeatedly 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let n: number = 0; n < 3; n++) { expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasFormBoundary010
     * @tc.number SUB_CANVAS_FORM_BOUND_010
     * @tc.desc   Toggle form visibility repeatedly 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let n: number = 0; n < 4; n++) { expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue(); }
    })
  })
}
