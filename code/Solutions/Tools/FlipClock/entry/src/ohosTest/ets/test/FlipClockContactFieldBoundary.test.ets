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

export default function flipClockContactFieldBoundaryTest() {
  describe('FlipClockContactFieldBoundaryTest', () => {

    /**
     * @tc.name   testFlipClockContactBoundary0001
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0001
     * @tc.desc   Construct contact boundary sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('', '', 0);
      expect(contact.key).assertEqual(''); expect(contact.value).assertEqual(''); expect(contact.reminderId).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockContactBoundary0002
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0002
     * @tc.desc   Construct contact boundary sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('k', 'v', -1);
      expect(contact.key).assertEqual('k'); expect(contact.value).assertEqual('v'); expect(contact.reminderId).assertEqual(-1);
    })

    /**
     * @tc.name   testFlipClockContactBoundary0003
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0003
     * @tc.desc   Construct contact boundary sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key', 'value', 9007199254740991);
      expect(contact.key).assertEqual('key'); expect(contact.value).assertEqual('value'); expect(contact.reminderId).assertEqual(9007199254740991);
    })

    /**
     * @tc.name   testFlipClockContactBoundary0004
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0004
     * @tc.desc   Construct contact boundary sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key', 'value', -9007199254740991);
      expect(contact.key).assertEqual('key'); expect(contact.value).assertEqual('value'); expect(contact.reminderId).assertEqual(-9007199254740991);
    })

    /**
     * @tc.name   testFlipClockContactBoundary0005
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0005
     * @tc.desc   Construct contact boundary sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong', 'valuevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevalue', 1);
      expect(contact.key).assertEqual('longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong'); expect(contact.value).assertEqual('valuevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevalue'); expect(contact.reminderId).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockContactBoundary0006
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0006
     * @tc.desc   Construct contact boundary sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact(' ', ' ', 2);
      expect(contact.key).assertEqual(' '); expect(contact.value).assertEqual(' '); expect(contact.reminderId).assertEqual(2);
    })

    /**
     * @tc.name   testFlipClockContactBoundary0007
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0007
     * @tc.desc   Construct contact boundary sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('0', '0', 3);
      expect(contact.key).assertEqual('0'); expect(contact.value).assertEqual('0'); expect(contact.reminderId).assertEqual(3);
    })

    /**
     * @tc.name   testFlipClockContactBoundary0008
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0008
     * @tc.desc   Construct contact boundary sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const contact: Contact = new Contact('key', 'value', -2147483648);
      expect(contact.key).assertEqual('key'); expect(contact.value).assertEqual('value'); expect(contact.reminderId).assertEqual(-2147483648);
    })
  })
}
