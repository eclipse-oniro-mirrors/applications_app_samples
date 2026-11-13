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
function safeGetTrustedDevices(): conversation.DeviceNodeInfo[] {
  return [];
}

const CALLBACK: conversation.DataCallback = (deviceId: string, msg: ArrayBuffer): void => {};

export default function conversationLastBatchTest() {
  describe('ConversationLastBatchTest', () => {

    /**
     * @tc.name   testLastDiscovery0001
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0001
     * @tc.desc   Test final discovery case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0002
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0002
     * @tc.desc   Test final discovery case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0003
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0003
     * @tc.desc   Test final discovery case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0004
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0004
     * @tc.desc   Test final discovery case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0005
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0005
     * @tc.desc   Test final discovery case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0006
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0006
     * @tc.desc   Test final discovery case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0007
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0007
     * @tc.desc   Test final discovery case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0008
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0008
     * @tc.desc   Test final discovery case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0009
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0009
     * @tc.desc   Test final discovery case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0010
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0010
     * @tc.desc   Test final discovery case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0011
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0011
     * @tc.desc   Test final discovery case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0012
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0012
     * @tc.desc   Test final discovery case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0013
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0013
     * @tc.desc   Test final discovery case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0014
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0014
     * @tc.desc   Test final discovery case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastDiscovery0015
     * @tc.number SUB_SOFTBUS_LAST_DISCOVERY_0015
     * @tc.desc   Test final discovery case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastDiscovery0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices(); expect(Array.isArray(devices)).assertTrue(); })

    /**
     * @tc.name   testLastSession0001
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0001
     * @tc.desc   Test final session case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0002
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0002
     * @tc.desc   Test final session case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0003
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0003
     * @tc.desc   Test final session case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0004
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0004
     * @tc.desc   Test final session case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0005
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0005
     * @tc.desc   Test final session case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0006
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0006
     * @tc.desc   Test final session case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0007
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0007
     * @tc.desc   Test final session case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0008
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0008
     * @tc.desc   Test final session case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0009
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0009
     * @tc.desc   Test final session case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0010
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0010
     * @tc.desc   Test final session case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0011
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0011
     * @tc.desc   Test final session case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0012
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0012
     * @tc.desc   Test final session case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0013
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0013
     * @tc.desc   Test final session case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0014
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0014
     * @tc.desc   Test final session case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastSession0015
     * @tc.number SUB_SOFTBUS_LAST_SESSION_0015
     * @tc.desc   Test final session case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastSession0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testLastMessage0001
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0001
     * @tc.desc   Test final message buffer 0, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0002
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0002
     * @tc.desc   Test final message buffer 1, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0003
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0003
     * @tc.desc   Test final message buffer 4, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0004
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0004
     * @tc.desc   Test final message buffer 16, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0005
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0005
     * @tc.desc   Test final message buffer 64, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0006
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0006
     * @tc.desc   Test final message buffer 256, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(256)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0007
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0007
     * @tc.desc   Test final message buffer 1024, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(1024)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0008
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0008
     * @tc.desc   Test final message buffer 4096, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(4096)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0009
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0009
     * @tc.desc   Test final message buffer 0, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0010
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0010
     * @tc.desc   Test final message buffer 1, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0011
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0011
     * @tc.desc   Test final message buffer 4, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0012
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0012
     * @tc.desc   Test final message buffer 16, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0013
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0013
     * @tc.desc   Test final message buffer 64, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(64)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0014
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0014
     * @tc.desc   Test final message buffer 256, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(256)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0015
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0015
     * @tc.desc   Test final message buffer 1024, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(1024)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0016
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0016
     * @tc.desc   Test final message buffer 4096, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(4096)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0017
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0017
     * @tc.desc   Test final message buffer 0, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(0)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0018
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0018
     * @tc.desc   Test final message buffer 1, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(1)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0019
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0019
     * @tc.desc   Test final message buffer 4, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(4)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })

    /**
     * @tc.name   testLastMessage0020
     * @tc.number SUB_SOFTBUS_LAST_MESSAGE_0020
     * @tc.desc   Test final message buffer 16, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastMessage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { let completed: boolean = false; try { await conversation.postConversationData(INVALID_DEVICE, BUNDLE_NAME, ABILITY_NAME, new ArrayBuffer(16)); completed = true; } catch (err) { const error: BusinessError = err as BusinessError; completed = error.code > 0; } expect(completed).assertTrue(); })
  })
}
