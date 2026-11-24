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

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0191
     * @tc.name      Resolution_LifecycleMatrix_0191
     * @tc.desc      resolution lifecycle res>fold>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0191 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>fold>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|0|false");
      expect(actual).assertEqual("5|1440*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0191 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0192
     * @tc.name      Resolution_LifecycleMatrix_0192
     * @tc.desc      resolution lifecycle config>fold>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0192 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>fold>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0192 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0193
     * @tc.name      Resolution_LifecycleMatrix_0193
     * @tc.desc      resolution lifecycle rotation>fold>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0193 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle rotation>fold>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0193 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0194
     * @tc.name      Resolution_LifecycleMatrix_0194
     * @tc.desc      resolution lifecycle fold>fold>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0194 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>fold>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0194 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0195
     * @tc.name      Resolution_LifecycleMatrix_0195
     * @tc.desc      resolution lifecycle reload>fold>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0195 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>fold>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0195 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0196
     * @tc.name      Resolution_LifecycleMatrix_0196
     * @tc.desc      resolution lifecycle record>fold>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0196 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>fold>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("6|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0196 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0197
     * @tc.name      Resolution_LifecycleMatrix_0197
     * @tc.desc      resolution lifecycle mode>reload>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0197 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle mode>reload>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0197 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0198
     * @tc.name      Resolution_LifecycleMatrix_0198
     * @tc.desc      resolution lifecycle switch>reload>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0198 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>reload>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("4|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0198 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0199
     * @tc.name      Resolution_LifecycleMatrix_0199
     * @tc.desc      resolution lifecycle rotation>reload>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0199 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>reload>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0199 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0200
     * @tc.name      Resolution_LifecycleMatrix_0200
     * @tc.desc      resolution lifecycle fold>reload>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0200 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>reload>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0200 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0201
     * @tc.name      Resolution_LifecycleMatrix_0201
     * @tc.desc      resolution lifecycle res>record>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0201 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle res>record>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|true|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0201 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0202
     * @tc.name      Resolution_LifecycleMatrix_0202
     * @tc.desc      resolution lifecycle config>record>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0202 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>record>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0202 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0203
     * @tc.name      Resolution_LifecycleMatrix_0203
     * @tc.desc      resolution lifecycle mode>record>rotation>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0203 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>record>rotation>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0203 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0204
     * @tc.name      Resolution_LifecycleMatrix_0204
     * @tc.desc      resolution lifecycle switch>record>rotation>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0204 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>record>rotation>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0204 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0205
     * @tc.name      Resolution_LifecycleMatrix_0205
     * @tc.desc      resolution lifecycle reload>record>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0205 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle reload>record>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|true|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0205 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0206
     * @tc.name      Resolution_LifecycleMatrix_0206
     * @tc.desc      resolution lifecycle record>record>rotation>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0206 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>record>rotation>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("3|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0206 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0207
     * @tc.name      Resolution_LifecycleMatrix_0207
     * @tc.desc      resolution lifecycle res>res>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0207 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>res>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1280*720|2|2|false|0|false");
      expect(actual).assertEqual("5|1280*720|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0207 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0208
     * @tc.name      Resolution_LifecycleMatrix_0208
     * @tc.desc      resolution lifecycle config>res>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0208 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>res>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("6|1440*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0208 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0209
     * @tc.name      Resolution_LifecycleMatrix_0209
     * @tc.desc      resolution lifecycle rotation>res>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0209 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle rotation>res>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0209 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0210
     * @tc.name      Resolution_LifecycleMatrix_0210
     * @tc.desc      resolution lifecycle fold>res>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0210 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>res>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|1|2|false|0|false");
      expect(actual).assertEqual("4|1440*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0210 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0211
     * @tc.name      Resolution_LifecycleMatrix_0211
     * @tc.desc      resolution lifecycle reload>res>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0211 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>res>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|0|true");
      expect(actual).assertEqual("5|1440*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0211 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0212
     * @tc.name      Resolution_LifecycleMatrix_0212
     * @tc.desc      resolution lifecycle record>res>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0212 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>res>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|2|true|0|false");
      expect(actual).assertEqual("6|1440*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0212 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0213
     * @tc.name      Resolution_LifecycleMatrix_0213
     * @tc.desc      resolution lifecycle mode>config>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0213 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle mode>config>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0213 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0214
     * @tc.name      Resolution_LifecycleMatrix_0214
     * @tc.desc      resolution lifecycle switch>config>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0214 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>config>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0214 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0215
     * @tc.name      Resolution_LifecycleMatrix_0215
     * @tc.desc      resolution lifecycle rotation>config>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0215 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>config>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0215 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0216
     * @tc.name      Resolution_LifecycleMatrix_0216
     * @tc.desc      resolution lifecycle fold>config>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0216 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>config>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0216 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0217
     * @tc.name      Resolution_LifecycleMatrix_0217
     * @tc.desc      resolution lifecycle res>mode>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0217 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle res>mode>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0217 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0218
     * @tc.name      Resolution_LifecycleMatrix_0218
     * @tc.desc      resolution lifecycle config>mode>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0218 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>mode>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0218 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0219
     * @tc.name      Resolution_LifecycleMatrix_0219
     * @tc.desc      resolution lifecycle mode>mode>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0219 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>mode>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0219 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0220
     * @tc.name      Resolution_LifecycleMatrix_0220
     * @tc.desc      resolution lifecycle switch>mode>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0220 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>mode>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|1|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0220 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0221
     * @tc.name      Resolution_LifecycleMatrix_0221
     * @tc.desc      resolution lifecycle reload>mode>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0221 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle reload>mode>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0221 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0222
     * @tc.name      Resolution_LifecycleMatrix_0222
     * @tc.desc      resolution lifecycle record>mode>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0222 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>mode>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0222 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0223
     * @tc.name      Resolution_LifecycleMatrix_0223
     * @tc.desc      resolution lifecycle res>switch>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0223 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>switch>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|2|false|0|false");
      expect(actual).assertEqual("5|1440*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0223 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0224
     * @tc.name      Resolution_LifecycleMatrix_0224
     * @tc.desc      resolution lifecycle config>switch>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0224 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>switch>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0224 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0225
     * @tc.name      Resolution_LifecycleMatrix_0225
     * @tc.desc      resolution lifecycle rotation>switch>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0225 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle rotation>switch>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0225 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0226
     * @tc.name      Resolution_LifecycleMatrix_0226
     * @tc.desc      resolution lifecycle fold>switch>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0226 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>switch>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("4|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0226 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0227
     * @tc.name      Resolution_LifecycleMatrix_0227
     * @tc.desc      resolution lifecycle reload>switch>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0227 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>switch>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("5|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0227 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0228
     * @tc.name      Resolution_LifecycleMatrix_0228
     * @tc.desc      resolution lifecycle record>switch>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0228 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>switch>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0228 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0229
     * @tc.name      Resolution_LifecycleMatrix_0229
     * @tc.desc      resolution lifecycle mode>rotation>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0229 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle mode>rotation>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("3|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0229 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0230
     * @tc.name      Resolution_LifecycleMatrix_0230
     * @tc.desc      resolution lifecycle switch>rotation>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0230 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>rotation>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("4|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0230 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0231
     * @tc.name      Resolution_LifecycleMatrix_0231
     * @tc.desc      resolution lifecycle rotation>rotation>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0231 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>rotation>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0231 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0232
     * @tc.name      Resolution_LifecycleMatrix_0232
     * @tc.desc      resolution lifecycle fold>rotation>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0232 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>rotation>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0232 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0233
     * @tc.name      Resolution_LifecycleMatrix_0233
     * @tc.desc      resolution lifecycle res>fold>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0233 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle res>fold>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0233 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0234
     * @tc.name      Resolution_LifecycleMatrix_0234
     * @tc.desc      resolution lifecycle config>fold>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0234 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>fold>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0234 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0235
     * @tc.name      Resolution_LifecycleMatrix_0235
     * @tc.desc      resolution lifecycle mode>fold>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0235 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>fold>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0235 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0236
     * @tc.name      Resolution_LifecycleMatrix_0236
     * @tc.desc      resolution lifecycle switch>fold>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0236 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>fold>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0236 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0237
     * @tc.name      Resolution_LifecycleMatrix_0237
     * @tc.desc      resolution lifecycle reload>fold>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0237 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle reload>fold>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0237 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0238
     * @tc.name      Resolution_LifecycleMatrix_0238
     * @tc.desc      resolution lifecycle record>fold>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0238 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>fold>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0238 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0239
     * @tc.name      Resolution_LifecycleMatrix_0239
     * @tc.desc      resolution lifecycle res>reload>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0239 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>reload>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|0|true");
      expect(actual).assertEqual("5|1440*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0239 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0240
     * @tc.name      Resolution_LifecycleMatrix_0240
     * @tc.desc      resolution lifecycle config>reload>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0240 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>reload>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0240 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0241
     * @tc.name      Resolution_LifecycleMatrix_0241
     * @tc.desc      resolution lifecycle rotation>reload>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0241 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle rotation>reload>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0241 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0242
     * @tc.name      Resolution_LifecycleMatrix_0242
     * @tc.desc      resolution lifecycle fold>reload>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0242 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>reload>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("4|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0242 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0243
     * @tc.name      Resolution_LifecycleMatrix_0243
     * @tc.desc      resolution lifecycle reload>reload>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0243 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>reload>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0243 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0244
     * @tc.name      Resolution_LifecycleMatrix_0244
     * @tc.desc      resolution lifecycle record>reload>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0244 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>reload>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("6|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0244 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0245
     * @tc.name      Resolution_LifecycleMatrix_0245
     * @tc.desc      resolution lifecycle mode>record>fold keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0245 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      logInfo("lifecycle mode>record>fold");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("3|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0245 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0246
     * @tc.name      Resolution_LifecycleMatrix_0246
     * @tc.desc      resolution lifecycle switch>record>fold>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0246 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>record>fold>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0246 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0247
     * @tc.name      Resolution_LifecycleMatrix_0247
     * @tc.desc      resolution lifecycle rotation>record>fold>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0247 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>record>fold>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0247 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0248
     * @tc.name      Resolution_LifecycleMatrix_0248
     * @tc.desc      resolution lifecycle fold>record>fold>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0248 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>record>fold>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("6|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0248 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0249
     * @tc.name      Resolution_LifecycleMatrix_0249
     * @tc.desc      resolution lifecycle res>res>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0249 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      logInfo("lifecycle res>res>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1280*720|1|1|false|0|true");
      expect(actual).assertEqual("3|1280*720|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0249 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0250
     * @tc.name      Resolution_LifecycleMatrix_0250
     * @tc.desc      resolution lifecycle config>res>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0250 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>res>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|1|2|false|1.777778|true");
      expect(actual).assertEqual("4|1440*1080|1|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0250 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0251
     * @tc.name      Resolution_LifecycleMatrix_0251
     * @tc.desc      resolution lifecycle mode>res>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0251 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>res>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|1|false|0|true");
      expect(actual).assertEqual("5|1440*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0251 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0252
     * @tc.name      Resolution_LifecycleMatrix_0252
     * @tc.desc      resolution lifecycle switch>res>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0252 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>res>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|1|2|false|0|true");
      expect(actual).assertEqual("6|1440*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0252 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0253
     * @tc.name      Resolution_LifecycleMatrix_0253
     * @tc.desc      resolution lifecycle reload>res>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0253 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      logInfo("lifecycle reload>res>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0253 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0254
     * @tc.name      Resolution_LifecycleMatrix_0254
     * @tc.desc      resolution lifecycle record>res>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0254 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>res>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|1|2|true|0|true");
      expect(actual).assertEqual("4|1440*1080|1|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0254 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0255
     * @tc.name      Resolution_LifecycleMatrix_0255
     * @tc.desc      resolution lifecycle res>config>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0255 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>config>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("5|1440*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0255 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0256
     * @tc.name      Resolution_LifecycleMatrix_0256
     * @tc.desc      resolution lifecycle config>config>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0256 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>config>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0256 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0257
     * @tc.name      Resolution_LifecycleMatrix_0257
     * @tc.desc      resolution lifecycle rotation>config>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0257 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.reloadXComponent();
      logInfo("lifecycle rotation>config>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|1.777778|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0257 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0258
     * @tc.name      Resolution_LifecycleMatrix_0258
     * @tc.desc      resolution lifecycle fold>config>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0258 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>config>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|true");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0258 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0259
     * @tc.name      Resolution_LifecycleMatrix_0259
     * @tc.desc      resolution lifecycle reload>config>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0259 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>config>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0259 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0260
     * @tc.name      Resolution_LifecycleMatrix_0260
     * @tc.desc      resolution lifecycle record>config>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0260 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>config>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|1.777778|true");
      expect(actual).assertEqual("6|1920*1080|2|2|true|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0260 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0261
     * @tc.name      Resolution_LifecycleMatrix_0261
     * @tc.desc      resolution lifecycle mode>mode>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0261 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      logInfo("lifecycle mode>mode>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0261 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0262
     * @tc.name      Resolution_LifecycleMatrix_0262
     * @tc.desc      resolution lifecycle switch>mode>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0262 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>mode>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|1|false|0|true");
      expect(actual).assertEqual("4|1920*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0262 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0263
     * @tc.name      Resolution_LifecycleMatrix_0263
     * @tc.desc      resolution lifecycle rotation>mode>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0263 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>mode>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|true");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0263 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0264
     * @tc.name      Resolution_LifecycleMatrix_0264
     * @tc.desc      resolution lifecycle fold>mode>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0264 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>mode>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|false|0|true");
      expect(actual).assertEqual("6|1920*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0264 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0265
     * @tc.name      Resolution_LifecycleMatrix_0265
     * @tc.desc      resolution lifecycle res>switch>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0265 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.reloadXComponent();
      logInfo("lifecycle res>switch>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|2|1|false|0|true");
      expect(actual).assertEqual("3|1440*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0265 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0266
     * @tc.name      Resolution_LifecycleMatrix_0266
     * @tc.desc      resolution lifecycle config>switch>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0266 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>switch>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("4|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0266 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0267
     * @tc.name      Resolution_LifecycleMatrix_0267
     * @tc.desc      resolution lifecycle mode>switch>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0267 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>switch>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("5|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0267 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0268
     * @tc.name      Resolution_LifecycleMatrix_0268
     * @tc.desc      resolution lifecycle switch>switch>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0268 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>switch>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0268 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0269
     * @tc.name      Resolution_LifecycleMatrix_0269
     * @tc.desc      resolution lifecycle reload>switch>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0269 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.reloadXComponent();
      logInfo("lifecycle reload>switch>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("3|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0269 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0270
     * @tc.name      Resolution_LifecycleMatrix_0270
     * @tc.desc      resolution lifecycle record>switch>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0270 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>switch>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("4|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0270 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0271
     * @tc.name      Resolution_LifecycleMatrix_0271
     * @tc.desc      resolution lifecycle res>rotation>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0271 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>rotation>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|false|0|true");
      expect(actual).assertEqual("5|1440*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0271 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0272
     * @tc.name      Resolution_LifecycleMatrix_0272
     * @tc.desc      resolution lifecycle config>rotation>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0272 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>rotation>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|1.777778|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0272 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0273
     * @tc.name      Resolution_LifecycleMatrix_0273
     * @tc.desc      resolution lifecycle rotation>rotation>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0273 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      logInfo("lifecycle rotation>rotation>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0273 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0274
     * @tc.name      Resolution_LifecycleMatrix_0274
     * @tc.desc      resolution lifecycle fold>rotation>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0274 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>rotation>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("4|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0274 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0275
     * @tc.name      Resolution_LifecycleMatrix_0275
     * @tc.desc      resolution lifecycle reload>rotation>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0275 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>rotation>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0275 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0276
     * @tc.name      Resolution_LifecycleMatrix_0276
     * @tc.desc      resolution lifecycle record>rotation>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0276 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>rotation>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("6|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0276 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0277
     * @tc.name      Resolution_LifecycleMatrix_0277
     * @tc.desc      resolution lifecycle mode>fold>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0277 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      logInfo("lifecycle mode>fold>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0277 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0278
     * @tc.name      Resolution_LifecycleMatrix_0278
     * @tc.desc      resolution lifecycle switch>fold>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0278 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>fold>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("4|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0278 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0279
     * @tc.name      Resolution_LifecycleMatrix_0279
     * @tc.desc      resolution lifecycle rotation>fold>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0279 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>fold>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("5|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0279 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0280
     * @tc.name      Resolution_LifecycleMatrix_0280
     * @tc.desc      resolution lifecycle fold>fold>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0280 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>fold>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|false|0|true");
      expect(actual).assertEqual("6|1920*1080|2|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0280 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0281
     * @tc.name      Resolution_LifecycleMatrix_0281
     * @tc.desc      resolution lifecycle res>reload>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0281 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.reloadXComponent();
      subject.reloadXComponent();
      logInfo("lifecycle res>reload>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0281 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0282
     * @tc.name      Resolution_LifecycleMatrix_0282
     * @tc.desc      resolution lifecycle config>reload>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0282 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>reload>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0282 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0283
     * @tc.name      Resolution_LifecycleMatrix_0283
     * @tc.desc      resolution lifecycle mode>reload>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0283 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>reload>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|false|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0283 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0284
     * @tc.name      Resolution_LifecycleMatrix_0284
     * @tc.desc      resolution lifecycle switch>reload>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0284 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>reload>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|false|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0284 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0285
     * @tc.name      Resolution_LifecycleMatrix_0285
     * @tc.desc      resolution lifecycle reload>reload>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0285 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.reloadXComponent();
      logInfo("lifecycle reload>reload>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|false|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0285 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0286
     * @tc.name      Resolution_LifecycleMatrix_0286
     * @tc.desc      resolution lifecycle record>reload>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0286 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.reloadXComponent();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>reload>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0286 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0287
     * @tc.name      Resolution_LifecycleMatrix_0287
     * @tc.desc      resolution lifecycle res>record>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0287 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>record>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|true|0|true");
      expect(actual).assertEqual("5|1440*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0287 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0288
     * @tc.name      Resolution_LifecycleMatrix_0288
     * @tc.desc      resolution lifecycle config>record>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0288 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>record>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|1.777778|true");
      expect(actual).assertEqual("6|1920*1080|2|2|true|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0288 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0289
     * @tc.name      Resolution_LifecycleMatrix_0289
     * @tc.desc      resolution lifecycle rotation>record>reload keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0289 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.reloadXComponent();
      logInfo("lifecycle rotation>record>reload");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|true|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0289 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0290
     * @tc.name      Resolution_LifecycleMatrix_0290
     * @tc.desc      resolution lifecycle fold>record>reload>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0290 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>record>reload>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|true");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0290 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0291
     * @tc.name      Resolution_LifecycleMatrix_0291
     * @tc.desc      resolution lifecycle reload>record>reload>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0291 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>record>reload>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0291 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0292
     * @tc.name      Resolution_LifecycleMatrix_0292
     * @tc.desc      resolution lifecycle record>record>reload>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0292 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.startRecording();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>record>reload>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("5|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0292 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0293
     * @tc.name      Resolution_LifecycleMatrix_0293
     * @tc.desc      resolution lifecycle mode>res>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0293 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      logInfo("lifecycle mode>res>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|true|0|false");
      expect(actual).assertEqual("3|1440*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0293 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0294
     * @tc.name      Resolution_LifecycleMatrix_0294
     * @tc.desc      resolution lifecycle switch>res>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0294 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>res>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|2|2|true|0|false");
      expect(actual).assertEqual("4|1440*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0294 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0295
     * @tc.name      Resolution_LifecycleMatrix_0295
     * @tc.desc      resolution lifecycle rotation>res>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0295 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>res>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|true|0|false");
      expect(actual).assertEqual("5|1440*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0295 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0296
     * @tc.name      Resolution_LifecycleMatrix_0296
     * @tc.desc      resolution lifecycle fold>res>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0296 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>res>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|2|true|0|false");
      expect(actual).assertEqual("6|1440*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0296 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0297
     * @tc.name      Resolution_LifecycleMatrix_0297
     * @tc.desc      resolution lifecycle res>config>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0297 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.setConfigMode(2);
      subject.startRecording();
      logInfo("lifecycle res>config>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|true|1.777778|false");
      expect(actual).assertEqual("3|1440*1080|1|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0297 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0298
     * @tc.name      Resolution_LifecycleMatrix_0298
     * @tc.desc      resolution lifecycle config>config>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0298 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.setConfigMode(2);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>config>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0298 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0299
     * @tc.name      Resolution_LifecycleMatrix_0299
     * @tc.desc      resolution lifecycle mode>config>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0299 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>config>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|true|1.777778|false");
      expect(actual).assertEqual("5|1920*1080|2|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0299 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0300
     * @tc.name      Resolution_LifecycleMatrix_0300
     * @tc.desc      resolution lifecycle switch>config>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0300 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>config>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0300 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0301
     * @tc.name      Resolution_LifecycleMatrix_0301
     * @tc.desc      resolution lifecycle reload>config>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0301 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.setConfigMode(2);
      subject.startRecording();
      logInfo("lifecycle reload>config>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|true|1.777778|true");
      expect(actual).assertEqual("3|1920*1080|1|1|true|1.777778|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0301 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0302
     * @tc.name      Resolution_LifecycleMatrix_0302
     * @tc.desc      resolution lifecycle record>config>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0302 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.setConfigMode(2);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>config>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0302 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0303
     * @tc.name      Resolution_LifecycleMatrix_0303
     * @tc.desc      resolution lifecycle res>mode>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0303 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>mode>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|1|true|0|false");
      expect(actual).assertEqual("5|1440*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0303 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0304
     * @tc.name      Resolution_LifecycleMatrix_0304
     * @tc.desc      resolution lifecycle config>mode>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0304 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>mode>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|1|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|1|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0304 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0305
     * @tc.name      Resolution_LifecycleMatrix_0305
     * @tc.desc      resolution lifecycle rotation>mode>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0305 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      logInfo("lifecycle rotation>mode>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("3|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0305 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0306
     * @tc.name      Resolution_LifecycleMatrix_0306
     * @tc.desc      resolution lifecycle fold>mode>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0306 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>mode>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0306 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0307
     * @tc.name      Resolution_LifecycleMatrix_0307
     * @tc.desc      resolution lifecycle reload>mode>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0307 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>mode>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|true|0|true");
      expect(actual).assertEqual("5|1920*1080|2|1|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0307 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0308
     * @tc.name      Resolution_LifecycleMatrix_0308
     * @tc.desc      resolution lifecycle record>mode>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0308 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>mode>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0308 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0309
     * @tc.name      Resolution_LifecycleMatrix_0309
     * @tc.desc      resolution lifecycle mode>switch>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0309 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.startRecording();
      logInfo("lifecycle mode>switch>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("3|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0309 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0310
     * @tc.name      Resolution_LifecycleMatrix_0310
     * @tc.desc      resolution lifecycle switch>switch>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0310 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchCamera();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>switch>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0310 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0311
     * @tc.name      Resolution_LifecycleMatrix_0311
     * @tc.desc      resolution lifecycle rotation>switch>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0311 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>switch>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("5|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0311 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0312
     * @tc.name      Resolution_LifecycleMatrix_0312
     * @tc.desc      resolution lifecycle fold>switch>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0312 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>switch>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0312 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0313
     * @tc.name      Resolution_LifecycleMatrix_0313
     * @tc.desc      resolution lifecycle res>rotation>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0313 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      logInfo("lifecycle res>rotation>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|1|true|0|false");
      expect(actual).assertEqual("3|1440*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0313 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0314
     * @tc.name      Resolution_LifecycleMatrix_0314
     * @tc.desc      resolution lifecycle config>rotation>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0314 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>rotation>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0314 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0315
     * @tc.name      Resolution_LifecycleMatrix_0315
     * @tc.desc      resolution lifecycle mode>rotation>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0315 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>rotation>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("5|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0315 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0316
     * @tc.name      Resolution_LifecycleMatrix_0316
     * @tc.desc      resolution lifecycle switch>rotation>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0316 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>rotation>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("6|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0316 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0317
     * @tc.name      Resolution_LifecycleMatrix_0317
     * @tc.desc      resolution lifecycle reload>rotation>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0317 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      logInfo("lifecycle reload>rotation>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|true|0|true");
      expect(actual).assertEqual("3|1920*1080|1|1|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0317 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0318
     * @tc.name      Resolution_LifecycleMatrix_0318
     * @tc.desc      resolution lifecycle record>rotation>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0318 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>rotation>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("3|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0318 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0319
     * @tc.name      Resolution_LifecycleMatrix_0319
     * @tc.desc      resolution lifecycle res>fold>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0319 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle res>fold>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|2|true|0|false");
      expect(actual).assertEqual("5|1440*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0319 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0320
     * @tc.name      Resolution_LifecycleMatrix_0320
     * @tc.desc      resolution lifecycle config>fold>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0320 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>fold>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|1.777778|false");
      expect(actual).assertEqual("6|1920*1080|2|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0320 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0321
     * @tc.name      Resolution_LifecycleMatrix_0321
     * @tc.desc      resolution lifecycle rotation>fold>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0321 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      logInfo("lifecycle rotation>fold>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|1|true|0|false");
      expect(actual).assertEqual("3|1920*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0321 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0322
     * @tc.name      Resolution_LifecycleMatrix_0322
     * @tc.desc      resolution lifecycle fold>fold>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0322 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle fold>fold>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("4|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0322 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0323
     * @tc.name      Resolution_LifecycleMatrix_0323
     * @tc.desc      resolution lifecycle reload>fold>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0323 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle reload>fold>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("5|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0323 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0324
     * @tc.name      Resolution_LifecycleMatrix_0324
     * @tc.desc      resolution lifecycle record>fold>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0324 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>fold>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|true|0|false");
      expect(actual).assertEqual("5|1920*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0324 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0325
     * @tc.name      Resolution_LifecycleMatrix_0325
     * @tc.desc      resolution lifecycle mode>reload>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0325 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.reloadXComponent();
      subject.startRecording();
      logInfo("lifecycle mode>reload>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|0|true");
      expect(actual).assertEqual("3|1920*1080|1|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0325 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0326
     * @tc.name      Resolution_LifecycleMatrix_0326
     * @tc.desc      resolution lifecycle switch>reload>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0326 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.reloadXComponent();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle switch>reload>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("4|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0326 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0327
     * @tc.name      Resolution_LifecycleMatrix_0327
     * @tc.desc      resolution lifecycle rotation>reload>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0327 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.reloadXComponent();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle rotation>reload>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("5|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0327 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0328
     * @tc.name      Resolution_LifecycleMatrix_0328
     * @tc.desc      resolution lifecycle fold>reload>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0328 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.reloadXComponent();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>reload>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1920*1080|2|2|true|0|true");
      expect(actual).assertEqual("6|1920*1080|2|2|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0328 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0329
     * @tc.name      Resolution_LifecycleMatrix_0329
     * @tc.desc      resolution lifecycle res>record>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0329 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.startRecording();
      subject.startRecording();
      logInfo("lifecycle res>record>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1440*1080|1|1|true|0|false");
      expect(actual).assertEqual("2|1440*1080|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0329 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0330
     * @tc.name      Resolution_LifecycleMatrix_0330
     * @tc.desc      resolution lifecycle config>record>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0330 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.startRecording();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle config>record>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1920*1080|1|2|true|1.777778|false");
      expect(actual).assertEqual("3|1920*1080|1|2|true|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0330 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0331
     * @tc.name      Resolution_LifecycleMatrix_0331
     * @tc.desc      resolution lifecycle mode>record>record>mode>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0331 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.startRecording();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      logInfo("lifecycle mode>record>record>mode>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1920*1080|2|1|true|0|false");
      expect(actual).assertEqual("4|1920*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0331 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0332
     * @tc.name      Resolution_LifecycleMatrix_0332
     * @tc.desc      resolution lifecycle switch>record>record>mode>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0332 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.startRecording();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>record>record>mode>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("5|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0332 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0333
     * @tc.name      Resolution_LifecycleMatrix_0333
     * @tc.desc      resolution lifecycle reload>record>record keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0333 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.startRecording();
      subject.startRecording();
      logInfo("lifecycle reload>record>record");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|1|true|0|true");
      expect(actual).assertEqual("2|1920*1080|1|1|true|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0333 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0334
     * @tc.name      Resolution_LifecycleMatrix_0334
     * @tc.desc      resolution lifecycle record>record>record>mode keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0334 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.startRecording();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      logInfo("lifecycle record>record>record>mode");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "2|1920*1080|1|2|true|0|false");
      expect(actual).assertEqual("2|1920*1080|1|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0334 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0335
     * @tc.name      Resolution_LifecycleMatrix_0335
     * @tc.desc      resolution lifecycle res>res>res>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0335 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle res>res>res>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1088*1088|1|1|false|0|false");
      expect(actual).assertEqual("5|1088*1088|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0335 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0336
     * @tc.name      Resolution_LifecycleMatrix_0336
     * @tc.desc      resolution lifecycle config>res>res>switch>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0336 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>res>res>switch>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1280*720|1|1|false|1.777778|false");
      expect(actual).assertEqual("6|1280*720|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0336 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0337
     * @tc.name      Resolution_LifecycleMatrix_0337
     * @tc.desc      resolution lifecycle rotation>res>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0337 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle rotation>res>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1280*720|1|1|false|0|false");
      expect(actual).assertEqual("3|1280*720|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0337 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0338
     * @tc.name      Resolution_LifecycleMatrix_0338
     * @tc.desc      resolution lifecycle fold>res>res>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0338 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      logInfo("lifecycle fold>res>res>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1280*720|2|1|false|0|false");
      expect(actual).assertEqual("4|1280*720|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0338 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0339
     * @tc.name      Resolution_LifecycleMatrix_0339
     * @tc.desc      resolution lifecycle reload>res>res>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0339 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle reload>res>res>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1280*720|1|1|false|0|true");
      expect(actual).assertEqual("5|1280*720|1|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0339 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0340
     * @tc.name      Resolution_LifecycleMatrix_0340
     * @tc.desc      resolution lifecycle record>res>res>switch>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0340 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>res>res>switch>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1280*720|1|1|true|0|false");
      expect(actual).assertEqual("6|1280*720|1|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0340 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0341
     * @tc.name      Resolution_LifecycleMatrix_0341
     * @tc.desc      resolution lifecycle mode>config>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_LifecycleMatrix_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0341 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle mode>config>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|false|1.777778|false");
      expect(actual).assertEqual("3|1440*1080|1|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0341 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0342
     * @tc.name      Resolution_LifecycleMatrix_0342
     * @tc.desc      resolution lifecycle switch>config>res>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0342 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      logInfo("lifecycle switch>config>res>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("4|1440*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0342 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0343
     * @tc.name      Resolution_LifecycleMatrix_0343
     * @tc.desc      resolution lifecycle rotation>config>res>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0343 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle rotation>config>res>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("5|1440*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0343 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0344
     * @tc.name      Resolution_LifecycleMatrix_0344
     * @tc.desc      resolution lifecycle fold>config>res>switch>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0344 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.setConfigMode(2);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle fold>config>res>switch>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|1|1|false|1.777778|false");
      expect(actual).assertEqual("6|1440*1080|1|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0344 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0345
     * @tc.name      Resolution_LifecycleMatrix_0345
     * @tc.desc      resolution lifecycle res>mode>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0345 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle res>mode>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1280*720|1|2|false|0|false");
      expect(actual).assertEqual("3|1280*720|1|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0345 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0346
     * @tc.name      Resolution_LifecycleMatrix_0346
     * @tc.desc      resolution lifecycle config>mode>res>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0346 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      logInfo("lifecycle config>mode>res>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|2|2|false|1.777778|false");
      expect(actual).assertEqual("4|1440*1080|2|2|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0346 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0347
     * @tc.name      Resolution_LifecycleMatrix_0347
     * @tc.desc      resolution lifecycle mode>mode>res>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0347 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle mode>mode>res>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("5|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0347 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0348
     * @tc.name      Resolution_LifecycleMatrix_0348
     * @tc.desc      resolution lifecycle switch>mode>res>switch>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0348 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.switchCamera();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle switch>mode>res>switch>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|2|false|0|false");
      expect(actual).assertEqual("6|1440*1080|2|2|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0348 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0349
     * @tc.name      Resolution_LifecycleMatrix_0349
     * @tc.desc      resolution lifecycle reload>mode>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0349 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle reload>mode>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|1|2|false|0|true");
      expect(actual).assertEqual("3|1440*1080|1|2|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0349 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0350
     * @tc.name      Resolution_LifecycleMatrix_0350
     * @tc.desc      resolution lifecycle record>mode>res>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0350 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchMode(subject.scene() === 1 ? 2 : 1);
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      logInfo("lifecycle record>mode>res>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|2|2|true|0|false");
      expect(actual).assertEqual("4|1440*1080|2|2|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0350 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0351
     * @tc.name      Resolution_LifecycleMatrix_0351
     * @tc.desc      resolution lifecycle res>switch>res>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0351 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle res>switch>res>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1280*720|2|1|false|0|false");
      expect(actual).assertEqual("5|1280*720|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0351 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0352
     * @tc.name      Resolution_LifecycleMatrix_0352
     * @tc.desc      resolution lifecycle config>switch>res>switch>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0352 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.setConfigMode(2);
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle config>switch>res>switch>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|1|false|1.777778|false");
      expect(actual).assertEqual("6|1440*1080|2|1|false|1.777778|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0352 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0353
     * @tc.name      Resolution_LifecycleMatrix_0353
     * @tc.desc      resolution lifecycle rotation>switch>res keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_LifecycleMatrix_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0353 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.updateRotation(subject.rotationValue() + 90);
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      logInfo("lifecycle rotation>switch>res");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "3|1440*1080|2|1|false|0|false");
      expect(actual).assertEqual("3|1440*1080|2|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0353 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0354
     * @tc.name      Resolution_LifecycleMatrix_0354
     * @tc.desc      resolution lifecycle fold>switch>res>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0354 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.applyFoldStatus((subject.fold() + 1) % 4, [1, 2]);
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      logInfo("lifecycle fold>switch>res>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "4|1440*1080|1|1|false|0|false");
      expect(actual).assertEqual("4|1440*1080|1|1|false|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0354 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0355
     * @tc.name      Resolution_LifecycleMatrix_0355
     * @tc.desc      resolution lifecycle reload>switch>res>switch>switch keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0355 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.reloadXComponent();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("lifecycle reload>switch>res>switch>switch");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "5|1440*1080|2|1|false|0|true");
      expect(actual).assertEqual("5|1440*1080|2|1|false|0|true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0355 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_LIFECYCLE_MATRIX_0356
     * @tc.name      Resolution_LifecycleMatrix_0356
     * @tc.desc      resolution lifecycle record>switch>res>switch>switch>rotation keeps page state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_LifecycleMatrix_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LifecycleMatrix_0356 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      subject.startRecording();
      subject.switchCamera();
      subject.selectResolution(subject.resolutionIndex() + 1);
      subject.switchCamera();
      subject.switchCamera();
      subject.updateRotation(subject.rotationValue() + 90);
      logInfo("lifecycle record>switch>res>switch>switch>rotation");
      const actual: string = subject.eventCount() + '|' + subject.resolution() + '|' + subject.cameraPosition() + '|' + subject.scene() + '|' + subject.isRecording() + '|' + subject.ratio() + '|' + subject.reloadValue();
      logInfo('actual=' + String(actual) + ', expected=' + "6|1440*1080|2|1|true|0|false");
      expect(actual).assertEqual("6|1440*1080|2|1|true|0|false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}LifecycleMatrix_0356 end`);
    });
  });
}
