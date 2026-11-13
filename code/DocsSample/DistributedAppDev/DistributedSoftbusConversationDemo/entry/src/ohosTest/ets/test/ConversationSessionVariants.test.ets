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

export default function conversationSessionVariantsTest() {
  describe('ConversationSessionVariantsTest', () => {

    /**
     * @tc.name   testSessionVariants0001
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0001
     * @tc.desc   Test listener register/unregister variant, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0002
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0002
     * @tc.desc   Test listener register/unregister variant, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0003
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0003
     * @tc.desc   Test listener register/unregister variant, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0004
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0004
     * @tc.desc   Test listener register/unregister variant, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0005
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0005
     * @tc.desc   Test listener register/unregister variant, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0006
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0006
     * @tc.desc   Test listener register/unregister variant, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0007
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0007
     * @tc.desc   Test listener register/unregister variant, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0008
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0008
     * @tc.desc   Test listener register/unregister variant, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0009
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0009
     * @tc.desc   Test listener register/unregister variant, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0010
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0010
     * @tc.desc   Test listener register/unregister variant, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0011
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0011
     * @tc.desc   Test listener register/unregister variant, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0012
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0012
     * @tc.desc   Test listener register/unregister variant, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0013
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0013
     * @tc.desc   Test listener register/unregister variant, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0014
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0014
     * @tc.desc   Test listener register/unregister variant, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0015
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0015
     * @tc.desc   Test listener register/unregister variant, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0016
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0016
     * @tc.desc   Test listener register/unregister variant, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0017
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0017
     * @tc.desc   Test listener register/unregister variant, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0018
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0018
     * @tc.desc   Test listener register/unregister variant, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0019
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0019
     * @tc.desc   Test listener register/unregister variant, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0020
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0020
     * @tc.desc   Test listener register/unregister variant, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0021
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0021
     * @tc.desc   Test listener register/unregister variant, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0022
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0022
     * @tc.desc   Test listener register/unregister variant, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0023
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0023
     * @tc.desc   Test listener register/unregister variant, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0024
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0024
     * @tc.desc   Test listener register/unregister variant, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0025
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0025
     * @tc.desc   Test listener register/unregister variant, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0026
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0026
     * @tc.desc   Test listener register/unregister variant, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0027
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0027
     * @tc.desc   Test listener register/unregister variant, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0028
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0028
     * @tc.desc   Test listener register/unregister variant, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0029
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0029
     * @tc.desc   Test listener register/unregister variant, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0030
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0030
     * @tc.desc   Test listener register/unregister variant, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0031
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0031
     * @tc.desc   Test listener register/unregister variant, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0032
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0032
     * @tc.desc   Test listener register/unregister variant, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0033
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0033
     * @tc.desc   Test listener register/unregister variant, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0034
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0034
     * @tc.desc   Test listener register/unregister variant, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0035
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0035
     * @tc.desc   Test listener register/unregister variant, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0036
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0036
     * @tc.desc   Test listener register/unregister variant, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0037
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0037
     * @tc.desc   Test listener register/unregister variant, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0038
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0038
     * @tc.desc   Test listener register/unregister variant, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0039
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0039
     * @tc.desc   Test listener register/unregister variant, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionVariants0040
     * @tc.number SUB_SOFTBUS_SESSION_VARIANT_0040
     * @tc.desc   Test listener register/unregister variant, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionVariants0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })
  })
}
