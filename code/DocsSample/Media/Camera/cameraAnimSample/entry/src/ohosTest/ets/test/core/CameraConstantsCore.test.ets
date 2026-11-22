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
  X_COMPONENT_WIDTH,
  X_COMPONENT_HEIGHT,
  X_COMPONENT_BORDER_WIDTH,
  CAPTURE_BUTTON_BORDER_WIDTH,
  CAPTURE_BUTTON_BORDER_RADIUS,
  CAPTURE_BUTTON_COLUMN_MARGIN,
  CAPTURE_BUTTON_COLUMN_PADDING,
  BACK_ICON_SIZE,
  IMAGE_SIZE,
  BACK_ICON_MARGIN,
  FULL_PERCENT,
  EIGHTY_FIVE_PERCENT,
  EIGHTY_PERCENT,
  SEVENTY_FIVE_PERCENT,
  SEVENTY_PERCENT,
  FORTY_PERCENT,
  THIRTY_PERCENT,
  FIFTEEN_PERCENT,
  TEN_PERCENT,
  ZERO_PERCENT,
  TEXT_BORDER_RADIUS,
  FONT_SIZE_14,
  COLUMN_SPACE_24,
  ROW_SPACE_24,
  DEFAULT_ZOOM_RATIO,
  BORDER_RADIUS_14,
  ZOOM_RADIO_MIN,
  ZOOM_RADIO_MAX,
  ZOOM_RADIO_MAX_STEP,
  ZOOM_RADIO_MIN_STEP,
  CAPTURE_COLUMN_WIDTH,
  CAPTURE_ROW_HEIGHT,
  AUDIO_BITRATE,
  AUDIO_CHANNELS,
  AUDIO_SAMPLE_RATE,
  VIDEO_BITRATE,
  MAX_VIDEO_FRAME,
  FLASH_POSITION_X,
  FLASH_POSITION_Y,
  SCENE_NORMAL_PHOTO,
  SCENE_NORMAL_VIDEO,
  FLASH_MODE_CLOSE,
  FLASH_MODE_OPEN,
  FLASH_MODE_AUTO,
  FLASH_MODE_ALWAYS_OPEN,
} from '../model/CameraLogic';

