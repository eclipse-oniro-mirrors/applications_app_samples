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

/** VpnFlowMatrixTest logic checks (450 cases). */
export default function vpnFlowMatrixTest(): void {
  describe('VpnFlowMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0001
     * @tc.name      VPN_FlowMatrix_0001
     * @tc.desc      vpn flow matrix -2,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0001 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(-2, true, false, false);
      logInfo("flow matrix -2,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0002
     * @tc.name      VPN_FlowMatrix_0002
     * @tc.desc      vpn flow matrix -1,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0002 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(-1, false, true, true);
      logInfo("flow matrix -1,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0003
     * @tc.name      VPN_FlowMatrix_0003
     * @tc.desc      vpn flow matrix 0,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0003 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(0, true, true, true);
      logInfo("flow matrix 0,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0004
     * @tc.name      VPN_FlowMatrix_0004
     * @tc.desc      vpn flow matrix 1,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0004 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(1, false, false, true);
      logInfo("flow matrix 1,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0005
     * @tc.name      VPN_FlowMatrix_0005
     * @tc.desc      vpn flow matrix 2,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0005 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(2, true, true, true);
      logInfo("flow matrix 2,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0006
     * @tc.name      VPN_FlowMatrix_0006
     * @tc.desc      vpn flow matrix 3,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0006 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(3, false, true, false);
      logInfo("flow matrix 3,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0007
     * @tc.name      VPN_FlowMatrix_0007
     * @tc.desc      vpn flow matrix 4,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0007 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(4, true, false, true);
      logInfo("flow matrix 4,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0008
     * @tc.name      VPN_FlowMatrix_0008
     * @tc.desc      vpn flow matrix 5,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0008 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(5, false, true, true);
      logInfo("flow matrix 5,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0009
     * @tc.name      VPN_FlowMatrix_0009
     * @tc.desc      vpn flow matrix 6,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0009 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(6, true, true, true);
      logInfo("flow matrix 6,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0010
     * @tc.name      VPN_FlowMatrix_0010
     * @tc.desc      vpn flow matrix 7,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0010 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(7, false, false, true);
      logInfo("flow matrix 7,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0011
     * @tc.name      VPN_FlowMatrix_0011
     * @tc.desc      vpn flow matrix 8,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0011 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(8, true, true, false);
      logInfo("flow matrix 8,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
