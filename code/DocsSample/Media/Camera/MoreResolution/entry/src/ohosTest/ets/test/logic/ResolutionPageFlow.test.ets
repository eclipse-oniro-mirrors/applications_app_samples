/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  ResolutionPageModel,
} from '../model/ResolutionLogic';

/** ResolutionPageFlowTest logic checks (36 cases). */
export default function resolutionPageFlowTest(): void {
  describe('ResolutionPageFlowTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0001
     * @tc.name      Resolution_PageFlow_0001
     * @tc.desc      resolution page ops res emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PageFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageFlow_0001 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("page ops res");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0002
     * @tc.name      Resolution_PageFlow_0002
     * @tc.desc      resolution page ops config>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0002 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchCamera();
      logInfo("page ops config>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0003
     * @tc.name      Resolution_PageFlow_0003
     * @tc.desc      resolution page ops mode>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0003 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops mode>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0004
     * @tc.name      Resolution_PageFlow_0004
     * @tc.desc      resolution page ops switch>switch>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0004 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops switch>switch>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0005
     * @tc.name      Resolution_PageFlow_0005
     * @tc.desc      resolution page ops rotation emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0005 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("page ops rotation");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0006
     * @tc.name      Resolution_PageFlow_0006
     * @tc.desc      resolution page ops fold>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0006 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      logInfo("page ops fold>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0007
     * @tc.name      Resolution_PageFlow_0007
     * @tc.desc      resolution page ops reload>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0007 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops reload>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0008
     * @tc.name      Resolution_PageFlow_0008
     * @tc.desc      resolution page ops record>switch>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0008 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops record>switch>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0009
     * @tc.name      Resolution_PageFlow_0009
     * @tc.desc      resolution page ops config>rotation emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0009 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("page ops config>rotation");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0010
     * @tc.name      Resolution_PageFlow_0010
     * @tc.desc      resolution page ops mode>rotation>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0010 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      logInfo("page ops mode>rotation>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0011
     * @tc.name      Resolution_PageFlow_0011
     * @tc.desc      resolution page ops switch>rotation>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0011 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops switch>rotation>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0012
     * @tc.name      Resolution_PageFlow_0012
     * @tc.desc      resolution page ops fold>rotation emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PageFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageFlow_0012 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("page ops fold>rotation");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0013
     * @tc.name      Resolution_PageFlow_0013
     * @tc.desc      resolution page ops reload>rotation>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0013 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      logInfo("page ops reload>rotation>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0014
     * @tc.name      Resolution_PageFlow_0014
     * @tc.desc      resolution page ops record>rotation>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0014 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops record>rotation>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0015
     * @tc.name      Resolution_PageFlow_0015
     * @tc.desc      resolution page ops config>fold emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0015 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("page ops config>fold");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0016
     * @tc.name      Resolution_PageFlow_0016
     * @tc.desc      resolution page ops mode>fold>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0016 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      logInfo("page ops mode>fold>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0017
     * @tc.name      Resolution_PageFlow_0017
     * @tc.desc      resolution page ops switch>fold>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0017 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops switch>fold>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0018
     * @tc.name      Resolution_PageFlow_0018
     * @tc.desc      resolution page ops fold>fold emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_PageFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageFlow_0018 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("page ops fold>fold");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0019
     * @tc.name      Resolution_PageFlow_0019
     * @tc.desc      resolution page ops reload>fold>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0019 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      logInfo("page ops reload>fold>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0020
     * @tc.name      Resolution_PageFlow_0020
     * @tc.desc      resolution page ops record>fold>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0020 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops record>fold>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0021
     * @tc.name      Resolution_PageFlow_0021
     * @tc.desc      resolution page ops config>reload emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0021 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      logInfo("page ops config>reload");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0022
     * @tc.name      Resolution_PageFlow_0022
     * @tc.desc      resolution page ops mode>reload>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0022 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.switchCamera();
      logInfo("page ops mode>reload>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0023
     * @tc.name      Resolution_PageFlow_0023
     * @tc.desc      resolution page ops switch>reload>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PageFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageFlow_0023 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops switch>reload>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0024
     * @tc.name      Resolution_PageFlow_0024
     * @tc.desc      resolution page ops fold>reload emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0024 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      logInfo("page ops fold>reload");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0025
     * @tc.name      Resolution_PageFlow_0025
     * @tc.desc      resolution page ops reload>reload>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0025 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.switchCamera();
      logInfo("page ops reload>reload>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0026
     * @tc.name      Resolution_PageFlow_0026
     * @tc.desc      resolution page ops record>reload>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0026 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops record>reload>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0027
     * @tc.name      Resolution_PageFlow_0027
     * @tc.desc      resolution page ops config>record emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0027 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.startRecording();
      logInfo("page ops config>record");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0028
     * @tc.name      Resolution_PageFlow_0028
     * @tc.desc      resolution page ops mode>record>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0028 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.switchCamera();
      logInfo("page ops mode>record>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0029
     * @tc.name      Resolution_PageFlow_0029
     * @tc.desc      resolution page ops switch>record>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0029 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.startRecording();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops switch>record>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0030
     * @tc.name      Resolution_PageFlow_0030
     * @tc.desc      resolution page ops fold>record emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0030 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      logInfo("page ops fold>record");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0031
     * @tc.name      Resolution_PageFlow_0031
     * @tc.desc      resolution page ops reload>record>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0031 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.startRecording();
      subject.switchCamera();
      logInfo("page ops reload>record>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0032
     * @tc.name      Resolution_PageFlow_0032
     * @tc.desc      resolution page ops record>record>switch>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0032 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.startRecording();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("page ops record>record>switch>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0033
     * @tc.name      Resolution_PageFlow_0033
     * @tc.desc      resolution page ops config>res emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0033 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("page ops config>res");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0034
     * @tc.name      Resolution_PageFlow_0034
     * @tc.desc      resolution page ops mode>res>rotation emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PageFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageFlow_0034 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("page ops mode>res>rotation");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0035
     * @tc.name      Resolution_PageFlow_0035
     * @tc.desc      resolution page ops switch>res>rotation>switch emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_PageFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PageFlow_0035 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      logInfo("page ops switch>res>rotation>switch");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_FLOW_0036
     * @tc.name      Resolution_PageFlow_0036
     * @tc.desc      resolution page ops fold>res emit the effective callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageFlow_0036 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("page ops fold>res");
      const actual: number = subject.eventCount();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}PageFlow_0036 end`);
    });
  });
}
