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

function createBuffer(size: number, seed: number): ArrayBuffer {
  const buffer: ArrayBuffer = new ArrayBuffer(size);
  const view: Uint8Array = new Uint8Array(buffer);
  for (let i: number = 0; i < size; i++) {
    view[i] = (i + seed) % 256;
  }
  return buffer;
}

export default function conversationMessageExtendedTest() {
  describe('ConversationMessageExtendedTest', () => {

    /**
     * @tc.name   testMessageExtended0001
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0001
     * @tc.desc   Test message post with buffer size 0, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(0, 0));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0002
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0002
     * @tc.desc   Test message post with buffer size 1, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1, 1));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0003
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0003
     * @tc.desc   Test message post with buffer size 8, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(8, 2));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0004
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0004
     * @tc.desc   Test message post with buffer size 32, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(32, 3));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0005
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0005
     * @tc.desc   Test message post with buffer size 256, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(256, 4));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0006
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0006
     * @tc.desc   Test message post with buffer size 1024, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1024, 5));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0007
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0007
     * @tc.desc   Test message post with buffer size 0, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(0, 6));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0008
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0008
     * @tc.desc   Test message post with buffer size 1, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1, 7));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0009
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0009
     * @tc.desc   Test message post with buffer size 8, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(8, 8));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0010
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0010
     * @tc.desc   Test message post with buffer size 32, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(32, 9));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0011
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0011
     * @tc.desc   Test message post with buffer size 256, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(256, 10));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0012
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0012
     * @tc.desc   Test message post with buffer size 1024, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1024, 11));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0013
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0013
     * @tc.desc   Test message post with buffer size 0, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(0, 12));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0014
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0014
     * @tc.desc   Test message post with buffer size 1, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1, 13));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0015
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0015
     * @tc.desc   Test message post with buffer size 8, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(8, 14));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0016
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0016
     * @tc.desc   Test message post with buffer size 32, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(32, 15));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0017
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0017
     * @tc.desc   Test message post with buffer size 256, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(256, 16));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0018
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0018
     * @tc.desc   Test message post with buffer size 1024, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1024, 17));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0019
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0019
     * @tc.desc   Test message post with buffer size 0, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(0, 18));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0020
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0020
     * @tc.desc   Test message post with buffer size 1, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1, 19));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0021
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0021
     * @tc.desc   Test message post with buffer size 8, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(8, 20));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0022
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0022
     * @tc.desc   Test message post with buffer size 32, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(32, 21));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0023
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0023
     * @tc.desc   Test message post with buffer size 256, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(256, 22));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0024
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0024
     * @tc.desc   Test message post with buffer size 1024, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1024, 23));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0025
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0025
     * @tc.desc   Test message post with buffer size 0, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(0, 24));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0026
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0026
     * @tc.desc   Test message post with buffer size 1, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1, 25));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0027
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0027
     * @tc.desc   Test message post with buffer size 8, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(8, 26));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0028
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0028
     * @tc.desc   Test message post with buffer size 32, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(32, 27));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0029
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0029
     * @tc.desc   Test message post with buffer size 256, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(256, 28));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0030
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0030
     * @tc.desc   Test message post with buffer size 1024, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1024, 29));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0031
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0031
     * @tc.desc   Test message post with buffer size 0, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(0, 30));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0032
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0032
     * @tc.desc   Test message post with buffer size 1, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1, 31));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0033
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0033
     * @tc.desc   Test message post with buffer size 8, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(8, 32));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0034
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0034
     * @tc.desc   Test message post with buffer size 32, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(32, 33));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0035
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0035
     * @tc.desc   Test message post with buffer size 256, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(256, 34));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0036
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0036
     * @tc.desc   Test message post with buffer size 1024, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1024, 35));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0037
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0037
     * @tc.desc   Test message post with buffer size 0, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(0, 36));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0038
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0038
     * @tc.desc   Test message post with buffer size 1, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(1, 37));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0039
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0039
     * @tc.desc   Test message post with buffer size 8, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(8, 38));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageExtended0040
     * @tc.number SUB_SOFTBUS_MESSAGE_EXT_0040
     * @tc.desc   Test message post with buffer size 32, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageExtended0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer(32, 39));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })
  })
}
