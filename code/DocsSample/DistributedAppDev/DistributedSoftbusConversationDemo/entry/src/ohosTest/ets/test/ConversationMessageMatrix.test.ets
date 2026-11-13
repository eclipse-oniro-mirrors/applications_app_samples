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
const MESSAGE: string = 'Hello from ConversationTest!';

function createBuffer(text: string): ArrayBuffer {
  const buffer: ArrayBuffer = new ArrayBuffer(text.length);
  const view: Uint8Array = new Uint8Array(buffer);
  for (let i: number = 0; i < text.length; i++) {
    view[i] = text.charCodeAt(i);
  }
  return buffer;
}

export default function conversationMessageMatrixTest() {
  describe('ConversationMessageMatrixTest', () => {

    /**
     * @tc.name   testMessageMatrix0001
     * @tc.number SUB_SOFTBUS_MESSAGE_0001
     * @tc.desc   Test message posting to an unavailable device, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-0'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0002
     * @tc.number SUB_SOFTBUS_MESSAGE_0002
     * @tc.desc   Test message posting to an unavailable device, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-1'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0003
     * @tc.number SUB_SOFTBUS_MESSAGE_0003
     * @tc.desc   Test message posting to an unavailable device, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-2'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0004
     * @tc.number SUB_SOFTBUS_MESSAGE_0004
     * @tc.desc   Test message posting to an unavailable device, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-3'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0005
     * @tc.number SUB_SOFTBUS_MESSAGE_0005
     * @tc.desc   Test message posting to an unavailable device, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-4'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0006
     * @tc.number SUB_SOFTBUS_MESSAGE_0006
     * @tc.desc   Test message posting to an unavailable device, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-5'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0007
     * @tc.number SUB_SOFTBUS_MESSAGE_0007
     * @tc.desc   Test message posting to an unavailable device, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-6'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0008
     * @tc.number SUB_SOFTBUS_MESSAGE_0008
     * @tc.desc   Test message posting to an unavailable device, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-7'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0009
     * @tc.number SUB_SOFTBUS_MESSAGE_0009
     * @tc.desc   Test message posting to an unavailable device, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-8'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0010
     * @tc.number SUB_SOFTBUS_MESSAGE_0010
     * @tc.desc   Test message posting to an unavailable device, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-9'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0011
     * @tc.number SUB_SOFTBUS_MESSAGE_0011
     * @tc.desc   Test message posting to an unavailable device, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-10'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0012
     * @tc.number SUB_SOFTBUS_MESSAGE_0012
     * @tc.desc   Test message posting to an unavailable device, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-11'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0013
     * @tc.number SUB_SOFTBUS_MESSAGE_0013
     * @tc.desc   Test message posting to an unavailable device, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-12'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0014
     * @tc.number SUB_SOFTBUS_MESSAGE_0014
     * @tc.desc   Test message posting to an unavailable device, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-13'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0015
     * @tc.number SUB_SOFTBUS_MESSAGE_0015
     * @tc.desc   Test message posting to an unavailable device, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-14'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0016
     * @tc.number SUB_SOFTBUS_MESSAGE_0016
     * @tc.desc   Test message posting to an unavailable device, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-15'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0017
     * @tc.number SUB_SOFTBUS_MESSAGE_0017
     * @tc.desc   Test message posting to an unavailable device, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-16'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0018
     * @tc.number SUB_SOFTBUS_MESSAGE_0018
     * @tc.desc   Test message posting to an unavailable device, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-17'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0019
     * @tc.number SUB_SOFTBUS_MESSAGE_0019
     * @tc.desc   Test message posting to an unavailable device, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-18'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0020
     * @tc.number SUB_SOFTBUS_MESSAGE_0020
     * @tc.desc   Test message posting to an unavailable device, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-19'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0021
     * @tc.number SUB_SOFTBUS_MESSAGE_0021
     * @tc.desc   Test message posting to an unavailable device, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-20'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0022
     * @tc.number SUB_SOFTBUS_MESSAGE_0022
     * @tc.desc   Test message posting to an unavailable device, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-21'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0023
     * @tc.number SUB_SOFTBUS_MESSAGE_0023
     * @tc.desc   Test message posting to an unavailable device, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-22'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0024
     * @tc.number SUB_SOFTBUS_MESSAGE_0024
     * @tc.desc   Test message posting to an unavailable device, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-23'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })

    /**
     * @tc.name   testMessageMatrix0025
     * @tc.number SUB_SOFTBUS_MESSAGE_0025
     * @tc.desc   Test message posting to an unavailable device, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let settled: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, createBuffer('Hello-24'));
        settled = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        settled = error.code > 0;
      }
      expect(settled).assertTrue();
    })
  })
}
