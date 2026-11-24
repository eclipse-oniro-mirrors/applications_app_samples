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
  PageRouteModel,
} from '../model/VPNLogic';

/** PageRouteFlowTest logic checks (6 cases). */
export default function pageRouteFlowTest(): void {
  describe('PageRouteFlowTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_FLOW_0001
     * @tc.name      VPN_RouteFlow_0001
     * @tc.desc      route page 0 success true -> Pass.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_RouteFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteFlow_0001 begin`);
      const subject: PageRouteModel = new PageRouteModel();
      logInfo("push page=0 ok=true");
      const actual: string = subject.push(0, true) + ':' + subject.currentRoute();
      logInfo('actual=' + String(actual) + ', expected=' + "Pass:pages/StopVpn");
      expect(actual).assertEqual("Pass:pages/StopVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_FLOW_0002
     * @tc.name      VPN_RouteFlow_0002
     * @tc.desc      route page 1 success false -> Error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteFlow_0002 begin`);
      const subject: PageRouteModel = new PageRouteModel();
      logInfo("push page=1 ok=false");
      const actual: string = subject.push(1, false) + ':' + subject.currentRoute();
      logInfo('actual=' + String(actual) + ', expected=' + "Error:pages/StartVpn");
      expect(actual).assertEqual("Error:pages/StartVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_FLOW_0003
     * @tc.name      VPN_RouteFlow_0003
     * @tc.desc      route page 2 success true -> Pass.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteFlow_0003 begin`);
      const subject: PageRouteModel = new PageRouteModel();
      logInfo("push page=2 ok=true");
      const actual: string = subject.push(2, true) + ':' + subject.currentRoute();
      logInfo('actual=' + String(actual) + ', expected=' + "Pass:pages/StopVpn");
      expect(actual).assertEqual("Pass:pages/StopVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_FLOW_0004
     * @tc.name      VPN_RouteFlow_0004
     * @tc.desc      route page 0 success false -> Error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteFlow_0004 begin`);
      const subject: PageRouteModel = new PageRouteModel();
      logInfo("push page=0 ok=false");
      const actual: string = subject.push(0, false) + ':' + subject.currentRoute();
      logInfo('actual=' + String(actual) + ', expected=' + "Error:pages/StopVpn");
      expect(actual).assertEqual("Error:pages/StopVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_FLOW_0005
     * @tc.name      VPN_RouteFlow_0005
     * @tc.desc      route page 1 success true -> Pass.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteFlow_0005 begin`);
      const subject: PageRouteModel = new PageRouteModel();
      logInfo("push page=1 ok=true");
      const actual: string = subject.push(1, true) + ':' + subject.currentRoute();
      logInfo('actual=' + String(actual) + ', expected=' + "Pass:pages/StartVpn");
      expect(actual).assertEqual("Pass:pages/StartVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_FLOW_0006
     * @tc.name      VPN_RouteFlow_0006
     * @tc.desc      route page 2 success false -> Error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteFlow_0006 begin`);
      const subject: PageRouteModel = new PageRouteModel();
      logInfo("push page=2 ok=false");
      const actual: string = subject.push(2, false) + ':' + subject.currentRoute();
      logInfo('actual=' + String(actual) + ', expected=' + "Error:pages/StopVpn");
      expect(actual).assertEqual("Error:pages/StopVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteFlow_0006 end`);
    });
  });
}
