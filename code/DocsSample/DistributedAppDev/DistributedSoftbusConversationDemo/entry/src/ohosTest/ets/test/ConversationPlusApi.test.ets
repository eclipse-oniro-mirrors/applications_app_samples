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
import { conversation } from '@kit.DistributedServiceKit';

export default function conversationPlusApiTest() {
  describe('ConversationPlusApiTest', () => {

    /**
     * @tc.name   testSoftbusPlusApi0001
     * @tc.number SUB_SOFTBUS_PLUS_API_0001
     * @tc.desc   Check conversation interface function set 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(1 > 0).assertTrue();
      expect(1 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0002
     * @tc.number SUB_SOFTBUS_PLUS_API_0002
     * @tc.desc   Check conversation interface function set 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(2 > 0).assertTrue();
      expect(2 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0003
     * @tc.number SUB_SOFTBUS_PLUS_API_0003
     * @tc.desc   Check conversation interface function set 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(3 > 0).assertTrue();
      expect(3 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0004
     * @tc.number SUB_SOFTBUS_PLUS_API_0004
     * @tc.desc   Check conversation interface function set 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(4 > 0).assertTrue();
      expect(4 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0005
     * @tc.number SUB_SOFTBUS_PLUS_API_0005
     * @tc.desc   Check conversation interface function set 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(5 > 0).assertTrue();
      expect(5 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0006
     * @tc.number SUB_SOFTBUS_PLUS_API_0006
     * @tc.desc   Check conversation interface function set 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(6 > 0).assertTrue();
      expect(6 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0007
     * @tc.number SUB_SOFTBUS_PLUS_API_0007
     * @tc.desc   Check conversation interface function set 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(7 > 0).assertTrue();
      expect(7 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0008
     * @tc.number SUB_SOFTBUS_PLUS_API_0008
     * @tc.desc   Check conversation interface function set 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(8 > 0).assertTrue();
      expect(8 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0009
     * @tc.number SUB_SOFTBUS_PLUS_API_0009
     * @tc.desc   Check conversation interface function set 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(9 > 0).assertTrue();
      expect(9 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0010
     * @tc.number SUB_SOFTBUS_PLUS_API_0010
     * @tc.desc   Check conversation interface function set 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(10 > 0).assertTrue();
      expect(10 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0011
     * @tc.number SUB_SOFTBUS_PLUS_API_0011
     * @tc.desc   Check conversation interface function set 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(11 > 0).assertTrue();
      expect(11 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0012
     * @tc.number SUB_SOFTBUS_PLUS_API_0012
     * @tc.desc   Check conversation interface function set 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(12 > 0).assertTrue();
      expect(12 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0013
     * @tc.number SUB_SOFTBUS_PLUS_API_0013
     * @tc.desc   Check conversation interface function set 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(13 > 0).assertTrue();
      expect(13 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0014
     * @tc.number SUB_SOFTBUS_PLUS_API_0014
     * @tc.desc   Check conversation interface function set 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(14 > 0).assertTrue();
      expect(14 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0015
     * @tc.number SUB_SOFTBUS_PLUS_API_0015
     * @tc.desc   Check conversation interface function set 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(15 > 0).assertTrue();
      expect(15 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0016
     * @tc.number SUB_SOFTBUS_PLUS_API_0016
     * @tc.desc   Check conversation interface function set 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(16 > 0).assertTrue();
      expect(16 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0017
     * @tc.number SUB_SOFTBUS_PLUS_API_0017
     * @tc.desc   Check conversation interface function set 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(17 > 0).assertTrue();
      expect(17 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0018
     * @tc.number SUB_SOFTBUS_PLUS_API_0018
     * @tc.desc   Check conversation interface function set 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(18 > 0).assertTrue();
      expect(18 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0019
     * @tc.number SUB_SOFTBUS_PLUS_API_0019
     * @tc.desc   Check conversation interface function set 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(19 > 0).assertTrue();
      expect(19 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0020
     * @tc.number SUB_SOFTBUS_PLUS_API_0020
     * @tc.desc   Check conversation interface function set 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(20 > 0).assertTrue();
      expect(20 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0021
     * @tc.number SUB_SOFTBUS_PLUS_API_0021
     * @tc.desc   Check conversation interface function set 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(21 > 0).assertTrue();
      expect(21 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0022
     * @tc.number SUB_SOFTBUS_PLUS_API_0022
     * @tc.desc   Check conversation interface function set 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(22 > 0).assertTrue();
      expect(22 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0023
     * @tc.number SUB_SOFTBUS_PLUS_API_0023
     * @tc.desc   Check conversation interface function set 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(23 > 0).assertTrue();
      expect(23 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0024
     * @tc.number SUB_SOFTBUS_PLUS_API_0024
     * @tc.desc   Check conversation interface function set 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(24 > 0).assertTrue();
      expect(24 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0025
     * @tc.number SUB_SOFTBUS_PLUS_API_0025
     * @tc.desc   Check conversation interface function set 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(25 > 0).assertTrue();
      expect(25 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0026
     * @tc.number SUB_SOFTBUS_PLUS_API_0026
     * @tc.desc   Check conversation interface function set 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(26 > 0).assertTrue();
      expect(26 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0027
     * @tc.number SUB_SOFTBUS_PLUS_API_0027
     * @tc.desc   Check conversation interface function set 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(27 > 0).assertTrue();
      expect(27 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0028
     * @tc.number SUB_SOFTBUS_PLUS_API_0028
     * @tc.desc   Check conversation interface function set 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(28 > 0).assertTrue();
      expect(28 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0029
     * @tc.number SUB_SOFTBUS_PLUS_API_0029
     * @tc.desc   Check conversation interface function set 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(29 > 0).assertTrue();
      expect(29 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0030
     * @tc.number SUB_SOFTBUS_PLUS_API_0030
     * @tc.desc   Check conversation interface function set 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(30 > 0).assertTrue();
      expect(30 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0031
     * @tc.number SUB_SOFTBUS_PLUS_API_0031
     * @tc.desc   Check conversation interface function set 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(31 > 0).assertTrue();
      expect(31 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0032
     * @tc.number SUB_SOFTBUS_PLUS_API_0032
     * @tc.desc   Check conversation interface function set 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(32 > 0).assertTrue();
      expect(32 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0033
     * @tc.number SUB_SOFTBUS_PLUS_API_0033
     * @tc.desc   Check conversation interface function set 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(33 > 0).assertTrue();
      expect(33 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0034
     * @tc.number SUB_SOFTBUS_PLUS_API_0034
     * @tc.desc   Check conversation interface function set 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(34 > 0).assertTrue();
      expect(34 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0035
     * @tc.number SUB_SOFTBUS_PLUS_API_0035
     * @tc.desc   Check conversation interface function set 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(35 > 0).assertTrue();
      expect(35 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0036
     * @tc.number SUB_SOFTBUS_PLUS_API_0036
     * @tc.desc   Check conversation interface function set 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(36 > 0).assertTrue();
      expect(36 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0037
     * @tc.number SUB_SOFTBUS_PLUS_API_0037
     * @tc.desc   Check conversation interface function set 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(37 > 0).assertTrue();
      expect(37 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0038
     * @tc.number SUB_SOFTBUS_PLUS_API_0038
     * @tc.desc   Check conversation interface function set 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(38 > 0).assertTrue();
      expect(38 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0039
     * @tc.number SUB_SOFTBUS_PLUS_API_0039
     * @tc.desc   Check conversation interface function set 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(39 > 0).assertTrue();
      expect(39 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0040
     * @tc.number SUB_SOFTBUS_PLUS_API_0040
     * @tc.desc   Check conversation interface function set 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(40 > 0).assertTrue();
      expect(40 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0041
     * @tc.number SUB_SOFTBUS_PLUS_API_0041
     * @tc.desc   Check conversation interface function set 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(41 > 0).assertTrue();
      expect(41 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0042
     * @tc.number SUB_SOFTBUS_PLUS_API_0042
     * @tc.desc   Check conversation interface function set 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(42 > 0).assertTrue();
      expect(42 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0043
     * @tc.number SUB_SOFTBUS_PLUS_API_0043
     * @tc.desc   Check conversation interface function set 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(43 > 0).assertTrue();
      expect(43 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0044
     * @tc.number SUB_SOFTBUS_PLUS_API_0044
     * @tc.desc   Check conversation interface function set 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(44 > 0).assertTrue();
      expect(44 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0045
     * @tc.number SUB_SOFTBUS_PLUS_API_0045
     * @tc.desc   Check conversation interface function set 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(45 > 0).assertTrue();
      expect(45 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0046
     * @tc.number SUB_SOFTBUS_PLUS_API_0046
     * @tc.desc   Check conversation interface function set 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(46 > 0).assertTrue();
      expect(46 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0047
     * @tc.number SUB_SOFTBUS_PLUS_API_0047
     * @tc.desc   Check conversation interface function set 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(47 > 0).assertTrue();
      expect(47 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0048
     * @tc.number SUB_SOFTBUS_PLUS_API_0048
     * @tc.desc   Check conversation interface function set 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(48 > 0).assertTrue();
      expect(48 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0049
     * @tc.number SUB_SOFTBUS_PLUS_API_0049
     * @tc.desc   Check conversation interface function set 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(49 > 0).assertTrue();
      expect(49 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0050
     * @tc.number SUB_SOFTBUS_PLUS_API_0050
     * @tc.desc   Check conversation interface function set 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(50 > 0).assertTrue();
      expect(50 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0051
     * @tc.number SUB_SOFTBUS_PLUS_API_0051
     * @tc.desc   Check conversation interface function set 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(51 > 0).assertTrue();
      expect(51 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0052
     * @tc.number SUB_SOFTBUS_PLUS_API_0052
     * @tc.desc   Check conversation interface function set 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(52 > 0).assertTrue();
      expect(52 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0053
     * @tc.number SUB_SOFTBUS_PLUS_API_0053
     * @tc.desc   Check conversation interface function set 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(53 > 0).assertTrue();
      expect(53 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0054
     * @tc.number SUB_SOFTBUS_PLUS_API_0054
     * @tc.desc   Check conversation interface function set 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(54 > 0).assertTrue();
      expect(54 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0055
     * @tc.number SUB_SOFTBUS_PLUS_API_0055
     * @tc.desc   Check conversation interface function set 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(55 > 0).assertTrue();
      expect(55 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0056
     * @tc.number SUB_SOFTBUS_PLUS_API_0056
     * @tc.desc   Check conversation interface function set 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(56 > 0).assertTrue();
      expect(56 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0057
     * @tc.number SUB_SOFTBUS_PLUS_API_0057
     * @tc.desc   Check conversation interface function set 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(57 > 0).assertTrue();
      expect(57 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0058
     * @tc.number SUB_SOFTBUS_PLUS_API_0058
     * @tc.desc   Check conversation interface function set 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(58 > 0).assertTrue();
      expect(58 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusApi0059
     * @tc.number SUB_SOFTBUS_PLUS_API_0059
     * @tc.desc   Check conversation interface function set 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(59 > 0).assertTrue();
      expect(59 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusApi0060
     * @tc.number SUB_SOFTBUS_PLUS_API_0060
     * @tc.desc   Check conversation interface function set 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApi0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect(60 > 0).assertTrue();
      expect(60 % 2).assertEqual(0);
    })
  })
}
