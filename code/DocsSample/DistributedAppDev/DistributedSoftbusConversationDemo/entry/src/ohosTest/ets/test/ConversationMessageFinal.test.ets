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

export default function conversationMessageFinalTest() {
  describe('ConversationMessageFinalTest', () => {

    /**
     * @tc.name   testMessageFinal0001
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0001
     * @tc.desc   Test message final matrix buffer 0, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0002
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0002
     * @tc.desc   Test message final matrix buffer 1, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0003
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0003
     * @tc.desc   Test message final matrix buffer 4, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0004
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0004
     * @tc.desc   Test message final matrix buffer 16, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0005
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0005
     * @tc.desc   Test message final matrix buffer 64, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0006
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0006
     * @tc.desc   Test message final matrix buffer 256, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0007
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0007
     * @tc.desc   Test message final matrix buffer 1024, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0008
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0008
     * @tc.desc   Test message final matrix buffer 4096, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4096));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0009
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0009
     * @tc.desc   Test message final matrix buffer 0, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0010
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0010
     * @tc.desc   Test message final matrix buffer 1, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0011
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0011
     * @tc.desc   Test message final matrix buffer 4, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0012
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0012
     * @tc.desc   Test message final matrix buffer 16, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0013
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0013
     * @tc.desc   Test message final matrix buffer 64, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0014
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0014
     * @tc.desc   Test message final matrix buffer 256, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0015
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0015
     * @tc.desc   Test message final matrix buffer 1024, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0016
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0016
     * @tc.desc   Test message final matrix buffer 4096, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4096));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0017
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0017
     * @tc.desc   Test message final matrix buffer 0, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0018
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0018
     * @tc.desc   Test message final matrix buffer 1, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0019
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0019
     * @tc.desc   Test message final matrix buffer 4, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0020
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0020
     * @tc.desc   Test message final matrix buffer 16, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0021
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0021
     * @tc.desc   Test message final matrix buffer 64, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0022
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0022
     * @tc.desc   Test message final matrix buffer 256, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0023
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0023
     * @tc.desc   Test message final matrix buffer 1024, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0024
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0024
     * @tc.desc   Test message final matrix buffer 4096, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4096));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0025
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0025
     * @tc.desc   Test message final matrix buffer 0, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0026
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0026
     * @tc.desc   Test message final matrix buffer 1, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0027
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0027
     * @tc.desc   Test message final matrix buffer 4, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0028
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0028
     * @tc.desc   Test message final matrix buffer 16, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0029
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0029
     * @tc.desc   Test message final matrix buffer 64, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0030
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0030
     * @tc.desc   Test message final matrix buffer 256, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0031
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0031
     * @tc.desc   Test message final matrix buffer 1024, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0032
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0032
     * @tc.desc   Test message final matrix buffer 4096, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4096));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0033
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0033
     * @tc.desc   Test message final matrix buffer 0, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0034
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0034
     * @tc.desc   Test message final matrix buffer 1, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0035
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0035
     * @tc.desc   Test message final matrix buffer 4, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0036
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0036
     * @tc.desc   Test message final matrix buffer 16, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0037
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0037
     * @tc.desc   Test message final matrix buffer 64, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0038
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0038
     * @tc.desc   Test message final matrix buffer 256, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   testMessageFinal0039
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0039
     * @tc.desc   Test message final matrix buffer 1024, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1024));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })

    /**
     * @tc.name   testMessageFinal0040
     * @tc.number SUB_SOFTBUS_MESSAGE_FINAL_0040
     * @tc.desc   Test message final matrix buffer 4096, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageFinal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false;
      try {
        await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4096));
        completed = true;
      } catch (err) {
        const error: BusinessError = err as BusinessError;
        completed = error.code > 0;
      }
      expect(completed).assertTrue();
    })
  })
}
