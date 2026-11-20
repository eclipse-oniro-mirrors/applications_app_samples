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
const BUNDLE_NAME: string = 'com.example.distributedsoftbusconversationdemo';
const ABILITY_NAME: string = 'EntryAbility';
const CALLBACK: conversation.DataCallback = (deviceId: string, msg: ArrayBuffer): void => {};
export default function conversationSessionUltra2Test() {
  describe('ConversationSessionUltra2Test', () => {

    /**
     * @tc.name   testSessionUltra20001
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0001
     * @tc.desc   Test session ultra2 matrix 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20002
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0002
     * @tc.desc   Test session ultra2 matrix 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20003
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0003
     * @tc.desc   Test session ultra2 matrix 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20004
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0004
     * @tc.desc   Test session ultra2 matrix 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20005
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0005
     * @tc.desc   Test session ultra2 matrix 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20006
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0006
     * @tc.desc   Test session ultra2 matrix 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20007
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0007
     * @tc.desc   Test session ultra2 matrix 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20008
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0008
     * @tc.desc   Test session ultra2 matrix 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20009
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0009
     * @tc.desc   Test session ultra2 matrix 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20010
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0010
     * @tc.desc   Test session ultra2 matrix 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20011
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0011
     * @tc.desc   Test session ultra2 matrix 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20012
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0012
     * @tc.desc   Test session ultra2 matrix 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20013
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0013
     * @tc.desc   Test session ultra2 matrix 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20014
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0014
     * @tc.desc   Test session ultra2 matrix 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20015
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0015
     * @tc.desc   Test session ultra2 matrix 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20016
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0016
     * @tc.desc   Test session ultra2 matrix 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20017
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0017
     * @tc.desc   Test session ultra2 matrix 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20018
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0018
     * @tc.desc   Test session ultra2 matrix 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20019
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0019
     * @tc.desc   Test session ultra2 matrix 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20020
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0020
     * @tc.desc   Test session ultra2 matrix 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20021
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0021
     * @tc.desc   Test session ultra2 matrix 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20022
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0022
     * @tc.desc   Test session ultra2 matrix 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20023
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0023
     * @tc.desc   Test session ultra2 matrix 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20024
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0024
     * @tc.desc   Test session ultra2 matrix 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20025
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0025
     * @tc.desc   Test session ultra2 matrix 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20026
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0026
     * @tc.desc   Test session ultra2 matrix 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20027
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0027
     * @tc.desc   Test session ultra2 matrix 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20028
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0028
     * @tc.desc   Test session ultra2 matrix 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20029
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0029
     * @tc.desc   Test session ultra2 matrix 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20030
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0030
     * @tc.desc   Test session ultra2 matrix 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20031
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0031
     * @tc.desc   Test session ultra2 matrix 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20032
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0032
     * @tc.desc   Test session ultra2 matrix 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20033
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0033
     * @tc.desc   Test session ultra2 matrix 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20034
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0034
     * @tc.desc   Test session ultra2 matrix 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20035
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0035
     * @tc.desc   Test session ultra2 matrix 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20036
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0036
     * @tc.desc   Test session ultra2 matrix 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20037
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0037
     * @tc.desc   Test session ultra2 matrix 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20038
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0038
     * @tc.desc   Test session ultra2 matrix 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20039
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0039
     * @tc.desc   Test session ultra2 matrix 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20040
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0040
     * @tc.desc   Test session ultra2 matrix 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20041
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0041
     * @tc.desc   Test session ultra2 matrix 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20042
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0042
     * @tc.desc   Test session ultra2 matrix 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20043
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0043
     * @tc.desc   Test session ultra2 matrix 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20044
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0044
     * @tc.desc   Test session ultra2 matrix 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20045
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0045
     * @tc.desc   Test session ultra2 matrix 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20046
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0046
     * @tc.desc   Test session ultra2 matrix 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20047
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0047
     * @tc.desc   Test session ultra2 matrix 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20048
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0048
     * @tc.desc   Test session ultra2 matrix 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20049
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0049
     * @tc.desc   Test session ultra2 matrix 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })

    /**
     * @tc.name   testSessionUltra20050
     * @tc.number SUB_SOFTBUS_SESSION_ULTRA2_0050
     * @tc.desc   Test session ultra2 matrix 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionUltra20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => { conversation.registerConversationListener(BUNDLE_NAME, ABILITY_NAME, CALLBACK); conversation.unregisterConversationListener(BUNDLE_NAME, ABILITY_NAME); expect(true).assertTrue(); })
  })
}
