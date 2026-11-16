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

export default function shakeLiveFormMaxForm09Test() {
  describe('ShakeLiveFormMaxForm09Test', () => {

    /**
     * @tc.name   testShakeMaxForm090001
     * @tc.number SUB_SHAKE_MAX_FORM_09_0001
     * @tc.desc   Max form case 9-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-129') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-129') === undefined).assertTrue(); expect(a.onFormEvent('form-129', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090002
     * @tc.number SUB_SHAKE_MAX_FORM_09_0002
     * @tc.desc   Max form case 9-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-130') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-130') === undefined).assertTrue(); expect(a.onFormEvent('form-130', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090003
     * @tc.number SUB_SHAKE_MAX_FORM_09_0003
     * @tc.desc   Max form case 9-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-131') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-131') === undefined).assertTrue(); expect(a.onFormEvent('form-131', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090004
     * @tc.number SUB_SHAKE_MAX_FORM_09_0004
     * @tc.desc   Max form case 9-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-132') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-132') === undefined).assertTrue(); expect(a.onFormEvent('form-132', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090005
     * @tc.number SUB_SHAKE_MAX_FORM_09_0005
     * @tc.desc   Max form case 9-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-133') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-133') === undefined).assertTrue(); expect(a.onFormEvent('form-133', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090006
     * @tc.number SUB_SHAKE_MAX_FORM_09_0006
     * @tc.desc   Max form case 9-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-134') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-134') === undefined).assertTrue(); expect(a.onFormEvent('form-134', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090007
     * @tc.number SUB_SHAKE_MAX_FORM_09_0007
     * @tc.desc   Max form case 9-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-135') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-135') === undefined).assertTrue(); expect(a.onFormEvent('form-135', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090008
     * @tc.number SUB_SHAKE_MAX_FORM_09_0008
     * @tc.desc   Max form case 9-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-136') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-136') === undefined).assertTrue(); expect(a.onFormEvent('form-136', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090009
     * @tc.number SUB_SHAKE_MAX_FORM_09_0009
     * @tc.desc   Max form case 9-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-137') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-137') === undefined).assertTrue(); expect(a.onFormEvent('form-137', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090010
     * @tc.number SUB_SHAKE_MAX_FORM_09_0010
     * @tc.desc   Max form case 9-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-138') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-138') === undefined).assertTrue(); expect(a.onFormEvent('form-138', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090011
     * @tc.number SUB_SHAKE_MAX_FORM_09_0011
     * @tc.desc   Max form case 9-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-139') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-139') === undefined).assertTrue(); expect(a.onFormEvent('form-139', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090012
     * @tc.number SUB_SHAKE_MAX_FORM_09_0012
     * @tc.desc   Max form case 9-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-140') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-140') === undefined).assertTrue(); expect(a.onFormEvent('form-140', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090013
     * @tc.number SUB_SHAKE_MAX_FORM_09_0013
     * @tc.desc   Max form case 9-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-141') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-141') === undefined).assertTrue(); expect(a.onFormEvent('form-141', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090014
     * @tc.number SUB_SHAKE_MAX_FORM_09_0014
     * @tc.desc   Max form case 9-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-142') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-142') === undefined).assertTrue(); expect(a.onFormEvent('form-142', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090015
     * @tc.number SUB_SHAKE_MAX_FORM_09_0015
     * @tc.desc   Max form case 9-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-143') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-143') === undefined).assertTrue(); expect(a.onFormEvent('form-143', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm090016
     * @tc.number SUB_SHAKE_MAX_FORM_09_0016
     * @tc.desc   Max form case 9-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm090016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-144') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-144') === undefined).assertTrue(); expect(a.onFormEvent('form-144', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
