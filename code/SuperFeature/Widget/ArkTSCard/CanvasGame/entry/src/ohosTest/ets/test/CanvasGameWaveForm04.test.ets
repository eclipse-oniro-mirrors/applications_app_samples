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

export default function canvasGameWaveForm04Test() {
  describe('CanvasGameWaveForm04Test', () => {

    /**
     * @tc.name   testCanvasWaveForm040001
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0001
     * @tc.desc   Wave form case 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(196); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(196);
    })

    /**
     * @tc.name   testCanvasWaveForm040002
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0002
     * @tc.desc   Wave form case 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(400); expect(a.onFormEvent('f-50', m) === undefined).assertTrue(); expect(m.length).assertEqual(400);
    })

    /**
     * @tc.name   testCanvasWaveForm040003
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0003
     * @tc.desc   Wave form case 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(204); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(204);
    })

    /**
     * @tc.name   testCanvasWaveForm040004
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0004
     * @tc.desc   Wave form case 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(416); expect(a.onFormEvent('f-52', m) === undefined).assertTrue(); expect(m.length).assertEqual(416);
    })

    /**
     * @tc.name   testCanvasWaveForm040005
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0005
     * @tc.desc   Wave form case 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(212); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(212);
    })

    /**
     * @tc.name   testCanvasWaveForm040006
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0006
     * @tc.desc   Wave form case 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(432); expect(a.onFormEvent('f-54', m) === undefined).assertTrue(); expect(m.length).assertEqual(432);
    })

    /**
     * @tc.name   testCanvasWaveForm040007
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0007
     * @tc.desc   Wave form case 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(220); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(220);
    })

    /**
     * @tc.name   testCanvasWaveForm040008
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0008
     * @tc.desc   Wave form case 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(448); expect(a.onFormEvent('f-56', m) === undefined).assertTrue(); expect(m.length).assertEqual(448);
    })

    /**
     * @tc.name   testCanvasWaveForm040009
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0009
     * @tc.desc   Wave form case 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(228); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(228);
    })

    /**
     * @tc.name   testCanvasWaveForm040010
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0010
     * @tc.desc   Wave form case 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(464); expect(a.onFormEvent('f-58', m) === undefined).assertTrue(); expect(m.length).assertEqual(464);
    })

    /**
     * @tc.name   testCanvasWaveForm040011
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0011
     * @tc.desc   Wave form case 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(236); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(236);
    })

    /**
     * @tc.name   testCanvasWaveForm040012
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0012
     * @tc.desc   Wave form case 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(480); expect(a.onFormEvent('f-60', m) === undefined).assertTrue(); expect(m.length).assertEqual(480);
    })

    /**
     * @tc.name   testCanvasWaveForm040013
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0013
     * @tc.desc   Wave form case 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(244); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(244);
    })

    /**
     * @tc.name   testCanvasWaveForm040014
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0014
     * @tc.desc   Wave form case 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(496); expect(a.onFormEvent('f-62', m) === undefined).assertTrue(); expect(m.length).assertEqual(496);
    })

    /**
     * @tc.name   testCanvasWaveForm040015
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0015
     * @tc.desc   Wave form case 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(252); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(252);
    })

    /**
     * @tc.name   testCanvasWaveForm040016
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0016
     * @tc.desc   Wave form case 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(512); expect(a.onFormEvent('f-64', m) === undefined).assertTrue(); expect(m.length).assertEqual(512);
    })
  })
}
