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
  routeUrl,
  routeFlag,
} from '../model/VPNLogic';

/** PageRouteTest logic checks (6 cases). */
export default function pageRouteTest(): void {
  describe('PageRouteTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_PAGE_ROUTE_0001
     * @tc.name      VPN_PageRoute_0001
     * @tc.desc      page route 0 with success true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_PageRoute_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageRoute_0001 begin`);
      logInfo("routeUrl(0) + ':' + routeFlag(true)");
      const actual: string = routeUrl(0) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StopVpn:Pass");
      expect(actual).assertEqual("pages/StopVpn:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageRoute_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PAGE_ROUTE_0002
     * @tc.name      VPN_PageRoute_0002
     * @tc.desc      page route 1 with success false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PageRoute_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageRoute_0002 begin`);
      logInfo("routeUrl(1) + ':' + routeFlag(false)");
      const actual: string = routeUrl(1) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StartVpn:Error");
      expect(actual).assertEqual("pages/StartVpn:Error");
      logInfo(`${BUNDLE}PageRoute_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PAGE_ROUTE_0003
     * @tc.name      VPN_PageRoute_0003
     * @tc.desc      page route 2 with success true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PageRoute_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageRoute_0003 begin`);
      logInfo("routeUrl(2) + ':' + routeFlag(true)");
      const actual: string = routeUrl(2) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StopVpn:Pass");
      expect(actual).assertEqual("pages/StopVpn:Pass");
      logInfo(`${BUNDLE}PageRoute_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PAGE_ROUTE_0004
     * @tc.name      VPN_PageRoute_0004
     * @tc.desc      page route 0 with success false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PageRoute_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageRoute_0004 begin`);
      logInfo("routeUrl(0) + ':' + routeFlag(false)");
      const actual: string = routeUrl(0) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StopVpn:Error");
      expect(actual).assertEqual("pages/StopVpn:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageRoute_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PAGE_ROUTE_0005
     * @tc.name      VPN_PageRoute_0005
     * @tc.desc      page route 1 with success true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PageRoute_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageRoute_0005 begin`);
      logInfo("routeUrl(1) + ':' + routeFlag(true)");
      const actual: string = routeUrl(1) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StartVpn:Pass");
      expect(actual).assertEqual("pages/StartVpn:Pass");
      logInfo(`${BUNDLE}PageRoute_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PAGE_ROUTE_0006
     * @tc.name      VPN_PageRoute_0006
     * @tc.desc      page route 2 with success false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PageRoute_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageRoute_0006 begin`);
      logInfo("routeUrl(2) + ':' + routeFlag(false)");
      const actual: string = routeUrl(2) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StopVpn:Error");
      expect(actual).assertEqual("pages/StopVpn:Error");
      logInfo(`${BUNDLE}PageRoute_0006 end`);
    });
  });
}
