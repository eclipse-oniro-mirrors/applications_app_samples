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
