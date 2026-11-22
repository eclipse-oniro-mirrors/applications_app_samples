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
  componentId,
} from '../model/VPNLogic';

/** ComponentIdTest logic checks (13 cases). */
export default function componentIdTest(): void {
  describe('ComponentIdTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0001
     * @tc.name      VPN_ComponentId_0001
     * @tc.desc      componentId(1) returns "STOP_VPN_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ComponentId_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentId_0001 begin`);
      logInfo("componentId(1)");
      const actual: string = componentId(1);
      logInfo('actual=' + String(actual) + ', expected=' + "STOP_VPN_BUTTON");
      expect(actual).assertEqual("STOP_VPN_BUTTON");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ComponentId_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0002
     * @tc.name      VPN_ComponentId_0002
     * @tc.desc      componentId(-1) returns "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0002 begin`);
      logInfo("componentId(-1)");
      const actual: string = componentId(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ComponentId_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0003
     * @tc.name      VPN_ComponentId_0003
     * @tc.desc      componentId(2) returns "CREATE_TUNNEL_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0003 begin`);
      logInfo("componentId(2)");
      const actual: string = componentId(2);
      logInfo('actual=' + String(actual) + ', expected=' + "CREATE_TUNNEL_BUTTON");
      expect(actual).assertEqual("CREATE_TUNNEL_BUTTON");
      logInfo(`${BUNDLE}ComponentId_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0004
     * @tc.name      VPN_ComponentId_0004
     * @tc.desc      componentId(3) returns "PROTECT_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0004 begin`);
      logInfo("componentId(3)");
      const actual: string = componentId(3);
      logInfo('actual=' + String(actual) + ', expected=' + "PROTECT_BUTTON");
      expect(actual).assertEqual("PROTECT_BUTTON");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ComponentId_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0005
     * @tc.name      VPN_ComponentId_0005
     * @tc.desc      componentId(4) returns "SETUP_VPN_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0005 begin`);
      logInfo("componentId(4)");
      const actual: string = componentId(4);
      logInfo('actual=' + String(actual) + ', expected=' + "SETUP_VPN_BUTTON");
      expect(actual).assertEqual("SETUP_VPN_BUTTON");
      logInfo(`${BUNDLE}ComponentId_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0006
     * @tc.name      VPN_ComponentId_0006
     * @tc.desc      componentId(5) returns "START_VPN_EXT_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0006 begin`);
      logInfo("componentId(5)");
      const actual: string = componentId(5);
      logInfo('actual=' + String(actual) + ', expected=' + "START_VPN_EXT_BUTTON");
      expect(actual).assertEqual("START_VPN_EXT_BUTTON");
      logInfo(`${BUNDLE}ComponentId_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0007
     * @tc.name      VPN_ComponentId_0007
     * @tc.desc      componentId(6) returns "INNER_STOP_VPN_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0007 begin`);
      logInfo("componentId(6)");
      const actual: string = componentId(6);
      logInfo('actual=' + String(actual) + ', expected=' + "INNER_STOP_VPN_BUTTON");
      expect(actual).assertEqual("INNER_STOP_VPN_BUTTON");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
