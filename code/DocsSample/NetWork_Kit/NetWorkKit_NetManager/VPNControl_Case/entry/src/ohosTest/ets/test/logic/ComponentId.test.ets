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
      logInfo(`${BUNDLE}ComponentId_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0008
     * @tc.name      VPN_ComponentId_0008
     * @tc.desc      componentId(7) returns "STOP_VPN_EXT_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0008 begin`);
      logInfo("componentId(7)");
      const actual: string = componentId(7);
      logInfo('actual=' + String(actual) + ', expected=' + "STOP_VPN_EXT_BUTTON");
      expect(actual).assertEqual("STOP_VPN_EXT_BUTTON");
      logInfo(`${BUNDLE}ComponentId_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0009
     * @tc.name      VPN_ComponentId_0009
     * @tc.desc      componentId(8) returns "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0009 begin`);
      logInfo("componentId(8)");
      const actual: string = componentId(8);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ComponentId_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0010
     * @tc.name      VPN_ComponentId_0010
     * @tc.desc      componentId(9) returns "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0010 begin`);
      logInfo("componentId(9)");
      const actual: string = componentId(9);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ComponentId_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0011
     * @tc.name      VPN_ComponentId_0011
     * @tc.desc      componentId(10) returns "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0011 begin`);
      logInfo("componentId(10)");
      const actual: string = componentId(10);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ComponentId_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0012
     * @tc.name      VPN_ComponentId_0012
     * @tc.desc      componentId(11) returns "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ComponentId_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentId_0012 begin`);
      logInfo("componentId(11)");
      const actual: string = componentId(11);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ComponentId_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_COMPONENT_ID_0013
     * @tc.name      VPN_ComponentId_0013
     * @tc.desc      componentId(0) returns "START_VPN_BUTTON".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ComponentId_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentId_0013 begin`);
      logInfo("componentId(0)");
      const actual: string = componentId(0);
      logInfo('actual=' + String(actual) + ', expected=' + "START_VPN_BUTTON");
      expect(actual).assertEqual("START_VPN_BUTTON");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ComponentId_0013 end`);
    });
  });
}
