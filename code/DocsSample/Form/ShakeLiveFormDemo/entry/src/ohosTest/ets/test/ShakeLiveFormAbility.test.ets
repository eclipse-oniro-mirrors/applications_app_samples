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
import { formBindingData } from '@kit.FormKit';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function shakeLiveFormAbilityTest() {
  describe('ShakeLiveFormAbilityContractTest', () => {

    /**
     * @tc.name   testShakeFormAbility0001
     * @tc.number SUB_SHAKE_FORM_ABILITY_0001
     * @tc.desc   Verify d is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const d: formBindingData.FormBindingData = a.onAddForm({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(d !== undefined));
        expect(d !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof d === 'object'));
        expect(typeof d === 'object').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0001 end');
    })

    /**
     * @tc.name   testShakeFormAbility0004
     * @tc.number SUB_SHAKE_FORM_ABILITY_0004
     * @tc.desc   Verify a.onRemoveForm(\'form-4\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-4') === undefined));
        expect(a.onRemoveForm('form-4') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0004 end');
    })

    /**
     * @tc.name   testShakeFormAbility0005
     * @tc.number SUB_SHAKE_FORM_ABILITY_0005
     * @tc.desc   Verify a.onRemoveForm(\'form-5\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-5') === undefined));
        expect(a.onRemoveForm('form-5') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0005 end');
    })

    /**
     * @tc.name   testShakeFormAbility0006
     * @tc.number SUB_SHAKE_FORM_ABILITY_0006
     * @tc.desc   Verify a.onRemoveForm(\'form-6\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-6') === undefined));
        expect(a.onRemoveForm('form-6') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0006 end');
    })

    /**
     * @tc.name   testShakeFormAbility0007
     * @tc.number SUB_SHAKE_FORM_ABILITY_0007
     * @tc.desc   Verify a.onCastToNormalForm(\'form-7\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-7') === undefined));
        expect(a.onCastToNormalForm('form-7') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility({}) === undefined));
        expect(a.onChangeFormVisibility({}) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0007 end');
    })

    /**
     * @tc.name   testShakeFormAbility0008
     * @tc.number SUB_SHAKE_FORM_ABILITY_0008
     * @tc.desc   Verify a.onCastToNormalForm(\'form-8\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-8') === undefined));
        expect(a.onCastToNormalForm('form-8') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility({}) === undefined));
        expect(a.onChangeFormVisibility({}) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0008 end');
    })

    /**
     * @tc.name   testShakeFormAbility0009
     * @tc.number SUB_SHAKE_FORM_ABILITY_0009
     * @tc.desc   Verify a.onCastToNormalForm(\'form-9\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-9') === undefined));
        expect(a.onCastToNormalForm('form-9') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility({}) === undefined));
        expect(a.onChangeFormVisibility({}) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0009 end');
    })

    /**
     * @tc.name   testShakeFormAbility0010
     * @tc.number SUB_SHAKE_FORM_ABILITY_0010
     * @tc.desc   Verify a.onFormEvent(\'form-10\', \'{"message":"other"}\') is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-10', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-10', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0010 end');
    })

    /**
     * @tc.name   testShakeFormAbility0011
     * @tc.number SUB_SHAKE_FORM_ABILITY_0011
     * @tc.desc   Verify a.onFormEvent(\'form-11\', \'{"message":"other"}\') is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-11', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-11', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0011 end');
    })

    /**
     * @tc.name   testShakeFormAbility0012
     * @tc.number SUB_SHAKE_FORM_ABILITY_0012
     * @tc.desc   Verify a.onFormEvent(\'form-12\', \'{"message":"other"}\') is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-12', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-12', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeFormAbility0012 end');
    })
  })
}
