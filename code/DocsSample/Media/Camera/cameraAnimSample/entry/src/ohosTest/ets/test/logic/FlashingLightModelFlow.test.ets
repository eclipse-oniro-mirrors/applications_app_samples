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
  FlashingLightModel,
} from '../model/CameraLogic';

/** FlashingLightModelFlowTest logic checks (46 cases). */
export default function flashingLightModelFlowTest(): void {
  describe('FlashingLightModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0001
     * @tc.name      Camera_FlashingLightModelFlow_0001
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashingLightModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0001 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      logInfo("clickFlash x1 control=false macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0002
     * @tc.name      Camera_FlashingLightModelFlow_0002
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0002 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(false);
      subject.clickFlash();
      logInfo("clickFlash x1 control=false macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0003
     * @tc.name      Camera_FlashingLightModelFlow_0003
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0003 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      logInfo("clickFlash x1 control=false macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0004
     * @tc.name      Camera_FlashingLightModelFlow_0004
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0004 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(true);
      subject.clickFlash();
      logInfo("clickFlash x1 control=false macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0005
     * @tc.name      Camera_FlashingLightModelFlow_0005
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0005 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      logInfo("clickFlash x1 control=true macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0006
     * @tc.name      Camera_FlashingLightModelFlow_0006
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0006 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(false);
      subject.clickFlash();
      logInfo("clickFlash x1 control=true macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0007
     * @tc.name      Camera_FlashingLightModelFlow_0007
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0007 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      logInfo("clickFlash x1 control=true macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0008
     * @tc.name      Camera_FlashingLightModelFlow_0008
     * @tc.desc      flash button clicked 1 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0008 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(true);
      subject.clickFlash();
      logInfo("clickFlash x1 control=true macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0009
     * @tc.name      Camera_FlashingLightModelFlow_0009
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0009 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=false macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0010
     * @tc.name      Camera_FlashingLightModelFlow_0010
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0010 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=false macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0011
     * @tc.name      Camera_FlashingLightModelFlow_0011
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0011 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=false macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0012
     * @tc.name      Camera_FlashingLightModelFlow_0012
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashingLightModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0012 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=false macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0013
     * @tc.name      Camera_FlashingLightModelFlow_0013
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0013 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=true macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0014
     * @tc.name      Camera_FlashingLightModelFlow_0014
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0014 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=true macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0015
     * @tc.name      Camera_FlashingLightModelFlow_0015
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0015 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=true macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0016
     * @tc.name      Camera_FlashingLightModelFlow_0016
     * @tc.desc      flash button clicked 2 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0016 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x2 control=true macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0017
     * @tc.name      Camera_FlashingLightModelFlow_0017
     * @tc.desc      flash button clicked 3 times lands on mode 3 with icon "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0017 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x3 control=false macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0018
     * @tc.name      Camera_FlashingLightModelFlow_0018
     * @tc.desc      flash button clicked 3 times lands on mode 3 with icon "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FlashingLightModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0018 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x3 control=false macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0019
     * @tc.name      Camera_FlashingLightModelFlow_0019
     * @tc.desc      flash button clicked 3 times lands on mode 3 with icon "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0019 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x3 control=false macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0020
     * @tc.name      Camera_FlashingLightModelFlow_0020
     * @tc.desc      flash button clicked 3 times lands on mode 3 with icon "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0020 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x3 control=false macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0021
     * @tc.name      Camera_FlashingLightModelFlow_0021
     * @tc.desc      flash button clicked 3 times lands on mode 3 with icon "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0021 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x3 control=true macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0022
     * @tc.name      Camera_FlashingLightModelFlow_0022
     * @tc.desc      flash button clicked 3 times lands on mode 3 with icon "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0022 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x3 control=true macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0023
     * @tc.name      Camera_FlashingLightModelFlow_0023
     * @tc.desc      flash button clicked 3 times lands on mode 3 with icon "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashingLightModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0023 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x3 control=true macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0024
     * @tc.name      Camera_FlashingLightModelFlow_0024
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0024 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=false macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0025
     * @tc.name      Camera_FlashingLightModelFlow_0025
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0025 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=false macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0026
     * @tc.name      Camera_FlashingLightModelFlow_0026
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0026 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=false macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0027
     * @tc.name      Camera_FlashingLightModelFlow_0027
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0027 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=false macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0028
     * @tc.name      Camera_FlashingLightModelFlow_0028
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0028 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=true macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0029
     * @tc.name      Camera_FlashingLightModelFlow_0029
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0029 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=true macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0030
     * @tc.name      Camera_FlashingLightModelFlow_0030
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0030 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=true macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0031
     * @tc.name      Camera_FlashingLightModelFlow_0031
     * @tc.desc      flash button clicked 4 times lands on mode 0 with icon "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0031 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x4 control=true macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0032
     * @tc.name      Camera_FlashingLightModelFlow_0032
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0032 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=false macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0033
     * @tc.name      Camera_FlashingLightModelFlow_0033
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0033 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=false macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0034
     * @tc.name      Camera_FlashingLightModelFlow_0034
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashingLightModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0034 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=false macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0035
     * @tc.name      Camera_FlashingLightModelFlow_0035
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FlashingLightModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0035 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=false macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0036
     * @tc.name      Camera_FlashingLightModelFlow_0036
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0036 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=true macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0037
     * @tc.name      Camera_FlashingLightModelFlow_0037
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0037 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=true macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0038
     * @tc.name      Camera_FlashingLightModelFlow_0038
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0038 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=true macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0039
     * @tc.name      Camera_FlashingLightModelFlow_0039
     * @tc.desc      flash button clicked 5 times lands on mode 1 with icon "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0039 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x5 control=true macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0040
     * @tc.name      Camera_FlashingLightModelFlow_0040
     * @tc.desc      flash button clicked 6 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0040 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x6 control=false macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0041
     * @tc.name      Camera_FlashingLightModelFlow_0041
     * @tc.desc      flash button clicked 6 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0041 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x6 control=false macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0042
     * @tc.name      Camera_FlashingLightModelFlow_0042
     * @tc.desc      flash button clicked 6 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0042 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x6 control=false macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0043
     * @tc.name      Camera_FlashingLightModelFlow_0043
     * @tc.desc      flash button clicked 6 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0043 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(false);
      subject.clickMacro(true);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x6 control=false macro=true pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0044
     * @tc.name      Camera_FlashingLightModelFlow_0044
     * @tc.desc      flash button clicked 6 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0044 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x6 control=true macro=false pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0045
     * @tc.name      Camera_FlashingLightModelFlow_0045
     * @tc.desc      flash button clicked 6 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashingLightModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0045 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickControl(true);
      subject.clickMacro(false);
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x6 control=true macro=false pre=true");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_MODEL_FLOW_0046
     * @tc.name      Camera_FlashingLightModelFlow_0046
     * @tc.desc      flash button clicked 6 times lands on mode 2 with icon "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashingLightModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashingLightModelFlow_0046 begin`);
      const subject: FlashingLightModel = new FlashingLightModel();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      subject.clickFlash();
      logInfo("clickFlash x6 control=true macro=true pre=false");
      const actual: number = subject.mode();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FlashingLightModelFlow_0046 end`);
    });
  });
}
