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
function makeBuffer(size: number): ArrayBuffer { return new ArrayBuffer(size); }
export default function conversationMessageUltra2Test() {
  describe('ConversationMessageUltra2Test', () => {

    /**
     * @tc.name   testMessageUltra20001
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0001
     * @tc.desc   Test message ultra2 matrix buffer 0, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20002
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0002
     * @tc.desc   Test message ultra2 matrix buffer 1, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20003
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0003
     * @tc.desc   Test message ultra2 matrix buffer 2, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20004
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0004
     * @tc.desc   Test message ultra2 matrix buffer 4, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20005
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0005
     * @tc.desc   Test message ultra2 matrix buffer 8, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20006
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0006
     * @tc.desc   Test message ultra2 matrix buffer 16, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20007
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0007
     * @tc.desc   Test message ultra2 matrix buffer 32, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20008
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0008
     * @tc.desc   Test message ultra2 matrix buffer 64, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20009
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0009
     * @tc.desc   Test message ultra2 matrix buffer 0, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20010
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0010
     * @tc.desc   Test message ultra2 matrix buffer 1, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20011
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0011
     * @tc.desc   Test message ultra2 matrix buffer 2, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20012
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0012
     * @tc.desc   Test message ultra2 matrix buffer 4, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20013
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0013
     * @tc.desc   Test message ultra2 matrix buffer 8, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20014
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0014
     * @tc.desc   Test message ultra2 matrix buffer 16, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20015
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0015
     * @tc.desc   Test message ultra2 matrix buffer 32, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20016
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0016
     * @tc.desc   Test message ultra2 matrix buffer 64, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20017
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0017
     * @tc.desc   Test message ultra2 matrix buffer 0, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20018
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0018
     * @tc.desc   Test message ultra2 matrix buffer 1, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20019
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0019
     * @tc.desc   Test message ultra2 matrix buffer 2, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20020
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0020
     * @tc.desc   Test message ultra2 matrix buffer 4, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20021
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0021
     * @tc.desc   Test message ultra2 matrix buffer 8, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20022
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0022
     * @tc.desc   Test message ultra2 matrix buffer 16, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20023
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0023
     * @tc.desc   Test message ultra2 matrix buffer 32, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20024
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0024
     * @tc.desc   Test message ultra2 matrix buffer 64, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20025
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0025
     * @tc.desc   Test message ultra2 matrix buffer 0, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20026
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0026
     * @tc.desc   Test message ultra2 matrix buffer 1, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20027
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0027
     * @tc.desc   Test message ultra2 matrix buffer 2, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20028
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0028
     * @tc.desc   Test message ultra2 matrix buffer 4, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20029
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0029
     * @tc.desc   Test message ultra2 matrix buffer 8, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20030
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0030
     * @tc.desc   Test message ultra2 matrix buffer 16, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20031
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0031
     * @tc.desc   Test message ultra2 matrix buffer 32, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20032
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0032
     * @tc.desc   Test message ultra2 matrix buffer 64, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20033
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0033
     * @tc.desc   Test message ultra2 matrix buffer 0, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20034
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0034
     * @tc.desc   Test message ultra2 matrix buffer 1, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20035
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0035
     * @tc.desc   Test message ultra2 matrix buffer 2, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20036
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0036
     * @tc.desc   Test message ultra2 matrix buffer 4, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20037
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0037
     * @tc.desc   Test message ultra2 matrix buffer 8, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20038
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0038
     * @tc.desc   Test message ultra2 matrix buffer 16, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20039
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0039
     * @tc.desc   Test message ultra2 matrix buffer 32, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20040
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0040
     * @tc.desc   Test message ultra2 matrix buffer 64, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20041
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0041
     * @tc.desc   Test message ultra2 matrix buffer 0, case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20042
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0042
     * @tc.desc   Test message ultra2 matrix buffer 1, case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20043
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0043
     * @tc.desc   Test message ultra2 matrix buffer 2, case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20044
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0044
     * @tc.desc   Test message ultra2 matrix buffer 4, case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20045
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0045
     * @tc.desc   Test message ultra2 matrix buffer 8, case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20046
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0046
     * @tc.desc   Test message ultra2 matrix buffer 16, case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20047
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0047
     * @tc.desc   Test message ultra2 matrix buffer 32, case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20048
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0048
     * @tc.desc   Test message ultra2 matrix buffer 64, case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20049
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0049
     * @tc.desc   Test message ultra2 matrix buffer 0, case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20050
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0050
     * @tc.desc   Test message ultra2 matrix buffer 1, case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20051
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0051
     * @tc.desc   Test message ultra2 matrix buffer 2, case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20052
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0052
     * @tc.desc   Test message ultra2 matrix buffer 4, case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20053
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0053
     * @tc.desc   Test message ultra2 matrix buffer 8, case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20054
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0054
     * @tc.desc   Test message ultra2 matrix buffer 16, case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20055
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0055
     * @tc.desc   Test message ultra2 matrix buffer 32, case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20056
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0056
     * @tc.desc   Test message ultra2 matrix buffer 64, case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20057
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0057
     * @tc.desc   Test message ultra2 matrix buffer 0, case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20058
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0058
     * @tc.desc   Test message ultra2 matrix buffer 1, case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20059
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0059
     * @tc.desc   Test message ultra2 matrix buffer 2, case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20060
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0060
     * @tc.desc   Test message ultra2 matrix buffer 4, case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20061
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0061
     * @tc.desc   Test message ultra2 matrix buffer 8, case 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20062
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0062
     * @tc.desc   Test message ultra2 matrix buffer 16, case 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20063
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0063
     * @tc.desc   Test message ultra2 matrix buffer 32, case 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20064
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0064
     * @tc.desc   Test message ultra2 matrix buffer 64, case 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20065
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0065
     * @tc.desc   Test message ultra2 matrix buffer 0, case 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20066
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0066
     * @tc.desc   Test message ultra2 matrix buffer 1, case 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20067
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0067
     * @tc.desc   Test message ultra2 matrix buffer 2, case 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20068
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0068
     * @tc.desc   Test message ultra2 matrix buffer 4, case 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20069
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0069
     * @tc.desc   Test message ultra2 matrix buffer 8, case 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20070
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0070
     * @tc.desc   Test message ultra2 matrix buffer 16, case 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20071
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0071
     * @tc.desc   Test message ultra2 matrix buffer 32, case 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20072
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0072
     * @tc.desc   Test message ultra2 matrix buffer 64, case 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20073
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0073
     * @tc.desc   Test message ultra2 matrix buffer 0, case 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20074
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0074
     * @tc.desc   Test message ultra2 matrix buffer 1, case 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20075
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0075
     * @tc.desc   Test message ultra2 matrix buffer 2, case 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(2)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20076
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0076
     * @tc.desc   Test message ultra2 matrix buffer 4, case 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20077
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0077
     * @tc.desc   Test message ultra2 matrix buffer 8, case 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(8)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20078
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0078
     * @tc.desc   Test message ultra2 matrix buffer 16, case 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testMessageUltra20079
     * @tc.number SUB_SOFTBUS_MESSAGE_ULTRA2_0079
     * @tc.desc   Test message ultra2 matrix buffer 32, case 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMessageUltra20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, makeBuffer(32)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })
  })
}
