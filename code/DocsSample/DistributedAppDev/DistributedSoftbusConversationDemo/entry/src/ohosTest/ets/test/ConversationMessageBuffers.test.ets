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

export default function conversationMessageBuffersTest() {
  describe('ConversationMessageBuffersTest', () => {

    /**
     * @tc.name   testMessageBuffers0001
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0001
     * @tc.desc   Test message post with 0-byte buffer, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0002
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0002
     * @tc.desc   Test message post with 2-byte buffer, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0003
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0003
     * @tc.desc   Test message post with 16-byte buffer, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0004
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0004
     * @tc.desc   Test message post with 64-byte buffer, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0005
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0005
     * @tc.desc   Test message post with 512-byte buffer, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0006
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0006
     * @tc.desc   Test message post with 2048-byte buffer, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2048));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0007
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0007
     * @tc.desc   Test message post with 0-byte buffer, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0008
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0008
     * @tc.desc   Test message post with 2-byte buffer, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0009
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0009
     * @tc.desc   Test message post with 16-byte buffer, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0010
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0010
     * @tc.desc   Test message post with 64-byte buffer, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0011
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0011
     * @tc.desc   Test message post with 512-byte buffer, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0012
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0012
     * @tc.desc   Test message post with 2048-byte buffer, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2048));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0013
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0013
     * @tc.desc   Test message post with 0-byte buffer, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0014
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0014
     * @tc.desc   Test message post with 2-byte buffer, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0015
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0015
     * @tc.desc   Test message post with 16-byte buffer, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0016
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0016
     * @tc.desc   Test message post with 64-byte buffer, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0017
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0017
     * @tc.desc   Test message post with 512-byte buffer, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0018
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0018
     * @tc.desc   Test message post with 2048-byte buffer, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2048));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0019
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0019
     * @tc.desc   Test message post with 0-byte buffer, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0020
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0020
     * @tc.desc   Test message post with 2-byte buffer, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0021
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0021
     * @tc.desc   Test message post with 16-byte buffer, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0022
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0022
     * @tc.desc   Test message post with 64-byte buffer, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0023
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0023
     * @tc.desc   Test message post with 512-byte buffer, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0024
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0024
     * @tc.desc   Test message post with 2048-byte buffer, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2048));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0025
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0025
     * @tc.desc   Test message post with 0-byte buffer, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0026
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0026
     * @tc.desc   Test message post with 2-byte buffer, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0027
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0027
     * @tc.desc   Test message post with 16-byte buffer, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0028
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0028
     * @tc.desc   Test message post with 64-byte buffer, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0029
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0029
     * @tc.desc   Test message post with 512-byte buffer, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0030
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0030
     * @tc.desc   Test message post with 2048-byte buffer, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2048));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0031
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0031
     * @tc.desc   Test message post with 0-byte buffer, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0032
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0032
     * @tc.desc   Test message post with 2-byte buffer, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0033
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0033
     * @tc.desc   Test message post with 16-byte buffer, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0034
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0034
     * @tc.desc   Test message post with 64-byte buffer, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0035
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0035
     * @tc.desc   Test message post with 512-byte buffer, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0036
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0036
     * @tc.desc   Test message post with 2048-byte buffer, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2048));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageBuffers0037
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0037
     * @tc.desc   Test message post with 0-byte buffer, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0038
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0038
     * @tc.desc   Test message post with 2-byte buffer, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0039
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0039
     * @tc.desc   Test message post with 16-byte buffer, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageBuffers0040
     * @tc.number SUB_SOFTBUS_MESSAGE_BUFFER_0040
     * @tc.desc   Test message post with 64-byte buffer, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageBuffers0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
  })
}
