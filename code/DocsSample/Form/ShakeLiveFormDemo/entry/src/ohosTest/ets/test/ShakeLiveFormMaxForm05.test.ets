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

export default function shakeLiveFormMaxForm05Test() {
  describe('ShakeLiveFormMaxForm05Test', () => {

    /**
     * @tc.name   testShakeMaxForm050001
     * @tc.number SUB_SHAKE_MAX_FORM_05_0001
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-65') === undefined));
        expect(a.onRemoveForm('form-65') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-65') === undefined));
        expect(a.onCastToNormalForm('form-65') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-65', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-65', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050001 end');
    })

    /**
     * @tc.name   testShakeMaxForm050002
     * @tc.number SUB_SHAKE_MAX_FORM_05_0002
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-66') === undefined));
        expect(a.onRemoveForm('form-66') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-66') === undefined));
        expect(a.onCastToNormalForm('form-66') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-66', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-66', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050002 end');
    })

    /**
     * @tc.name   testShakeMaxForm050003
     * @tc.number SUB_SHAKE_MAX_FORM_05_0003
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-67') === undefined));
        expect(a.onRemoveForm('form-67') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-67') === undefined));
        expect(a.onCastToNormalForm('form-67') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-67', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-67', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050003 end');
    })

    /**
     * @tc.name   testShakeMaxForm050004
     * @tc.number SUB_SHAKE_MAX_FORM_05_0004
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-68') === undefined));
        expect(a.onRemoveForm('form-68') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-68') === undefined));
        expect(a.onCastToNormalForm('form-68') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-68', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-68', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050004 end');
    })

    /**
     * @tc.name   testShakeMaxForm050005
     * @tc.number SUB_SHAKE_MAX_FORM_05_0005
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-69') === undefined));
        expect(a.onRemoveForm('form-69') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-69') === undefined));
        expect(a.onCastToNormalForm('form-69') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-69', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-69', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050005 end');
    })

    /**
     * @tc.name   testShakeMaxForm050006
     * @tc.number SUB_SHAKE_MAX_FORM_05_0006
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-70') === undefined));
        expect(a.onRemoveForm('form-70') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-70') === undefined));
        expect(a.onCastToNormalForm('form-70') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-70', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-70', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050006 end');
    })

    /**
     * @tc.name   testShakeMaxForm050007
     * @tc.number SUB_SHAKE_MAX_FORM_05_0007
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-71') === undefined));
        expect(a.onRemoveForm('form-71') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-71') === undefined));
        expect(a.onCastToNormalForm('form-71') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-71', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-71', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050007 end');
    })

    /**
     * @tc.name   testShakeMaxForm050008
     * @tc.number SUB_SHAKE_MAX_FORM_05_0008
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-72') === undefined));
        expect(a.onRemoveForm('form-72') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-72') === undefined));
        expect(a.onCastToNormalForm('form-72') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-72', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-72', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050008 end');
    })

    /**
     * @tc.name   testShakeMaxForm050009
     * @tc.number SUB_SHAKE_MAX_FORM_05_0009
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-73') === undefined));
        expect(a.onRemoveForm('form-73') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-73') === undefined));
        expect(a.onCastToNormalForm('form-73') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-73', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-73', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050009 end');
    })

    /**
     * @tc.name   testShakeMaxForm050010
     * @tc.number SUB_SHAKE_MAX_FORM_05_0010
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-74') === undefined));
        expect(a.onRemoveForm('form-74') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-74') === undefined));
        expect(a.onCastToNormalForm('form-74') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-74', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-74', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050010 end');
    })

    /**
     * @tc.name   testShakeMaxForm050011
     * @tc.number SUB_SHAKE_MAX_FORM_05_0011
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-75') === undefined));
        expect(a.onRemoveForm('form-75') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-75') === undefined));
        expect(a.onCastToNormalForm('form-75') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-75', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-75', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050011 end');
    })

    /**
     * @tc.name   testShakeMaxForm050012
     * @tc.number SUB_SHAKE_MAX_FORM_05_0012
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-76') === undefined));
        expect(a.onRemoveForm('form-76') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-76') === undefined));
        expect(a.onCastToNormalForm('form-76') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-76', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-76', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050012 end');
    })

    /**
     * @tc.name   testShakeMaxForm050013
     * @tc.number SUB_SHAKE_MAX_FORM_05_0013
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-77') === undefined));
        expect(a.onRemoveForm('form-77') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-77') === undefined));
        expect(a.onCastToNormalForm('form-77') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-77', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-77', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050013 end');
    })

    /**
     * @tc.name   testShakeMaxForm050014
     * @tc.number SUB_SHAKE_MAX_FORM_05_0014
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-78') === undefined));
        expect(a.onRemoveForm('form-78') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-78') === undefined));
        expect(a.onCastToNormalForm('form-78') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-78', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-78', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050014 end');
    })

    /**
     * @tc.name   testShakeMaxForm050015
     * @tc.number SUB_SHAKE_MAX_FORM_05_0015
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-79') === undefined));
        expect(a.onRemoveForm('form-79') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-79') === undefined));
        expect(a.onCastToNormalForm('form-79') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-79', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-79', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050015 end');
    })

    /**
     * @tc.name   testShakeMaxForm050016
     * @tc.number SUB_SHAKE_MAX_FORM_05_0016
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-80') === undefined));
        expect(a.onRemoveForm('form-80') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-80') === undefined));
        expect(a.onCastToNormalForm('form-80') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-80', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-80', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm050016 end');
    })
  })
}
