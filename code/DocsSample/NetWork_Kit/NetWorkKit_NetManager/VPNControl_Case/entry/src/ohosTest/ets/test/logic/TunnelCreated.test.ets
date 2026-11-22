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
  tunnelCreatedForPage,
  tunnelCreatedForExtension,
} from '../model/VPNLogic';

/** TunnelCreatedTest logic checks (44 cases). */
export default function tunnelCreatedTest(): void {
  describe('TunnelCreatedTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0001
     * @tc.name      VPN_TunnelCreated_0001
     * @tc.desc      tunnel fd -20 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_TunnelCreated_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TunnelCreated_0001 begin`);
      logInfo("tunnelCreatedForPage(-20) + ':' + tunnelCreatedForExtension(-20)");
      const actual: string = tunnelCreatedForPage(-20) + ':' + tunnelCreatedForExtension(-20);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0002
     * @tc.name      VPN_TunnelCreated_0002
     * @tc.desc      tunnel fd -19 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0002 begin`);
      logInfo("tunnelCreatedForPage(-19) + ':' + tunnelCreatedForExtension(-19)");
      const actual: string = tunnelCreatedForPage(-19) + ':' + tunnelCreatedForExtension(-19);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0003
     * @tc.name      VPN_TunnelCreated_0003
     * @tc.desc      tunnel fd -18 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0003 begin`);
      logInfo("tunnelCreatedForPage(-18) + ':' + tunnelCreatedForExtension(-18)");
      const actual: string = tunnelCreatedForPage(-18) + ':' + tunnelCreatedForExtension(-18);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0004
     * @tc.name      VPN_TunnelCreated_0004
     * @tc.desc      tunnel fd -17 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0004 begin`);
      logInfo("tunnelCreatedForPage(-17) + ':' + tunnelCreatedForExtension(-17)");
      const actual: string = tunnelCreatedForPage(-17) + ':' + tunnelCreatedForExtension(-17);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
