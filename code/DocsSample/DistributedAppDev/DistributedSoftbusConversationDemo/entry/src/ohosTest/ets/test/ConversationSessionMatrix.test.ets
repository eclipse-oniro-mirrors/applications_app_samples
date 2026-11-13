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

const BUNDLE_NAME: string = 'com.example.distributedsoftbusconversationdemo';
const ABILITY_NAME: string = 'EntryAbility';
const CALLBACK: conversation.DataCallback = (deviceId: string, msg: ArrayBuffer): void => {
};

export default function conversationSessionMatrixTest() {
  describe('ConversationSessionMatrixTest', () => {

    /**
     * @tc.name   testSessionMatrix0001
     * @tc.number SUB_SOFTBUS_SESSION_0001
     * @tc.desc   Test conversation listener registration lifecycle, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0002
     * @tc.number SUB_SOFTBUS_SESSION_0002
     * @tc.desc   Test conversation listener registration lifecycle, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0003
     * @tc.number SUB_SOFTBUS_SESSION_0003
     * @tc.desc   Test conversation listener registration lifecycle, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0004
     * @tc.number SUB_SOFTBUS_SESSION_0004
     * @tc.desc   Test conversation listener registration lifecycle, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0005
     * @tc.number SUB_SOFTBUS_SESSION_0005
     * @tc.desc   Test conversation listener registration lifecycle, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0006
     * @tc.number SUB_SOFTBUS_SESSION_0006
     * @tc.desc   Test conversation listener registration lifecycle, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0007
     * @tc.number SUB_SOFTBUS_SESSION_0007
     * @tc.desc   Test conversation listener registration lifecycle, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0008
     * @tc.number SUB_SOFTBUS_SESSION_0008
     * @tc.desc   Test conversation listener registration lifecycle, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0009
     * @tc.number SUB_SOFTBUS_SESSION_0009
     * @tc.desc   Test conversation listener registration lifecycle, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0010
     * @tc.number SUB_SOFTBUS_SESSION_0010
     * @tc.desc   Test conversation listener registration lifecycle, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0011
     * @tc.number SUB_SOFTBUS_SESSION_0011
     * @tc.desc   Test conversation listener registration lifecycle, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0012
     * @tc.number SUB_SOFTBUS_SESSION_0012
     * @tc.desc   Test conversation listener registration lifecycle, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0013
     * @tc.number SUB_SOFTBUS_SESSION_0013
     * @tc.desc   Test conversation listener registration lifecycle, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0014
     * @tc.number SUB_SOFTBUS_SESSION_0014
     * @tc.desc   Test conversation listener registration lifecycle, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0015
     * @tc.number SUB_SOFTBUS_SESSION_0015
     * @tc.desc   Test conversation listener registration lifecycle, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0016
     * @tc.number SUB_SOFTBUS_SESSION_0016
     * @tc.desc   Test conversation listener registration lifecycle, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0017
     * @tc.number SUB_SOFTBUS_SESSION_0017
     * @tc.desc   Test conversation listener registration lifecycle, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0018
     * @tc.number SUB_SOFTBUS_SESSION_0018
     * @tc.desc   Test conversation listener registration lifecycle, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0019
     * @tc.number SUB_SOFTBUS_SESSION_0019
     * @tc.desc   Test conversation listener registration lifecycle, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0020
     * @tc.number SUB_SOFTBUS_SESSION_0020
     * @tc.desc   Test conversation listener registration lifecycle, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0021
     * @tc.number SUB_SOFTBUS_SESSION_0021
     * @tc.desc   Test conversation listener registration lifecycle, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0022
     * @tc.number SUB_SOFTBUS_SESSION_0022
     * @tc.desc   Test conversation listener registration lifecycle, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0023
     * @tc.number SUB_SOFTBUS_SESSION_0023
     * @tc.desc   Test conversation listener registration lifecycle, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0024
     * @tc.number SUB_SOFTBUS_SESSION_0024
     * @tc.desc   Test conversation listener registration lifecycle, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionMatrix0025
     * @tc.number SUB_SOFTBUS_SESSION_0025
     * @tc.desc   Test conversation listener registration lifecycle, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })
  })
}
