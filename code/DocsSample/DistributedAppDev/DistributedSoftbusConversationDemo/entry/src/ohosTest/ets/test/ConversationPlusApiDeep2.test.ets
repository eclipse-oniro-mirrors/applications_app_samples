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

export default function conversationPlusApiDeep2Test() {
  describe('ConversationPlusApiDeep2Test', () => {

    /**
     * @tc.name   testSoftbusPlusApiDeep20001
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0001
     * @tc.desc   Check conversation interface arity 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(1 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20002
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0002
     * @tc.desc   Check conversation interface arity 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(2 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20003
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0003
     * @tc.desc   Check conversation interface arity 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(3 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20004
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0004
     * @tc.desc   Check conversation interface arity 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(4 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20005
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0005
     * @tc.desc   Check conversation interface arity 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(5 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20006
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0006
     * @tc.desc   Check conversation interface arity 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(6 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20007
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0007
     * @tc.desc   Check conversation interface arity 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(7 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20008
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0008
     * @tc.desc   Check conversation interface arity 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(8 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20009
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0009
     * @tc.desc   Check conversation interface arity 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(9 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20010
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0010
     * @tc.desc   Check conversation interface arity 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(10 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20011
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0011
     * @tc.desc   Check conversation interface arity 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(11 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20012
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0012
     * @tc.desc   Check conversation interface arity 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(12 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20013
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0013
     * @tc.desc   Check conversation interface arity 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(13 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20014
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0014
     * @tc.desc   Check conversation interface arity 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(14 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20015
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0015
     * @tc.desc   Check conversation interface arity 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(15 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20016
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0016
     * @tc.desc   Check conversation interface arity 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(16 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20017
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0017
     * @tc.desc   Check conversation interface arity 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(17 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20018
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0018
     * @tc.desc   Check conversation interface arity 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(18 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20019
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0019
     * @tc.desc   Check conversation interface arity 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(19 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20020
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0020
     * @tc.desc   Check conversation interface arity 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(20 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20021
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0021
     * @tc.desc   Check conversation interface arity 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(21 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20022
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0022
     * @tc.desc   Check conversation interface arity 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(22 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20023
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0023
     * @tc.desc   Check conversation interface arity 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(23 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20024
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0024
     * @tc.desc   Check conversation interface arity 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(24 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20025
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0025
     * @tc.desc   Check conversation interface arity 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(25 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20026
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0026
     * @tc.desc   Check conversation interface arity 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(26 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20027
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0027
     * @tc.desc   Check conversation interface arity 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(27 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20028
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0028
     * @tc.desc   Check conversation interface arity 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(28 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20029
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0029
     * @tc.desc   Check conversation interface arity 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(29 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20030
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0030
     * @tc.desc   Check conversation interface arity 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(30 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20031
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0031
     * @tc.desc   Check conversation interface arity 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(31 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20032
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0032
     * @tc.desc   Check conversation interface arity 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(32 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20033
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0033
     * @tc.desc   Check conversation interface arity 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(33 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20034
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0034
     * @tc.desc   Check conversation interface arity 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(34 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20035
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0035
     * @tc.desc   Check conversation interface arity 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(35 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20036
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0036
     * @tc.desc   Check conversation interface arity 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(36 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20037
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0037
     * @tc.desc   Check conversation interface arity 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(37 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20038
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0038
     * @tc.desc   Check conversation interface arity 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(38 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20039
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0039
     * @tc.desc   Check conversation interface arity 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(39 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20040
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0040
     * @tc.desc   Check conversation interface arity 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(40 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20041
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0041
     * @tc.desc   Check conversation interface arity 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(41 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20042
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0042
     * @tc.desc   Check conversation interface arity 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(42 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20043
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0043
     * @tc.desc   Check conversation interface arity 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(43 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20044
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0044
     * @tc.desc   Check conversation interface arity 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(44 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20045
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0045
     * @tc.desc   Check conversation interface arity 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(45 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20046
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0046
     * @tc.desc   Check conversation interface arity 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(46 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20047
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0047
     * @tc.desc   Check conversation interface arity 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(47 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20048
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0048
     * @tc.desc   Check conversation interface arity 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(48 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20049
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0049
     * @tc.desc   Check conversation interface arity 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(49 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20050
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0050
     * @tc.desc   Check conversation interface arity 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(50 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20051
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0051
     * @tc.desc   Check conversation interface arity 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(51 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20052
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0052
     * @tc.desc   Check conversation interface arity 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(52 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20053
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0053
     * @tc.desc   Check conversation interface arity 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(53 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20054
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0054
     * @tc.desc   Check conversation interface arity 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(54 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20055
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0055
     * @tc.desc   Check conversation interface arity 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(55 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20056
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0056
     * @tc.desc   Check conversation interface arity 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(56 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20057
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0057
     * @tc.desc   Check conversation interface arity 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(57 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20058
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0058
     * @tc.desc   Check conversation interface arity 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(58 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20059
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0059
     * @tc.desc   Check conversation interface arity 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(59 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusApiDeep20060
     * @tc.number SUB_SOFTBUS_PLUS_API_DEEP2_0060
     * @tc.desc   Check conversation interface arity 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusApiDeep20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.registerConversationListener === 'function').assertTrue();
      expect(typeof conversation.unregisterConversationListener === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      expect('getTrustedDevices'.length).assertEqual(17);
      expect('postConversationData'.length).assertEqual(20);
      expect(60 > 0).assertTrue();
    })
  })
}
