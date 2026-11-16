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

export default function shakeLiveFormMaxForm06Test() {
  describe('ShakeLiveFormMaxForm06Test', () => {

    /**
     * @tc.name   testShakeMaxForm060001
     * @tc.number SUB_SHAKE_MAX_FORM_06_0001
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-81') === undefined));
        expect(a.onRemoveForm('form-81') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-81') === undefined));
        expect(a.onCastToNormalForm('form-81') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-81', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-81', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060001 end');
    })

    /**
     * @tc.name   testShakeMaxForm060002
     * @tc.number SUB_SHAKE_MAX_FORM_06_0002
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-82') === undefined));
        expect(a.onRemoveForm('form-82') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-82') === undefined));
        expect(a.onCastToNormalForm('form-82') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-82', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-82', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060002 end');
    })

    /**
     * @tc.name   testShakeMaxForm060003
     * @tc.number SUB_SHAKE_MAX_FORM_06_0003
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-83') === undefined));
        expect(a.onRemoveForm('form-83') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-83') === undefined));
        expect(a.onCastToNormalForm('form-83') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-83', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-83', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060003 end');
    })

    /**
     * @tc.name   testShakeMaxForm060004
     * @tc.number SUB_SHAKE_MAX_FORM_06_0004
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-84') === undefined));
        expect(a.onRemoveForm('form-84') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-84') === undefined));
        expect(a.onCastToNormalForm('form-84') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-84', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-84', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060004 end');
    })

    /**
     * @tc.name   testShakeMaxForm060005
     * @tc.number SUB_SHAKE_MAX_FORM_06_0005
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-85') === undefined));
        expect(a.onRemoveForm('form-85') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-85') === undefined));
        expect(a.onCastToNormalForm('form-85') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-85', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-85', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060005 end');
    })

    /**
     * @tc.name   testShakeMaxForm060006
     * @tc.number SUB_SHAKE_MAX_FORM_06_0006
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-86') === undefined));
        expect(a.onRemoveForm('form-86') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-86') === undefined));
        expect(a.onCastToNormalForm('form-86') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-86', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-86', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060006 end');
    })

    /**
     * @tc.name   testShakeMaxForm060007
     * @tc.number SUB_SHAKE_MAX_FORM_06_0007
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-87') === undefined));
        expect(a.onRemoveForm('form-87') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-87') === undefined));
        expect(a.onCastToNormalForm('form-87') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-87', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-87', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060007 end');
    })

    /**
     * @tc.name   testShakeMaxForm060008
     * @tc.number SUB_SHAKE_MAX_FORM_06_0008
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-88') === undefined));
        expect(a.onRemoveForm('form-88') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-88') === undefined));
        expect(a.onCastToNormalForm('form-88') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-88', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-88', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060008 end');
    })

    /**
     * @tc.name   testShakeMaxForm060009
     * @tc.number SUB_SHAKE_MAX_FORM_06_0009
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-89') === undefined));
        expect(a.onRemoveForm('form-89') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-89') === undefined));
        expect(a.onCastToNormalForm('form-89') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-89', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-89', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060009 end');
    })

    /**
     * @tc.name   testShakeMaxForm060010
     * @tc.number SUB_SHAKE_MAX_FORM_06_0010
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-90') === undefined));
        expect(a.onRemoveForm('form-90') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-90') === undefined));
        expect(a.onCastToNormalForm('form-90') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-90', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-90', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060010 end');
    })

    /**
     * @tc.name   testShakeMaxForm060011
     * @tc.number SUB_SHAKE_MAX_FORM_06_0011
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-91') === undefined));
        expect(a.onRemoveForm('form-91') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-91') === undefined));
        expect(a.onCastToNormalForm('form-91') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-91', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-91', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060011 end');
    })

    /**
     * @tc.name   testShakeMaxForm060012
     * @tc.number SUB_SHAKE_MAX_FORM_06_0012
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-92') === undefined));
        expect(a.onRemoveForm('form-92') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-92') === undefined));
        expect(a.onCastToNormalForm('form-92') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-92', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-92', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060012 end');
    })

    /**
     * @tc.name   testShakeMaxForm060013
     * @tc.number SUB_SHAKE_MAX_FORM_06_0013
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-93') === undefined));
        expect(a.onRemoveForm('form-93') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-93') === undefined));
        expect(a.onCastToNormalForm('form-93') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-93', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-93', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060013 end');
    })

    /**
     * @tc.name   testShakeMaxForm060014
     * @tc.number SUB_SHAKE_MAX_FORM_06_0014
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-94') === undefined));
        expect(a.onRemoveForm('form-94') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-94') === undefined));
        expect(a.onCastToNormalForm('form-94') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-94', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-94', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060014 end');
    })

    /**
     * @tc.name   testShakeMaxForm060015
     * @tc.number SUB_SHAKE_MAX_FORM_06_0015
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-95') === undefined));
        expect(a.onRemoveForm('form-95') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-95') === undefined));
        expect(a.onCastToNormalForm('form-95') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-95', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-95', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060015 end');
    })

    /**
     * @tc.name   testShakeMaxForm060016
     * @tc.number SUB_SHAKE_MAX_FORM_06_0016
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('form-96') === undefined));
        expect(a.onRemoveForm('form-96') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('form-96') === undefined));
        expect(a.onCastToNormalForm('form-96') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-96', '{"message":"other"}') !== undefined));
        expect(a.onFormEvent('form-96', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm060016 end');
    })
  })
}
