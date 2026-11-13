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

export default function conversationSessionExtendedTest() {
  describe('ConversationSessionExtendedTest', () => {

    /**
     * @tc.name   testSessionExtended0001
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0001
     * @tc.desc   Test repeated listener register/unregister cycles, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0002
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0002
     * @tc.desc   Test repeated listener register/unregister cycles, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0003
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0003
     * @tc.desc   Test repeated listener register/unregister cycles, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0004
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0004
     * @tc.desc   Test repeated listener register/unregister cycles, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0005
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0005
     * @tc.desc   Test repeated listener register/unregister cycles, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0006
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0006
     * @tc.desc   Test repeated listener register/unregister cycles, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0007
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0007
     * @tc.desc   Test repeated listener register/unregister cycles, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0008
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0008
     * @tc.desc   Test repeated listener register/unregister cycles, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0009
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0009
     * @tc.desc   Test repeated listener register/unregister cycles, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0010
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0010
     * @tc.desc   Test repeated listener register/unregister cycles, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0011
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0011
     * @tc.desc   Test repeated listener register/unregister cycles, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0012
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0012
     * @tc.desc   Test repeated listener register/unregister cycles, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0013
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0013
     * @tc.desc   Test repeated listener register/unregister cycles, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0014
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0014
     * @tc.desc   Test repeated listener register/unregister cycles, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0015
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0015
     * @tc.desc   Test repeated listener register/unregister cycles, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0016
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0016
     * @tc.desc   Test repeated listener register/unregister cycles, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0017
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0017
     * @tc.desc   Test repeated listener register/unregister cycles, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0018
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0018
     * @tc.desc   Test repeated listener register/unregister cycles, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0019
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0019
     * @tc.desc   Test repeated listener register/unregister cycles, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0020
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0020
     * @tc.desc   Test repeated listener register/unregister cycles, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0021
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0021
     * @tc.desc   Test repeated listener register/unregister cycles, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0022
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0022
     * @tc.desc   Test repeated listener register/unregister cycles, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0023
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0023
     * @tc.desc   Test repeated listener register/unregister cycles, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0024
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0024
     * @tc.desc   Test repeated listener register/unregister cycles, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0025
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0025
     * @tc.desc   Test repeated listener register/unregister cycles, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0026
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0026
     * @tc.desc   Test repeated listener register/unregister cycles, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0027
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0027
     * @tc.desc   Test repeated listener register/unregister cycles, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0028
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0028
     * @tc.desc   Test repeated listener register/unregister cycles, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0029
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0029
     * @tc.desc   Test repeated listener register/unregister cycles, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionExtended0030
     * @tc.number SUB_SOFTBUS_SESSION_EXT_0030
     * @tc.desc   Test repeated listener register/unregister cycles, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionExtended0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })
  })
}
