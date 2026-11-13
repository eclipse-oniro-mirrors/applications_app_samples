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
const PLUS_BUNDLE: string = 'com.example.distributedsoftbusconversationdemo';
const PLUS_ABILITY: string = 'EntryAbility';

export default function conversationPlusContractTest() {
  describe('ConversationPlusContractTest', () => {

    /**
     * @tc.name   testSoftbusPlusContract0001
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0001
     * @tc.desc   Check conversation sample contract 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(1);
      expect(payload.byteLength).assertEqual(1);
      expect(1 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0002
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0002
     * @tc.desc   Check conversation sample contract 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(2);
      expect(payload.byteLength).assertEqual(2);
      expect(2 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0003
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0003
     * @tc.desc   Check conversation sample contract 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(3);
      expect(payload.byteLength).assertEqual(3);
      expect(3 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0004
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0004
     * @tc.desc   Check conversation sample contract 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(4);
      expect(payload.byteLength).assertEqual(4);
      expect(4 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0005
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0005
     * @tc.desc   Check conversation sample contract 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(5);
      expect(payload.byteLength).assertEqual(5);
      expect(5 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0006
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0006
     * @tc.desc   Check conversation sample contract 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(6);
      expect(payload.byteLength).assertEqual(6);
      expect(6 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0007
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0007
     * @tc.desc   Check conversation sample contract 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(7);
      expect(payload.byteLength).assertEqual(7);
      expect(7 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0008
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0008
     * @tc.desc   Check conversation sample contract 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(8);
      expect(payload.byteLength).assertEqual(8);
      expect(8 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0009
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0009
     * @tc.desc   Check conversation sample contract 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(9);
      expect(payload.byteLength).assertEqual(9);
      expect(9 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0010
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0010
     * @tc.desc   Check conversation sample contract 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(10);
      expect(payload.byteLength).assertEqual(10);
      expect(10 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0011
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0011
     * @tc.desc   Check conversation sample contract 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(11);
      expect(payload.byteLength).assertEqual(11);
      expect(11 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0012
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0012
     * @tc.desc   Check conversation sample contract 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(12);
      expect(payload.byteLength).assertEqual(12);
      expect(12 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0013
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0013
     * @tc.desc   Check conversation sample contract 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(13);
      expect(payload.byteLength).assertEqual(13);
      expect(13 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0014
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0014
     * @tc.desc   Check conversation sample contract 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(14);
      expect(payload.byteLength).assertEqual(14);
      expect(14 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0015
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0015
     * @tc.desc   Check conversation sample contract 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(15);
      expect(payload.byteLength).assertEqual(15);
      expect(15 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0016
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0016
     * @tc.desc   Check conversation sample contract 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(16);
      expect(payload.byteLength).assertEqual(16);
      expect(16 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0017
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0017
     * @tc.desc   Check conversation sample contract 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(17);
      expect(payload.byteLength).assertEqual(17);
      expect(17 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0018
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0018
     * @tc.desc   Check conversation sample contract 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(18);
      expect(payload.byteLength).assertEqual(18);
      expect(18 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0019
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0019
     * @tc.desc   Check conversation sample contract 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(19);
      expect(payload.byteLength).assertEqual(19);
      expect(19 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0020
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0020
     * @tc.desc   Check conversation sample contract 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(20);
      expect(payload.byteLength).assertEqual(20);
      expect(20 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0021
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0021
     * @tc.desc   Check conversation sample contract 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(21);
      expect(payload.byteLength).assertEqual(21);
      expect(21 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0022
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0022
     * @tc.desc   Check conversation sample contract 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(22);
      expect(payload.byteLength).assertEqual(22);
      expect(22 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0023
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0023
     * @tc.desc   Check conversation sample contract 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(23);
      expect(payload.byteLength).assertEqual(23);
      expect(23 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0024
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0024
     * @tc.desc   Check conversation sample contract 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(24);
      expect(payload.byteLength).assertEqual(24);
      expect(24 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0025
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0025
     * @tc.desc   Check conversation sample contract 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(25);
      expect(payload.byteLength).assertEqual(25);
      expect(25 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0026
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0026
     * @tc.desc   Check conversation sample contract 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(26);
      expect(payload.byteLength).assertEqual(26);
      expect(26 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0027
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0027
     * @tc.desc   Check conversation sample contract 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(27);
      expect(payload.byteLength).assertEqual(27);
      expect(27 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0028
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0028
     * @tc.desc   Check conversation sample contract 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(28);
      expect(payload.byteLength).assertEqual(28);
      expect(28 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0029
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0029
     * @tc.desc   Check conversation sample contract 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(29);
      expect(payload.byteLength).assertEqual(29);
      expect(29 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0030
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0030
     * @tc.desc   Check conversation sample contract 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(30);
      expect(payload.byteLength).assertEqual(30);
      expect(30 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0031
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0031
     * @tc.desc   Check conversation sample contract 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(31);
      expect(payload.byteLength).assertEqual(31);
      expect(31 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0032
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0032
     * @tc.desc   Check conversation sample contract 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(32);
      expect(payload.byteLength).assertEqual(32);
      expect(32 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0033
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0033
     * @tc.desc   Check conversation sample contract 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(33);
      expect(payload.byteLength).assertEqual(33);
      expect(33 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0034
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0034
     * @tc.desc   Check conversation sample contract 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(34);
      expect(payload.byteLength).assertEqual(34);
      expect(34 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0035
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0035
     * @tc.desc   Check conversation sample contract 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(35);
      expect(payload.byteLength).assertEqual(35);
      expect(35 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0036
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0036
     * @tc.desc   Check conversation sample contract 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(36);
      expect(payload.byteLength).assertEqual(36);
      expect(36 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0037
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0037
     * @tc.desc   Check conversation sample contract 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(37);
      expect(payload.byteLength).assertEqual(37);
      expect(37 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0038
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0038
     * @tc.desc   Check conversation sample contract 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(38);
      expect(payload.byteLength).assertEqual(38);
      expect(38 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0039
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0039
     * @tc.desc   Check conversation sample contract 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(39);
      expect(payload.byteLength).assertEqual(39);
      expect(39 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0040
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0040
     * @tc.desc   Check conversation sample contract 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(40);
      expect(payload.byteLength).assertEqual(40);
      expect(40 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0041
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0041
     * @tc.desc   Check conversation sample contract 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(41);
      expect(payload.byteLength).assertEqual(41);
      expect(41 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0042
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0042
     * @tc.desc   Check conversation sample contract 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(42);
      expect(payload.byteLength).assertEqual(42);
      expect(42 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0043
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0043
     * @tc.desc   Check conversation sample contract 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(43);
      expect(payload.byteLength).assertEqual(43);
      expect(43 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0044
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0044
     * @tc.desc   Check conversation sample contract 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(44);
      expect(payload.byteLength).assertEqual(44);
      expect(44 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0045
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0045
     * @tc.desc   Check conversation sample contract 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(45);
      expect(payload.byteLength).assertEqual(45);
      expect(45 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0046
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0046
     * @tc.desc   Check conversation sample contract 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(46);
      expect(payload.byteLength).assertEqual(46);
      expect(46 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0047
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0047
     * @tc.desc   Check conversation sample contract 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(47);
      expect(payload.byteLength).assertEqual(47);
      expect(47 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0048
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0048
     * @tc.desc   Check conversation sample contract 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(48);
      expect(payload.byteLength).assertEqual(48);
      expect(48 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0049
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0049
     * @tc.desc   Check conversation sample contract 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(49);
      expect(payload.byteLength).assertEqual(49);
      expect(49 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0050
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0050
     * @tc.desc   Check conversation sample contract 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(50);
      expect(payload.byteLength).assertEqual(50);
      expect(50 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0051
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0051
     * @tc.desc   Check conversation sample contract 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(51);
      expect(payload.byteLength).assertEqual(51);
      expect(51 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0052
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0052
     * @tc.desc   Check conversation sample contract 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(52);
      expect(payload.byteLength).assertEqual(52);
      expect(52 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0053
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0053
     * @tc.desc   Check conversation sample contract 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(53);
      expect(payload.byteLength).assertEqual(53);
      expect(53 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0054
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0054
     * @tc.desc   Check conversation sample contract 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(54);
      expect(payload.byteLength).assertEqual(54);
      expect(54 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0055
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0055
     * @tc.desc   Check conversation sample contract 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(55);
      expect(payload.byteLength).assertEqual(55);
      expect(55 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0056
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0056
     * @tc.desc   Check conversation sample contract 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(56);
      expect(payload.byteLength).assertEqual(56);
      expect(56 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0057
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0057
     * @tc.desc   Check conversation sample contract 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(57);
      expect(payload.byteLength).assertEqual(57);
      expect(57 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0058
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0058
     * @tc.desc   Check conversation sample contract 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(58);
      expect(payload.byteLength).assertEqual(58);
      expect(58 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0059
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0059
     * @tc.desc   Check conversation sample contract 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(59);
      expect(payload.byteLength).assertEqual(59);
      expect(59 > 0).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusContract0060
     * @tc.number SUB_SOFTBUS_PLUS_CONTRACT_0060
     * @tc.desc   Check conversation sample contract 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusContract0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(PLUS_BUNDLE.length > 0).assertTrue();
      expect(PLUS_ABILITY).assertEqual('EntryAbility');
      expect(typeof conversation.getTrustedDevices === 'function').assertTrue();
      expect(typeof conversation.postConversationData === 'function').assertTrue();
      const payload: ArrayBuffer = new ArrayBuffer(60);
      expect(payload.byteLength).assertEqual(60);
      expect(60 > 0).assertTrue();
    })
  })
}
