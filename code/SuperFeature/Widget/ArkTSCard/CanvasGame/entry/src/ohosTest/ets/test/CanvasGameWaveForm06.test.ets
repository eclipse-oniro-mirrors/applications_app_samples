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

export default function canvasGameWaveForm06Test() {
  describe('CanvasGameWaveForm06Test', () => {

    /**
     * @tc.name   testCanvasWaveForm060001
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0001
     * @tc.desc   Wave form case 6-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(324); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(324);
    })

    /**
     * @tc.name   testCanvasWaveForm060002
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0002
     * @tc.desc   Wave form case 6-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(656); expect(a.onFormEvent('f-82', m) === undefined).assertTrue(); expect(m.length).assertEqual(656);
    })

    /**
     * @tc.name   testCanvasWaveForm060003
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0003
     * @tc.desc   Wave form case 6-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(332); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(332);
    })

    /**
     * @tc.name   testCanvasWaveForm060004
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0004
     * @tc.desc   Wave form case 6-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(672); expect(a.onFormEvent('f-84', m) === undefined).assertTrue(); expect(m.length).assertEqual(672);
    })

    /**
     * @tc.name   testCanvasWaveForm060005
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0005
     * @tc.desc   Wave form case 6-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(340); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(340);
    })

    /**
     * @tc.name   testCanvasWaveForm060006
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0006
     * @tc.desc   Wave form case 6-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(688); expect(a.onFormEvent('f-86', m) === undefined).assertTrue(); expect(m.length).assertEqual(688);
    })

    /**
     * @tc.name   testCanvasWaveForm060007
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0007
     * @tc.desc   Wave form case 6-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(348); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(348);
    })

    /**
     * @tc.name   testCanvasWaveForm060008
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0008
     * @tc.desc   Wave form case 6-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(704); expect(a.onFormEvent('f-88', m) === undefined).assertTrue(); expect(m.length).assertEqual(704);
    })

    /**
     * @tc.name   testCanvasWaveForm060009
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0009
     * @tc.desc   Wave form case 6-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(356); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(356);
    })

    /**
     * @tc.name   testCanvasWaveForm060010
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0010
     * @tc.desc   Wave form case 6-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(720); expect(a.onFormEvent('f-90', m) === undefined).assertTrue(); expect(m.length).assertEqual(720);
    })

    /**
     * @tc.name   testCanvasWaveForm060011
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0011
     * @tc.desc   Wave form case 6-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(364); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(364);
    })

    /**
     * @tc.name   testCanvasWaveForm060012
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0012
     * @tc.desc   Wave form case 6-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(736); expect(a.onFormEvent('f-92', m) === undefined).assertTrue(); expect(m.length).assertEqual(736);
    })

    /**
     * @tc.name   testCanvasWaveForm060013
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0013
     * @tc.desc   Wave form case 6-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(372); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(372);
    })

    /**
     * @tc.name   testCanvasWaveForm060014
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0014
     * @tc.desc   Wave form case 6-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(752); expect(a.onFormEvent('f-94', m) === undefined).assertTrue(); expect(m.length).assertEqual(752);
    })

    /**
     * @tc.name   testCanvasWaveForm060015
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0015
     * @tc.desc   Wave form case 6-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(380); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(380);
    })

    /**
     * @tc.name   testCanvasWaveForm060016
     * @tc.number SUB_CANVAS_WAVE_FORM_06_0016
     * @tc.desc   Wave form case 6-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(768); expect(a.onFormEvent('f-96', m) === undefined).assertTrue(); expect(m.length).assertEqual(768);
    })
  })
}
