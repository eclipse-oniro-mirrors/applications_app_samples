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
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0012
     * @tc.name      VPN_FlowMatrix_0012
     * @tc.desc      vpn flow matrix 9,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0012 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(9, false, true, true);
      logInfo("flow matrix 9,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0013
     * @tc.name      VPN_FlowMatrix_0013
     * @tc.desc      vpn flow matrix 10,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0013 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(10, true, false, true);
      logInfo("flow matrix 10,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0014
     * @tc.name      VPN_FlowMatrix_0014
     * @tc.desc      vpn flow matrix 11,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0014 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(11, false, true, true);
      logInfo("flow matrix 11,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0015
     * @tc.name      VPN_FlowMatrix_0015
     * @tc.desc      vpn flow matrix 12,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0015 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(12, true, true, true);
      logInfo("flow matrix 12,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0016
     * @tc.name      VPN_FlowMatrix_0016
     * @tc.desc      vpn flow matrix 13,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0016 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(13, false, false, false);
      logInfo("flow matrix 13,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0017
     * @tc.name      VPN_FlowMatrix_0017
     * @tc.desc      vpn flow matrix 14,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0017 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(14, true, true, true);
      logInfo("flow matrix 14,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0018
     * @tc.name      VPN_FlowMatrix_0018
     * @tc.desc      vpn flow matrix 15,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0018 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(15, false, true, true);
      logInfo("flow matrix 15,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0019
     * @tc.name      VPN_FlowMatrix_0019
     * @tc.desc      vpn flow matrix 16,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0019 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(16, true, false, true);
      logInfo("flow matrix 16,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0020
     * @tc.name      VPN_FlowMatrix_0020
     * @tc.desc      vpn flow matrix 17,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0020 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(17, false, true, true);
      logInfo("flow matrix 17,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0021
     * @tc.name      VPN_FlowMatrix_0021
     * @tc.desc      vpn flow matrix 18,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0021 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(18, true, true, false);
      logInfo("flow matrix 18,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0022
     * @tc.name      VPN_FlowMatrix_0022
     * @tc.desc      vpn flow matrix 19,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0022 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(19, false, false, true);
      logInfo("flow matrix 19,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0023
     * @tc.name      VPN_FlowMatrix_0023
     * @tc.desc      vpn flow matrix 20,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0023 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(20, true, true, true);
      logInfo("flow matrix 20,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0024
     * @tc.name      VPN_FlowMatrix_0024
     * @tc.desc      vpn flow matrix 21,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0024 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(21, false, true, true);
      logInfo("flow matrix 21,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0025
     * @tc.name      VPN_FlowMatrix_0025
     * @tc.desc      vpn flow matrix 22,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0025 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(22, true, false, true);
      logInfo("flow matrix 22,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0026
     * @tc.name      VPN_FlowMatrix_0026
     * @tc.desc      vpn flow matrix 23,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0026 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(23, false, true, false);
      logInfo("flow matrix 23,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0027
     * @tc.name      VPN_FlowMatrix_0027
     * @tc.desc      vpn flow matrix 24,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0027 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(24, true, true, true);
      logInfo("flow matrix 24,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0028
     * @tc.name      VPN_FlowMatrix_0028
     * @tc.desc      vpn flow matrix 25,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0028 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(25, false, false, true);
      logInfo("flow matrix 25,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0029
     * @tc.name      VPN_FlowMatrix_0029
     * @tc.desc      vpn flow matrix 26,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0029 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(26, true, true, true);
      logInfo("flow matrix 26,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0030
     * @tc.name      VPN_FlowMatrix_0030
     * @tc.desc      vpn flow matrix 27,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0030 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(27, false, true, true);
      logInfo("flow matrix 27,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0031
     * @tc.name      VPN_FlowMatrix_0031
     * @tc.desc      vpn flow matrix 28,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0031 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(28, true, false, false);
      logInfo("flow matrix 28,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0032
     * @tc.name      VPN_FlowMatrix_0032
     * @tc.desc      vpn flow matrix 29,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0032 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(29, false, true, true);
      logInfo("flow matrix 29,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0033
     * @tc.name      VPN_FlowMatrix_0033
     * @tc.desc      vpn flow matrix 30,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0033 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(30, true, true, true);
      logInfo("flow matrix 30,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0034
     * @tc.name      VPN_FlowMatrix_0034
     * @tc.desc      vpn flow matrix 31,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0034 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(31, false, false, true);
      logInfo("flow matrix 31,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0035
     * @tc.name      VPN_FlowMatrix_0035
     * @tc.desc      vpn flow matrix 32,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0035 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(32, true, true, true);
      logInfo("flow matrix 32,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0036
     * @tc.name      VPN_FlowMatrix_0036
     * @tc.desc      vpn flow matrix 33,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0036 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(33, false, true, false);
      logInfo("flow matrix 33,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0037
     * @tc.name      VPN_FlowMatrix_0037
     * @tc.desc      vpn flow matrix 34,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0037 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(34, true, false, true);
      logInfo("flow matrix 34,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0038
     * @tc.name      VPN_FlowMatrix_0038
     * @tc.desc      vpn flow matrix 35,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0038 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(35, false, true, true);
      logInfo("flow matrix 35,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0039
     * @tc.name      VPN_FlowMatrix_0039
     * @tc.desc      vpn flow matrix 36,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0039 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(36, true, true, true);
      logInfo("flow matrix 36,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0040
     * @tc.name      VPN_FlowMatrix_0040
     * @tc.desc      vpn flow matrix 37,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0040 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(37, false, false, true);
      logInfo("flow matrix 37,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0041
     * @tc.name      VPN_FlowMatrix_0041
     * @tc.desc      vpn flow matrix 38,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0041 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(38, true, true, false);
      logInfo("flow matrix 38,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0042
     * @tc.name      VPN_FlowMatrix_0042
     * @tc.desc      vpn flow matrix 39,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0042 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(39, false, true, true);
      logInfo("flow matrix 39,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0043
     * @tc.name      VPN_FlowMatrix_0043
     * @tc.desc      vpn flow matrix 40,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0043 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(40, true, false, true);
      logInfo("flow matrix 40,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0044
     * @tc.name      VPN_FlowMatrix_0044
     * @tc.desc      vpn flow matrix 41,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0044 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(41, false, true, true);
      logInfo("flow matrix 41,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0045
     * @tc.name      VPN_FlowMatrix_0045
     * @tc.desc      vpn flow matrix 42,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0045 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(42, true, true, true);
      logInfo("flow matrix 42,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0046
     * @tc.name      VPN_FlowMatrix_0046
     * @tc.desc      vpn flow matrix 43,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0046 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(43, false, false, false);
      logInfo("flow matrix 43,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0047
     * @tc.name      VPN_FlowMatrix_0047
     * @tc.desc      vpn flow matrix 44,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0047 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(44, true, true, true);
      logInfo("flow matrix 44,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0048
     * @tc.name      VPN_FlowMatrix_0048
     * @tc.desc      vpn flow matrix 45,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0048 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(45, false, true, true);
      logInfo("flow matrix 45,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0049
     * @tc.name      VPN_FlowMatrix_0049
     * @tc.desc      vpn flow matrix 46,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0049 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(46, true, false, true);
      logInfo("flow matrix 46,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0050
     * @tc.name      VPN_FlowMatrix_0050
     * @tc.desc      vpn flow matrix 47,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0050 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(47, false, true, true);
      logInfo("flow matrix 47,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0051
     * @tc.name      VPN_FlowMatrix_0051
     * @tc.desc      vpn flow matrix 48,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0051 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(48, true, true, false);
      logInfo("flow matrix 48,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0052
     * @tc.name      VPN_FlowMatrix_0052
     * @tc.desc      vpn flow matrix 49,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0052 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(49, false, false, true);
      logInfo("flow matrix 49,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0053
     * @tc.name      VPN_FlowMatrix_0053
     * @tc.desc      vpn flow matrix 50,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0053 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(50, true, true, true);
      logInfo("flow matrix 50,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0054
     * @tc.name      VPN_FlowMatrix_0054
     * @tc.desc      vpn flow matrix 51,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0054 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(51, false, true, true);
      logInfo("flow matrix 51,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0055
     * @tc.name      VPN_FlowMatrix_0055
     * @tc.desc      vpn flow matrix 52,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0055 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(52, true, false, true);
      logInfo("flow matrix 52,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0056
     * @tc.name      VPN_FlowMatrix_0056
     * @tc.desc      vpn flow matrix 53,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0056 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(53, false, true, false);
      logInfo("flow matrix 53,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0057
     * @tc.name      VPN_FlowMatrix_0057
     * @tc.desc      vpn flow matrix 54,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0057 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(54, true, true, true);
      logInfo("flow matrix 54,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0058
     * @tc.name      VPN_FlowMatrix_0058
     * @tc.desc      vpn flow matrix 55,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0058 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(55, false, false, true);
      logInfo("flow matrix 55,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0059
     * @tc.name      VPN_FlowMatrix_0059
     * @tc.desc      vpn flow matrix 56,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0059 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(56, true, true, true);
      logInfo("flow matrix 56,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0060
     * @tc.name      VPN_FlowMatrix_0060
     * @tc.desc      vpn flow matrix 57,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0060 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(57, false, true, true);
      logInfo("flow matrix 57,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0061
     * @tc.name      VPN_FlowMatrix_0061
     * @tc.desc      vpn flow matrix 58,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0061 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(58, true, false, false);
      logInfo("flow matrix 58,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0062
     * @tc.name      VPN_FlowMatrix_0062
     * @tc.desc      vpn flow matrix 59,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0062 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(59, false, true, true);
      logInfo("flow matrix 59,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0063
     * @tc.name      VPN_FlowMatrix_0063
     * @tc.desc      vpn flow matrix 60,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0063 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(60, true, true, true);
      logInfo("flow matrix 60,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0064
     * @tc.name      VPN_FlowMatrix_0064
     * @tc.desc      vpn flow matrix 61,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0064 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(61, false, false, true);
      logInfo("flow matrix 61,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0065
     * @tc.name      VPN_FlowMatrix_0065
     * @tc.desc      vpn flow matrix 62,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0065 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(62, true, true, true);
      logInfo("flow matrix 62,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0066
     * @tc.name      VPN_FlowMatrix_0066
     * @tc.desc      vpn flow matrix 63,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0066 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(63, false, true, false);
      logInfo("flow matrix 63,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0067
     * @tc.name      VPN_FlowMatrix_0067
     * @tc.desc      vpn flow matrix 64,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0067 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(64, true, false, true);
      logInfo("flow matrix 64,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0068
     * @tc.name      VPN_FlowMatrix_0068
     * @tc.desc      vpn flow matrix 65,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0068 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(65, false, true, true);
      logInfo("flow matrix 65,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0069
     * @tc.name      VPN_FlowMatrix_0069
     * @tc.desc      vpn flow matrix 66,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0069 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(66, true, true, true);
      logInfo("flow matrix 66,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0070
     * @tc.name      VPN_FlowMatrix_0070
     * @tc.desc      vpn flow matrix 67,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0070 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(67, false, false, true);
      logInfo("flow matrix 67,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0071
     * @tc.name      VPN_FlowMatrix_0071
     * @tc.desc      vpn flow matrix 68,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0071 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(68, true, true, false);
      logInfo("flow matrix 68,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0072
     * @tc.name      VPN_FlowMatrix_0072
     * @tc.desc      vpn flow matrix 69,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0072 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(69, false, true, true);
      logInfo("flow matrix 69,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0073
     * @tc.name      VPN_FlowMatrix_0073
     * @tc.desc      vpn flow matrix 70,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0073 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(70, true, false, true);
      logInfo("flow matrix 70,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0074
     * @tc.name      VPN_FlowMatrix_0074
     * @tc.desc      vpn flow matrix 71,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0074 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(71, false, true, true);
      logInfo("flow matrix 71,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0075
     * @tc.name      VPN_FlowMatrix_0075
     * @tc.desc      vpn flow matrix 72,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0075 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(72, true, true, true);
      logInfo("flow matrix 72,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0076
     * @tc.name      VPN_FlowMatrix_0076
     * @tc.desc      vpn flow matrix 73,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0076 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(73, false, false, false);
      logInfo("flow matrix 73,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0076 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0077
     * @tc.name      VPN_FlowMatrix_0077
     * @tc.desc      vpn flow matrix 74,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0077 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(74, true, true, true);
      logInfo("flow matrix 74,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0078
     * @tc.name      VPN_FlowMatrix_0078
     * @tc.desc      vpn flow matrix 75,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0078 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(75, false, true, true);
      logInfo("flow matrix 75,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0079
     * @tc.name      VPN_FlowMatrix_0079
     * @tc.desc      vpn flow matrix 76,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0079 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(76, true, false, true);
      logInfo("flow matrix 76,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0080
     * @tc.name      VPN_FlowMatrix_0080
     * @tc.desc      vpn flow matrix 77,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0080 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(77, false, true, true);
      logInfo("flow matrix 77,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0081
     * @tc.name      VPN_FlowMatrix_0081
     * @tc.desc      vpn flow matrix 78,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0081 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(78, true, true, false);
      logInfo("flow matrix 78,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0082
     * @tc.name      VPN_FlowMatrix_0082
     * @tc.desc      vpn flow matrix 79,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0082 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(79, false, false, true);
      logInfo("flow matrix 79,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0083
     * @tc.name      VPN_FlowMatrix_0083
     * @tc.desc      vpn flow matrix 80,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0083 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(80, true, true, true);
      logInfo("flow matrix 80,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0084
     * @tc.name      VPN_FlowMatrix_0084
     * @tc.desc      vpn flow matrix 81,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0084 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(81, false, true, true);
      logInfo("flow matrix 81,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0085
     * @tc.name      VPN_FlowMatrix_0085
     * @tc.desc      vpn flow matrix 82,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0085 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(82, true, false, true);
      logInfo("flow matrix 82,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0086
     * @tc.name      VPN_FlowMatrix_0086
     * @tc.desc      vpn flow matrix 83,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0086 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(83, false, true, false);
      logInfo("flow matrix 83,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0087
     * @tc.name      VPN_FlowMatrix_0087
     * @tc.desc      vpn flow matrix 84,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0087 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(84, true, true, true);
      logInfo("flow matrix 84,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0088
     * @tc.name      VPN_FlowMatrix_0088
     * @tc.desc      vpn flow matrix 85,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0088 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(85, false, false, true);
      logInfo("flow matrix 85,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0089
     * @tc.name      VPN_FlowMatrix_0089
     * @tc.desc      vpn flow matrix 86,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0089 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(86, true, true, true);
      logInfo("flow matrix 86,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0090
     * @tc.name      VPN_FlowMatrix_0090
     * @tc.desc      vpn flow matrix 87,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0090 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(87, false, true, true);
      logInfo("flow matrix 87,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0091
     * @tc.name      VPN_FlowMatrix_0091
     * @tc.desc      vpn flow matrix 88,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0091 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(88, true, false, false);
      logInfo("flow matrix 88,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0092
     * @tc.name      VPN_FlowMatrix_0092
     * @tc.desc      vpn flow matrix 89,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0092 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(89, false, true, true);
      logInfo("flow matrix 89,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0093
     * @tc.name      VPN_FlowMatrix_0093
     * @tc.desc      vpn flow matrix 90,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0093 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(90, true, true, true);
      logInfo("flow matrix 90,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0094
     * @tc.name      VPN_FlowMatrix_0094
     * @tc.desc      vpn flow matrix 91,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0094 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(91, false, false, true);
      logInfo("flow matrix 91,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0095
     * @tc.name      VPN_FlowMatrix_0095
     * @tc.desc      vpn flow matrix 92,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0095 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(92, true, true, true);
      logInfo("flow matrix 92,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0096
     * @tc.name      VPN_FlowMatrix_0096
     * @tc.desc      vpn flow matrix 93,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0096 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(93, false, true, false);
      logInfo("flow matrix 93,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0097
     * @tc.name      VPN_FlowMatrix_0097
     * @tc.desc      vpn flow matrix 94,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0097 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(94, true, false, true);
      logInfo("flow matrix 94,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0098
     * @tc.name      VPN_FlowMatrix_0098
     * @tc.desc      vpn flow matrix 95,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0098 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(95, false, true, true);
      logInfo("flow matrix 95,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0099
     * @tc.name      VPN_FlowMatrix_0099
     * @tc.desc      vpn flow matrix 96,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0099 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(96, true, true, true);
      logInfo("flow matrix 96,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0100
     * @tc.name      VPN_FlowMatrix_0100
     * @tc.desc      vpn flow matrix 97,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0100 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(97, false, false, true);
      logInfo("flow matrix 97,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0101
     * @tc.name      VPN_FlowMatrix_0101
     * @tc.desc      vpn flow matrix 98,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0101 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(98, true, true, false);
      logInfo("flow matrix 98,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0102
     * @tc.name      VPN_FlowMatrix_0102
     * @tc.desc      vpn flow matrix 99,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0102 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(99, false, true, true);
      logInfo("flow matrix 99,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0103
     * @tc.name      VPN_FlowMatrix_0103
     * @tc.desc      vpn flow matrix 100,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0103 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(100, true, false, true);
      logInfo("flow matrix 100,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0104
     * @tc.name      VPN_FlowMatrix_0104
     * @tc.desc      vpn flow matrix 101,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0104 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(101, false, true, true);
      logInfo("flow matrix 101,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0105
     * @tc.name      VPN_FlowMatrix_0105
     * @tc.desc      vpn flow matrix 102,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0105 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(102, true, true, true);
      logInfo("flow matrix 102,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0106
     * @tc.name      VPN_FlowMatrix_0106
     * @tc.desc      vpn flow matrix 103,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0106 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(103, false, false, false);
      logInfo("flow matrix 103,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0107
     * @tc.name      VPN_FlowMatrix_0107
     * @tc.desc      vpn flow matrix 104,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0107 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(104, true, true, true);
      logInfo("flow matrix 104,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0108
     * @tc.name      VPN_FlowMatrix_0108
     * @tc.desc      vpn flow matrix 105,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0108 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(105, false, true, true);
      logInfo("flow matrix 105,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0109
     * @tc.name      VPN_FlowMatrix_0109
     * @tc.desc      vpn flow matrix 106,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0109 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(106, true, false, true);
      logInfo("flow matrix 106,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0110
     * @tc.name      VPN_FlowMatrix_0110
     * @tc.desc      vpn flow matrix 107,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0110 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(107, false, true, true);
      logInfo("flow matrix 107,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0111
     * @tc.name      VPN_FlowMatrix_0111
     * @tc.desc      vpn flow matrix 108,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0111 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(108, true, true, false);
      logInfo("flow matrix 108,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0112
     * @tc.name      VPN_FlowMatrix_0112
     * @tc.desc      vpn flow matrix 109,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0112 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(109, false, false, true);
      logInfo("flow matrix 109,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0113
     * @tc.name      VPN_FlowMatrix_0113
     * @tc.desc      vpn flow matrix 110,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0113 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(110, true, true, true);
      logInfo("flow matrix 110,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0114
     * @tc.name      VPN_FlowMatrix_0114
     * @tc.desc      vpn flow matrix 111,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0114 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(111, false, true, true);
      logInfo("flow matrix 111,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0115
     * @tc.name      VPN_FlowMatrix_0115
     * @tc.desc      vpn flow matrix 112,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0115 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(112, true, false, true);
      logInfo("flow matrix 112,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0116
     * @tc.name      VPN_FlowMatrix_0116
     * @tc.desc      vpn flow matrix 113,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0116 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(113, false, true, false);
      logInfo("flow matrix 113,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0117
     * @tc.name      VPN_FlowMatrix_0117
     * @tc.desc      vpn flow matrix 114,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0117 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(114, true, true, true);
      logInfo("flow matrix 114,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0118
     * @tc.name      VPN_FlowMatrix_0118
     * @tc.desc      vpn flow matrix 115,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0118 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(115, false, false, true);
      logInfo("flow matrix 115,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0119
     * @tc.name      VPN_FlowMatrix_0119
     * @tc.desc      vpn flow matrix 116,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0119 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(116, true, true, true);
      logInfo("flow matrix 116,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0120
     * @tc.name      VPN_FlowMatrix_0120
     * @tc.desc      vpn flow matrix 117,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0120 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(117, false, true, true);
      logInfo("flow matrix 117,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0121
     * @tc.name      VPN_FlowMatrix_0121
     * @tc.desc      vpn flow matrix 118,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0121 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(118, true, false, false);
      logInfo("flow matrix 118,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0122
     * @tc.name      VPN_FlowMatrix_0122
     * @tc.desc      vpn flow matrix 119,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0122 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(119, false, true, true);
      logInfo("flow matrix 119,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0123
     * @tc.name      VPN_FlowMatrix_0123
     * @tc.desc      vpn flow matrix 120,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0123 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(120, true, true, true);
      logInfo("flow matrix 120,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0124
     * @tc.name      VPN_FlowMatrix_0124
     * @tc.desc      vpn flow matrix 121,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0124 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(121, false, false, true);
      logInfo("flow matrix 121,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0125
     * @tc.name      VPN_FlowMatrix_0125
     * @tc.desc      vpn flow matrix 122,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0125 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(122, true, true, true);
      logInfo("flow matrix 122,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0126
     * @tc.name      VPN_FlowMatrix_0126
     * @tc.desc      vpn flow matrix 123,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0126 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(123, false, true, false);
      logInfo("flow matrix 123,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0126 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0127
     * @tc.name      VPN_FlowMatrix_0127
     * @tc.desc      vpn flow matrix 124,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0127 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(124, true, false, true);
      logInfo("flow matrix 124,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0128
     * @tc.name      VPN_FlowMatrix_0128
     * @tc.desc      vpn flow matrix 125,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0128 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(125, false, true, true);
      logInfo("flow matrix 125,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0129
     * @tc.name      VPN_FlowMatrix_0129
     * @tc.desc      vpn flow matrix 126,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0129 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(126, true, true, true);
      logInfo("flow matrix 126,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0130
     * @tc.name      VPN_FlowMatrix_0130
     * @tc.desc      vpn flow matrix 127,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0130 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(127, false, false, true);
      logInfo("flow matrix 127,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0131
     * @tc.name      VPN_FlowMatrix_0131
     * @tc.desc      vpn flow matrix 128,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0131 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(128, true, true, false);
      logInfo("flow matrix 128,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0132
     * @tc.name      VPN_FlowMatrix_0132
     * @tc.desc      vpn flow matrix 129,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0132 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(129, false, true, true);
      logInfo("flow matrix 129,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0133
     * @tc.name      VPN_FlowMatrix_0133
     * @tc.desc      vpn flow matrix 130,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0133 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(130, true, false, true);
      logInfo("flow matrix 130,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0134
     * @tc.name      VPN_FlowMatrix_0134
     * @tc.desc      vpn flow matrix 131,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0134 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(131, false, true, true);
      logInfo("flow matrix 131,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0135
     * @tc.name      VPN_FlowMatrix_0135
     * @tc.desc      vpn flow matrix 132,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0135 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(132, true, true, true);
      logInfo("flow matrix 132,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0136
     * @tc.name      VPN_FlowMatrix_0136
     * @tc.desc      vpn flow matrix 133,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0136 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(133, false, false, false);
      logInfo("flow matrix 133,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0137
     * @tc.name      VPN_FlowMatrix_0137
     * @tc.desc      vpn flow matrix 134,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0137 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(134, true, true, true);
      logInfo("flow matrix 134,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0138
     * @tc.name      VPN_FlowMatrix_0138
     * @tc.desc      vpn flow matrix 135,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0138 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(135, false, true, true);
      logInfo("flow matrix 135,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0139
     * @tc.name      VPN_FlowMatrix_0139
     * @tc.desc      vpn flow matrix 136,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0139 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(136, true, false, true);
      logInfo("flow matrix 136,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0140
     * @tc.name      VPN_FlowMatrix_0140
     * @tc.desc      vpn flow matrix 137,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0140 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(137, false, true, true);
      logInfo("flow matrix 137,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0141
     * @tc.name      VPN_FlowMatrix_0141
     * @tc.desc      vpn flow matrix 138,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0141 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(138, true, true, false);
      logInfo("flow matrix 138,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0142
     * @tc.name      VPN_FlowMatrix_0142
     * @tc.desc      vpn flow matrix 139,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0142 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(139, false, false, true);
      logInfo("flow matrix 139,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0143
     * @tc.name      VPN_FlowMatrix_0143
     * @tc.desc      vpn flow matrix 140,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0143 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(140, true, true, true);
      logInfo("flow matrix 140,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0144
     * @tc.name      VPN_FlowMatrix_0144
     * @tc.desc      vpn flow matrix 141,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0144 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(141, false, true, true);
      logInfo("flow matrix 141,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0145
     * @tc.name      VPN_FlowMatrix_0145
     * @tc.desc      vpn flow matrix 142,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0145 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(142, true, false, true);
      logInfo("flow matrix 142,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0146
     * @tc.name      VPN_FlowMatrix_0146
     * @tc.desc      vpn flow matrix 143,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0146 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(143, false, true, false);
      logInfo("flow matrix 143,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0147
     * @tc.name      VPN_FlowMatrix_0147
     * @tc.desc      vpn flow matrix 144,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0147 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(144, true, true, true);
      logInfo("flow matrix 144,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0148
     * @tc.name      VPN_FlowMatrix_0148
     * @tc.desc      vpn flow matrix 145,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0148 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(145, false, false, true);
      logInfo("flow matrix 145,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0149
     * @tc.name      VPN_FlowMatrix_0149
     * @tc.desc      vpn flow matrix 146,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0149 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(146, true, true, true);
      logInfo("flow matrix 146,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0150
     * @tc.name      VPN_FlowMatrix_0150
     * @tc.desc      vpn flow matrix 147,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0150 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(147, false, true, true);
      logInfo("flow matrix 147,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0151
     * @tc.name      VPN_FlowMatrix_0151
     * @tc.desc      vpn flow matrix 148,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0151 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(148, true, false, false);
      logInfo("flow matrix 148,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0152
     * @tc.name      VPN_FlowMatrix_0152
     * @tc.desc      vpn flow matrix 149,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0152 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(149, false, true, true);
      logInfo("flow matrix 149,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0153
     * @tc.name      VPN_FlowMatrix_0153
     * @tc.desc      vpn flow matrix 150,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0153 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(150, true, true, true);
      logInfo("flow matrix 150,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0154
     * @tc.name      VPN_FlowMatrix_0154
     * @tc.desc      vpn flow matrix 151,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0154 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(151, false, false, true);
      logInfo("flow matrix 151,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0155
     * @tc.name      VPN_FlowMatrix_0155
     * @tc.desc      vpn flow matrix 152,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0155 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(152, true, true, true);
      logInfo("flow matrix 152,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0156
     * @tc.name      VPN_FlowMatrix_0156
     * @tc.desc      vpn flow matrix 153,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0156 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(153, false, true, false);
      logInfo("flow matrix 153,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0157
     * @tc.name      VPN_FlowMatrix_0157
     * @tc.desc      vpn flow matrix 154,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0157 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(154, true, false, true);
      logInfo("flow matrix 154,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0158
     * @tc.name      VPN_FlowMatrix_0158
     * @tc.desc      vpn flow matrix 155,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0158 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(155, false, true, true);
      logInfo("flow matrix 155,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0159
     * @tc.name      VPN_FlowMatrix_0159
     * @tc.desc      vpn flow matrix 156,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0159 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(156, true, true, true);
      logInfo("flow matrix 156,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0160
     * @tc.name      VPN_FlowMatrix_0160
     * @tc.desc      vpn flow matrix 157,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0160 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(157, false, false, true);
      logInfo("flow matrix 157,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0161
     * @tc.name      VPN_FlowMatrix_0161
     * @tc.desc      vpn flow matrix 158,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0161 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(158, true, true, false);
      logInfo("flow matrix 158,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0162
     * @tc.name      VPN_FlowMatrix_0162
     * @tc.desc      vpn flow matrix 159,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0162 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(159, false, true, true);
      logInfo("flow matrix 159,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0163
     * @tc.name      VPN_FlowMatrix_0163
     * @tc.desc      vpn flow matrix 160,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0163 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(160, true, false, true);
      logInfo("flow matrix 160,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0164
     * @tc.name      VPN_FlowMatrix_0164
     * @tc.desc      vpn flow matrix 161,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0164 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(161, false, true, true);
      logInfo("flow matrix 161,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0165
     * @tc.name      VPN_FlowMatrix_0165
     * @tc.desc      vpn flow matrix 162,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0165 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(162, true, true, true);
      logInfo("flow matrix 162,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0166
     * @tc.name      VPN_FlowMatrix_0166
     * @tc.desc      vpn flow matrix 163,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0166 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(163, false, false, false);
      logInfo("flow matrix 163,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0167
     * @tc.name      VPN_FlowMatrix_0167
     * @tc.desc      vpn flow matrix 164,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0167 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(164, true, true, true);
      logInfo("flow matrix 164,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0168
     * @tc.name      VPN_FlowMatrix_0168
     * @tc.desc      vpn flow matrix 165,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0168 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(165, false, true, true);
      logInfo("flow matrix 165,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0169
     * @tc.name      VPN_FlowMatrix_0169
     * @tc.desc      vpn flow matrix 166,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0169 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(166, true, false, true);
      logInfo("flow matrix 166,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0170
     * @tc.name      VPN_FlowMatrix_0170
     * @tc.desc      vpn flow matrix 167,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0170 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(167, false, true, true);
      logInfo("flow matrix 167,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0171
     * @tc.name      VPN_FlowMatrix_0171
     * @tc.desc      vpn flow matrix 168,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
