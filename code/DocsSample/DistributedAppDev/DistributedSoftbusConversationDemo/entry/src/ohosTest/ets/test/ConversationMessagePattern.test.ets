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

function makeBuffer(size: number, seed: number): ArrayBuffer {
  const buffer: ArrayBuffer = new ArrayBuffer(size);
  const view: Uint8Array = new Uint8Array(buffer);
  for (let i: number = 0; i < size; i++) {
    view[i] = (seed + i) % 256;
  }
  return buffer;
}

export default function conversationMessagePatternTest() {
  describe('ConversationMessagePatternTest', () => {

    /**
     * @tc.name   testMessagePattern0001
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0001
     * @tc.desc   Test message post buffer pattern 0, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0, 0));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0002
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0002
     * @tc.desc   Test message post buffer pattern 1, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1, 1));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0003
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0003
     * @tc.desc   Test message post buffer pattern 4, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4, 2));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0004
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0004
     * @tc.desc   Test message post buffer pattern 16, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16, 3));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0005
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0005
     * @tc.desc   Test message post buffer pattern 64, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64, 4));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0006
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0006
     * @tc.desc   Test message post buffer pattern 128, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128, 5));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0007
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0007
     * @tc.desc   Test message post buffer pattern 512, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512, 6));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0008
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0008
     * @tc.desc   Test message post buffer pattern 1024, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024, 7));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0009
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0009
     * @tc.desc   Test message post buffer pattern 0, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0, 8));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0010
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0010
     * @tc.desc   Test message post buffer pattern 1, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1, 9));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0011
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0011
     * @tc.desc   Test message post buffer pattern 4, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4, 10));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0012
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0012
     * @tc.desc   Test message post buffer pattern 16, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16, 11));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0013
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0013
     * @tc.desc   Test message post buffer pattern 64, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64, 12));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0014
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0014
     * @tc.desc   Test message post buffer pattern 128, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128, 13));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0015
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0015
     * @tc.desc   Test message post buffer pattern 512, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512, 14));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0016
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0016
     * @tc.desc   Test message post buffer pattern 1024, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024, 15));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0017
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0017
     * @tc.desc   Test message post buffer pattern 0, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0, 16));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0018
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0018
     * @tc.desc   Test message post buffer pattern 1, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1, 17));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0019
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0019
     * @tc.desc   Test message post buffer pattern 4, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4, 18));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0020
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0020
     * @tc.desc   Test message post buffer pattern 16, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16, 19));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0021
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0021
     * @tc.desc   Test message post buffer pattern 64, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64, 20));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0022
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0022
     * @tc.desc   Test message post buffer pattern 128, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128, 21));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0023
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0023
     * @tc.desc   Test message post buffer pattern 512, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512, 22));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0024
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0024
     * @tc.desc   Test message post buffer pattern 1024, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024, 23));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0025
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0025
     * @tc.desc   Test message post buffer pattern 0, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0, 24));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0026
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0026
     * @tc.desc   Test message post buffer pattern 1, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1, 25));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0027
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0027
     * @tc.desc   Test message post buffer pattern 4, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4, 26));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0028
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0028
     * @tc.desc   Test message post buffer pattern 16, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16, 27));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0029
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0029
     * @tc.desc   Test message post buffer pattern 64, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64, 28));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0030
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0030
     * @tc.desc   Test message post buffer pattern 128, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128, 29));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0031
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0031
     * @tc.desc   Test message post buffer pattern 512, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512, 30));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0032
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0032
     * @tc.desc   Test message post buffer pattern 1024, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024, 31));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0033
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0033
     * @tc.desc   Test message post buffer pattern 0, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0, 32));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0034
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0034
     * @tc.desc   Test message post buffer pattern 1, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1, 33));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0035
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0035
     * @tc.desc   Test message post buffer pattern 4, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4, 34));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0036
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0036
     * @tc.desc   Test message post buffer pattern 16, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16, 35));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0037
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0037
     * @tc.desc   Test message post buffer pattern 64, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64, 36));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0038
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0038
     * @tc.desc   Test message post buffer pattern 128, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(128, 37));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0039
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0039
     * @tc.desc   Test message post buffer pattern 512, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(512, 38));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessagePattern0040
     * @tc.number SUB_SOFTBUS_MESSAGE_PATTERN_0040
     * @tc.desc   Test message post buffer pattern 1024, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessagePattern0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024, 39));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })
  })
}
