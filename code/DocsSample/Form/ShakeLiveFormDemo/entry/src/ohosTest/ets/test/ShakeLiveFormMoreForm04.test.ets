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

export default function shakeLiveFormMoreForm04Test() {
  describe('ShakeLiveFormMoreForm04Test', () => {

    /**
     * @tc.name   testShakeMoreForm040001
     * @tc.number SUB_SHAKE_MORE_FORM_04_0001
     * @tc.desc   Verify a.onRemoveForm(\'r-49\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-49\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-49') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-49\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-49') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-49\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-49', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040001 end');
    })

    /**
     * @tc.name   testShakeMoreForm040002
     * @tc.number SUB_SHAKE_MORE_FORM_04_0002
     * @tc.desc   Verify a.onRemoveForm(\'r-50\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-50\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-50') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-50\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-50') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-50\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-50', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040002 end');
    })

    /**
     * @tc.name   testShakeMoreForm040003
     * @tc.number SUB_SHAKE_MORE_FORM_04_0003
     * @tc.desc   Verify a.onRemoveForm(\'r-51\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-51\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-51') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-51\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-51') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-51\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-51', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040003 end');
    })

    /**
     * @tc.name   testShakeMoreForm040004
     * @tc.number SUB_SHAKE_MORE_FORM_04_0004
     * @tc.desc   Verify a.onRemoveForm(\'r-52\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-52\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-52') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-52\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-52') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-52\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-52', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040004 end');
    })

    /**
     * @tc.name   testShakeMoreForm040005
     * @tc.number SUB_SHAKE_MORE_FORM_04_0005
     * @tc.desc   Verify a.onRemoveForm(\'r-53\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-53\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-53') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-53\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-53') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-53\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-53', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040005 end');
    })

    /**
     * @tc.name   testShakeMoreForm040006
     * @tc.number SUB_SHAKE_MORE_FORM_04_0006
     * @tc.desc   Verify a.onRemoveForm(\'r-54\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-54\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-54') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-54\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-54') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-54\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-54', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040006 end');
    })

    /**
     * @tc.name   testShakeMoreForm040007
     * @tc.number SUB_SHAKE_MORE_FORM_04_0007
     * @tc.desc   Verify a.onRemoveForm(\'r-55\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-55\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-55') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-55\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-55') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-55\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-55', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040007 end');
    })

    /**
     * @tc.name   testShakeMoreForm040008
     * @tc.number SUB_SHAKE_MORE_FORM_04_0008
     * @tc.desc   Verify a.onRemoveForm(\'r-56\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-56\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-56') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-56\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-56') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-56\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-56', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040008 end');
    })

    /**
     * @tc.name   testShakeMoreForm040009
     * @tc.number SUB_SHAKE_MORE_FORM_04_0009
     * @tc.desc   Verify a.onRemoveForm(\'r-57\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-57\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-57') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-57\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-57') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-57\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-57', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040009 end');
    })

    /**
     * @tc.name   testShakeMoreForm040010
     * @tc.number SUB_SHAKE_MORE_FORM_04_0010
     * @tc.desc   Verify a.onRemoveForm(\'r-58\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-58\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-58') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-58\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-58') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-58\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-58', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040010 end');
    })

    /**
     * @tc.name   testShakeMoreForm040011
     * @tc.number SUB_SHAKE_MORE_FORM_04_0011
     * @tc.desc   Verify a.onRemoveForm(\'r-59\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-59\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-59') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-59\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-59') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-59\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-59', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040011 end');
    })

    /**
     * @tc.name   testShakeMoreForm040012
     * @tc.number SUB_SHAKE_MORE_FORM_04_0012
     * @tc.desc   Verify a.onRemoveForm(\'r-60\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-60\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-60') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-60\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-60') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-60\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-60', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040012 end');
    })

    /**
     * @tc.name   testShakeMoreForm040013
     * @tc.number SUB_SHAKE_MORE_FORM_04_0013
     * @tc.desc   Verify a.onRemoveForm(\'r-61\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-61\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-61') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-61\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-61') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-61\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-61', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040013 end');
    })

    /**
     * @tc.name   testShakeMoreForm040014
     * @tc.number SUB_SHAKE_MORE_FORM_04_0014
     * @tc.desc   Verify a.onRemoveForm(\'r-62\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-62\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-62') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-62\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-62') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-62\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-62', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040014 end');
    })

    /**
     * @tc.name   testShakeMoreForm040015
     * @tc.number SUB_SHAKE_MORE_FORM_04_0015
     * @tc.desc   Verify a.onRemoveForm(\'r-63\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-63\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-63') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-63\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-63') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-63\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-63', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040015 end');
    })

    /**
     * @tc.name   testShakeMoreForm040016
     * @tc.number SUB_SHAKE_MORE_FORM_04_0016
     * @tc.desc   Verify a.onRemoveForm(\'r-64\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'r-64\') === undefined).assertTrue();');
        expect(a.onRemoveForm('r-64') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'c-64\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('c-64') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'e-64\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('e-64', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm040016 end');
    })
  })
}
