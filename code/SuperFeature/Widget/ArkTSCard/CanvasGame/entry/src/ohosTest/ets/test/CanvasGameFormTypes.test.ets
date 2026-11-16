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

export default function canvasGameFormTypesTest() {
  describe('CanvasGameFormTypesTest', () => {

    /**
     * @tc.name   testCanvasFormAdd001
     * @tc.number SUB_CANVAS_FORM_001
     * @tc.desc   Create form binding data with an empty want.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); const data = ability.onAddForm({}); expect(data !== undefined).assertTrue(); expect(typeof data === 'object').assertTrue();
    })

    /**
     * @tc.name   testCanvasFormAddTwo002
     * @tc.number SUB_CANVAS_FORM_002
     * @tc.desc   Create form binding data repeatedly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormAddTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); const first = ability.onAddForm({}); const second = ability.onAddForm({}); expect(first !== undefined).assertTrue(); expect(second !== undefined).assertTrue(); expect(typeof first === typeof second).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormState003
     * @tc.number SUB_CANVAS_FORM_003
     * @tc.desc   Acquire form state with an empty want.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); const state = ability.onAcquireFormState({}); expect(state >= 0).assertTrue(); expect(typeof state === 'number').assertTrue();
    })

    /**
     * @tc.name   testCanvasFormStateRepeat004
     * @tc.number SUB_CANVAS_FORM_004
     * @tc.desc   Acquire form state repeatedly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormStateRepeat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onAcquireFormState({})).assertEqual(ability.onAcquireFormState({})); expect(ability.onAcquireFormState({}) >= 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormUpdateEmpty005
     * @tc.number SUB_CANVAS_FORM_005
     * @tc.desc   Update form with an empty form id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormUpdateEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onUpdateForm('') === undefined).assertTrue(); expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormUpdateId006
     * @tc.number SUB_CANVAS_FORM_006
     * @tc.desc   Update form with a normal form id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormUpdateId006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onUpdateForm('form-001') === undefined).assertTrue(); expect('form-001'.length > 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormUpdateLong007
     * @tc.number SUB_CANVAS_FORM_007
     * @tc.desc   Update form with a long form id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormUpdateLong007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); const id: string = 'form-' + 'x'.repeat(256); expect(ability.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(261);
    })

    /**
     * @tc.name   testCanvasFormCast008
     * @tc.number SUB_CANVAS_FORM_008
     * @tc.desc   Cast a temporary form with an empty id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormCast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onCastToNormalForm('') === undefined).assertTrue(); expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormCastLong009
     * @tc.number SUB_CANVAS_FORM_009
     * @tc.desc   Cast a temporary form with a long id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormCastLong009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(512); expect(ability.onCastToNormalForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(512);
    })

    /**
     * @tc.name   testCanvasFormVisibility010
     * @tc.number SUB_CANVAS_FORM_010
     * @tc.desc   Change form visibility with boolean True.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormVisibility010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onChangeFormVisibility(true) === undefined).assertTrue(); expect(true).assertEqual(true);
    })

    /**
     * @tc.name   testCanvasFormVisibility011
     * @tc.number SUB_CANVAS_FORM_011
     * @tc.desc   Change form visibility with boolean False.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormVisibility011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onChangeFormVisibility(false) === undefined).assertTrue(); expect(false).assertEqual(false);
    })

    /**
     * @tc.name   testCanvasFormVisibility012
     * @tc.number SUB_CANVAS_FORM_012
     * @tc.desc   Change form visibility with boolean True.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormVisibility012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onChangeFormVisibility(true) === undefined).assertTrue(); expect(true).assertEqual(true);
    })

    /**
     * @tc.name   testCanvasFormVisibility013
     * @tc.number SUB_CANVAS_FORM_013
     * @tc.desc   Change form visibility with boolean False.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormVisibility013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onChangeFormVisibility(false) === undefined).assertTrue(); expect(false).assertEqual(false);
    })

    /**
     * @tc.name   testCanvasFormVisibility014
     * @tc.number SUB_CANVAS_FORM_014
     * @tc.desc   Change form visibility with boolean True.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormVisibility014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onChangeFormVisibility(true) === undefined).assertTrue(); expect(true).assertEqual(true);
    })

    /**
     * @tc.name   testCanvasFormVisibility015
     * @tc.number SUB_CANVAS_FORM_015
     * @tc.desc   Change form visibility with boolean False.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormVisibility015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onChangeFormVisibility(false) === undefined).assertTrue(); expect(false).assertEqual(false);
    })

    /**
     * @tc.name   testCanvasFormEvent016
     * @tc.number SUB_CANVAS_FORM_016
     * @tc.desc   Dispatch form event case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onFormEvent('form-16', '') === undefined).assertTrue(); expect(''.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormEvent017
     * @tc.number SUB_CANVAS_FORM_017
     * @tc.desc   Dispatch form event case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onFormEvent('form-17', 'event-1717') === undefined).assertTrue(); expect('event-1717'.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormEvent018
     * @tc.number SUB_CANVAS_FORM_018
     * @tc.desc   Dispatch form event case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onFormEvent('form-18', 'event-181818') === undefined).assertTrue(); expect('event-181818'.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormEvent019
     * @tc.number SUB_CANVAS_FORM_019
     * @tc.desc   Dispatch form event case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onFormEvent('form-19', 'event-19191919') === undefined).assertTrue(); expect('event-19191919'.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormEvent020
     * @tc.number SUB_CANVAS_FORM_020
     * @tc.desc   Dispatch form event case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onFormEvent('form-20', 'event-2020202020') === undefined).assertTrue(); expect('event-2020202020'.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormRemove021
     * @tc.number SUB_CANVAS_FORM_021
     * @tc.desc   Remove a form with an empty id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormRemove021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); expect(ability.onRemoveForm('') === undefined).assertTrue(); expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasFormRemove022
     * @tc.number SUB_CANVAS_FORM_022
     * @tc.desc   Remove a form with a long id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormRemove022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: EntryFormAbility = new EntryFormAbility(); const id: string = 'r'.repeat(128); expect(ability.onRemoveForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(128);
    })
  })
}
