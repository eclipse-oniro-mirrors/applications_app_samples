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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function shakeLiveFormMoreForm05Test() {
  describe('ShakeLiveFormMoreForm05Test', () => {

    /**
     * @tc.name   testShakeMoreForm050001
     * @tc.number SUB_SHAKE_MORE_FORM_05_0001
     * @tc.desc   Verify a.onRemoveForm(\'r-65\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-65') === undefined));
        expect(a.onRemoveForm('r-65') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-65') === undefined));
        expect(a.onCastToNormalForm('c-65') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-65', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-65', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050001 end');
    })

    /**
     * @tc.name   testShakeMoreForm050002
     * @tc.number SUB_SHAKE_MORE_FORM_05_0002
     * @tc.desc   Verify a.onRemoveForm(\'r-66\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-66') === undefined));
        expect(a.onRemoveForm('r-66') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-66') === undefined));
        expect(a.onCastToNormalForm('c-66') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-66', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-66', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050002 end');
    })

    /**
     * @tc.name   testShakeMoreForm050003
     * @tc.number SUB_SHAKE_MORE_FORM_05_0003
     * @tc.desc   Verify a.onRemoveForm(\'r-67\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-67') === undefined));
        expect(a.onRemoveForm('r-67') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-67') === undefined));
        expect(a.onCastToNormalForm('c-67') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-67', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-67', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050003 end');
    })

    /**
     * @tc.name   testShakeMoreForm050004
     * @tc.number SUB_SHAKE_MORE_FORM_05_0004
     * @tc.desc   Verify a.onRemoveForm(\'r-68\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-68') === undefined));
        expect(a.onRemoveForm('r-68') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-68') === undefined));
        expect(a.onCastToNormalForm('c-68') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-68', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-68', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050004 end');
    })

    /**
     * @tc.name   testShakeMoreForm050005
     * @tc.number SUB_SHAKE_MORE_FORM_05_0005
     * @tc.desc   Verify a.onRemoveForm(\'r-69\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-69') === undefined));
        expect(a.onRemoveForm('r-69') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-69') === undefined));
        expect(a.onCastToNormalForm('c-69') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-69', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-69', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050005 end');
    })

    /**
     * @tc.name   testShakeMoreForm050006
     * @tc.number SUB_SHAKE_MORE_FORM_05_0006
     * @tc.desc   Verify a.onRemoveForm(\'r-70\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-70') === undefined));
        expect(a.onRemoveForm('r-70') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-70') === undefined));
        expect(a.onCastToNormalForm('c-70') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-70', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-70', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050006 end');
    })

    /**
     * @tc.name   testShakeMoreForm050007
     * @tc.number SUB_SHAKE_MORE_FORM_05_0007
     * @tc.desc   Verify a.onRemoveForm(\'r-71\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-71') === undefined));
        expect(a.onRemoveForm('r-71') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-71') === undefined));
        expect(a.onCastToNormalForm('c-71') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-71', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-71', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050007 end');
    })

    /**
     * @tc.name   testShakeMoreForm050008
     * @tc.number SUB_SHAKE_MORE_FORM_05_0008
     * @tc.desc   Verify a.onRemoveForm(\'r-72\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-72') === undefined));
        expect(a.onRemoveForm('r-72') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-72') === undefined));
        expect(a.onCastToNormalForm('c-72') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-72', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-72', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050008 end');
    })

    /**
     * @tc.name   testShakeMoreForm050009
     * @tc.number SUB_SHAKE_MORE_FORM_05_0009
     * @tc.desc   Verify a.onRemoveForm(\'r-73\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-73') === undefined));
        expect(a.onRemoveForm('r-73') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-73') === undefined));
        expect(a.onCastToNormalForm('c-73') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-73', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-73', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050009 end');
    })

    /**
     * @tc.name   testShakeMoreForm050010
     * @tc.number SUB_SHAKE_MORE_FORM_05_0010
     * @tc.desc   Verify a.onRemoveForm(\'r-74\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-74') === undefined));
        expect(a.onRemoveForm('r-74') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-74') === undefined));
        expect(a.onCastToNormalForm('c-74') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-74', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-74', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050010 end');
    })

    /**
     * @tc.name   testShakeMoreForm050011
     * @tc.number SUB_SHAKE_MORE_FORM_05_0011
     * @tc.desc   Verify a.onRemoveForm(\'r-75\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-75') === undefined));
        expect(a.onRemoveForm('r-75') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-75') === undefined));
        expect(a.onCastToNormalForm('c-75') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-75', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-75', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050011 end');
    })

    /**
     * @tc.name   testShakeMoreForm050012
     * @tc.number SUB_SHAKE_MORE_FORM_05_0012
     * @tc.desc   Verify a.onRemoveForm(\'r-76\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-76') === undefined));
        expect(a.onRemoveForm('r-76') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-76') === undefined));
        expect(a.onCastToNormalForm('c-76') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-76', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-76', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050012 end');
    })

    /**
     * @tc.name   testShakeMoreForm050013
     * @tc.number SUB_SHAKE_MORE_FORM_05_0013
     * @tc.desc   Verify a.onRemoveForm(\'r-77\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-77') === undefined));
        expect(a.onRemoveForm('r-77') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-77') === undefined));
        expect(a.onCastToNormalForm('c-77') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-77', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-77', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050013 end');
    })

    /**
     * @tc.name   testShakeMoreForm050014
     * @tc.number SUB_SHAKE_MORE_FORM_05_0014
     * @tc.desc   Verify a.onRemoveForm(\'r-78\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-78') === undefined));
        expect(a.onRemoveForm('r-78') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-78') === undefined));
        expect(a.onCastToNormalForm('c-78') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-78', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-78', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050014 end');
    })

    /**
     * @tc.name   testShakeMoreForm050015
     * @tc.number SUB_SHAKE_MORE_FORM_05_0015
     * @tc.desc   Verify a.onRemoveForm(\'r-79\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-79') === undefined));
        expect(a.onRemoveForm('r-79') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-79') === undefined));
        expect(a.onCastToNormalForm('c-79') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-79', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-79', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050015 end');
    })

    /**
     * @tc.name   testShakeMoreForm050016
     * @tc.number SUB_SHAKE_MORE_FORM_05_0016
     * @tc.desc   Verify a.onRemoveForm(\'r-80\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-80') === undefined));
        expect(a.onRemoveForm('r-80') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-80') === undefined));
        expect(a.onCastToNormalForm('c-80') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-80', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-80', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm050016 end');
    })
  })
}
