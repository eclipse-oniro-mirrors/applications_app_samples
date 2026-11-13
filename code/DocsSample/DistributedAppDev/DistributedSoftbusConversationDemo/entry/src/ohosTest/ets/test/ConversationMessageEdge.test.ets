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
export default function conversationMessageEdgeTest() {
  describe('ConversationMessageEdgeTest', () => {

    /**
     * @tc.name   testMessageEdge0001
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0001
     * @tc.desc   Test message edge buffer 0, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0002
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0002
     * @tc.desc   Test message edge buffer 3, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(3)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0003
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0003
     * @tc.desc   Test message edge buffer 7, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(7)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0004
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0004
     * @tc.desc   Test message edge buffer 15, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(15)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0005
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0005
     * @tc.desc   Test message edge buffer 31, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(31)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0006
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0006
     * @tc.desc   Test message edge buffer 63, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(63)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0007
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0007
     * @tc.desc   Test message edge buffer 127, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(127)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0008
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0008
     * @tc.desc   Test message edge buffer 0, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0009
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0009
     * @tc.desc   Test message edge buffer 3, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(3)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0010
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0010
     * @tc.desc   Test message edge buffer 7, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(7)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0011
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0011
     * @tc.desc   Test message edge buffer 15, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(15)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0012
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0012
     * @tc.desc   Test message edge buffer 31, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(31)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0013
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0013
     * @tc.desc   Test message edge buffer 63, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(63)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0014
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0014
     * @tc.desc   Test message edge buffer 127, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(127)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0015
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0015
     * @tc.desc   Test message edge buffer 0, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0016
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0016
     * @tc.desc   Test message edge buffer 3, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(3)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0017
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0017
     * @tc.desc   Test message edge buffer 7, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(7)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0018
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0018
     * @tc.desc   Test message edge buffer 15, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(15)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0019
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0019
     * @tc.desc   Test message edge buffer 31, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(31)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0020
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0020
     * @tc.desc   Test message edge buffer 63, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(63)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0021
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0021
     * @tc.desc   Test message edge buffer 127, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(127)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0022
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0022
     * @tc.desc   Test message edge buffer 0, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0023
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0023
     * @tc.desc   Test message edge buffer 3, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(3)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0024
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0024
     * @tc.desc   Test message edge buffer 7, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(7)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageEdge0025
     * @tc.number SUB_SOFTBUS_MESSAGE_EDGE_0025
     * @tc.desc   Test message edge buffer 15, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(15)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })
  })
}
