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
import { logInfo, BUNDLE } from '../common/CameraTestSupport';
import {
  CameraEventModel,
} from '../model/CameraLogic';

/** CameraEventNotifyTest logic checks (46 cases). */
export default function cameraEventNotifyTest(): void {
  describe('CameraEventNotifyTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0001
     * @tc.name      Camera_EventNotify_0001
     * @tc.desc      camera notification order frame tallies to "1:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EventNotify_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventNotify_0001 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      logInfo("notifications frame");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0002
     * @tc.name      Camera_EventNotify_0002
     * @tc.desc      camera notification order pressure tallies to "0:0:0:0:0:0:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0002 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onSystemPressure(2, 0);
      logInfo("notifications pressure");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:0:1:0");
      expect(actual).assertEqual("0:0:0:0:0:0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0003
     * @tc.name      Camera_EventNotify_0003
     * @tc.desc      camera notification order frame>end tallies to "1:0:0:1:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0003 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onCaptureEnd(3);
      logInfo("notifications frame>end");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:1:0:0:0:0");
      expect(actual).assertEqual("1:0:0:1:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0004
     * @tc.name      Camera_EventNotify_0004
     * @tc.desc      camera notification order frame>frameEnd tallies to "1:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0004 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onFrameEnd();
      logInfo("notifications frame>frameEnd");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0005
     * @tc.name      Camera_EventNotify_0005
     * @tc.desc      camera notification order shot>empty tallies to "0:1:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0005 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onPhotoAssetAvailable('');
      logInfo("notifications shot>empty");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:0:0:0:0:0:0");
      expect(actual).assertEqual("0:1:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0006
     * @tc.name      Camera_EventNotify_0006
     * @tc.desc      camera notification order shutter>shutter tallies to "0:0:2:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0006 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameShutter(7);
      subject.onFrameShutter(7);
      logInfo("notifications shutter>shutter");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:2:0:0:0:0:0");
      expect(actual).assertEqual("0:0:2:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0007
     * @tc.name      Camera_EventNotify_0007
     * @tc.desc      camera notification order shutter>bind tallies to "0:0:1:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0007 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameShutter(7);
      subject.bindSaveCallback();
      logInfo("notifications shutter>bind");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:0:0:0:0:0");
      expect(actual).assertEqual("0:0:1:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0008
     * @tc.name      Camera_EventNotify_0008
     * @tc.desc      camera notification order end>empty tallies to "0:0:0:1:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0008 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureEnd(3);
      subject.onPhotoAssetAvailable('');
      logInfo("notifications end>empty");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:0:0:0:0");
      expect(actual).assertEqual("0:0:0:1:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0009
     * @tc.name      Camera_EventNotify_0009
     * @tc.desc      camera notification order error>shot tallies to "0:1:0:0:1:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0009 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onError(500);
      subject.onCaptureStart('info');
      logInfo("notifications error>shot");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:0:0:1:0:0:0");
      expect(actual).assertEqual("0:1:0:0:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0010
     * @tc.name      Camera_EventNotify_0010
     * @tc.desc      camera notification order error>status tallies to "0:0:0:0:1:0:0:1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0010 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onError(500);
      subject.onCameraStatus(1);
      logInfo("notifications error>status");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:1:0:0:1");
      expect(actual).assertEqual("0:0:0:0:1:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0011
     * @tc.name      Camera_EventNotify_0011
     * @tc.desc      camera notification order asset>asset tallies to "0:0:0:0:0:2:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0011 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onPhotoAssetAvailable('asset');
      subject.onPhotoAssetAvailable('asset');
      logInfo("notifications asset>asset");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:2:0:0");
      expect(actual).assertEqual("0:0:0:0:0:2:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0012
     * @tc.name      Camera_EventNotify_0012
     * @tc.desc      camera notification order empty>shot tallies to "0:1:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EventNotify_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventNotify_0012 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onPhotoAssetAvailable('');
      subject.onCaptureStart('info');
      logInfo("notifications empty>shot");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:0:0:0:0:0:0");
      expect(actual).assertEqual("0:1:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0013
     * @tc.name      Camera_EventNotify_0013
     * @tc.desc      camera notification order empty>pressureErr tallies to "0:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0013 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onPhotoAssetAvailable('');
      subject.onSystemPressure(2, -1);
      logInfo("notifications empty>pressureErr");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:0:0:0");
      expect(actual).assertEqual("0:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0014
     * @tc.name      Camera_EventNotify_0014
     * @tc.desc      camera notification order pressure>error tallies to "0:0:0:0:1:0:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0014 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onSystemPressure(2, 0);
      subject.onError(500);
      logInfo("notifications pressure>error");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:1:0:1:0");
      expect(actual).assertEqual("0:0:0:0:1:0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0015
     * @tc.name      Camera_EventNotify_0015
     * @tc.desc      camera notification order pressureErr>frame tallies to "1:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0015 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onSystemPressure(2, -1);
      subject.onFrameStart();
      logInfo("notifications pressureErr>frame");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0016
     * @tc.name      Camera_EventNotify_0016
     * @tc.desc      camera notification order pressureErr>pressureErr tallies to "0:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0016 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onSystemPressure(2, -1);
      subject.onSystemPressure(2, -1);
      logInfo("notifications pressureErr>pressureErr");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:0:0:0");
      expect(actual).assertEqual("0:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0017
     * @tc.name      Camera_EventNotify_0017
     * @tc.desc      camera notification order status>end tallies to "0:0:0:1:0:0:0:1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0017 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCameraStatus(1);
      subject.onCaptureEnd(3);
      logInfo("notifications status>end");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:0:0:0:1");
      expect(actual).assertEqual("0:0:0:1:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0018
     * @tc.name      Camera_EventNotify_0018
     * @tc.desc      camera notification order status>frameEnd tallies to "0:0:0:0:0:0:0:1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_EventNotify_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}EventNotify_0018 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCameraStatus(1);
      subject.onFrameEnd();
      logInfo("notifications status>frameEnd");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:0:0:1");
      expect(actual).assertEqual("0:0:0:0:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0019
     * @tc.name      Camera_EventNotify_0019
     * @tc.desc      camera notification order bind>pressure tallies to "0:0:0:0:0:0:1:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0019 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.bindSaveCallback();
      subject.onSystemPressure(2, 0);
      logInfo("notifications bind>pressure");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:0:1:0");
      expect(actual).assertEqual("0:0:0:0:0:0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0020
     * @tc.name      Camera_EventNotify_0020
     * @tc.desc      camera notification order frameEnd>end tallies to "0:0:0:1:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0020 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameEnd();
      subject.onCaptureEnd(3);
      logInfo("notifications frameEnd>end");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:0:0:0:0");
      expect(actual).assertEqual("0:0:0:1:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0021
     * @tc.name      Camera_EventNotify_0021
     * @tc.desc      camera notification order frameEnd>bind tallies to "0:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0021 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameEnd();
      subject.bindSaveCallback();
      logInfo("notifications frameEnd>bind");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:0:0:0");
      expect(actual).assertEqual("0:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0022
     * @tc.name      Camera_EventNotify_0022
     * @tc.desc      camera notification order frame>frame>empty tallies to "2:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0022 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onFrameStart();
      subject.onPhotoAssetAvailable('');
      logInfo("notifications frame>frame>empty");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "2:0:0:0:0:0:0:0");
      expect(actual).assertEqual("2:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0023
     * @tc.name      Camera_EventNotify_0023
     * @tc.desc      camera notification order frame>shot>shutter tallies to "1:1:1:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EventNotify_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventNotify_0023 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onCaptureStart('info');
      subject.onFrameShutter(7);
      logInfo("notifications frame>shot>shutter");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:1:0:0:0:0:0");
      expect(actual).assertEqual("1:1:1:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0024
     * @tc.name      Camera_EventNotify_0024
     * @tc.desc      camera notification order frame>shot>bind tallies to "1:1:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0024 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onCaptureStart('info');
      subject.bindSaveCallback();
      logInfo("notifications frame>shot>bind");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0:0:0:0:0:0");
      expect(actual).assertEqual("1:1:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0025
     * @tc.name      Camera_EventNotify_0025
     * @tc.desc      camera notification order frame>shutter>asset tallies to "1:0:1:0:0:1:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0025 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onFrameShutter(7);
      subject.onPhotoAssetAvailable('asset');
      logInfo("notifications frame>shutter>asset");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1:0:0:1:0:0");
      expect(actual).assertEqual("1:0:1:0:0:1:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0026
     * @tc.name      Camera_EventNotify_0026
     * @tc.desc      camera notification order frame>end>shot tallies to "1:1:0:1:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0026 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onCaptureEnd(3);
      subject.onCaptureStart('info');
      logInfo("notifications frame>end>shot");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0:1:0:0:0:0");
      expect(actual).assertEqual("1:1:0:1:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0027
     * @tc.name      Camera_EventNotify_0027
     * @tc.desc      camera notification order frame>end>status tallies to "1:0:0:1:0:0:0:1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0027 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onCaptureEnd(3);
      subject.onCameraStatus(1);
      logInfo("notifications frame>end>status");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:1:0:0:0:1");
      expect(actual).assertEqual("1:0:0:1:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0028
     * @tc.name      Camera_EventNotify_0028
     * @tc.desc      camera notification order frame>error>error tallies to "1:0:0:0:2:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0028 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onError(500);
      subject.onError(500);
      logInfo("notifications frame>error>error");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:2:0:0:0");
      expect(actual).assertEqual("1:0:0:0:2:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0029
     * @tc.name      Camera_EventNotify_0029
     * @tc.desc      camera notification order frame>asset>frame tallies to "2:0:0:0:0:1:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0029 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onPhotoAssetAvailable('asset');
      subject.onFrameStart();
      logInfo("notifications frame>asset>frame");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "2:0:0:0:0:1:0:0");
      expect(actual).assertEqual("2:0:0:0:0:1:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0030
     * @tc.name      Camera_EventNotify_0030
     * @tc.desc      camera notification order frame>asset>pressureErr tallies to "1:0:0:0:0:1:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0030 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onPhotoAssetAvailable('asset');
      subject.onSystemPressure(2, -1);
      logInfo("notifications frame>asset>pressureErr");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:1:0:0");
      expect(actual).assertEqual("1:0:0:0:0:1:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0031
     * @tc.name      Camera_EventNotify_0031
     * @tc.desc      camera notification order frame>empty>error tallies to "1:0:0:0:1:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0031 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onPhotoAssetAvailable('');
      subject.onError(500);
      logInfo("notifications frame>empty>error");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:1:0:0:0");
      expect(actual).assertEqual("1:0:0:0:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0032
     * @tc.name      Camera_EventNotify_0032
     * @tc.desc      camera notification order frame>empty>frameEnd tallies to "1:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0032 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onPhotoAssetAvailable('');
      subject.onFrameEnd();
      logInfo("notifications frame>empty>frameEnd");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0033
     * @tc.name      Camera_EventNotify_0033
     * @tc.desc      camera notification order frame>pressure>pressure tallies to "1:0:0:0:0:0:2:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0033 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onSystemPressure(2, 0);
      subject.onSystemPressure(2, 0);
      logInfo("notifications frame>pressure>pressure");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:2:0");
      expect(actual).assertEqual("1:0:0:0:0:0:2:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0034
     * @tc.name      Camera_EventNotify_0034
     * @tc.desc      camera notification order frame>pressureErr>end tallies to "1:0:0:1:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EventNotify_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventNotify_0034 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onSystemPressure(2, -1);
      subject.onCaptureEnd(3);
      logInfo("notifications frame>pressureErr>end");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:1:0:0:0:0");
      expect(actual).assertEqual("1:0:0:1:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0035
     * @tc.name      Camera_EventNotify_0035
     * @tc.desc      camera notification order frame>pressureErr>frameEnd tallies to "1:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_EventNotify_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}EventNotify_0035 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onSystemPressure(2, -1);
      subject.onFrameEnd();
      logInfo("notifications frame>pressureErr>frameEnd");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0036
     * @tc.name      Camera_EventNotify_0036
     * @tc.desc      camera notification order frame>status>empty tallies to "1:0:0:0:0:0:0:1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0036 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onCameraStatus(1);
      subject.onPhotoAssetAvailable('');
      logInfo("notifications frame>status>empty");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:1");
      expect(actual).assertEqual("1:0:0:0:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0037
     * @tc.name      Camera_EventNotify_0037
     * @tc.desc      camera notification order frame>bind>shutter tallies to "1:0:1:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0037 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.bindSaveCallback();
      subject.onFrameShutter(7);
      logInfo("notifications frame>bind>shutter");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1:0:0:0:0:0");
      expect(actual).assertEqual("1:0:1:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0038
     * @tc.name      Camera_EventNotify_0038
     * @tc.desc      camera notification order frame>bind>bind tallies to "1:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0038 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.bindSaveCallback();
      subject.bindSaveCallback();
      logInfo("notifications frame>bind>bind");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0039
     * @tc.name      Camera_EventNotify_0039
     * @tc.desc      camera notification order frame>frameEnd>empty tallies to "1:0:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0039 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onFrameStart();
      subject.onFrameEnd();
      subject.onPhotoAssetAvailable('');
      logInfo("notifications frame>frameEnd>empty");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0040
     * @tc.name      Camera_EventNotify_0040
     * @tc.desc      camera notification order shot>frame>shot tallies to "1:2:0:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0040 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onFrameStart();
      subject.onCaptureStart('info');
      logInfo("notifications shot>frame>shot");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:2:0:0:0:0:0:0");
      expect(actual).assertEqual("1:2:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0041
     * @tc.name      Camera_EventNotify_0041
     * @tc.desc      camera notification order shot>frame>status tallies to "1:1:0:0:0:0:0:1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0041 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onFrameStart();
      subject.onCameraStatus(1);
      logInfo("notifications shot>frame>status");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0:0:0:0:0:1");
      expect(actual).assertEqual("1:1:0:0:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0042
     * @tc.name      Camera_EventNotify_0042
     * @tc.desc      camera notification order shot>shot>asset tallies to "0:2:0:0:0:1:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0042 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onCaptureStart('info');
      subject.onPhotoAssetAvailable('asset');
      logInfo("notifications shot>shot>asset");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:2:0:0:0:1:0:0");
      expect(actual).assertEqual("0:2:0:0:0:1:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0043
     * @tc.name      Camera_EventNotify_0043
     * @tc.desc      camera notification order shot>shutter>shot tallies to "0:2:1:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0043 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onFrameShutter(7);
      subject.onCaptureStart('info');
      logInfo("notifications shot>shutter>shot");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:2:1:0:0:0:0:0");
      expect(actual).assertEqual("0:2:1:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0044
     * @tc.name      Camera_EventNotify_0044
     * @tc.desc      camera notification order shot>shutter>pressureErr tallies to "0:1:1:0:0:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0044 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onFrameShutter(7);
      subject.onSystemPressure(2, -1);
      logInfo("notifications shot>shutter>pressureErr");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:1:0:0:0:0:0");
      expect(actual).assertEqual("0:1:1:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0045
     * @tc.name      Camera_EventNotify_0045
     * @tc.desc      camera notification order shot>end>error tallies to "0:1:0:1:1:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EventNotify_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventNotify_0045 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onCaptureEnd(3);
      subject.onError(500);
      logInfo("notifications shot>end>error");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:0:1:1:0:0:0");
      expect(actual).assertEqual("0:1:0:1:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EVENT_NOTIFY_0046
     * @tc.name      Camera_EventNotify_0046
     * @tc.desc      camera notification order shot>error>frame tallies to "1:1:0:0:1:0:0:0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EventNotify_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventNotify_0046 begin`);
      const subject: CameraEventModel = new CameraEventModel();
      subject.onCaptureStart('info');
      subject.onError(500);
      subject.onFrameStart();
      logInfo("notifications shot>error>frame");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:1:0:0:1:0:0:0");
      expect(actual).assertEqual("1:1:0:0:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventNotify_0046 end`);
    });
  });
}
