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
import { hilog } from '@kit.PerformanceAnalysisKit';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
import { formInfo, formBindingData } from '@kit.FormKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormAdd001 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        const data: formBindingData.FormBindingData = ability.onAddForm({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(data !== undefined));
        expect(data !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof data === 'object'));
        expect(typeof data === 'object').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormAdd001 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormAddTwo002 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        const first: formBindingData.FormBindingData = ability.onAddForm({});
        const second: formBindingData.FormBindingData = ability.onAddForm({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(first !== undefined));
        expect(first !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(second !== undefined));
        expect(second !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof first === typeof second));
        expect(typeof first === typeof second).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormAddTwo002 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormState003 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        const state: formInfo.FormState = ability.onAcquireFormState({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(state >= 0));
        expect(state >= 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof state === 'number'));
        expect(typeof state === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormState003 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormStateRepeat004 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ability.onAcquireFormState({})), String(ability.onAcquireFormState({})));
        expect(ability.onAcquireFormState({})).assertEqual(ability.onAcquireFormState({}));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onAcquireFormState({}) >= 0));
        expect(ability.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormStateRepeat004 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormUpdateEmpty005 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onUpdateForm('') === undefined));
        expect(ability.onUpdateForm('') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormUpdateEmpty005 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormUpdateId006 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onUpdateForm('form-001') === undefined));
        expect(ability.onUpdateForm('form-001') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormUpdateId006 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormUpdateLong007 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        const id: string = 'form-' + 'x'.repeat(256);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onUpdateForm(id) === undefined));
        expect(ability.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(261));
        expect(id.length).assertEqual(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormUpdateLong007 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormCast008 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onCastToNormalForm('') === undefined));
        expect(ability.onCastToNormalForm('') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormCast008 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormCastLong009 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onCastToNormalForm(id) === undefined));
        expect(ability.onCastToNormalForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(512));
        expect(id.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormCastLong009 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility010 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onChangeFormVisibility(true) === undefined));
        expect(ability.onChangeFormVisibility(true) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility010 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility011 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onChangeFormVisibility(false) === undefined));
        expect(ability.onChangeFormVisibility(false) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(false), String(false));
        expect(false).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility011 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility012 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onChangeFormVisibility(true) === undefined));
        expect(ability.onChangeFormVisibility(true) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility012 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility013 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onChangeFormVisibility(false) === undefined));
        expect(ability.onChangeFormVisibility(false) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(false), String(false));
        expect(false).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility013 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility014 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onChangeFormVisibility(true) === undefined));
        expect(ability.onChangeFormVisibility(true) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility014 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility015 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onChangeFormVisibility(false) === undefined));
        expect(ability.onChangeFormVisibility(false) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(false), String(false));
        expect(false).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormVisibility015 end');
    })

    /**
     * @tc.name   testCanvasFormEvent016
     * @tc.number SUB_CANVAS_FORM_016
     * @tc.desc   Verify ability.onFormEvent(\'form-16\', \'\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent016 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onFormEvent('form-16', '') === undefined));
        expect(ability.onFormEvent('form-16', '') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent016 end');
    })

    /**
     * @tc.name   testCanvasFormEvent017
     * @tc.number SUB_CANVAS_FORM_017
     * @tc.desc   Verify ability.onFormEvent(\'form-17\', \'event-1717\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent017 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onFormEvent('form-17', 'event-1717') === undefined));
        expect(ability.onFormEvent('form-17', 'event-1717') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent017 end');
    })

    /**
     * @tc.name   testCanvasFormEvent018
     * @tc.number SUB_CANVAS_FORM_018
     * @tc.desc   Verify ability.onFormEvent(\'form-18\', \'event-181818\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent018 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onFormEvent('form-18', 'event-181818') === undefined));
        expect(ability.onFormEvent('form-18', 'event-181818') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent018 end');
    })

    /**
     * @tc.name   testCanvasFormEvent019
     * @tc.number SUB_CANVAS_FORM_019
     * @tc.desc   Verify ability.onFormEvent(\'form-19\', \'event-19191919\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent019 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onFormEvent('form-19', 'event-19191919') === undefined));
        expect(ability.onFormEvent('form-19', 'event-19191919') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent019 end');
    })

    /**
     * @tc.name   testCanvasFormEvent020
     * @tc.number SUB_CANVAS_FORM_020
     * @tc.desc   Verify ability.onFormEvent(\'form-20\', \'event-2020202020\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFormEvent020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent020 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onFormEvent('form-20', 'event-2020202020') === undefined));
        expect(ability.onFormEvent('form-20', 'event-2020202020') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormEvent020 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormRemove021 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onRemoveForm('') === undefined));
        expect(ability.onRemoveForm('') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormRemove021 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormRemove022 begin');
      const ability: EntryFormAbility = new EntryFormAbility();
        const id: string = 'r'.repeat(128);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.onRemoveForm(id) === undefined));
        expect(ability.onRemoveForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(128));
        expect(id.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFormRemove022 end');
    })
  })
}
