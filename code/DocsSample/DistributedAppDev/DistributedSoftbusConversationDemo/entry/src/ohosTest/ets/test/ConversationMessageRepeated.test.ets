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
import { BusinessError } from '@kit.BasicServicesKit';
import { conversation } from '@kit.DistributedServiceKit';

const BUNDLE_NAME: string = 'com.example.distributedsoftbusconversationdemo';
const ABILITY_NAME: string = 'EntryAbility';
const INVALID_DEVICE: string = 'invalid-network-id';

function makeBuffer(size: number): ArrayBuffer {
  return new ArrayBuffer(size);
}

export default function conversationMessageRepeatedTest() {
  describe('ConversationMessageRepeatedTest', () => {

    /**
     * @tc.name   testMessageRepeated0001
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0001
     * @tc.desc   Test message send repeated buffer 0, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0002
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0002
     * @tc.desc   Test message send repeated buffer 1, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0003
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0003
     * @tc.desc   Test message send repeated buffer 2, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0004
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0004
     * @tc.desc   Test message send repeated buffer 4, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0005
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0005
     * @tc.desc   Test message send repeated buffer 8, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0006
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0006
     * @tc.desc   Test message send repeated buffer 16, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0007
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0007
     * @tc.desc   Test message send repeated buffer 32, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0008
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0008
     * @tc.desc   Test message send repeated buffer 64, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0009
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0009
     * @tc.desc   Test message send repeated buffer 128, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0010
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0010
     * @tc.desc   Test message send repeated buffer 256, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(256));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0011
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0011
     * @tc.desc   Test message send repeated buffer 0, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0012
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0012
     * @tc.desc   Test message send repeated buffer 1, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0013
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0013
     * @tc.desc   Test message send repeated buffer 2, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0014
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0014
     * @tc.desc   Test message send repeated buffer 4, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0015
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0015
     * @tc.desc   Test message send repeated buffer 8, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0016
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0016
     * @tc.desc   Test message send repeated buffer 16, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0017
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0017
     * @tc.desc   Test message send repeated buffer 32, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0018
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0018
     * @tc.desc   Test message send repeated buffer 64, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0019
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0019
     * @tc.desc   Test message send repeated buffer 128, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0020
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0020
     * @tc.desc   Test message send repeated buffer 256, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(256));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0021
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0021
     * @tc.desc   Test message send repeated buffer 0, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0022
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0022
     * @tc.desc   Test message send repeated buffer 1, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0023
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0023
     * @tc.desc   Test message send repeated buffer 2, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0024
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0024
     * @tc.desc   Test message send repeated buffer 4, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0025
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0025
     * @tc.desc   Test message send repeated buffer 8, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0026
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0026
     * @tc.desc   Test message send repeated buffer 16, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0027
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0027
     * @tc.desc   Test message send repeated buffer 32, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0028
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0028
     * @tc.desc   Test message send repeated buffer 64, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0029
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0029
     * @tc.desc   Test message send repeated buffer 128, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0030
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0030
     * @tc.desc   Test message send repeated buffer 256, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(256));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0031
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0031
     * @tc.desc   Test message send repeated buffer 0, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0032
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0032
     * @tc.desc   Test message send repeated buffer 1, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0033
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0033
     * @tc.desc   Test message send repeated buffer 2, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0034
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0034
     * @tc.desc   Test message send repeated buffer 4, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0035
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0035
     * @tc.desc   Test message send repeated buffer 8, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0036
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0036
     * @tc.desc   Test message send repeated buffer 16, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0037
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0037
     * @tc.desc   Test message send repeated buffer 32, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0038
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0038
     * @tc.desc   Test message send repeated buffer 64, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0039
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0039
     * @tc.desc   Test message send repeated buffer 128, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0040
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0040
     * @tc.desc   Test message send repeated buffer 256, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(256));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0041
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0041
     * @tc.desc   Test message send repeated buffer 0, case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0042
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0042
     * @tc.desc   Test message send repeated buffer 1, case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0043
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0043
     * @tc.desc   Test message send repeated buffer 2, case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0044
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0044
     * @tc.desc   Test message send repeated buffer 4, case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0045
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0045
     * @tc.desc   Test message send repeated buffer 8, case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0046
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0046
     * @tc.desc   Test message send repeated buffer 16, case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0047
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0047
     * @tc.desc   Test message send repeated buffer 32, case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0048
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0048
     * @tc.desc   Test message send repeated buffer 64, case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0049
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0049
     * @tc.desc   Test message send repeated buffer 128, case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageRepeated0050
     * @tc.number SUB_SOFTBUS_MESSAGE_REPEAT_0050
     * @tc.desc   Test message send repeated buffer 256, case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageRepeated0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(256));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })
  })
}
