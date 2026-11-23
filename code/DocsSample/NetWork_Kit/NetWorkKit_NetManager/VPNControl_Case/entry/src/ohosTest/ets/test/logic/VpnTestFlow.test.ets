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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/VPNTestSupport';
import {
  VpnTestModel,
} from '../model/VPNLogic';

/** VpnTestFlowTest logic checks (6 cases). */
export default function vpnTestFlowTest(): void {
  describe('VpnTestFlowTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_TEST_FLOW_0001
     * @tc.name      VPN_TestFlow_0001
     * @tc.desc      vpn id/destroy helper flow -> vpn-1/false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_TestFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TestFlow_0001 begin`);
      const subject: VpnTestModel = new VpnTestModel();
      logInfo("getVpnId then destroy");
      const actual: string = subject.getVpnId("vpn-1") + ':' + subject.destroy(true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:false");
      expect(actual).assertEqual("vpn-1:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TestFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TEST_FLOW_0002
     * @tc.name      VPN_TestFlow_0002
     * @tc.desc      vpn id/destroy helper flow -> vpn-1/false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TestFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TestFlow_0002 begin`);
      const subject: VpnTestModel = new VpnTestModel();
      logInfo("getVpnId then destroy");
      const actual: string = subject.getVpnId("vpn-1") + ':' + subject.destroy(false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:false");
      expect(actual).assertEqual("vpn-1:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TestFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TEST_FLOW_0003
     * @tc.name      VPN_TestFlow_0003
     * @tc.desc      vpn id/destroy helper flow -> vpn-1/true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TestFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TestFlow_0003 begin`);
      const subject: VpnTestModel = new VpnTestModel();
      logInfo("getVpnId then destroy");
      const actual: string = subject.getVpnId("vpn-1") + ':' + subject.destroy(true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:true");
      expect(actual).assertEqual("vpn-1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TestFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TEST_FLOW_0004
     * @tc.name      VPN_TestFlow_0004
     * @tc.desc      vpn id/destroy helper flow -> vpn-1/false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TestFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TestFlow_0004 begin`);
      const subject: VpnTestModel = new VpnTestModel();
      logInfo("getVpnId then destroy");
      const actual: string = subject.getVpnId("vpn-1") + ':' + subject.destroy(false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:false");
      expect(actual).assertEqual("vpn-1:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TestFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TEST_FLOW_0005
     * @tc.name      VPN_TestFlow_0005
     * @tc.desc      vpn id/destroy helper flow -> vpn-1/true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TestFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TestFlow_0005 begin`);
      const subject: VpnTestModel = new VpnTestModel();
      logInfo("getVpnId then destroy");
      const actual: string = subject.getVpnId("vpn-1") + ':' + subject.destroy(true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:true");
      expect(actual).assertEqual("vpn-1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TestFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TEST_FLOW_0006
     * @tc.name      VPN_TestFlow_0006
     * @tc.desc      vpn id/destroy helper flow -> vpn-1/false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TestFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TestFlow_0006 begin`);
      const subject: VpnTestModel = new VpnTestModel();
      logInfo("getVpnId then destroy");
      const actual: string = subject.getVpnId("vpn-1") + ':' + subject.destroy(false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:false");
      expect(actual).assertEqual("vpn-1:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TestFlow_0006 end`);
    });
  });
}
