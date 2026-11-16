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

export default function shakeLiveFormMoreForm06Test() {
  describe('ShakeLiveFormMoreForm06Test', () => {

    /**
     * @tc.name   testShakeMoreForm060001
     * @tc.number SUB_SHAKE_MORE_FORM_06_0001
     * @tc.desc   Verify a.onRemoveForm(\'r-81\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-81') === undefined));
        expect(a.onRemoveForm('r-81') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-81') === undefined));
        expect(a.onCastToNormalForm('c-81') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-81', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-81', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060001 end');
    })

    /**
     * @tc.name   testShakeMoreForm060002
     * @tc.number SUB_SHAKE_MORE_FORM_06_0002
     * @tc.desc   Verify a.onRemoveForm(\'r-82\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-82') === undefined));
        expect(a.onRemoveForm('r-82') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-82') === undefined));
        expect(a.onCastToNormalForm('c-82') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-82', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-82', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060002 end');
    })

    /**
     * @tc.name   testShakeMoreForm060003
     * @tc.number SUB_SHAKE_MORE_FORM_06_0003
     * @tc.desc   Verify a.onRemoveForm(\'r-83\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-83') === undefined));
        expect(a.onRemoveForm('r-83') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-83') === undefined));
        expect(a.onCastToNormalForm('c-83') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-83', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-83', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060003 end');
    })

    /**
     * @tc.name   testShakeMoreForm060004
     * @tc.number SUB_SHAKE_MORE_FORM_06_0004
     * @tc.desc   Verify a.onRemoveForm(\'r-84\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-84') === undefined));
        expect(a.onRemoveForm('r-84') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-84') === undefined));
        expect(a.onCastToNormalForm('c-84') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-84', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-84', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060004 end');
    })

    /**
     * @tc.name   testShakeMoreForm060005
     * @tc.number SUB_SHAKE_MORE_FORM_06_0005
     * @tc.desc   Verify a.onRemoveForm(\'r-85\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-85') === undefined));
        expect(a.onRemoveForm('r-85') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-85') === undefined));
        expect(a.onCastToNormalForm('c-85') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-85', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-85', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060005 end');
    })

    /**
     * @tc.name   testShakeMoreForm060006
     * @tc.number SUB_SHAKE_MORE_FORM_06_0006
     * @tc.desc   Verify a.onRemoveForm(\'r-86\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-86') === undefined));
        expect(a.onRemoveForm('r-86') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-86') === undefined));
        expect(a.onCastToNormalForm('c-86') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-86', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-86', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060006 end');
    })

    /**
     * @tc.name   testShakeMoreForm060007
     * @tc.number SUB_SHAKE_MORE_FORM_06_0007
     * @tc.desc   Verify a.onRemoveForm(\'r-87\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-87') === undefined));
        expect(a.onRemoveForm('r-87') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-87') === undefined));
        expect(a.onCastToNormalForm('c-87') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-87', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-87', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060007 end');
    })

    /**
     * @tc.name   testShakeMoreForm060008
     * @tc.number SUB_SHAKE_MORE_FORM_06_0008
     * @tc.desc   Verify a.onRemoveForm(\'r-88\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-88') === undefined));
        expect(a.onRemoveForm('r-88') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-88') === undefined));
        expect(a.onCastToNormalForm('c-88') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-88', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-88', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060008 end');
    })

    /**
     * @tc.name   testShakeMoreForm060009
     * @tc.number SUB_SHAKE_MORE_FORM_06_0009
     * @tc.desc   Verify a.onRemoveForm(\'r-89\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-89') === undefined));
        expect(a.onRemoveForm('r-89') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-89') === undefined));
        expect(a.onCastToNormalForm('c-89') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-89', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-89', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060009 end');
    })

    /**
     * @tc.name   testShakeMoreForm060010
     * @tc.number SUB_SHAKE_MORE_FORM_06_0010
     * @tc.desc   Verify a.onRemoveForm(\'r-90\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-90') === undefined));
        expect(a.onRemoveForm('r-90') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-90') === undefined));
        expect(a.onCastToNormalForm('c-90') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-90', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-90', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060010 end');
    })

    /**
     * @tc.name   testShakeMoreForm060011
     * @tc.number SUB_SHAKE_MORE_FORM_06_0011
     * @tc.desc   Verify a.onRemoveForm(\'r-91\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-91') === undefined));
        expect(a.onRemoveForm('r-91') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-91') === undefined));
        expect(a.onCastToNormalForm('c-91') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-91', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-91', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060011 end');
    })

    /**
     * @tc.name   testShakeMoreForm060012
     * @tc.number SUB_SHAKE_MORE_FORM_06_0012
     * @tc.desc   Verify a.onRemoveForm(\'r-92\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-92') === undefined));
        expect(a.onRemoveForm('r-92') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-92') === undefined));
        expect(a.onCastToNormalForm('c-92') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-92', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-92', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060012 end');
    })

    /**
     * @tc.name   testShakeMoreForm060013
     * @tc.number SUB_SHAKE_MORE_FORM_06_0013
     * @tc.desc   Verify a.onRemoveForm(\'r-93\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-93') === undefined));
        expect(a.onRemoveForm('r-93') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-93') === undefined));
        expect(a.onCastToNormalForm('c-93') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-93', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-93', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060013 end');
    })

    /**
     * @tc.name   testShakeMoreForm060014
     * @tc.number SUB_SHAKE_MORE_FORM_06_0014
     * @tc.desc   Verify a.onRemoveForm(\'r-94\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-94') === undefined));
        expect(a.onRemoveForm('r-94') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-94') === undefined));
        expect(a.onCastToNormalForm('c-94') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-94', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-94', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060014 end');
    })

    /**
     * @tc.name   testShakeMoreForm060015
     * @tc.number SUB_SHAKE_MORE_FORM_06_0015
     * @tc.desc   Verify a.onRemoveForm(\'r-95\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-95') === undefined));
        expect(a.onRemoveForm('r-95') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-95') === undefined));
        expect(a.onCastToNormalForm('c-95') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-95', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-95', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060015 end');
    })

    /**
     * @tc.name   testShakeMoreForm060016
     * @tc.number SUB_SHAKE_MORE_FORM_06_0016
     * @tc.desc   Verify a.onRemoveForm(\'r-96\') is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('r-96') === undefined));
        expect(a.onRemoveForm('r-96') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('c-96') === undefined));
        expect(a.onCastToNormalForm('c-96') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('e-96', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('e-96', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreForm060016 end');
    })
  })
}
