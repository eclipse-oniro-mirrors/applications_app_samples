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

export default function flipClockContactMoreTest() {
  describe('FlipClockContactMoreTest', () => {

    /**
     * @tc.name   testFlipClockContactMore0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0000
     * @tc.desc   Construct contact variant 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key0', 'value0', 0);
      expect(contact.key).assertEqual('key0'); expect(contact.value).assertEqual('value0'); expect(contact.reminderId).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockContactMore0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0001
     * @tc.desc   Construct contact variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key1', 'value1', 100);
      expect(contact.key).assertEqual('key1'); expect(contact.value).assertEqual('value1'); expect(contact.reminderId).assertEqual(100);
    })

    /**
     * @tc.name   testFlipClockContactMore0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0002
     * @tc.desc   Construct contact variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key2', 'value2', 200);
      expect(contact.key).assertEqual('key2'); expect(contact.value).assertEqual('value2'); expect(contact.reminderId).assertEqual(200);
    })

    /**
     * @tc.name   testFlipClockContactMore0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0003
     * @tc.desc   Construct contact variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key3', 'value3', 300);
      expect(contact.key).assertEqual('key3'); expect(contact.value).assertEqual('value3'); expect(contact.reminderId).assertEqual(300);
    })

    /**
     * @tc.name   testFlipClockContactMore0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0004
     * @tc.desc   Construct contact variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key4', 'value4', 400);
      expect(contact.key).assertEqual('key4'); expect(contact.value).assertEqual('value4'); expect(contact.reminderId).assertEqual(400);
    })

    /**
     * @tc.name   testFlipClockContactMore0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0005
     * @tc.desc   Construct contact variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key5', 'value5', 500);
      expect(contact.key).assertEqual('key5'); expect(contact.value).assertEqual('value5'); expect(contact.reminderId).assertEqual(500);
    })

    /**
     * @tc.name   testFlipClockContactMore0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0006
     * @tc.desc   Construct contact variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key6', 'value6', 600);
      expect(contact.key).assertEqual('key6'); expect(contact.value).assertEqual('value6'); expect(contact.reminderId).assertEqual(600);
    })

    /**
     * @tc.name   testFlipClockContactMore0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0007
     * @tc.desc   Construct contact variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key7', 'value7', 700);
      expect(contact.key).assertEqual('key7'); expect(contact.value).assertEqual('value7'); expect(contact.reminderId).assertEqual(700);
    })
  })
}
