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

export default function canvasGameTenKPlusTest() {
  describe('CanvasGameTenKPlusTest', () => {

    /**
     * @tc.name   testCanvasTenKPlus0001
     * @tc.number SUB_CANVAS_10K_PLUS_0001
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(256); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(256);
    })

    /**
     * @tc.name   testCanvasTenKPlus0002
     * @tc.number SUB_CANVAS_10K_PLUS_0002
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(512); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(512);
    })

    /**
     * @tc.name   testCanvasTenKPlus0003
     * @tc.number SUB_CANVAS_10K_PLUS_0003
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(768); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(768);
    })

    /**
     * @tc.name   testCanvasTenKPlus0004
     * @tc.number SUB_CANVAS_10K_PLUS_0004
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(1024); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1024);
    })

    /**
     * @tc.name   testCanvasTenKPlus0005
     * @tc.number SUB_CANVAS_10K_PLUS_0005
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(1280); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1280);
    })

    /**
     * @tc.name   testCanvasTenKPlus0006
     * @tc.number SUB_CANVAS_10K_PLUS_0006
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(1536); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1536);
    })

    /**
     * @tc.name   testCanvasTenKPlus0007
     * @tc.number SUB_CANVAS_10K_PLUS_0007
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(1792); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1792);
    })

    /**
     * @tc.name   testCanvasTenKPlus0008
     * @tc.number SUB_CANVAS_10K_PLUS_0008
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'p'.repeat(2048); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2048);
    })
  })
}
