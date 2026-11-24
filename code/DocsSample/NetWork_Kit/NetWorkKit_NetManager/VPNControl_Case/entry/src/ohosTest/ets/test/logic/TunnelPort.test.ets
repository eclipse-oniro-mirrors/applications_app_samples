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
  tunnelPortForPage,
} from '../model/VPNLogic';

/** TunnelPortTest logic checks (4 cases). */
export default function tunnelPortTest(): void {
  describe('TunnelPortTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_PORT_0001
     * @tc.name      VPN_TunnelPort_0001
     * @tc.desc      tunnelPortForPage(0) returns 1194.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_TunnelPort_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TunnelPort_0001 begin`);
      logInfo("tunnelPortForPage(0)");
      const actual: number = tunnelPortForPage(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1194");
      expect(actual).assertEqual(1194);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TunnelPort_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_PORT_0002
     * @tc.name      VPN_TunnelPort_0002
     * @tc.desc      tunnelPortForPage(1) returns 8888.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelPort_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelPort_0002 begin`);
      logInfo("tunnelPortForPage(1)");
      const actual: number = tunnelPortForPage(1);
      logInfo('actual=' + String(actual) + ', expected=' + "8888");
      expect(actual).assertEqual(8888);
      logInfo(`${BUNDLE}TunnelPort_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_PORT_0003
     * @tc.name      VPN_TunnelPort_0003
     * @tc.desc      tunnelPortForPage(2) returns 1194.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelPort_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelPort_0003 begin`);
      logInfo("tunnelPortForPage(2)");
      const actual: number = tunnelPortForPage(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1194");
      expect(actual).assertEqual(1194);
      logInfo(`${BUNDLE}TunnelPort_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_PORT_0004
     * @tc.name      VPN_TunnelPort_0004
     * @tc.desc      tunnelPortForPage(3) returns 1194.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelPort_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelPort_0004 begin`);
      logInfo("tunnelPortForPage(3)");
      const actual: number = tunnelPortForPage(3);
      logInfo('actual=' + String(actual) + ', expected=' + "1194");
      expect(actual).assertEqual(1194);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TunnelPort_0004 end`);
    });
  });
}
