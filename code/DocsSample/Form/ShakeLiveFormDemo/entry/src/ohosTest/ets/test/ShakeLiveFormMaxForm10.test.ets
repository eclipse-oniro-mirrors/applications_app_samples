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

export default function shakeLiveFormMaxForm10Test() {
  describe('ShakeLiveFormMaxForm10Test', () => {

    /**
     * @tc.name   testShakeMaxForm100001
     * @tc.number SUB_SHAKE_MAX_FORM_10_0001
     * @tc.desc   Max form case 10-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-145') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-145') === undefined).assertTrue(); expect(a.onFormEvent('form-145', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100002
     * @tc.number SUB_SHAKE_MAX_FORM_10_0002
     * @tc.desc   Max form case 10-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-146') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-146') === undefined).assertTrue(); expect(a.onFormEvent('form-146', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100003
     * @tc.number SUB_SHAKE_MAX_FORM_10_0003
     * @tc.desc   Max form case 10-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-147') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-147') === undefined).assertTrue(); expect(a.onFormEvent('form-147', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100004
     * @tc.number SUB_SHAKE_MAX_FORM_10_0004
     * @tc.desc   Max form case 10-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-148') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-148') === undefined).assertTrue(); expect(a.onFormEvent('form-148', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100005
     * @tc.number SUB_SHAKE_MAX_FORM_10_0005
     * @tc.desc   Max form case 10-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-149') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-149') === undefined).assertTrue(); expect(a.onFormEvent('form-149', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100006
     * @tc.number SUB_SHAKE_MAX_FORM_10_0006
     * @tc.desc   Max form case 10-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-150') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-150') === undefined).assertTrue(); expect(a.onFormEvent('form-150', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100007
     * @tc.number SUB_SHAKE_MAX_FORM_10_0007
     * @tc.desc   Max form case 10-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-151') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-151') === undefined).assertTrue(); expect(a.onFormEvent('form-151', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100008
     * @tc.number SUB_SHAKE_MAX_FORM_10_0008
     * @tc.desc   Max form case 10-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-152') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-152') === undefined).assertTrue(); expect(a.onFormEvent('form-152', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100009
     * @tc.number SUB_SHAKE_MAX_FORM_10_0009
     * @tc.desc   Max form case 10-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-153') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-153') === undefined).assertTrue(); expect(a.onFormEvent('form-153', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100010
     * @tc.number SUB_SHAKE_MAX_FORM_10_0010
     * @tc.desc   Max form case 10-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-154') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-154') === undefined).assertTrue(); expect(a.onFormEvent('form-154', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100011
     * @tc.number SUB_SHAKE_MAX_FORM_10_0011
     * @tc.desc   Max form case 10-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-155') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-155') === undefined).assertTrue(); expect(a.onFormEvent('form-155', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100012
     * @tc.number SUB_SHAKE_MAX_FORM_10_0012
     * @tc.desc   Max form case 10-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-156') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-156') === undefined).assertTrue(); expect(a.onFormEvent('form-156', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100013
     * @tc.number SUB_SHAKE_MAX_FORM_10_0013
     * @tc.desc   Max form case 10-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-157') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-157') === undefined).assertTrue(); expect(a.onFormEvent('form-157', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100014
     * @tc.number SUB_SHAKE_MAX_FORM_10_0014
     * @tc.desc   Max form case 10-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-158') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-158') === undefined).assertTrue(); expect(a.onFormEvent('form-158', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100015
     * @tc.number SUB_SHAKE_MAX_FORM_10_0015
     * @tc.desc   Max form case 10-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-159') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-159') === undefined).assertTrue(); expect(a.onFormEvent('form-159', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm100016
     * @tc.number SUB_SHAKE_MAX_FORM_10_0016
     * @tc.desc   Max form case 10-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-160') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-160') === undefined).assertTrue(); expect(a.onFormEvent('form-160', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
