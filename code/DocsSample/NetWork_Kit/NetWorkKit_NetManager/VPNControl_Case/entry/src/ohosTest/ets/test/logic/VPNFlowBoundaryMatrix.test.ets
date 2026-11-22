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
  VpnFlowModel,
} from '../model/VPNLogic';

/** VPNFlowBoundaryMatrixTest logic checks (450 cases). */
export default function vpnFlowBoundaryMatrixTest(): void {
  describe('VPNFlowBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0001
     * @tc.name      VPN_FlowBoundary_0001
     * @tc.desc      vpn flow boundary -5,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0001 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -5,true,false,false");
      const actual: string = subject.run(-5, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn--5|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn--5|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0002
     * @tc.name      VPN_FlowBoundary_0002
     * @tc.desc      vpn flow boundary -4,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0002 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -4,false,true,true");
      const actual: string = subject.run(-4, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0003
     * @tc.name      VPN_FlowBoundary_0003
     * @tc.desc      vpn flow boundary -3,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0003 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -3,true,true,true");
      const actual: string = subject.run(-3, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn--3|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn--3|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0004
     * @tc.name      VPN_FlowBoundary_0004
     * @tc.desc      vpn flow boundary -2,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0004 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -2,false,false,true");
      const actual: string = subject.run(-2, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0005
     * @tc.name      VPN_FlowBoundary_0005
     * @tc.desc      vpn flow boundary -1,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0005 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -1,true,true,true");
      const actual: string = subject.run(-1, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn--1|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn--1|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0006
     * @tc.name      VPN_FlowBoundary_0006
     * @tc.desc      vpn flow boundary 0,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0006 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 0,false,true,false");
      const actual: string = subject.run(0, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "create-failed||false|Error|CreateTunnel Fail");
      expect(actual).assertEqual("create-failed||false|Error|CreateTunnel Fail");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0007
     * @tc.name      VPN_FlowBoundary_0007
     * @tc.desc      vpn flow boundary 1,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0007 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 1,true,false,true");
      const actual: string = subject.run(1, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-1|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-1|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0008
     * @tc.name      VPN_FlowBoundary_0008
     * @tc.desc      vpn flow boundary 2,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0008 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 2,false,true,true");
      const actual: string = subject.run(2, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0009
     * @tc.name      VPN_FlowBoundary_0009
     * @tc.desc      vpn flow boundary 3,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0009 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 3,true,true,true");
      const actual: string = subject.run(3, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-3|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-3|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0010
     * @tc.name      VPN_FlowBoundary_0010
     * @tc.desc      vpn flow boundary 4,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0010 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 4,false,false,true");
      const actual: string = subject.run(4, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0011
     * @tc.name      VPN_FlowBoundary_0011
     * @tc.desc      vpn flow boundary 5,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0011 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 5,true,true,false");
      const actual: string = subject.run(5, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-5|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-5|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0012
     * @tc.name      VPN_FlowBoundary_0012
     * @tc.desc      vpn flow boundary 6,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0012 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 6,false,true,true");
      const actual: string = subject.run(6, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0013
     * @tc.name      VPN_FlowBoundary_0013
     * @tc.desc      vpn flow boundary 7,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0013 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 7,true,false,true");
      const actual: string = subject.run(7, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-7|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-7|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0014
     * @tc.name      VPN_FlowBoundary_0014
     * @tc.desc      vpn flow boundary 8,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0014 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 8,false,true,true");
      const actual: string = subject.run(8, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0015
     * @tc.name      VPN_FlowBoundary_0015
     * @tc.desc      vpn flow boundary 9,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0015 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 9,true,true,true");
      const actual: string = subject.run(9, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-9|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-9|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0016
     * @tc.name      VPN_FlowBoundary_0016
     * @tc.desc      vpn flow boundary 10,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0016 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 10,false,false,false");
      const actual: string = subject.run(10, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0017
     * @tc.name      VPN_FlowBoundary_0017
     * @tc.desc      vpn flow boundary 11,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0017 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 11,true,true,true");
      const actual: string = subject.run(11, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-11|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-11|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0018
     * @tc.name      VPN_FlowBoundary_0018
     * @tc.desc      vpn flow boundary 12,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0018 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 12,false,true,true");
      const actual: string = subject.run(12, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0019
     * @tc.name      VPN_FlowBoundary_0019
     * @tc.desc      vpn flow boundary 13,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0019 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 13,true,false,true");
      const actual: string = subject.run(13, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-13|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-13|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0020
     * @tc.name      VPN_FlowBoundary_0020
     * @tc.desc      vpn flow boundary 14,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0020 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 14,false,true,true");
      const actual: string = subject.run(14, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0021
     * @tc.name      VPN_FlowBoundary_0021
     * @tc.desc      vpn flow boundary 15,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0021 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 15,true,true,false");
      const actual: string = subject.run(15, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-15|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-15|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0022
     * @tc.name      VPN_FlowBoundary_0022
     * @tc.desc      vpn flow boundary 16,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0022 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 16,false,false,true");
      const actual: string = subject.run(16, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0023
     * @tc.name      VPN_FlowBoundary_0023
     * @tc.desc      vpn flow boundary 17,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0023 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 17,true,true,true");
      const actual: string = subject.run(17, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-17|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-17|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0024
     * @tc.name      VPN_FlowBoundary_0024
     * @tc.desc      vpn flow boundary 18,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0024 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 18,false,true,true");
      const actual: string = subject.run(18, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0025
     * @tc.name      VPN_FlowBoundary_0025
     * @tc.desc      vpn flow boundary 19,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0025 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 19,true,false,true");
      const actual: string = subject.run(19, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-19|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-19|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0026
     * @tc.name      VPN_FlowBoundary_0026
     * @tc.desc      vpn flow boundary 20,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0026 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 20,false,true,false");
      const actual: string = subject.run(20, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0027
     * @tc.name      VPN_FlowBoundary_0027
     * @tc.desc      vpn flow boundary 21,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0027 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 21,true,true,true");
      const actual: string = subject.run(21, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-21|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-21|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0028
     * @tc.name      VPN_FlowBoundary_0028
     * @tc.desc      vpn flow boundary 22,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0028 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 22,false,false,true");
      const actual: string = subject.run(22, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0029
     * @tc.name      VPN_FlowBoundary_0029
     * @tc.desc      vpn flow boundary 23,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0029 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 23,true,true,true");
      const actual: string = subject.run(23, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-23|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-23|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0030
     * @tc.name      VPN_FlowBoundary_0030
     * @tc.desc      vpn flow boundary 24,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0030 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 24,false,true,true");
      const actual: string = subject.run(24, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0031
     * @tc.name      VPN_FlowBoundary_0031
     * @tc.desc      vpn flow boundary 25,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0031 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 25,true,false,false");
      const actual: string = subject.run(25, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-25|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-25|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0032
     * @tc.name      VPN_FlowBoundary_0032
     * @tc.desc      vpn flow boundary 26,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0032 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 26,false,true,true");
      const actual: string = subject.run(26, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0033
     * @tc.name      VPN_FlowBoundary_0033
     * @tc.desc      vpn flow boundary 27,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0033 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 27,true,true,true");
      const actual: string = subject.run(27, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-27|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-27|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0034
     * @tc.name      VPN_FlowBoundary_0034
     * @tc.desc      vpn flow boundary 28,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0034 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 28,false,false,true");
      const actual: string = subject.run(28, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0035
     * @tc.name      VPN_FlowBoundary_0035
     * @tc.desc      vpn flow boundary 29,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0035 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 29,true,true,true");
      const actual: string = subject.run(29, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-29|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-29|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0036
     * @tc.name      VPN_FlowBoundary_0036
     * @tc.desc      vpn flow boundary 30,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0036 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 30,false,true,false");
      const actual: string = subject.run(30, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0037
     * @tc.name      VPN_FlowBoundary_0037
     * @tc.desc      vpn flow boundary 31,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0037 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 31,true,false,true");
      const actual: string = subject.run(31, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-31|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-31|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0038
     * @tc.name      VPN_FlowBoundary_0038
     * @tc.desc      vpn flow boundary 32,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0038 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 32,false,true,true");
      const actual: string = subject.run(32, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0039
     * @tc.name      VPN_FlowBoundary_0039
     * @tc.desc      vpn flow boundary 33,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0039 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 33,true,true,true");
      const actual: string = subject.run(33, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-33|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-33|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0040
     * @tc.name      VPN_FlowBoundary_0040
     * @tc.desc      vpn flow boundary 34,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0040 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 34,false,false,true");
      const actual: string = subject.run(34, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0041
     * @tc.name      VPN_FlowBoundary_0041
     * @tc.desc      vpn flow boundary 35,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0041 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 35,true,true,false");
      const actual: string = subject.run(35, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-35|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-35|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0042
     * @tc.name      VPN_FlowBoundary_0042
     * @tc.desc      vpn flow boundary 36,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0042 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 36,false,true,true");
      const actual: string = subject.run(36, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0043
     * @tc.name      VPN_FlowBoundary_0043
     * @tc.desc      vpn flow boundary 37,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0043 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 37,true,false,true");
      const actual: string = subject.run(37, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-37|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-37|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0044
     * @tc.name      VPN_FlowBoundary_0044
     * @tc.desc      vpn flow boundary 38,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0044 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 38,false,true,true");
      const actual: string = subject.run(38, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0044 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0045
     * @tc.name      VPN_FlowBoundary_0045
     * @tc.desc      vpn flow boundary 39,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0045 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 39,true,true,true");
      const actual: string = subject.run(39, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-39|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-39|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0045 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0046
     * @tc.name      VPN_FlowBoundary_0046
     * @tc.desc      vpn flow boundary 40,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0046 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 40,false,false,false");
      const actual: string = subject.run(40, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0046 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0047
     * @tc.name      VPN_FlowBoundary_0047
     * @tc.desc      vpn flow boundary 41,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0047 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 41,true,true,true");
      const actual: string = subject.run(41, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-41|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-41|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0047 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0048
     * @tc.name      VPN_FlowBoundary_0048
     * @tc.desc      vpn flow boundary 42,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0048 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 42,false,true,true");
      const actual: string = subject.run(42, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0048 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0049
     * @tc.name      VPN_FlowBoundary_0049
     * @tc.desc      vpn flow boundary 43,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0049 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 43,true,false,true");
      const actual: string = subject.run(43, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-43|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-43|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0049 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0050
     * @tc.name      VPN_FlowBoundary_0050
     * @tc.desc      vpn flow boundary 44,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0050 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 44,false,true,true");
      const actual: string = subject.run(44, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0050 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0051
     * @tc.name      VPN_FlowBoundary_0051
     * @tc.desc      vpn flow boundary 45,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0051 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 45,true,true,false");
      const actual: string = subject.run(45, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-45|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-45|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0051 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0052
     * @tc.name      VPN_FlowBoundary_0052
     * @tc.desc      vpn flow boundary 46,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0052 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 46,false,false,true");
      const actual: string = subject.run(46, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0052 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0053
     * @tc.name      VPN_FlowBoundary_0053
     * @tc.desc      vpn flow boundary 47,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0053 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 47,true,true,true");
      const actual: string = subject.run(47, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-47|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-47|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0053 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0054
     * @tc.name      VPN_FlowBoundary_0054
     * @tc.desc      vpn flow boundary 48,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0054 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 48,false,true,true");
      const actual: string = subject.run(48, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0054 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0055
     * @tc.name      VPN_FlowBoundary_0055
     * @tc.desc      vpn flow boundary 49,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0055 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 49,true,false,true");
      const actual: string = subject.run(49, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-49|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-49|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0055 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0056
     * @tc.name      VPN_FlowBoundary_0056
     * @tc.desc      vpn flow boundary 50,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0056 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 50,false,true,false");
      const actual: string = subject.run(50, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0056 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0057
     * @tc.name      VPN_FlowBoundary_0057
     * @tc.desc      vpn flow boundary 51,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0057 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 51,true,true,true");
      const actual: string = subject.run(51, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-51|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-51|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0057 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0058
     * @tc.name      VPN_FlowBoundary_0058
     * @tc.desc      vpn flow boundary 52,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0058 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 52,false,false,true");
      const actual: string = subject.run(52, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0058 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0059
     * @tc.name      VPN_FlowBoundary_0059
     * @tc.desc      vpn flow boundary 53,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0059 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 53,true,true,true");
      const actual: string = subject.run(53, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-53|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-53|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0059 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0060
     * @tc.name      VPN_FlowBoundary_0060
     * @tc.desc      vpn flow boundary 54,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0060 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 54,false,true,true");
      const actual: string = subject.run(54, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0060 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0061
     * @tc.name      VPN_FlowBoundary_0061
     * @tc.desc      vpn flow boundary 55,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0061 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 55,true,false,false");
      const actual: string = subject.run(55, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-55|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-55|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0061 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0062
     * @tc.name      VPN_FlowBoundary_0062
     * @tc.desc      vpn flow boundary 56,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0062 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 56,false,true,true");
      const actual: string = subject.run(56, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0062 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0063
     * @tc.name      VPN_FlowBoundary_0063
     * @tc.desc      vpn flow boundary 57,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0063 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 57,true,true,true");
      const actual: string = subject.run(57, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-57|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-57|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0063 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0064
     * @tc.name      VPN_FlowBoundary_0064
     * @tc.desc      vpn flow boundary 58,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0064 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 58,false,false,true");
      const actual: string = subject.run(58, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0064 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0065
     * @tc.name      VPN_FlowBoundary_0065
     * @tc.desc      vpn flow boundary 59,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0065 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 59,true,true,true");
      const actual: string = subject.run(59, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-59|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-59|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0065 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0066
     * @tc.name      VPN_FlowBoundary_0066
     * @tc.desc      vpn flow boundary 60,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0066 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 60,false,true,false");
      const actual: string = subject.run(60, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0066 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0067
     * @tc.name      VPN_FlowBoundary_0067
     * @tc.desc      vpn flow boundary 61,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0067 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 61,true,false,true");
      const actual: string = subject.run(61, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-61|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-61|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0067 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0068
     * @tc.name      VPN_FlowBoundary_0068
     * @tc.desc      vpn flow boundary 62,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0068 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 62,false,true,true");
      const actual: string = subject.run(62, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0068 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0069
     * @tc.name      VPN_FlowBoundary_0069
     * @tc.desc      vpn flow boundary 63,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0069 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 63,true,true,true");
      const actual: string = subject.run(63, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-63|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-63|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0069 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0070
     * @tc.name      VPN_FlowBoundary_0070
     * @tc.desc      vpn flow boundary 64,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0070 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 64,false,false,true");
      const actual: string = subject.run(64, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0070 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0071
     * @tc.name      VPN_FlowBoundary_0071
     * @tc.desc      vpn flow boundary 65,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0071 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 65,true,true,false");
      const actual: string = subject.run(65, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-65|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-65|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0071 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0072
     * @tc.name      VPN_FlowBoundary_0072
     * @tc.desc      vpn flow boundary 66,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0072 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 66,false,true,true");
      const actual: string = subject.run(66, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0072 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0073
     * @tc.name      VPN_FlowBoundary_0073
     * @tc.desc      vpn flow boundary 67,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0073 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 67,true,false,true");
      const actual: string = subject.run(67, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-67|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-67|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0073 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0074
     * @tc.name      VPN_FlowBoundary_0074
     * @tc.desc      vpn flow boundary 68,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0074 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 68,false,true,true");
      const actual: string = subject.run(68, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0074 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0075
     * @tc.name      VPN_FlowBoundary_0075
     * @tc.desc      vpn flow boundary 69,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0075 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 69,true,true,true");
      const actual: string = subject.run(69, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-69|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-69|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0075 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0076
     * @tc.name      VPN_FlowBoundary_0076
     * @tc.desc      vpn flow boundary 70,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0076 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 70,false,false,false");
      const actual: string = subject.run(70, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0076 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0077
     * @tc.name      VPN_FlowBoundary_0077
     * @tc.desc      vpn flow boundary 71,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0077 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 71,true,true,true");
      const actual: string = subject.run(71, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-71|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-71|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0077 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0078
     * @tc.name      VPN_FlowBoundary_0078
     * @tc.desc      vpn flow boundary 72,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0078 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 72,false,true,true");
      const actual: string = subject.run(72, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0078 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0079
     * @tc.name      VPN_FlowBoundary_0079
     * @tc.desc      vpn flow boundary 73,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0079 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 73,true,false,true");
      const actual: string = subject.run(73, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-73|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-73|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0079 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0080
     * @tc.name      VPN_FlowBoundary_0080
     * @tc.desc      vpn flow boundary 74,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0080 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 74,false,true,true");
      const actual: string = subject.run(74, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0080 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0081
     * @tc.name      VPN_FlowBoundary_0081
     * @tc.desc      vpn flow boundary 75,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0081 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 75,true,true,false");
      const actual: string = subject.run(75, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-75|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-75|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0081 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0082
     * @tc.name      VPN_FlowBoundary_0082
     * @tc.desc      vpn flow boundary 76,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0082 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 76,false,false,true");
      const actual: string = subject.run(76, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0082 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0083
     * @tc.name      VPN_FlowBoundary_0083
     * @tc.desc      vpn flow boundary 77,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0083 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 77,true,true,true");
      const actual: string = subject.run(77, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-77|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-77|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0083 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0084
     * @tc.name      VPN_FlowBoundary_0084
     * @tc.desc      vpn flow boundary 78,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0084 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 78,false,true,true");
      const actual: string = subject.run(78, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0084 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0085
     * @tc.name      VPN_FlowBoundary_0085
     * @tc.desc      vpn flow boundary 79,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0085 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 79,true,false,true");
      const actual: string = subject.run(79, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-79|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-79|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0085 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0086
     * @tc.name      VPN_FlowBoundary_0086
     * @tc.desc      vpn flow boundary 80,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0086 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 80,false,true,false");
      const actual: string = subject.run(80, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0086 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0087
     * @tc.name      VPN_FlowBoundary_0087
     * @tc.desc      vpn flow boundary 81,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0087 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 81,true,true,true");
      const actual: string = subject.run(81, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-81|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-81|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0087 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0088
     * @tc.name      VPN_FlowBoundary_0088
     * @tc.desc      vpn flow boundary 82,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0088 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 82,false,false,true");
      const actual: string = subject.run(82, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0088 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0089
     * @tc.name      VPN_FlowBoundary_0089
     * @tc.desc      vpn flow boundary 83,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0089 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 83,true,true,true");
      const actual: string = subject.run(83, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-83|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-83|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0089 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0090
     * @tc.name      VPN_FlowBoundary_0090
     * @tc.desc      vpn flow boundary 84,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0090 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 84,false,true,true");
      const actual: string = subject.run(84, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0090 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0091
     * @tc.name      VPN_FlowBoundary_0091
     * @tc.desc      vpn flow boundary 85,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0091 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 85,true,false,false");
      const actual: string = subject.run(85, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-85|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-85|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0091 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0092
     * @tc.name      VPN_FlowBoundary_0092
     * @tc.desc      vpn flow boundary 86,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0092 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 86,false,true,true");
      const actual: string = subject.run(86, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0092 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0093
     * @tc.name      VPN_FlowBoundary_0093
     * @tc.desc      vpn flow boundary 87,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0093 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 87,true,true,true");
      const actual: string = subject.run(87, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-87|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-87|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0093 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0094
     * @tc.name      VPN_FlowBoundary_0094
     * @tc.desc      vpn flow boundary 88,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0094 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 88,false,false,true");
      const actual: string = subject.run(88, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0094 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0095
     * @tc.name      VPN_FlowBoundary_0095
     * @tc.desc      vpn flow boundary 89,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0095 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 89,true,true,true");
      const actual: string = subject.run(89, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-89|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-89|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0095 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0096
     * @tc.name      VPN_FlowBoundary_0096
     * @tc.desc      vpn flow boundary 90,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0096 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 90,false,true,false");
      const actual: string = subject.run(90, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0096 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0097
     * @tc.name      VPN_FlowBoundary_0097
     * @tc.desc      vpn flow boundary 91,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0097 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 91,true,false,true");
      const actual: string = subject.run(91, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-91|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-91|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0097 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0098
     * @tc.name      VPN_FlowBoundary_0098
     * @tc.desc      vpn flow boundary 92,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0098 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 92,false,true,true");
      const actual: string = subject.run(92, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0098 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0099
     * @tc.name      VPN_FlowBoundary_0099
     * @tc.desc      vpn flow boundary 93,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0099 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 93,true,true,true");
      const actual: string = subject.run(93, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-93|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-93|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0099 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0100
     * @tc.name      VPN_FlowBoundary_0100
     * @tc.desc      vpn flow boundary 94,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0100 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 94,false,false,true");
      const actual: string = subject.run(94, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0100 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0101
     * @tc.name      VPN_FlowBoundary_0101
     * @tc.desc      vpn flow boundary 95,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0101 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 95,true,true,false");
      const actual: string = subject.run(95, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-95|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-95|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0101 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0102
     * @tc.name      VPN_FlowBoundary_0102
     * @tc.desc      vpn flow boundary 96,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0102 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 96,false,true,true");
      const actual: string = subject.run(96, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0102 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0103
     * @tc.name      VPN_FlowBoundary_0103
     * @tc.desc      vpn flow boundary 97,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0103 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 97,true,false,true");
      const actual: string = subject.run(97, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-97|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-97|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0103 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0104
     * @tc.name      VPN_FlowBoundary_0104
     * @tc.desc      vpn flow boundary 98,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0104 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 98,false,true,true");
      const actual: string = subject.run(98, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0104 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0105
     * @tc.name      VPN_FlowBoundary_0105
     * @tc.desc      vpn flow boundary 99,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0105 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 99,true,true,true");
      const actual: string = subject.run(99, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-99|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-99|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0105 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0106
     * @tc.name      VPN_FlowBoundary_0106
     * @tc.desc      vpn flow boundary 100,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0106 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 100,false,false,false");
      const actual: string = subject.run(100, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0106 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0107
     * @tc.name      VPN_FlowBoundary_0107
     * @tc.desc      vpn flow boundary 101,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0107 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 101,true,true,true");
      const actual: string = subject.run(101, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-101|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-101|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0107 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0108
     * @tc.name      VPN_FlowBoundary_0108
     * @tc.desc      vpn flow boundary 102,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0108 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 102,false,true,true");
      const actual: string = subject.run(102, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0108 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0109
     * @tc.name      VPN_FlowBoundary_0109
     * @tc.desc      vpn flow boundary 103,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0109 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 103,true,false,true");
      const actual: string = subject.run(103, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-103|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-103|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0109 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0110
     * @tc.name      VPN_FlowBoundary_0110
     * @tc.desc      vpn flow boundary 104,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0110 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 104,false,true,true");
      const actual: string = subject.run(104, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0110 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0111
     * @tc.name      VPN_FlowBoundary_0111
     * @tc.desc      vpn flow boundary 105,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0111 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 105,true,true,false");
      const actual: string = subject.run(105, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-105|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-105|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0111 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0112
     * @tc.name      VPN_FlowBoundary_0112
     * @tc.desc      vpn flow boundary 106,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0112 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 106,false,false,true");
      const actual: string = subject.run(106, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0112 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0113
     * @tc.name      VPN_FlowBoundary_0113
     * @tc.desc      vpn flow boundary 107,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0113 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 107,true,true,true");
      const actual: string = subject.run(107, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-107|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-107|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0113 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0114
     * @tc.name      VPN_FlowBoundary_0114
     * @tc.desc      vpn flow boundary 108,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0114 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 108,false,true,true");
      const actual: string = subject.run(108, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0114 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0115
     * @tc.name      VPN_FlowBoundary_0115
     * @tc.desc      vpn flow boundary 109,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0115 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 109,true,false,true");
      const actual: string = subject.run(109, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-109|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-109|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0115 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0116
     * @tc.name      VPN_FlowBoundary_0116
     * @tc.desc      vpn flow boundary 110,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0116 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 110,false,true,false");
      const actual: string = subject.run(110, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0116 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0117
     * @tc.name      VPN_FlowBoundary_0117
     * @tc.desc      vpn flow boundary 111,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0117 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 111,true,true,true");
      const actual: string = subject.run(111, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-111|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-111|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0117 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0118
     * @tc.name      VPN_FlowBoundary_0118
     * @tc.desc      vpn flow boundary 112,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0118 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 112,false,false,true");
      const actual: string = subject.run(112, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0118 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0119
     * @tc.name      VPN_FlowBoundary_0119
     * @tc.desc      vpn flow boundary 113,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0119 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 113,true,true,true");
      const actual: string = subject.run(113, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-113|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-113|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0119 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0120
     * @tc.name      VPN_FlowBoundary_0120
     * @tc.desc      vpn flow boundary 114,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0120 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 114,false,true,true");
      const actual: string = subject.run(114, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0120 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0121
     * @tc.name      VPN_FlowBoundary_0121
     * @tc.desc      vpn flow boundary 115,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0121 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 115,true,false,false");
      const actual: string = subject.run(115, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-115|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-115|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0121 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0122
     * @tc.name      VPN_FlowBoundary_0122
     * @tc.desc      vpn flow boundary 116,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0122 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 116,false,true,true");
      const actual: string = subject.run(116, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0122 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0123
     * @tc.name      VPN_FlowBoundary_0123
     * @tc.desc      vpn flow boundary 117,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0123 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 117,true,true,true");
      const actual: string = subject.run(117, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-117|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-117|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0123 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0124
     * @tc.name      VPN_FlowBoundary_0124
     * @tc.desc      vpn flow boundary 118,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0124 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 118,false,false,true");
      const actual: string = subject.run(118, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0124 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0125
     * @tc.name      VPN_FlowBoundary_0125
     * @tc.desc      vpn flow boundary 119,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0125 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 119,true,true,true");
      const actual: string = subject.run(119, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-119|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-119|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0125 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0126
     * @tc.name      VPN_FlowBoundary_0126
     * @tc.desc      vpn flow boundary 120,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0126 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 120,false,true,false");
      const actual: string = subject.run(120, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0126 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0127
     * @tc.name      VPN_FlowBoundary_0127
     * @tc.desc      vpn flow boundary 121,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0127 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 121,true,false,true");
      const actual: string = subject.run(121, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-121|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-121|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0127 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0128
     * @tc.name      VPN_FlowBoundary_0128
     * @tc.desc      vpn flow boundary 122,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0128 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 122,false,true,true");
      const actual: string = subject.run(122, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0128 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0129
     * @tc.name      VPN_FlowBoundary_0129
     * @tc.desc      vpn flow boundary 123,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0129 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 123,true,true,true");
      const actual: string = subject.run(123, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-123|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-123|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0129 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0130
     * @tc.name      VPN_FlowBoundary_0130
     * @tc.desc      vpn flow boundary 124,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0130 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 124,false,false,true");
      const actual: string = subject.run(124, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0130 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0131
     * @tc.name      VPN_FlowBoundary_0131
     * @tc.desc      vpn flow boundary 125,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0131 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 125,true,true,false");
      const actual: string = subject.run(125, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-125|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-125|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0131 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0132
     * @tc.name      VPN_FlowBoundary_0132
     * @tc.desc      vpn flow boundary 126,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0132 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 126,false,true,true");
      const actual: string = subject.run(126, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0132 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0133
     * @tc.name      VPN_FlowBoundary_0133
     * @tc.desc      vpn flow boundary 127,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0133 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 127,true,false,true");
      const actual: string = subject.run(127, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-127|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-127|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0133 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0134
     * @tc.name      VPN_FlowBoundary_0134
     * @tc.desc      vpn flow boundary 128,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0134 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 128,false,true,true");
      const actual: string = subject.run(128, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0134 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0135
     * @tc.name      VPN_FlowBoundary_0135
     * @tc.desc      vpn flow boundary 129,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0135 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 129,true,true,true");
      const actual: string = subject.run(129, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-129|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-129|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0135 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0136
     * @tc.name      VPN_FlowBoundary_0136
     * @tc.desc      vpn flow boundary 130,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0136 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 130,false,false,false");
      const actual: string = subject.run(130, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0136 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0137
     * @tc.name      VPN_FlowBoundary_0137
     * @tc.desc      vpn flow boundary 131,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0137 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 131,true,true,true");
      const actual: string = subject.run(131, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-131|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-131|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0137 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0138
     * @tc.name      VPN_FlowBoundary_0138
     * @tc.desc      vpn flow boundary 132,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0138 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 132,false,true,true");
      const actual: string = subject.run(132, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0138 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0139
     * @tc.name      VPN_FlowBoundary_0139
     * @tc.desc      vpn flow boundary 133,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0139 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 133,true,false,true");
      const actual: string = subject.run(133, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-133|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-133|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0139 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0140
     * @tc.name      VPN_FlowBoundary_0140
     * @tc.desc      vpn flow boundary 134,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0140 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 134,false,true,true");
      const actual: string = subject.run(134, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0140 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0141
     * @tc.name      VPN_FlowBoundary_0141
     * @tc.desc      vpn flow boundary 135,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0141 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 135,true,true,false");
      const actual: string = subject.run(135, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-135|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-135|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0141 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0142
     * @tc.name      VPN_FlowBoundary_0142
     * @tc.desc      vpn flow boundary 136,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0142 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 136,false,false,true");
      const actual: string = subject.run(136, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0142 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0143
     * @tc.name      VPN_FlowBoundary_0143
     * @tc.desc      vpn flow boundary 137,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0143 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 137,true,true,true");
      const actual: string = subject.run(137, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-137|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-137|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0143 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0144
     * @tc.name      VPN_FlowBoundary_0144
     * @tc.desc      vpn flow boundary 138,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0144 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 138,false,true,true");
      const actual: string = subject.run(138, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0144 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0145
     * @tc.name      VPN_FlowBoundary_0145
     * @tc.desc      vpn flow boundary 139,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0145 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 139,true,false,true");
      const actual: string = subject.run(139, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-139|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-139|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0145 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0146
     * @tc.name      VPN_FlowBoundary_0146
     * @tc.desc      vpn flow boundary 140,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0146 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 140,false,true,false");
      const actual: string = subject.run(140, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0146 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0147
     * @tc.name      VPN_FlowBoundary_0147
     * @tc.desc      vpn flow boundary 141,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0147 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 141,true,true,true");
      const actual: string = subject.run(141, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-141|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-141|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0147 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0148
     * @tc.name      VPN_FlowBoundary_0148
     * @tc.desc      vpn flow boundary 142,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0148 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 142,false,false,true");
      const actual: string = subject.run(142, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0148 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0149
     * @tc.name      VPN_FlowBoundary_0149
     * @tc.desc      vpn flow boundary 143,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0149 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 143,true,true,true");
      const actual: string = subject.run(143, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-143|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-143|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0149 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0150
     * @tc.name      VPN_FlowBoundary_0150
     * @tc.desc      vpn flow boundary 144,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0150 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 144,false,true,true");
      const actual: string = subject.run(144, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0150 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0151
     * @tc.name      VPN_FlowBoundary_0151
     * @tc.desc      vpn flow boundary 145,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0151 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 145,true,false,false");
      const actual: string = subject.run(145, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-145|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-145|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0151 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0152
     * @tc.name      VPN_FlowBoundary_0152
     * @tc.desc      vpn flow boundary 146,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0152 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 146,false,true,true");
      const actual: string = subject.run(146, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0152 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0153
     * @tc.name      VPN_FlowBoundary_0153
     * @tc.desc      vpn flow boundary 147,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0153 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 147,true,true,true");
      const actual: string = subject.run(147, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-147|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-147|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0153 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0154
     * @tc.name      VPN_FlowBoundary_0154
     * @tc.desc      vpn flow boundary 148,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0154 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 148,false,false,true");
      const actual: string = subject.run(148, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0154 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0155
     * @tc.name      VPN_FlowBoundary_0155
     * @tc.desc      vpn flow boundary 149,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0155 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 149,true,true,true");
      const actual: string = subject.run(149, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-149|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-149|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0155 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0156
     * @tc.name      VPN_FlowBoundary_0156
     * @tc.desc      vpn flow boundary 150,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0156 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 150,false,true,false");
      const actual: string = subject.run(150, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0156 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0157
     * @tc.name      VPN_FlowBoundary_0157
     * @tc.desc      vpn flow boundary 151,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0157 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 151,true,false,true");
      const actual: string = subject.run(151, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-151|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-151|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0157 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0158
     * @tc.name      VPN_FlowBoundary_0158
     * @tc.desc      vpn flow boundary 152,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0158 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 152,false,true,true");
      const actual: string = subject.run(152, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0158 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0159
     * @tc.name      VPN_FlowBoundary_0159
     * @tc.desc      vpn flow boundary 153,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0159 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 153,true,true,true");
      const actual: string = subject.run(153, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-153|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-153|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0159 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0160
     * @tc.name      VPN_FlowBoundary_0160
     * @tc.desc      vpn flow boundary 154,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0160 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 154,false,false,true");
      const actual: string = subject.run(154, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0160 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0161
     * @tc.name      VPN_FlowBoundary_0161
     * @tc.desc      vpn flow boundary 155,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0161 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 155,true,true,false");
      const actual: string = subject.run(155, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-155|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-155|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0161 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0162
     * @tc.name      VPN_FlowBoundary_0162
     * @tc.desc      vpn flow boundary 156,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0162 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 156,false,true,true");
      const actual: string = subject.run(156, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0162 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0163
     * @tc.name      VPN_FlowBoundary_0163
     * @tc.desc      vpn flow boundary 157,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0163 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 157,true,false,true");
      const actual: string = subject.run(157, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-157|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-157|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0163 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0164
     * @tc.name      VPN_FlowBoundary_0164
     * @tc.desc      vpn flow boundary 158,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0164 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 158,false,true,true");
      const actual: string = subject.run(158, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0164 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0165
     * @tc.name      VPN_FlowBoundary_0165
     * @tc.desc      vpn flow boundary 159,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0165 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 159,true,true,true");
      const actual: string = subject.run(159, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-159|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-159|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0165 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0166
     * @tc.name      VPN_FlowBoundary_0166
     * @tc.desc      vpn flow boundary 160,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0166 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 160,false,false,false");
      const actual: string = subject.run(160, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0166 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0167
     * @tc.name      VPN_FlowBoundary_0167
     * @tc.desc      vpn flow boundary 161,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0167 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 161,true,true,true");
      const actual: string = subject.run(161, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-161|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-161|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0167 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0168
     * @tc.name      VPN_FlowBoundary_0168
     * @tc.desc      vpn flow boundary 162,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0168 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 162,false,true,true");
      const actual: string = subject.run(162, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0168 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0169
     * @tc.name      VPN_FlowBoundary_0169
     * @tc.desc      vpn flow boundary 163,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0169 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 163,true,false,true");
      const actual: string = subject.run(163, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-163|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-163|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0169 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0170
     * @tc.name      VPN_FlowBoundary_0170
     * @tc.desc      vpn flow boundary 164,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0170 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 164,false,true,true");
      const actual: string = subject.run(164, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0170 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0171
     * @tc.name      VPN_FlowBoundary_0171
     * @tc.desc      vpn flow boundary 165,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0171 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 165,true,true,false");
      const actual: string = subject.run(165, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-165|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-165|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0171 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0172
     * @tc.name      VPN_FlowBoundary_0172
     * @tc.desc      vpn flow boundary 166,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0172 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 166,false,false,true");
      const actual: string = subject.run(166, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0172 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0173
     * @tc.name      VPN_FlowBoundary_0173
     * @tc.desc      vpn flow boundary 167,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0173 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 167,true,true,true");
      const actual: string = subject.run(167, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-167|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-167|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0173 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0174
     * @tc.name      VPN_FlowBoundary_0174
     * @tc.desc      vpn flow boundary 168,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0174 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 168,false,true,true");
      const actual: string = subject.run(168, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0174 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0175
     * @tc.name      VPN_FlowBoundary_0175
     * @tc.desc      vpn flow boundary 169,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0175 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 169,true,false,true");
      const actual: string = subject.run(169, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-169|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-169|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0175 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0176
     * @tc.name      VPN_FlowBoundary_0176
     * @tc.desc      vpn flow boundary 170,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0176 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 170,false,true,false");
      const actual: string = subject.run(170, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0176 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0177
     * @tc.name      VPN_FlowBoundary_0177
     * @tc.desc      vpn flow boundary 171,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0177 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 171,true,true,true");
      const actual: string = subject.run(171, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-171|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-171|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0177 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0178
     * @tc.name      VPN_FlowBoundary_0178
     * @tc.desc      vpn flow boundary 172,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0178 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 172,false,false,true");
      const actual: string = subject.run(172, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0178 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0179
     * @tc.name      VPN_FlowBoundary_0179
     * @tc.desc      vpn flow boundary 173,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0179 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 173,true,true,true");
      const actual: string = subject.run(173, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-173|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-173|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0179 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0180
     * @tc.name      VPN_FlowBoundary_0180
     * @tc.desc      vpn flow boundary 174,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0180 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 174,false,true,true");
      const actual: string = subject.run(174, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0180 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0181
     * @tc.name      VPN_FlowBoundary_0181
     * @tc.desc      vpn flow boundary 175,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0181 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 175,true,false,false");
      const actual: string = subject.run(175, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-175|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-175|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0181 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0182
     * @tc.name      VPN_FlowBoundary_0182
     * @tc.desc      vpn flow boundary 176,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0182 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 176,false,true,true");
      const actual: string = subject.run(176, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0182 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0183
     * @tc.name      VPN_FlowBoundary_0183
     * @tc.desc      vpn flow boundary 177,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0183 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 177,true,true,true");
      const actual: string = subject.run(177, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-177|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-177|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0183 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0184
     * @tc.name      VPN_FlowBoundary_0184
     * @tc.desc      vpn flow boundary 178,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0184 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 178,false,false,true");
      const actual: string = subject.run(178, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0184 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0185
     * @tc.name      VPN_FlowBoundary_0185
     * @tc.desc      vpn flow boundary 179,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0185 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 179,true,true,true");
      const actual: string = subject.run(179, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-179|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-179|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0185 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0186
     * @tc.name      VPN_FlowBoundary_0186
     * @tc.desc      vpn flow boundary 180,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0186 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 180,false,true,false");
      const actual: string = subject.run(180, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0186 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0187
     * @tc.name      VPN_FlowBoundary_0187
     * @tc.desc      vpn flow boundary 181,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0187 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 181,true,false,true");
      const actual: string = subject.run(181, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-181|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-181|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0187 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0188
     * @tc.name      VPN_FlowBoundary_0188
     * @tc.desc      vpn flow boundary 182,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0188 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 182,false,true,true");
      const actual: string = subject.run(182, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0188 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0189
     * @tc.name      VPN_FlowBoundary_0189
     * @tc.desc      vpn flow boundary 183,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0189 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 183,true,true,true");
      const actual: string = subject.run(183, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-183|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-183|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0189 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0190
     * @tc.name      VPN_FlowBoundary_0190
     * @tc.desc      vpn flow boundary 184,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0190 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 184,false,false,true");
      const actual: string = subject.run(184, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0190 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0191
     * @tc.name      VPN_FlowBoundary_0191
     * @tc.desc      vpn flow boundary 185,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0191 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 185,true,true,false");
      const actual: string = subject.run(185, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-185|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-185|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0191 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0192
     * @tc.name      VPN_FlowBoundary_0192
     * @tc.desc      vpn flow boundary 186,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0192 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 186,false,true,true");
      const actual: string = subject.run(186, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0192 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0193
     * @tc.name      VPN_FlowBoundary_0193
     * @tc.desc      vpn flow boundary 187,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0193 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 187,true,false,true");
      const actual: string = subject.run(187, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-187|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-187|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0193 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0194
     * @tc.name      VPN_FlowBoundary_0194
     * @tc.desc      vpn flow boundary 188,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0194 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 188,false,true,true");
      const actual: string = subject.run(188, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0194 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0195
     * @tc.name      VPN_FlowBoundary_0195
     * @tc.desc      vpn flow boundary 189,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0195 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 189,true,true,true");
      const actual: string = subject.run(189, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-189|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-189|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0195 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0196
     * @tc.name      VPN_FlowBoundary_0196
     * @tc.desc      vpn flow boundary 190,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0196 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 190,false,false,false");
      const actual: string = subject.run(190, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0196 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0197
     * @tc.name      VPN_FlowBoundary_0197
     * @tc.desc      vpn flow boundary 191,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0197 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 191,true,true,true");
      const actual: string = subject.run(191, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-191|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-191|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0197 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0198
     * @tc.name      VPN_FlowBoundary_0198
     * @tc.desc      vpn flow boundary 192,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0198 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 192,false,true,true");
      const actual: string = subject.run(192, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0198 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0199
     * @tc.name      VPN_FlowBoundary_0199
     * @tc.desc      vpn flow boundary 193,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0199 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 193,true,false,true");
      const actual: string = subject.run(193, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-193|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-193|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0199 end`);
    });