/** CameraConstantsCoreTest logic checks (45 cases). */
export default function cameraConstantsCoreTest(): void {
  describe('CameraConstantsCoreTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0001
     * @tc.name      Camera_Constants_0001
     * @tc.desc      X_COMPONENT_WIDTH is pinned to 1920 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Constants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0001 begin`);
      logInfo("constant X_COMPONENT_WIDTH");
      const actual: number = X_COMPONENT_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "1920");
      expect(actual).assertEqual(1920);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0002
     * @tc.name      Camera_Constants_0002
     * @tc.desc      X_COMPONENT_HEIGHT is pinned to 1080 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0002 begin`);
      logInfo("constant X_COMPONENT_HEIGHT");
      const actual: number = X_COMPONENT_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0003
     * @tc.name      Camera_Constants_0003
     * @tc.desc      X_COMPONENT_BORDER_WIDTH is pinned to 0.5 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0003 begin`);
      logInfo("constant X_COMPONENT_BORDER_WIDTH");
      const actual: number = X_COMPONENT_BORDER_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0004
     * @tc.name      Camera_Constants_0004
     * @tc.desc      CAPTURE_BUTTON_BORDER_WIDTH is pinned to 3 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0004 begin`);
      logInfo("constant CAPTURE_BUTTON_BORDER_WIDTH");
      const actual: number = CAPTURE_BUTTON_BORDER_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0005
     * @tc.name      Camera_Constants_0005
     * @tc.desc      CAPTURE_BUTTON_BORDER_RADIUS is pinned to 70 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0005 begin`);
      logInfo("constant CAPTURE_BUTTON_BORDER_RADIUS");
      const actual: number = CAPTURE_BUTTON_BORDER_RADIUS;
      logInfo('actual=' + String(actual) + ', expected=' + "70");
      expect(actual).assertEqual(70);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0006
     * @tc.name      Camera_Constants_0006
     * @tc.desc      CAPTURE_BUTTON_COLUMN_MARGIN is pinned to 24 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0006 begin`);
      logInfo("constant CAPTURE_BUTTON_COLUMN_MARGIN");
      const actual: number = CAPTURE_BUTTON_COLUMN_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0007
     * @tc.name      Camera_Constants_0007
     * @tc.desc      CAPTURE_BUTTON_COLUMN_PADDING is pinned to 24 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0007 begin`);
      logInfo("constant CAPTURE_BUTTON_COLUMN_PADDING");
      const actual: number = CAPTURE_BUTTON_COLUMN_PADDING;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0008
     * @tc.name      Camera_Constants_0008
     * @tc.desc      BACK_ICON_SIZE is pinned to 24 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0008 begin`);
      logInfo("constant BACK_ICON_SIZE");
      const actual: number = BACK_ICON_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0009
     * @tc.name      Camera_Constants_0009
     * @tc.desc      IMAGE_SIZE is pinned to 25 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0009 begin`);
      logInfo("constant IMAGE_SIZE");
      const actual: number = IMAGE_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0010
     * @tc.name      Camera_Constants_0010
     * @tc.desc      BACK_ICON_MARGIN is pinned to 24 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0010 begin`);
      logInfo("constant BACK_ICON_MARGIN");
      const actual: number = BACK_ICON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0011
     * @tc.name      Camera_Constants_0011
     * @tc.desc      FULL_PERCENT is pinned to "100%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0011 begin`);
      logInfo("constant FULL_PERCENT");
      const actual: string = FULL_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "100%");
      expect(actual).assertEqual("100%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0012
     * @tc.name      Camera_Constants_0012
     * @tc.desc      EIGHTY_FIVE_PERCENT is pinned to "85%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Constants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0012 begin`);
      logInfo("constant EIGHTY_FIVE_PERCENT");
      const actual: string = EIGHTY_FIVE_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "85%");
      expect(actual).assertEqual("85%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0013
     * @tc.name      Camera_Constants_0013
     * @tc.desc      EIGHTY_PERCENT is pinned to "80%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0013 begin`);
      logInfo("constant EIGHTY_PERCENT");
      const actual: string = EIGHTY_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "80%");
      expect(actual).assertEqual("80%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0014
     * @tc.name      Camera_Constants_0014
     * @tc.desc      SEVENTY_FIVE_PERCENT is pinned to "75%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0014 begin`);
      logInfo("constant SEVENTY_FIVE_PERCENT");
      const actual: string = SEVENTY_FIVE_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "75%");
      expect(actual).assertEqual("75%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0015
     * @tc.name      Camera_Constants_0015
     * @tc.desc      SEVENTY_PERCENT is pinned to "70%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0015 begin`);
      logInfo("constant SEVENTY_PERCENT");
      const actual: string = SEVENTY_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "70%");
      expect(actual).assertEqual("70%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0016
     * @tc.name      Camera_Constants_0016
     * @tc.desc      FORTY_PERCENT is pinned to "40%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0016 begin`);
      logInfo("constant FORTY_PERCENT");
      const actual: string = FORTY_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "40%");
      expect(actual).assertEqual("40%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0017
     * @tc.name      Camera_Constants_0017
     * @tc.desc      THIRTY_PERCENT is pinned to "30%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0017 begin`);
      logInfo("constant THIRTY_PERCENT");
      const actual: string = THIRTY_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "30%");
      expect(actual).assertEqual("30%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0018
     * @tc.name      Camera_Constants_0018
     * @tc.desc      FIFTEEN_PERCENT is pinned to "15%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_Constants_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Constants_0018 begin`);
      logInfo("constant FIFTEEN_PERCENT");
      const actual: string = FIFTEEN_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "15%");
      expect(actual).assertEqual("15%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0019
     * @tc.name      Camera_Constants_0019
     * @tc.desc      TEN_PERCENT is pinned to "10%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0019 begin`);
      logInfo("constant TEN_PERCENT");
      const actual: string = TEN_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "10%");
      expect(actual).assertEqual("10%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0020
     * @tc.name      Camera_Constants_0020
     * @tc.desc      ZERO_PERCENT is pinned to "0%" for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0020 begin`);
      logInfo("constant ZERO_PERCENT");
      const actual: string = ZERO_PERCENT;
      logInfo('actual=' + String(actual) + ', expected=' + "0%");
      expect(actual).assertEqual("0%");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0021
     * @tc.name      Camera_Constants_0021
     * @tc.desc      TEXT_BORDER_RADIUS is pinned to 25 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0021 begin`);
      logInfo("constant TEXT_BORDER_RADIUS");
      const actual: number = TEXT_BORDER_RADIUS;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0022
     * @tc.name      Camera_Constants_0022
     * @tc.desc      FONT_SIZE_14 is pinned to 14 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0022 begin`);
      logInfo("constant FONT_SIZE_14");
      const actual: number = FONT_SIZE_14;
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0023
     * @tc.name      Camera_Constants_0023
     * @tc.desc      COLUMN_SPACE_24 is pinned to 24 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Constants_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0023 begin`);
      logInfo("constant COLUMN_SPACE_24");
      const actual: number = COLUMN_SPACE_24;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0024
     * @tc.name      Camera_Constants_0024
     * @tc.desc      ROW_SPACE_24 is pinned to 24 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0024 begin`);
      logInfo("constant ROW_SPACE_24");
      const actual: number = ROW_SPACE_24;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0025
     * @tc.name      Camera_Constants_0025
     * @tc.desc      DEFAULT_ZOOM_RATIO is pinned to 1 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0025 begin`);
      logInfo("constant DEFAULT_ZOOM_RATIO");
      const actual: number = DEFAULT_ZOOM_RATIO;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0026
     * @tc.name      Camera_Constants_0026
     * @tc.desc      BORDER_RADIUS_14 is pinned to 14 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0026 begin`);
      logInfo("constant BORDER_RADIUS_14");
      const actual: number = BORDER_RADIUS_14;
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0027
     * @tc.name      Camera_Constants_0027
     * @tc.desc      ZOOM_RADIO_MIN is pinned to 1 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0027 begin`);
      logInfo("constant ZOOM_RADIO_MIN");
      const actual: number = ZOOM_RADIO_MIN;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0028
     * @tc.name      Camera_Constants_0028
     * @tc.desc      ZOOM_RADIO_MAX is pinned to 6 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0028 begin`);
      logInfo("constant ZOOM_RADIO_MAX");
      const actual: number = ZOOM_RADIO_MAX;
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0029
     * @tc.name      Camera_Constants_0029
     * @tc.desc      ZOOM_RADIO_MAX_STEP is pinned to 0.1 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0029 begin`);
      logInfo("constant ZOOM_RADIO_MAX_STEP");
      const actual: number = ZOOM_RADIO_MAX_STEP;
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0030
     * @tc.name      Camera_Constants_0030
     * @tc.desc      ZOOM_RADIO_MIN_STEP is pinned to 0.01 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0030 begin`);
      logInfo("constant ZOOM_RADIO_MIN_STEP");
      const actual: number = ZOOM_RADIO_MIN_STEP;
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0031
     * @tc.name      Camera_Constants_0031
     * @tc.desc      CAPTURE_COLUMN_WIDTH is pinned to 50 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0031 begin`);
      logInfo("constant CAPTURE_COLUMN_WIDTH");
      const actual: number = CAPTURE_COLUMN_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0032
     * @tc.name      Camera_Constants_0032
     * @tc.desc      CAPTURE_ROW_HEIGHT is pinned to 28 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0032 begin`);
      logInfo("constant CAPTURE_ROW_HEIGHT");
      const actual: number = CAPTURE_ROW_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "28");
      expect(actual).assertEqual(28);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0033
     * @tc.name      Camera_Constants_0033
     * @tc.desc      AUDIO_BITRATE is pinned to 48000 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0033 begin`);
      logInfo("constant AUDIO_BITRATE");
      const actual: number = AUDIO_BITRATE;
      logInfo('actual=' + String(actual) + ', expected=' + "48000");
      expect(actual).assertEqual(48000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0034
     * @tc.name      Camera_Constants_0034
     * @tc.desc      AUDIO_CHANNELS is pinned to 2 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Constants_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0034 begin`);
      logInfo("constant AUDIO_CHANNELS");
      const actual: number = AUDIO_CHANNELS;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0035
     * @tc.name      Camera_Constants_0035
     * @tc.desc      AUDIO_SAMPLE_RATE is pinned to 48000 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_Constants_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Constants_0035 begin`);
      logInfo("constant AUDIO_SAMPLE_RATE");
      const actual: number = AUDIO_SAMPLE_RATE;
      logInfo('actual=' + String(actual) + ', expected=' + "48000");
      expect(actual).assertEqual(48000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0036
     * @tc.name      Camera_Constants_0036
     * @tc.desc      VIDEO_BITRATE is pinned to 512000 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0036 begin`);
      logInfo("constant VIDEO_BITRATE");
      const actual: number = VIDEO_BITRATE;
      logInfo('actual=' + String(actual) + ', expected=' + "512000");
      expect(actual).assertEqual(512000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0037
     * @tc.name      Camera_Constants_0037
     * @tc.desc      MAX_VIDEO_FRAME is pinned to 60 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0037 begin`);
      logInfo("constant MAX_VIDEO_FRAME");
      const actual: number = MAX_VIDEO_FRAME;
      logInfo('actual=' + String(actual) + ', expected=' + "60");
      expect(actual).assertEqual(60);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0038
     * @tc.name      Camera_Constants_0038
     * @tc.desc      FLASH_POSITION_X is pinned to 0 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0038 begin`);
      logInfo("constant FLASH_POSITION_X");
      const actual: number = FLASH_POSITION_X;
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0039
     * @tc.name      Camera_Constants_0039
     * @tc.desc      FLASH_POSITION_Y is pinned to 50 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0039 begin`);
      logInfo("constant FLASH_POSITION_Y");
      const actual: number = FLASH_POSITION_Y;
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0040
     * @tc.name      Camera_Constants_0040
     * @tc.desc      SCENE_NORMAL_PHOTO is pinned to 1 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0040 begin`);
      logInfo("constant SCENE_NORMAL_PHOTO");
      const actual: number = SCENE_NORMAL_PHOTO;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0041
     * @tc.name      Camera_Constants_0041
     * @tc.desc      SCENE_NORMAL_VIDEO is pinned to 2 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0041 begin`);
      logInfo("constant SCENE_NORMAL_VIDEO");
      const actual: number = SCENE_NORMAL_VIDEO;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0042
     * @tc.name      Camera_Constants_0042
     * @tc.desc      FLASH_MODE_CLOSE is pinned to 0 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0042 begin`);
      logInfo("constant FLASH_MODE_CLOSE");
      const actual: number = FLASH_MODE_CLOSE;
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0043
     * @tc.name      Camera_Constants_0043
     * @tc.desc      FLASH_MODE_OPEN is pinned to 1 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0043 begin`);
      logInfo("constant FLASH_MODE_OPEN");
      const actual: number = FLASH_MODE_OPEN;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0044
     * @tc.name      Camera_Constants_0044
     * @tc.desc      FLASH_MODE_AUTO is pinned to 2 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Constants_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0044 begin`);
      logInfo("constant FLASH_MODE_AUTO");
      const actual: number = FLASH_MODE_AUTO;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONSTANTS_0045
     * @tc.name      Camera_Constants_0045
     * @tc.desc      FLASH_MODE_ALWAYS_OPEN is pinned to 3 for the camera layout contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Constants_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0045 begin`);
      logInfo("constant FLASH_MODE_ALWAYS_OPEN");
      const actual: number = FLASH_MODE_ALWAYS_OPEN;
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0045 end`);
    });
  });
}
