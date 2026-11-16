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

export default function flipClockContactModelTest() {
  describe('FlipClockContactModelTest', () => {

    /**
     * @tc.name   testFlipClockContactField0001
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0001
     * @tc.desc   Construct contact field sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('', '', 0);
      expect(contact.key).assertEqual(''); expect(contact.value).assertEqual(''); expect(contact.reminderId).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockContactField0002
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0002
     * @tc.desc   Construct contact field sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('alarm', '07:30', 1);
      expect(contact.key).assertEqual('alarm'); expect(contact.value).assertEqual('07:30'); expect(contact.reminderId).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockContactField0003
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0003
     * @tc.desc   Construct contact field sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('work', '09:00', 99);
      expect(contact.key).assertEqual('work'); expect(contact.value).assertEqual('09:00'); expect(contact.reminderId).assertEqual(99);
    })

    /**
     * @tc.name   testFlipClockContactField0004
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0004
     * @tc.desc   Construct contact field sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('home', '18:30', -1);
      expect(contact.key).assertEqual('home'); expect(contact.value).assertEqual('18:30'); expect(contact.reminderId).assertEqual(-1);
    })

    /**
     * @tc.name   testFlipClockContactField0005
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0005
     * @tc.desc   Construct contact field sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('a', 'b', 2147483647);
      expect(contact.key).assertEqual('a'); expect(contact.value).assertEqual('b'); expect(contact.reminderId).assertEqual(2147483647);
    })

    /**
     * @tc.name   testFlipClockContactField0006
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0006
     * @tc.desc   Construct contact field sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key', 'value', -2147483648);
      expect(contact.key).assertEqual('key'); expect(contact.value).assertEqual('value'); expect(contact.reminderId).assertEqual(-2147483648);
    })

    /**
     * @tc.name   testFlipClockContactField0007
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0007
     * @tc.desc   Construct contact field sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('long-key', 'long-value', 42);
      expect(contact.key).assertEqual('long-key'); expect(contact.value).assertEqual('long-value'); expect(contact.reminderId).assertEqual(42);
    })

    /**
     * @tc.name   testFlipClockContactField0008
     * @tc.number SUB_FLIP_CLOCK_MORE_CONTACT_0008
     * @tc.desc   Construct contact field sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('0', '0', 0);
      expect(contact.key).assertEqual('0'); expect(contact.value).assertEqual('0'); expect(contact.reminderId).assertEqual(0);
    })
  })
}
