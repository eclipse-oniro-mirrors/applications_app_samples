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

export default function shakeLiveFormMaxForm02Test() {
  describe('ShakeLiveFormMaxForm02Test', () => {

    /**
     * @tc.name   testShakeMaxForm020001
     * @tc.number SUB_SHAKE_MAX_FORM_02_0001
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-17\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-17') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-17\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-17') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-17\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-17', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020001 end');
    })

    /**
     * @tc.name   testShakeMaxForm020002
     * @tc.number SUB_SHAKE_MAX_FORM_02_0002
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-18\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-18') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-18\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-18') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-18\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-18', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020002 end');
    })

    /**
     * @tc.name   testShakeMaxForm020003
     * @tc.number SUB_SHAKE_MAX_FORM_02_0003
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-19\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-19') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-19\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-19') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-19\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-19', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020003 end');
    })

    /**
     * @tc.name   testShakeMaxForm020004
     * @tc.number SUB_SHAKE_MAX_FORM_02_0004
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-20\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-20') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-20\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-20') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-20\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-20', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020004 end');
    })

    /**
     * @tc.name   testShakeMaxForm020005
     * @tc.number SUB_SHAKE_MAX_FORM_02_0005
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-21\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-21') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-21\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-21') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-21\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-21', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020005 end');
    })

    /**
     * @tc.name   testShakeMaxForm020006
     * @tc.number SUB_SHAKE_MAX_FORM_02_0006
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-22\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-22') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-22\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-22') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-22\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-22', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020006 end');
    })

    /**
     * @tc.name   testShakeMaxForm020007
     * @tc.number SUB_SHAKE_MAX_FORM_02_0007
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-23\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-23') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-23\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-23') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-23\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-23', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020007 end');
    })

    /**
     * @tc.name   testShakeMaxForm020008
     * @tc.number SUB_SHAKE_MAX_FORM_02_0008
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-24\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-24') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-24\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-24') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-24\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-24', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020008 end');
    })

    /**
     * @tc.name   testShakeMaxForm020009
     * @tc.number SUB_SHAKE_MAX_FORM_02_0009
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-25\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-25') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-25\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-25') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-25\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-25', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020009 end');
    })

    /**
     * @tc.name   testShakeMaxForm020010
     * @tc.number SUB_SHAKE_MAX_FORM_02_0010
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-26\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-26') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-26\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-26') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-26\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-26', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020010 end');
    })

    /**
     * @tc.name   testShakeMaxForm020011
     * @tc.number SUB_SHAKE_MAX_FORM_02_0011
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-27\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-27') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-27\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-27') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-27\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-27', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020011 end');
    })

    /**
     * @tc.name   testShakeMaxForm020012
     * @tc.number SUB_SHAKE_MAX_FORM_02_0012
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-28\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-28') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-28\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-28') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-28\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-28', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020012 end');
    })

    /**
     * @tc.name   testShakeMaxForm020013
     * @tc.number SUB_SHAKE_MAX_FORM_02_0013
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-29\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-29') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-29\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-29') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-29\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-29', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020013 end');
    })

    /**
     * @tc.name   testShakeMaxForm020014
     * @tc.number SUB_SHAKE_MAX_FORM_02_0014
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-30\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-30') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-30\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-30') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-30\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-30', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020014 end');
    })

    /**
     * @tc.name   testShakeMaxForm020015
     * @tc.number SUB_SHAKE_MAX_FORM_02_0015
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-31\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-31') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-31\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-31') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-31\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-31', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020015 end');
    })

    /**
     * @tc.name   testShakeMaxForm020016
     * @tc.number SUB_SHAKE_MAX_FORM_02_0016
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAddForm({}) !== undefined).assertTrue();');
        expect(a.onAddForm({}) !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'form-32\') === undefined).assertTrue();');
        expect(a.onRemoveForm('form-32') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'form-32\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('form-32') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'form-32\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('form-32', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxForm020016 end');
    })
  })
}
