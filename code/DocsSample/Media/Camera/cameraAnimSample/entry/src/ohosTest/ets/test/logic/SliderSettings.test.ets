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
  sliderStep,
  sliderMax,
} from '../model/CameraLogic';

/** SliderSettingsTest logic checks (46 cases). */
export default function sliderSettingsTest(): void {
  describe('SliderSettingsTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0001
     * @tc.name      Camera_SliderSettings_0001
     * @tc.desc      slider settings for 4 -> step 0.01, max 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SliderSettings_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderSettings_0001 begin`);
      logInfo("sliderStep(4) + ',' + sliderMax(4)");
      const actual: string = sliderStep(4) + ',' + sliderMax(4);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,4");
      expect(actual).assertEqual("0.01,4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0002
     * @tc.name      Camera_SliderSettings_0002
     * @tc.desc      slider settings for 5 -> step 0.01, max 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0002 begin`);
      logInfo("sliderStep(5) + ',' + sliderMax(5)");
      const actual: string = sliderStep(5) + ',' + sliderMax(5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,5");
      expect(actual).assertEqual("0.01,5");
      logInfo(`${BUNDLE}SliderSettings_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0003
     * @tc.name      Camera_SliderSettings_0003
     * @tc.desc      slider settings for 6 -> step 0.01, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0003 begin`);
      logInfo("sliderStep(6) + ',' + sliderMax(6)");
      const actual: string = sliderStep(6) + ',' + sliderMax(6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01,6");
      expect(actual).assertEqual("0.01,6");
      logInfo(`${BUNDLE}SliderSettings_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0004
     * @tc.name      Camera_SliderSettings_0004
     * @tc.desc      slider settings for 6.1 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0004 begin`);
      logInfo("sliderStep(6.1) + ',' + sliderMax(6.1)");
      const actual: string = sliderStep(6.1) + ',' + sliderMax(6.1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0005
     * @tc.name      Camera_SliderSettings_0005
     * @tc.desc      slider settings for 7 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0005 begin`);
      logInfo("sliderStep(7) + ',' + sliderMax(7)");
      const actual: string = sliderStep(7) + ',' + sliderMax(7);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0006
     * @tc.name      Camera_SliderSettings_0006
     * @tc.desc      slider settings for 8 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0006 begin`);
      logInfo("sliderStep(8) + ',' + sliderMax(8)");
      const actual: string = sliderStep(8) + ',' + sliderMax(8);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0007
     * @tc.name      Camera_SliderSettings_0007
     * @tc.desc      slider settings for 9 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0007 begin`);
      logInfo("sliderStep(9) + ',' + sliderMax(9)");
      const actual: string = sliderStep(9) + ',' + sliderMax(9);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0008
     * @tc.name      Camera_SliderSettings_0008
     * @tc.desc      slider settings for 10 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0008 begin`);
      logInfo("sliderStep(10) + ',' + sliderMax(10)");
      const actual: string = sliderStep(10) + ',' + sliderMax(10);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0009
     * @tc.name      Camera_SliderSettings_0009
     * @tc.desc      slider settings for 12 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0009 begin`);
      logInfo("sliderStep(12) + ',' + sliderMax(12)");
      const actual: string = sliderStep(12) + ',' + sliderMax(12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0010
     * @tc.name      Camera_SliderSettings_0010
     * @tc.desc      slider settings for 15 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0010 begin`);
      logInfo("sliderStep(15) + ',' + sliderMax(15)");
      const actual: string = sliderStep(15) + ',' + sliderMax(15);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderSettings_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0011
     * @tc.name      Camera_SliderSettings_0011
     * @tc.desc      slider settings for 20 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0011 begin`);
      logInfo("sliderStep(20) + ',' + sliderMax(20)");
      const actual: string = sliderStep(20) + ',' + sliderMax(20);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0012
     * @tc.name      Camera_SliderSettings_0012
     * @tc.desc      slider settings for 24 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SliderSettings_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderSettings_0012 begin`);
      logInfo("sliderStep(24) + ',' + sliderMax(24)");
      const actual: string = sliderStep(24) + ',' + sliderMax(24);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,6");
      expect(actual).assertEqual("0.1,6");
      logInfo(`${BUNDLE}SliderSettings_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SLIDER_SETTINGS_0013
     * @tc.name      Camera_SliderSettings_0013
     * @tc.desc      slider settings for 30 -> step 0.1, max 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SliderSettings_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderSettings_0013 begin`);
