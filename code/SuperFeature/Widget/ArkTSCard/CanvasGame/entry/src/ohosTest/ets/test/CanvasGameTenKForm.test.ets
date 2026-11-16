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

export default function canvasGameTenKFormTest() {
  describe('CanvasGameTenKFormTest', () => {

    /**
     * @tc.name   testCanvasTenKForm0001
     * @tc.number SUB_CANVAS_10K_FORM_0001
     * @tc.desc   Ten-K form case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(128); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(128);
    })

    /**
     * @tc.name   testCanvasTenKForm0002
     * @tc.number SUB_CANVAS_10K_FORM_0002
     * @tc.desc   Ten-K form case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(256); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(256);
    })

    /**
     * @tc.name   testCanvasTenKForm0003
     * @tc.number SUB_CANVAS_10K_FORM_0003
     * @tc.desc   Ten-K form case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(384); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(384);
    })

    /**
     * @tc.name   testCanvasTenKForm0004
     * @tc.number SUB_CANVAS_10K_FORM_0004
     * @tc.desc   Ten-K form case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(512); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(512);
    })

    /**
     * @tc.name   testCanvasTenKForm0005
     * @tc.number SUB_CANVAS_10K_FORM_0005
     * @tc.desc   Ten-K form case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(640); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(640);
    })

    /**
     * @tc.name   testCanvasTenKForm0006
     * @tc.number SUB_CANVAS_10K_FORM_0006
     * @tc.desc   Ten-K form case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(768); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(768);
    })

    /**
     * @tc.name   testCanvasTenKForm0007
     * @tc.number SUB_CANVAS_10K_FORM_0007
     * @tc.desc   Ten-K form case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(896); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(896);
    })

    /**
     * @tc.name   testCanvasTenKForm0008
     * @tc.number SUB_CANVAS_10K_FORM_0008
     * @tc.desc   Ten-K form case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1024); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1024);
    })

    /**
     * @tc.name   testCanvasTenKForm0009
     * @tc.number SUB_CANVAS_10K_FORM_0009
     * @tc.desc   Ten-K form case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1152); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1152);
    })

    /**
     * @tc.name   testCanvasTenKForm0010
     * @tc.number SUB_CANVAS_10K_FORM_0010
     * @tc.desc   Ten-K form case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1280); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1280);
    })

    /**
     * @tc.name   testCanvasTenKForm0011
     * @tc.number SUB_CANVAS_10K_FORM_0011
     * @tc.desc   Ten-K form case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1408); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1408);
    })

    /**
     * @tc.name   testCanvasTenKForm0012
     * @tc.number SUB_CANVAS_10K_FORM_0012
     * @tc.desc   Ten-K form case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1536); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1536);
    })

    /**
     * @tc.name   testCanvasTenKForm0013
     * @tc.number SUB_CANVAS_10K_FORM_0013
     * @tc.desc   Ten-K form case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1664); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1664);
    })

    /**
     * @tc.name   testCanvasTenKForm0014
     * @tc.number SUB_CANVAS_10K_FORM_0014
     * @tc.desc   Ten-K form case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1792); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1792);
    })

    /**
     * @tc.name   testCanvasTenKForm0015
     * @tc.number SUB_CANVAS_10K_FORM_0015
     * @tc.desc   Ten-K form case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(1920); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1920);
    })

    /**
     * @tc.name   testCanvasTenKForm0016
     * @tc.number SUB_CANVAS_10K_FORM_0016
     * @tc.desc   Ten-K form case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'k'.repeat(2048); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2048);
    })
  })
}
