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

/** ResolutionLifecycleMatrixTest logic checks (356 cases). */
export default function resolutionLifecycleMatrixTest(): void {
  describe('ResolutionLifecycleMatrixTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0001
     * @tc.name      Resolution_LifecycleMatrix_0001
     * @tc.desc      resolution lifecycle res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0001 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("1|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0002
     * @tc.name      Resolution_LifecycleMatrix_0002
     * @tc.desc      resolution lifecycle config>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0002 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle config>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1440*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("2|1440*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0003
     * @tc.name      Resolution_LifecycleMatrix_0003
     * @tc.desc      resolution lifecycle mode>res>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0003 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      logInfo("lifecycle mode>res>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("3|1440*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0004
     * @tc.name      Resolution_LifecycleMatrix_0004
     * @tc.desc      resolution lifecycle switch>res>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0004 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>res>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("4|1440*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0005
     * @tc.name      Resolution_LifecycleMatrix_0005
     * @tc.desc      resolution lifecycle rotation>res>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0005 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>res>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("5|1440*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0006
     * @tc.name      Resolution_LifecycleMatrix_0006
     * @tc.desc      resolution lifecycle fold>res>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0006 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>res>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("6|1440*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0007
     * @tc.name      Resolution_LifecycleMatrix_0007
     * @tc.desc      resolution lifecycle reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0007 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      logInfo("lifecycle reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("1|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0008
     * @tc.name      Resolution_LifecycleMatrix_0008
     * @tc.desc      resolution lifecycle record>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0008 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle record>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1440*1080|1|1|true|0|false");
      expect(actual).assertEqual("2|1440*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0009
     * @tc.name      Resolution_LifecycleMatrix_0009
     * @tc.desc      resolution lifecycle res>config>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0009 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      logInfo("lifecycle res>config>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0010
     * @tc.name      Resolution_LifecycleMatrix_0010
     * @tc.desc      resolution lifecycle config>config>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0010 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>config>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0011
     * @tc.name      Resolution_LifecycleMatrix_0011
     * @tc.desc      resolution lifecycle mode>config>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0011 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>config>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0012
     * @tc.name      Resolution_LifecycleMatrix_0012
     * @tc.desc      resolution lifecycle switch>config>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0012 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>config>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0013
     * @tc.name      Resolution_LifecycleMatrix_0013
     * @tc.desc      resolution lifecycle rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0013 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("1|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0014
     * @tc.name      Resolution_LifecycleMatrix_0014
     * @tc.desc      resolution lifecycle fold>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0014 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      logInfo("lifecycle fold>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0015
     * @tc.name      Resolution_LifecycleMatrix_0015
     * @tc.desc      resolution lifecycle reload>config>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0015 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      logInfo("lifecycle reload>config>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|1.777778|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0016
     * @tc.name      Resolution_LifecycleMatrix_0016
     * @tc.desc      resolution lifecycle record>config>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0016 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>config>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0017
     * @tc.name      Resolution_LifecycleMatrix_0017
     * @tc.desc      resolution lifecycle res>mode>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0017 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>mode>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("5|1440*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0018
     * @tc.name      Resolution_LifecycleMatrix_0018
     * @tc.desc      resolution lifecycle config>mode>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0018 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>mode>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0019
     * @tc.name      Resolution_LifecycleMatrix_0019
     * @tc.desc      resolution lifecycle mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0019 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("1|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0020
     * @tc.name      Resolution_LifecycleMatrix_0020
     * @tc.desc      resolution lifecycle switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0020 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("2|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0021
     * @tc.name      Resolution_LifecycleMatrix_0021
     * @tc.desc      resolution lifecycle rotation>mode>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0021 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      logInfo("lifecycle rotation>mode>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0022
     * @tc.name      Resolution_LifecycleMatrix_0022
     * @tc.desc      resolution lifecycle fold>mode>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0022 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>mode>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0023
     * @tc.name      Resolution_LifecycleMatrix_0023
     * @tc.desc      resolution lifecycle reload>mode>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0023 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>mode>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|1.777778|true");
      expect(actual).assertEqual("5|1920*1080|2|1|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0024
     * @tc.name      Resolution_LifecycleMatrix_0024
     * @tc.desc      resolution lifecycle record>mode>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0024 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>mode>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0025
     * @tc.name      Resolution_LifecycleMatrix_0025
     * @tc.desc      resolution lifecycle config>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0025 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchCamera();
      logInfo("lifecycle config>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0026
     * @tc.name      Resolution_LifecycleMatrix_0026
     * @tc.desc      resolution lifecycle mode>switch>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0026 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.setConfigMode(2);
      logInfo("lifecycle mode>switch>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0027
     * @tc.name      Resolution_LifecycleMatrix_0027
     * @tc.desc      resolution lifecycle switch>switch>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0027 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>switch>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0028
     * @tc.name      Resolution_LifecycleMatrix_0028
     * @tc.desc      resolution lifecycle rotation>switch>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0028 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>switch>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0029
     * @tc.name      Resolution_LifecycleMatrix_0029
     * @tc.desc      resolution lifecycle fold>switch>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0029 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>switch>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0030
     * @tc.name      Resolution_LifecycleMatrix_0030
     * @tc.desc      resolution lifecycle record>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0030 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchCamera();
      logInfo("lifecycle record>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("2|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0031
     * @tc.name      Resolution_LifecycleMatrix_0031
     * @tc.desc      resolution lifecycle res>rotation>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0031 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      logInfo("lifecycle res>rotation>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0032
     * @tc.name      Resolution_LifecycleMatrix_0032
     * @tc.desc      resolution lifecycle config>rotation>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0032 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>rotation>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0033
     * @tc.name      Resolution_LifecycleMatrix_0033
     * @tc.desc      resolution lifecycle mode>rotation>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0033 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>rotation>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0034
     * @tc.name      Resolution_LifecycleMatrix_0034
     * @tc.desc      resolution lifecycle switch>rotation>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0034 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>rotation>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0035
     * @tc.name      Resolution_LifecycleMatrix_0035
     * @tc.desc      resolution lifecycle fold>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0035 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("2|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0036
     * @tc.name      Resolution_LifecycleMatrix_0036
     * @tc.desc      resolution lifecycle reload>rotation>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0036 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      logInfo("lifecycle reload>rotation>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|1.777778|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0037
     * @tc.name      Resolution_LifecycleMatrix_0037
     * @tc.desc      resolution lifecycle record>rotation>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0037 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>rotation>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0038
     * @tc.name      Resolution_LifecycleMatrix_0038
     * @tc.desc      resolution lifecycle res>fold>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0038 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>fold>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("5|1440*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0039
     * @tc.name      Resolution_LifecycleMatrix_0039
     * @tc.desc      resolution lifecycle config>fold>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0039 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>fold>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0040
     * @tc.name      Resolution_LifecycleMatrix_0040
     * @tc.desc      resolution lifecycle switch>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0040 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle switch>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("2|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0041
     * @tc.name      Resolution_LifecycleMatrix_0041
     * @tc.desc      resolution lifecycle rotation>fold>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0041 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      logInfo("lifecycle rotation>fold>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0042
     * @tc.name      Resolution_LifecycleMatrix_0042
     * @tc.desc      resolution lifecycle fold>fold>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0042 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>fold>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0043
     * @tc.name      Resolution_LifecycleMatrix_0043
     * @tc.desc      resolution lifecycle reload>fold>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0043 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>fold>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("5|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0044
     * @tc.name      Resolution_LifecycleMatrix_0044
     * @tc.desc      resolution lifecycle record>fold>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0044 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>fold>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0045
     * @tc.name      Resolution_LifecycleMatrix_0045
     * @tc.desc      resolution lifecycle config>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0045 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      logInfo("lifecycle config>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|1.777778|true");
      expect(actual).assertEqual("2|1920*1080|1|1|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0046
     * @tc.name      Resolution_LifecycleMatrix_0046
     * @tc.desc      resolution lifecycle mode>reload>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0046 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.setConfigMode(2);
      logInfo("lifecycle mode>reload>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|1.777778|true");
      expect(actual).assertEqual("3|1920*1080|1|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0047
     * @tc.name      Resolution_LifecycleMatrix_0047
     * @tc.desc      resolution lifecycle switch>reload>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0047 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>reload>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("4|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0048
     * @tc.name      Resolution_LifecycleMatrix_0048
     * @tc.desc      resolution lifecycle rotation>reload>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0048 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>reload>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("5|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0049
     * @tc.name      Resolution_LifecycleMatrix_0049
     * @tc.desc      resolution lifecycle fold>reload>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0049 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>reload>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0050
     * @tc.name      Resolution_LifecycleMatrix_0050
     * @tc.desc      resolution lifecycle record>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0050 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.reloadXComponent();
      logInfo("lifecycle record>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|true|0|true");
      expect(actual).assertEqual("2|1920*1080|1|1|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0051
     * @tc.name      Resolution_LifecycleMatrix_0051
     * @tc.desc      resolution lifecycle res>record>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0051 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.setConfigMode(2);
      logInfo("lifecycle res>record>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|true|1.777778|false");
      expect(actual).assertEqual("3|1440*1080|1|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0052
     * @tc.name      Resolution_LifecycleMatrix_0052
     * @tc.desc      resolution lifecycle config>record>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0052 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.startRecording();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>record>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0053
     * @tc.name      Resolution_LifecycleMatrix_0053
     * @tc.desc      resolution lifecycle mode>record>config>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0053 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>record>config>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|true|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0054
     * @tc.name      Resolution_LifecycleMatrix_0054
     * @tc.desc      resolution lifecycle switch>record>config>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0054 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.startRecording();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>record>config>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0055
     * @tc.name      Resolution_LifecycleMatrix_0055
     * @tc.desc      resolution lifecycle fold>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0055 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      logInfo("lifecycle fold>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("2|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0056
     * @tc.name      Resolution_LifecycleMatrix_0056
     * @tc.desc      resolution lifecycle reload>record>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0056 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.startRecording();
      subject.setConfigMode(2);
      logInfo("lifecycle reload>record>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|true|1.777778|true");
      expect(actual).assertEqual("3|1920*1080|1|1|true|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0057
     * @tc.name      Resolution_LifecycleMatrix_0057
     * @tc.desc      resolution lifecycle record>record>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0057 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.startRecording();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>record>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0058
     * @tc.name      Resolution_LifecycleMatrix_0058
     * @tc.desc      resolution lifecycle res>res>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0058 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>res>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1280*720|2|1|false|0|false");
      expect(actual).assertEqual("5|1280*720|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0059
     * @tc.name      Resolution_LifecycleMatrix_0059
     * @tc.desc      resolution lifecycle config>res>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0059 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>res>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("6|1440*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0060
     * @tc.name      Resolution_LifecycleMatrix_0060
     * @tc.desc      resolution lifecycle switch>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0060 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle switch>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1440*1080|2|1|false|0|false");
      expect(actual).assertEqual("2|1440*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0061
     * @tc.name      Resolution_LifecycleMatrix_0061
     * @tc.desc      resolution lifecycle rotation>res>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0061 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle rotation>res>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0062
     * @tc.name      Resolution_LifecycleMatrix_0062
     * @tc.desc      resolution lifecycle fold>res>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0062 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>res>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("4|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0063
     * @tc.name      Resolution_LifecycleMatrix_0063
     * @tc.desc      resolution lifecycle reload>res>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0063 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>res>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|1|false|0|true");
      expect(actual).assertEqual("5|1440*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0064
     * @tc.name      Resolution_LifecycleMatrix_0064
     * @tc.desc      resolution lifecycle record>res>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0064 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>res>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|1|true|0|false");
      expect(actual).assertEqual("6|1440*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0065
     * @tc.name      Resolution_LifecycleMatrix_0065
     * @tc.desc      resolution lifecycle config>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0065 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      logInfo("lifecycle config>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0066
     * @tc.name      Resolution_LifecycleMatrix_0066
     * @tc.desc      resolution lifecycle mode>config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0066 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle mode>config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0067
     * @tc.name      Resolution_LifecycleMatrix_0067
     * @tc.desc      resolution lifecycle switch>config>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0067 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>config>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0068
     * @tc.name      Resolution_LifecycleMatrix_0068
     * @tc.desc      resolution lifecycle rotation>config>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0068 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>config>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0069
     * @tc.name      Resolution_LifecycleMatrix_0069
     * @tc.desc      resolution lifecycle fold>config>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0069 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>config>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0070
     * @tc.name      Resolution_LifecycleMatrix_0070
     * @tc.desc      resolution lifecycle record>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0070 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.setConfigMode(2);
      logInfo("lifecycle record>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|true|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|1|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0071
     * @tc.name      Resolution_LifecycleMatrix_0071
     * @tc.desc      resolution lifecycle res>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0071 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle res>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0072
     * @tc.name      Resolution_LifecycleMatrix_0072
     * @tc.desc      resolution lifecycle config>mode>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0072 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>mode>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0073
     * @tc.name      Resolution_LifecycleMatrix_0073
     * @tc.desc      resolution lifecycle mode>mode>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0073 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>mode>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0074
     * @tc.name      Resolution_LifecycleMatrix_0074
     * @tc.desc      resolution lifecycle switch>mode>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0074 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>mode>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0075
     * @tc.name      Resolution_LifecycleMatrix_0075
     * @tc.desc      resolution lifecycle fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0075 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("2|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0076
     * @tc.name      Resolution_LifecycleMatrix_0076
     * @tc.desc      resolution lifecycle reload>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0076 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle reload>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0076 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0077
     * @tc.name      Resolution_LifecycleMatrix_0077
     * @tc.desc      resolution lifecycle record>mode>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0077 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>mode>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0078
     * @tc.name      Resolution_LifecycleMatrix_0078
     * @tc.desc      resolution lifecycle res>switch>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0078 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>switch>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("5|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0079
     * @tc.name      Resolution_LifecycleMatrix_0079
     * @tc.desc      resolution lifecycle config>switch>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0079 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>switch>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0080
     * @tc.name      Resolution_LifecycleMatrix_0080
     * @tc.desc      resolution lifecycle switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0080 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("2|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0081
     * @tc.name      Resolution_LifecycleMatrix_0081
     * @tc.desc      resolution lifecycle rotation>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0081 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle rotation>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0082
     * @tc.name      Resolution_LifecycleMatrix_0082
     * @tc.desc      resolution lifecycle fold>switch>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0082 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>switch>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("4|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0083
     * @tc.name      Resolution_LifecycleMatrix_0083
     * @tc.desc      resolution lifecycle reload>switch>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0083 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>switch>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("5|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0084
     * @tc.name      Resolution_LifecycleMatrix_0084
     * @tc.desc      resolution lifecycle record>switch>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0084 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>switch>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("6|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0085
     * @tc.name      Resolution_LifecycleMatrix_0085
     * @tc.desc      resolution lifecycle config>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0085 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0086
     * @tc.name      Resolution_LifecycleMatrix_0086
     * @tc.desc      resolution lifecycle mode>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0086 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle mode>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0087
     * @tc.name      Resolution_LifecycleMatrix_0087
     * @tc.desc      resolution lifecycle switch>rotation>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0087 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>rotation>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("4|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0088
     * @tc.name      Resolution_LifecycleMatrix_0088
     * @tc.desc      resolution lifecycle rotation>rotation>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0088 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>rotation>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0089
     * @tc.name      Resolution_LifecycleMatrix_0089
     * @tc.desc      resolution lifecycle fold>rotation>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0089 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>rotation>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("6|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0090
     * @tc.name      Resolution_LifecycleMatrix_0090
     * @tc.desc      resolution lifecycle record>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0090 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("2|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0091
     * @tc.name      Resolution_LifecycleMatrix_0091
     * @tc.desc      resolution lifecycle res>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0091 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle res>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0092
     * @tc.name      Resolution_LifecycleMatrix_0092
     * @tc.desc      resolution lifecycle config>fold>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0092 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>fold>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0093
     * @tc.name      Resolution_LifecycleMatrix_0093
     * @tc.desc      resolution lifecycle mode>fold>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0093 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>fold>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0094
     * @tc.name      Resolution_LifecycleMatrix_0094
     * @tc.desc      resolution lifecycle switch>fold>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0094 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>fold>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0095
     * @tc.name      Resolution_LifecycleMatrix_0095
     * @tc.desc      resolution lifecycle fold>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0095 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle fold>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("2|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0096
     * @tc.name      Resolution_LifecycleMatrix_0096
     * @tc.desc      resolution lifecycle reload>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0096 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle reload>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0097
     * @tc.name      Resolution_LifecycleMatrix_0097
     * @tc.desc      resolution lifecycle record>fold>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0097 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>fold>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0098
     * @tc.name      Resolution_LifecycleMatrix_0098
     * @tc.desc      resolution lifecycle res>reload>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0098 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>reload>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|1|false|0|true");
      expect(actual).assertEqual("5|1440*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0099
     * @tc.name      Resolution_LifecycleMatrix_0099
     * @tc.desc      resolution lifecycle config>reload>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0099 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>reload>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|false|1.777778|true");
      expect(actual).assertEqual("6|1920*1080|2|1|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0100
     * @tc.name      Resolution_LifecycleMatrix_0100
     * @tc.desc      resolution lifecycle switch>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0100 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.reloadXComponent();
      logInfo("lifecycle switch>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|false|0|true");
      expect(actual).assertEqual("2|1920*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0101
     * @tc.name      Resolution_LifecycleMatrix_0101
     * @tc.desc      resolution lifecycle rotation>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0101 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle rotation>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0102
     * @tc.name      Resolution_LifecycleMatrix_0102
     * @tc.desc      resolution lifecycle fold>reload>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0102 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>reload>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("4|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0103
     * @tc.name      Resolution_LifecycleMatrix_0103
     * @tc.desc      resolution lifecycle reload>reload>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0103 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>reload>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0104
     * @tc.name      Resolution_LifecycleMatrix_0104
     * @tc.desc      resolution lifecycle record>reload>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0104 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>reload>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|true|0|true");
      expect(actual).assertEqual("6|1920*1080|2|1|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0105
     * @tc.name      Resolution_LifecycleMatrix_0105
     * @tc.desc      resolution lifecycle config>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0105 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.startRecording();
      logInfo("lifecycle config>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|true|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|1|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0106
     * @tc.name      Resolution_LifecycleMatrix_0106
     * @tc.desc      resolution lifecycle mode>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0106 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle mode>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("3|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0107
     * @tc.name      Resolution_LifecycleMatrix_0107
     * @tc.desc      resolution lifecycle switch>record>mode>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0107 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>record>mode>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("4|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0108
     * @tc.name      Resolution_LifecycleMatrix_0108
     * @tc.desc      resolution lifecycle rotation>record>mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0108 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>record>mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0109
     * @tc.name      Resolution_LifecycleMatrix_0109
     * @tc.desc      resolution lifecycle fold>record>mode>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0109 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>record>mode>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("6|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0110
     * @tc.name      Resolution_LifecycleMatrix_0110
     * @tc.desc      resolution lifecycle record>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0110 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.startRecording();
      logInfo("lifecycle record>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "1|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("1|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0111
     * @tc.name      Resolution_LifecycleMatrix_0111
     * @tc.desc      resolution lifecycle res>res>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0111 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      logInfo("lifecycle res>res>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1280*720|2|1|false|0|false");
      expect(actual).assertEqual("3|1280*720|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0112
     * @tc.name      Resolution_LifecycleMatrix_0112
     * @tc.desc      resolution lifecycle config>res>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0112 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>res>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("4|1440*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0113
     * @tc.name      Resolution_LifecycleMatrix_0113
     * @tc.desc      resolution lifecycle mode>res>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0113 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>res>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("5|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0114
     * @tc.name      Resolution_LifecycleMatrix_0114
     * @tc.desc      resolution lifecycle switch>res>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0114 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>res>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|2|false|0|false");
      expect(actual).assertEqual("6|1440*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0115
     * @tc.name      Resolution_LifecycleMatrix_0115
     * @tc.desc      resolution lifecycle fold>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0115 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle fold>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("2|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0116
     * @tc.name      Resolution_LifecycleMatrix_0116
     * @tc.desc      resolution lifecycle reload>res>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0116 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      logInfo("lifecycle reload>res>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|2|1|false|0|true");
      expect(actual).assertEqual("3|1440*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0117
     * @tc.name      Resolution_LifecycleMatrix_0117
     * @tc.desc      resolution lifecycle record>res>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0117 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>res>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|2|2|true|0|false");
      expect(actual).assertEqual("4|1440*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0118
     * @tc.name      Resolution_LifecycleMatrix_0118
     * @tc.desc      resolution lifecycle res>config>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0118 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>config>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("5|1440*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0119
     * @tc.name      Resolution_LifecycleMatrix_0119
     * @tc.desc      resolution lifecycle config>config>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0119 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>config>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0120
     * @tc.name      Resolution_LifecycleMatrix_0120
     * @tc.desc      resolution lifecycle switch>config keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0120 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.setConfigMode(2);
      logInfo("lifecycle switch>config");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0121
     * @tc.name      Resolution_LifecycleMatrix_0121
     * @tc.desc      resolution lifecycle rotation>config>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0121 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.switchCamera();
      logInfo("lifecycle rotation>config>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0122
     * @tc.name      Resolution_LifecycleMatrix_0122
     * @tc.desc      resolution lifecycle fold>config>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0122 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>config>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0123
     * @tc.name      Resolution_LifecycleMatrix_0123
     * @tc.desc      resolution lifecycle reload>config>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0123 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>config>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|false|1.777778|true");
      expect(actual).assertEqual("5|1920*1080|1|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0124
     * @tc.name      Resolution_LifecycleMatrix_0124
     * @tc.desc      resolution lifecycle record>config>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0124 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>config>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0125
     * @tc.name      Resolution_LifecycleMatrix_0125
     * @tc.desc      resolution lifecycle config>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0125 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0126
     * @tc.name      Resolution_LifecycleMatrix_0126
     * @tc.desc      resolution lifecycle mode>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0126 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0126 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0127
     * @tc.name      Resolution_LifecycleMatrix_0127
     * @tc.desc      resolution lifecycle switch>mode>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0127 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>mode>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("4|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0128
     * @tc.name      Resolution_LifecycleMatrix_0128
     * @tc.desc      resolution lifecycle rotation>mode>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0128 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>mode>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0129
     * @tc.name      Resolution_LifecycleMatrix_0129
     * @tc.desc      resolution lifecycle fold>mode>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0129 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>mode>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0130
     * @tc.name      Resolution_LifecycleMatrix_0130
     * @tc.desc      resolution lifecycle record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0130 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("2|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0131
     * @tc.name      Resolution_LifecycleMatrix_0131
     * @tc.desc      resolution lifecycle res>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0131 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle res>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0132
     * @tc.name      Resolution_LifecycleMatrix_0132
     * @tc.desc      resolution lifecycle config>switch>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0132 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>switch>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0133
     * @tc.name      Resolution_LifecycleMatrix_0133
     * @tc.desc      resolution lifecycle mode>switch>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0133 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>switch>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0134
     * @tc.name      Resolution_LifecycleMatrix_0134
     * @tc.desc      resolution lifecycle switch>switch>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0134 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>switch>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0135
     * @tc.name      Resolution_LifecycleMatrix_0135
     * @tc.desc      resolution lifecycle fold>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0135 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      logInfo("lifecycle fold>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("2|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0136
     * @tc.name      Resolution_LifecycleMatrix_0136
     * @tc.desc      resolution lifecycle reload>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0136 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle reload>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0137
     * @tc.name      Resolution_LifecycleMatrix_0137
     * @tc.desc      resolution lifecycle record>switch>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0137 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>switch>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0138
     * @tc.name      Resolution_LifecycleMatrix_0138
     * @tc.desc      resolution lifecycle res>rotation>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0138 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>rotation>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|2|false|0|false");
      expect(actual).assertEqual("5|1440*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0139
     * @tc.name      Resolution_LifecycleMatrix_0139
     * @tc.desc      resolution lifecycle config>rotation>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0139 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>rotation>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0140
     * @tc.name      Resolution_LifecycleMatrix_0140
     * @tc.desc      resolution lifecycle switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0140 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("2|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0141
     * @tc.name      Resolution_LifecycleMatrix_0141
     * @tc.desc      resolution lifecycle rotation>rotation>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0141 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      logInfo("lifecycle rotation>rotation>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0142
     * @tc.name      Resolution_LifecycleMatrix_0142
     * @tc.desc      resolution lifecycle fold>rotation>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0142 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>rotation>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("4|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0143
     * @tc.name      Resolution_LifecycleMatrix_0143
     * @tc.desc      resolution lifecycle reload>rotation>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0143 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>rotation>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("5|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0144
     * @tc.name      Resolution_LifecycleMatrix_0144
     * @tc.desc      resolution lifecycle record>rotation>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0144 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>rotation>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0145
     * @tc.name      Resolution_LifecycleMatrix_0145
     * @tc.desc      resolution lifecycle config>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0145 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle config>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("2|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0146
     * @tc.name      Resolution_LifecycleMatrix_0146
     * @tc.desc      resolution lifecycle mode>fold>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0146 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      logInfo("lifecycle mode>fold>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0147
     * @tc.name      Resolution_LifecycleMatrix_0147
     * @tc.desc      resolution lifecycle switch>fold>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0147 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>fold>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0148
     * @tc.name      Resolution_LifecycleMatrix_0148
     * @tc.desc      resolution lifecycle rotation>fold>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0148 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>fold>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("5|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0149
     * @tc.name      Resolution_LifecycleMatrix_0149
     * @tc.desc      resolution lifecycle fold>fold>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0149 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>fold>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0150
     * @tc.name      Resolution_LifecycleMatrix_0150
     * @tc.desc      resolution lifecycle record>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0150 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle record>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("2|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0151
     * @tc.name      Resolution_LifecycleMatrix_0151
     * @tc.desc      resolution lifecycle res>reload>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0151 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.switchCamera();
      logInfo("lifecycle res>reload>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|2|1|false|0|true");
      expect(actual).assertEqual("3|1440*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0152
     * @tc.name      Resolution_LifecycleMatrix_0152
     * @tc.desc      resolution lifecycle config>reload>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0152 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>reload>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("4|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0153
     * @tc.name      Resolution_LifecycleMatrix_0153
     * @tc.desc      resolution lifecycle mode>reload>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0153 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>reload>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("5|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0154
     * @tc.name      Resolution_LifecycleMatrix_0154
     * @tc.desc      resolution lifecycle switch>reload>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0154 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>reload>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0155
     * @tc.name      Resolution_LifecycleMatrix_0155
     * @tc.desc      resolution lifecycle fold>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0155 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      logInfo("lifecycle fold>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("2|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0156
     * @tc.name      Resolution_LifecycleMatrix_0156
     * @tc.desc      resolution lifecycle reload>reload>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0156 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.switchCamera();
      logInfo("lifecycle reload>reload>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0157
     * @tc.name      Resolution_LifecycleMatrix_0157
     * @tc.desc      resolution lifecycle record>reload>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0157 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>reload>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("4|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0158
     * @tc.name      Resolution_LifecycleMatrix_0158
     * @tc.desc      resolution lifecycle res>record>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0158 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>record>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|2|true|0|false");
      expect(actual).assertEqual("5|1440*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0159
     * @tc.name      Resolution_LifecycleMatrix_0159
     * @tc.desc      resolution lifecycle config>record>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0159 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.startRecording();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>record>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0160
     * @tc.name      Resolution_LifecycleMatrix_0160
     * @tc.desc      resolution lifecycle switch>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0160 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.startRecording();
      logInfo("lifecycle switch>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("2|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0161
     * @tc.name      Resolution_LifecycleMatrix_0161
     * @tc.desc      resolution lifecycle rotation>record>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0161 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.switchCamera();
      logInfo("lifecycle rotation>record>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("3|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0162
     * @tc.name      Resolution_LifecycleMatrix_0162
     * @tc.desc      resolution lifecycle fold>record>switch>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0162 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>record>switch>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0163
     * @tc.name      Resolution_LifecycleMatrix_0163
     * @tc.desc      resolution lifecycle reload>record>switch>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0163 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.startRecording();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>record>switch>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|true|0|true");
      expect(actual).assertEqual("5|1920*1080|1|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0164
     * @tc.name      Resolution_LifecycleMatrix_0164
     * @tc.desc      resolution lifecycle record>record>switch>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0164 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.startRecording();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>record>switch>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("5|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0165
     * @tc.name      Resolution_LifecycleMatrix_0165
     * @tc.desc      resolution lifecycle mode>res>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0165 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle mode>res>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0166
     * @tc.name      Resolution_LifecycleMatrix_0166
     * @tc.desc      resolution lifecycle switch>res>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0166 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>res>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|2|2|false|0|false");
      expect(actual).assertEqual("4|1440*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0167
     * @tc.name      Resolution_LifecycleMatrix_0167
     * @tc.desc      resolution lifecycle rotation>res>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0167 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>res>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|0|false");
      expect(actual).assertEqual("5|1440*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0168
     * @tc.name      Resolution_LifecycleMatrix_0168
     * @tc.desc      resolution lifecycle fold>res>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0168 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>res>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|2|false|0|false");
      expect(actual).assertEqual("6|1440*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0169
     * @tc.name      Resolution_LifecycleMatrix_0169
     * @tc.desc      resolution lifecycle res>config>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0169 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle res>config>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0170
     * @tc.name      Resolution_LifecycleMatrix_0170
     * @tc.desc      resolution lifecycle config>config>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0170 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>config>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0171
     * @tc.name      Resolution_LifecycleMatrix_0171
     * @tc.desc      resolution lifecycle mode>config>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0171 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>config>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0171 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0172
     * @tc.name      Resolution_LifecycleMatrix_0172
     * @tc.desc      resolution lifecycle switch>config>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0172 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>config>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0172 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0173
     * @tc.name      Resolution_LifecycleMatrix_0173
     * @tc.desc      resolution lifecycle reload>config>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0173 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle reload>config>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|1.777778|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0173 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0174
     * @tc.name      Resolution_LifecycleMatrix_0174
     * @tc.desc      resolution lifecycle record>config>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0174 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>config>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0174 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0175
     * @tc.name      Resolution_LifecycleMatrix_0175
     * @tc.desc      resolution lifecycle res>mode>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0175 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>mode>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1440*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0175 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0176
     * @tc.name      Resolution_LifecycleMatrix_0176
     * @tc.desc      resolution lifecycle config>mode>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0176 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>mode>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0176 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0177
     * @tc.name      Resolution_LifecycleMatrix_0177
     * @tc.desc      resolution lifecycle rotation>mode>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0177 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle rotation>mode>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("3|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0177 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0178
     * @tc.name      Resolution_LifecycleMatrix_0178
     * @tc.desc      resolution lifecycle fold>mode>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0178 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>mode>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("4|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0178 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0179
     * @tc.name      Resolution_LifecycleMatrix_0179
     * @tc.desc      resolution lifecycle reload>mode>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0179 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>mode>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|true");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0179 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0180
     * @tc.name      Resolution_LifecycleMatrix_0180
     * @tc.desc      resolution lifecycle record>mode>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0180 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>mode>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("6|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0180 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0181
     * @tc.name      Resolution_LifecycleMatrix_0181
     * @tc.desc      resolution lifecycle mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0181 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0181 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0182
     * @tc.name      Resolution_LifecycleMatrix_0182
     * @tc.desc      resolution lifecycle switch>switch>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0182 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>switch>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0182 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0183
     * @tc.name      Resolution_LifecycleMatrix_0183
     * @tc.desc      resolution lifecycle rotation>switch>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0183 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>switch>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("5|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0183 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0184
     * @tc.name      Resolution_LifecycleMatrix_0184
     * @tc.desc      resolution lifecycle fold>switch>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0184 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>switch>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0184 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0185
     * @tc.name      Resolution_LifecycleMatrix_0185
     * @tc.desc      resolution lifecycle res>rotation>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0185 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle res>rotation>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0185 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0186
     * @tc.name      Resolution_LifecycleMatrix_0186
     * @tc.desc      resolution lifecycle config>rotation>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0186 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>rotation>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0186 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0187
     * @tc.name      Resolution_LifecycleMatrix_0187
     * @tc.desc      resolution lifecycle mode>rotation>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0187 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>rotation>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0187 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0188
     * @tc.name      Resolution_LifecycleMatrix_0188
     * @tc.desc      resolution lifecycle switch>rotation>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0188 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>rotation>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0188 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0189
     * @tc.name      Resolution_LifecycleMatrix_0189
     * @tc.desc      resolution lifecycle reload>rotation>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0189 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle reload>rotation>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0189 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0190
     * @tc.name      Resolution_LifecycleMatrix_0190
     * @tc.desc      resolution lifecycle record>rotation>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0190 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>rotation>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0190 end`);
    });
