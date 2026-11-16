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
import { Contact } from '../../../main/ets/common/DataSource';

export default function flipClockContactPropertiesTest() {
  describe('FlipClockContactPropertiesTest', () => {

    /**
     * @tc.name   testFlipClockContactProp0000
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0000
     * @tc.desc   Verify contact property variant 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key0', 'value0', 50); expect(c.key).assertEqual('key0'); expect(c.value).assertEqual('value0'); expect(c.reminderId).assertEqual(50);
    })

    /**
     * @tc.name   testFlipClockContactProp0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0001
     * @tc.desc   Verify contact property variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key1', 'value1', 51); expect(c.key).assertEqual('key1'); expect(c.value).assertEqual('value1'); expect(c.reminderId).assertEqual(51);
    })

    /**
     * @tc.name   testFlipClockContactProp0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0002
     * @tc.desc   Verify contact property variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key2', 'value2', 52); expect(c.key).assertEqual('key2'); expect(c.value).assertEqual('value2'); expect(c.reminderId).assertEqual(52);
    })

    /**
     * @tc.name   testFlipClockContactProp0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0003
     * @tc.desc   Verify contact property variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key3', 'value3', 53); expect(c.key).assertEqual('key3'); expect(c.value).assertEqual('value3'); expect(c.reminderId).assertEqual(53);
    })

    /**
     * @tc.name   testFlipClockContactProp0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0004
     * @tc.desc   Verify contact property variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key4', 'value4', 54); expect(c.key).assertEqual('key4'); expect(c.value).assertEqual('value4'); expect(c.reminderId).assertEqual(54);
    })

    /**
     * @tc.name   testFlipClockContactProp0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0005
     * @tc.desc   Verify contact property variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key5', 'value5', 55); expect(c.key).assertEqual('key5'); expect(c.value).assertEqual('value5'); expect(c.reminderId).assertEqual(55);
    })

    /**
     * @tc.name   testFlipClockContactProp0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0006
     * @tc.desc   Verify contact property variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key6', 'value6', 56); expect(c.key).assertEqual('key6'); expect(c.value).assertEqual('value6'); expect(c.reminderId).assertEqual(56);
    })

    /**
     * @tc.name   testFlipClockContactProp0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0007
     * @tc.desc   Verify contact property variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Contact = new Contact('key7', 'value7', 57); expect(c.key).assertEqual('key7'); expect(c.value).assertEqual('value7'); expect(c.reminderId).assertEqual(57);
    })
  })
}
