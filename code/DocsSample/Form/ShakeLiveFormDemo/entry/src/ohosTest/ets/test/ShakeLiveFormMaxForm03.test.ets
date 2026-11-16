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

export default function shakeLiveFormMaxForm03Test() {
  describe('ShakeLiveFormMaxForm03Test', () => {

    /**
     * @tc.name   testShakeMaxForm030001
     * @tc.number SUB_SHAKE_MAX_FORM_03_0001
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-33\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-33') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-33\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-33') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-33\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-33', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030001 end');
    })

    /**
     * @tc.name   testShakeMaxForm030002
     * @tc.number SUB_SHAKE_MAX_FORM_03_0002
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-34\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-34') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-34\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-34') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-34\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-34', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030002 end');
    })

    /**
     * @tc.name   testShakeMaxForm030003
     * @tc.number SUB_SHAKE_MAX_FORM_03_0003
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-35\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-35') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-35\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-35') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-35\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-35', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030003 end');
    })

    /**
     * @tc.name   testShakeMaxForm030004
     * @tc.number SUB_SHAKE_MAX_FORM_03_0004
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-36\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-36') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-36\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-36') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-36\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-36', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030004 end');
    })

    /**
     * @tc.name   testShakeMaxForm030005
     * @tc.number SUB_SHAKE_MAX_FORM_03_0005
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-37\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-37') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-37\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-37') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-37\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-37', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030005 end');
    })

    /**
     * @tc.name   testShakeMaxForm030006
     * @tc.number SUB_SHAKE_MAX_FORM_03_0006
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-38\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-38') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-38\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-38') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-38\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-38', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030006 end');
    })

    /**
     * @tc.name   testShakeMaxForm030007
     * @tc.number SUB_SHAKE_MAX_FORM_03_0007
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-39\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-39') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-39\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-39') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-39\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-39', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030007 end');
    })

    /**
     * @tc.name   testShakeMaxForm030008
     * @tc.number SUB_SHAKE_MAX_FORM_03_0008
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-40\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-40') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-40\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-40') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-40\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-40', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030008 end');
    })

    /**
     * @tc.name   testShakeMaxForm030009
     * @tc.number SUB_SHAKE_MAX_FORM_03_0009
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-41\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-41') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-41\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-41') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-41\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-41', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030009 end');
    })

    /**
     * @tc.name   testShakeMaxForm030010
     * @tc.number SUB_SHAKE_MAX_FORM_03_0010
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-42\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-42') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-42\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-42') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-42\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-42', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030010 end');
    })

    /**
     * @tc.name   testShakeMaxForm030011
     * @tc.number SUB_SHAKE_MAX_FORM_03_0011
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-43\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-43') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-43\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-43') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-43\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-43', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030011 end');
    })

    /**
     * @tc.name   testShakeMaxForm030012
     * @tc.number SUB_SHAKE_MAX_FORM_03_0012
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-44\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-44') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-44\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-44') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-44\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-44', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030012 end');
    })

    /**
     * @tc.name   testShakeMaxForm030013
     * @tc.number SUB_SHAKE_MAX_FORM_03_0013
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-45\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-45') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-45\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-45') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-45\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-45', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030013 end');
    })

    /**
     * @tc.name   testShakeMaxForm030014
     * @tc.number SUB_SHAKE_MAX_FORM_03_0014
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-46\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-46') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-46\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-46') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-46\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-46', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030014 end');
    })

    /**
     * @tc.name   testShakeMaxForm030015
     * @tc.number SUB_SHAKE_MAX_FORM_03_0015
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-47\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-47') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-47\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-47') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-47\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-47', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030015 end');
    })

    /**
     * @tc.name   testShakeMaxForm030016
     * @tc.number SUB_SHAKE_MAX_FORM_03_0016
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-48\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-48') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-48\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-48') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-48\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-48', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm030016 end');
    })
  })
}
