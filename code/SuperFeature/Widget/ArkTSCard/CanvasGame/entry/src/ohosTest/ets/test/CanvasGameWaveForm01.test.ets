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

export default function canvasGameWaveForm01Test() {
  describe('CanvasGameWaveForm01Test', () => {

    /**
     * @tc.name   testCanvasWaveForm010001
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0001
     * @tc.desc   Wave form case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(4); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(4);
    })

    /**
     * @tc.name   testCanvasWaveForm010002
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0002
     * @tc.desc   Wave form case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(16); expect(a.onFormEvent('f-2', m) === undefined).assertTrue(); expect(m.length).assertEqual(16);
    })

    /**
     * @tc.name   testCanvasWaveForm010003
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0003
     * @tc.desc   Wave form case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(12); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(12);
    })

    /**
     * @tc.name   testCanvasWaveForm010004
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0004
     * @tc.desc   Wave form case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(32); expect(a.onFormEvent('f-4', m) === undefined).assertTrue(); expect(m.length).assertEqual(32);
    })

    /**
     * @tc.name   testCanvasWaveForm010005
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0005
     * @tc.desc   Wave form case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(20); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(20);
    })

    /**
     * @tc.name   testCanvasWaveForm010006
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0006
     * @tc.desc   Wave form case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(48); expect(a.onFormEvent('f-6', m) === undefined).assertTrue(); expect(m.length).assertEqual(48);
    })

    /**
     * @tc.name   testCanvasWaveForm010007
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0007
     * @tc.desc   Wave form case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(28); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(28);
    })

    /**
     * @tc.name   testCanvasWaveForm010008
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0008
     * @tc.desc   Wave form case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(64); expect(a.onFormEvent('f-8', m) === undefined).assertTrue(); expect(m.length).assertEqual(64);
    })

    /**
     * @tc.name   testCanvasWaveForm010009
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0009
     * @tc.desc   Wave form case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(36); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(36);
    })

    /**
     * @tc.name   testCanvasWaveForm010010
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0010
     * @tc.desc   Wave form case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(80); expect(a.onFormEvent('f-10', m) === undefined).assertTrue(); expect(m.length).assertEqual(80);
    })

    /**
     * @tc.name   testCanvasWaveForm010011
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0011
     * @tc.desc   Wave form case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(44); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(44);
    })

    /**
     * @tc.name   testCanvasWaveForm010012
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0012
     * @tc.desc   Wave form case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(96); expect(a.onFormEvent('f-12', m) === undefined).assertTrue(); expect(m.length).assertEqual(96);
    })

    /**
     * @tc.name   testCanvasWaveForm010013
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0013
     * @tc.desc   Wave form case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(52); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(52);
    })

    /**
     * @tc.name   testCanvasWaveForm010014
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0014
     * @tc.desc   Wave form case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(112); expect(a.onFormEvent('f-14', m) === undefined).assertTrue(); expect(m.length).assertEqual(112);
    })

    /**
     * @tc.name   testCanvasWaveForm010015
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0015
     * @tc.desc   Wave form case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(60); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(60);
    })

    /**
     * @tc.name   testCanvasWaveForm010016
     * @tc.number SUB_CANVAS_WAVE_FORM_01_0016
     * @tc.desc   Wave form case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(128); expect(a.onFormEvent('f-16', m) === undefined).assertTrue(); expect(m.length).assertEqual(128);
    })
  })
}
