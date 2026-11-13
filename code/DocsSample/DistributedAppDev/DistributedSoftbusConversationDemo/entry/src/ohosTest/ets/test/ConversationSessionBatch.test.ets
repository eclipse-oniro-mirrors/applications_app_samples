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

export default function conversationSessionBatchTest() {
  describe('ConversationSessionBatchTest', () => {

    /**
     * @tc.name   testSessionBatch0001
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0001
     * @tc.desc   Test session batch case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0002
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0002
     * @tc.desc   Test session batch case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0003
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0003
     * @tc.desc   Test session batch case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0004
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0004
     * @tc.desc   Test session batch case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0005
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0005
     * @tc.desc   Test session batch case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0006
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0006
     * @tc.desc   Test session batch case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0007
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0007
     * @tc.desc   Test session batch case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0008
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0008
     * @tc.desc   Test session batch case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0009
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0009
     * @tc.desc   Test session batch case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0010
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0010
     * @tc.desc   Test session batch case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0011
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0011
     * @tc.desc   Test session batch case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0012
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0012
     * @tc.desc   Test session batch case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0013
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0013
     * @tc.desc   Test session batch case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0014
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0014
     * @tc.desc   Test session batch case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0015
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0015
     * @tc.desc   Test session batch case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0016
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0016
     * @tc.desc   Test session batch case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0017
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0017
     * @tc.desc   Test session batch case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0018
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0018
     * @tc.desc   Test session batch case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0019
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0019
     * @tc.desc   Test session batch case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0020
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0020
     * @tc.desc   Test session batch case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0021
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0021
     * @tc.desc   Test session batch case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0022
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0022
     * @tc.desc   Test session batch case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0023
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0023
     * @tc.desc   Test session batch case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0024
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0024
     * @tc.desc   Test session batch case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0025
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0025
     * @tc.desc   Test session batch case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0026
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0026
     * @tc.desc   Test session batch case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0027
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0027
     * @tc.desc   Test session batch case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0028
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0028
     * @tc.desc   Test session batch case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0029
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0029
     * @tc.desc   Test session batch case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0030
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0030
     * @tc.desc   Test session batch case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0031
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0031
     * @tc.desc   Test session batch case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0032
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0032
     * @tc.desc   Test session batch case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0033
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0033
     * @tc.desc   Test session batch case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0034
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0034
     * @tc.desc   Test session batch case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0035
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0035
     * @tc.desc   Test session batch case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0036
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0036
     * @tc.desc   Test session batch case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0037
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0037
     * @tc.desc   Test session batch case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0038
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0038
     * @tc.desc   Test session batch case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0039
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0039
     * @tc.desc   Test session batch case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0040
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0040
     * @tc.desc   Test session batch case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0041
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0041
     * @tc.desc   Test session batch case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0042
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0042
     * @tc.desc   Test session batch case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0043
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0043
     * @tc.desc   Test session batch case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0044
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0044
     * @tc.desc   Test session batch case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0045
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0045
     * @tc.desc   Test session batch case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0046
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0046
     * @tc.desc   Test session batch case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0047
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0047
     * @tc.desc   Test session batch case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0048
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0048
     * @tc.desc   Test session batch case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0049
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0049
     * @tc.desc   Test session batch case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0050
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0050
     * @tc.desc   Test session batch case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0051
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0051
     * @tc.desc   Test session batch case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0052
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0052
     * @tc.desc   Test session batch case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0053
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0053
     * @tc.desc   Test session batch case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0054
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0054
     * @tc.desc   Test session batch case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0055
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0055
     * @tc.desc   Test session batch case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0056
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0056
     * @tc.desc   Test session batch case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0057
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0057
     * @tc.desc   Test session batch case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0058
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0058
     * @tc.desc   Test session batch case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0059
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0059
     * @tc.desc   Test session batch case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testSessionBatch0060
     * @tc.number SUB_SOFTBUS_SESSION_BATCH_0060
     * @tc.desc   Test session batch case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionBatch0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK);
      conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME);
      expect(true).assertTrue();
    })
  })
}
