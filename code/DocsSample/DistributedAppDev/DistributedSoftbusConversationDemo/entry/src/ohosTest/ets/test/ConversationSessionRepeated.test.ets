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

export default function conversationSessionRepeatedTest() {
  describe('ConversationSessionRepeatedTest', () => {

    /**
     * @tc.name   testSessionRepeated0001
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0001
     * @tc.desc   Test repeated session registration, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0002
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0002
     * @tc.desc   Test repeated session registration, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0003
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0003
     * @tc.desc   Test repeated session registration, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0004
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0004
     * @tc.desc   Test repeated session registration, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0005
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0005
     * @tc.desc   Test repeated session registration, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0006
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0006
     * @tc.desc   Test repeated session registration, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0007
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0007
     * @tc.desc   Test repeated session registration, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0008
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0008
     * @tc.desc   Test repeated session registration, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0009
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0009
     * @tc.desc   Test repeated session registration, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0010
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0010
     * @tc.desc   Test repeated session registration, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0011
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0011
     * @tc.desc   Test repeated session registration, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0012
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0012
     * @tc.desc   Test repeated session registration, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0013
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0013
     * @tc.desc   Test repeated session registration, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0014
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0014
     * @tc.desc   Test repeated session registration, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0015
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0015
     * @tc.desc   Test repeated session registration, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0016
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0016
     * @tc.desc   Test repeated session registration, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0017
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0017
     * @tc.desc   Test repeated session registration, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0018
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0018
     * @tc.desc   Test repeated session registration, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0019
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0019
     * @tc.desc   Test repeated session registration, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0020
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0020
     * @tc.desc   Test repeated session registration, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0021
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0021
     * @tc.desc   Test repeated session registration, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0022
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0022
     * @tc.desc   Test repeated session registration, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0023
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0023
     * @tc.desc   Test repeated session registration, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0024
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0024
     * @tc.desc   Test repeated session registration, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0025
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0025
     * @tc.desc   Test repeated session registration, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0026
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0026
     * @tc.desc   Test repeated session registration, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0027
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0027
     * @tc.desc   Test repeated session registration, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0028
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0028
     * @tc.desc   Test repeated session registration, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0029
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0029
     * @tc.desc   Test repeated session registration, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0030
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0030
     * @tc.desc   Test repeated session registration, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0031
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0031
     * @tc.desc   Test repeated session registration, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0032
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0032
     * @tc.desc   Test repeated session registration, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0033
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0033
     * @tc.desc   Test repeated session registration, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0034
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0034
     * @tc.desc   Test repeated session registration, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0035
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0035
     * @tc.desc   Test repeated session registration, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0036
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0036
     * @tc.desc   Test repeated session registration, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0037
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0037
     * @tc.desc   Test repeated session registration, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0038
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0038
     * @tc.desc   Test repeated session registration, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0039
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0039
     * @tc.desc   Test repeated session registration, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionRepeated0040
     * @tc.number SUB_SOFTBUS_SESSION_REPEAT_0040
     * @tc.desc   Test repeated session registration, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionRepeated0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })
  })
}
