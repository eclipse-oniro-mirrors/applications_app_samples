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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import CameraService, { SliderValue } from '../../../main/ets/mode/CameraService';
import { camera } from '@kit.CameraKit';
import { Constants } from '../../../main/ets/common/Constants';
import { BlurAnimateUtil } from '../../../main/ets/common/utils/BlurAnimateUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function CameraServiceStateMatrixPart1Test(): void {
  describe('CameraServiceStateMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0100
     * @tc.name      testSliderDefaults0001
     * @tc.desc      Verify SliderValue starts at 1, 6 and 0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSliderDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderDefaults0001 begin');
      const value: SliderValue = new SliderValue();
      expect(value.min).assertEqual(1);
      expect(value.max).assertEqual(6);
      expect(value.step).assertEqual(0.1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderDefaults0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0200
     * @tc.name      testSliderMutation0002
     * @tc.desc      Verify SliderValue fields are writable.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSliderMutation0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderMutation0002 begin');
      const value: SliderValue = new SliderValue();
      value.min = 2;
      value.max = 8;
      value.step = 0.25;
      expect(value.min).assertEqual(2);
      expect(value.max).assertEqual(8);
      expect(value.step).assertEqual(0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderMutation0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0300
     * @tc.name      testSceneVideo0003
     * @tc.desc      Verify setSceneMode stores NORMAL_VIDEO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSceneVideo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneVideo0003 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_VIDEO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneVideo0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0400
     * @tc.name      testScenePhoto0004
     * @tc.desc      Verify setSceneMode stores NORMAL_PHOTO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testScenePhoto0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenePhoto0004 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_PHOTO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenePhoto0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0500
     * @tc.name      testSceneToggle0005
     * @tc.desc      Verify two mode switches end on the last requested mode.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneToggle0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneToggle0005 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_PHOTO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneToggle0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0600
     * @tc.name      testSceneSameValue0006
     * @tc.desc      Verify setting the current mode again keeps it stable.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSameValue0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSameValue0006 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_VIDEO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSameValue0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0700
     * @tc.name      testFrameFlagWrite0007
     * @tc.desc      Verify the public frame start flag stores 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFrameFlagWrite0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameFlagWrite0007 begin');
      CameraService.frameStartFlag = 7;
      expect(CameraService.frameStartFlag).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameFlagWrite0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0800
     * @tc.name      testFrameFlagNegative0008
     * @tc.desc      Verify the frame start flag accepts a negative counter.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameFlagNegative0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameFlagNegative0008 begin');
      CameraService.frameStartFlag = -1;
      expect(CameraService.frameStartFlag).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameFlagNegative0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_0900
     * @tc.name      testFrameFlagReset0009
     * @tc.desc      Verify the frame start flag can return to zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameFlagReset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameFlagReset0009 begin');
      CameraService.frameStartFlag = 9;
      CameraService.frameStartFlag = 0;
      expect(CameraService.frameStartFlag).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameFlagReset0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1000
     * @tc.name      testZoomRange0010
     * @tc.desc      Verify zoom min, default and max are ordered.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testZoomRange0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZoomRange0010 begin');
      expect(Constants.ZOOM_RADIO_MIN <= Constants.DEFAULT_ZOOM_RATIO).assertTrue();
      expect(Constants.DEFAULT_ZOOM_RATIO <= Constants.ZOOM_RADIO_MAX).assertTrue();
      expect(Constants.ZOOM_RADIO_MIN < Constants.ZOOM_RADIO_MAX).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZoomRange0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1100
     * @tc.name      testZoomSteps0011
     * @tc.desc      Verify both configured zoom steps are positive and below one.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testZoomSteps0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZoomSteps0011 begin');
      expect(Constants.ZOOM_RADIO_MIN_STEP > 0).assertTrue();
      expect(Constants.ZOOM_RADIO_MAX_STEP > 0).assertTrue();
      expect(Constants.ZOOM_RADIO_MAX_STEP < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZoomSteps0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1200
     * @tc.name      testSurfaceShape0012
     * @tc.desc      Verify the capture surface is wider than it is tall.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSurfaceShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSurfaceShape0012 begin');
      expect(Constants.X_COMPONENT_SURFACE_WIDTH > Constants.X_COMPONENT_SURFACE_HEIGHT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSurfaceShape0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1300
     * @tc.name      testAudioConfig0013
     * @tc.desc      Verify audio channels and sample rate are positive.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAudioConfig0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioConfig0013 begin');
      expect(Constants.AUDIO_CHANNELS > 0).assertTrue();
      expect(Constants.AUDIO_SAMPLE_RATE > 0).assertTrue();
      expect(Constants.AUDIO_BITRATE > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioConfig0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1400
     * @tc.name      testVideoBitrate0014
     * @tc.desc      Verify the video bitrate and frame ceiling are positive.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoBitrate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoBitrate0014 begin');
      expect(Constants.VIDEO_BITRATE > 0).assertTrue();
      expect(Constants.MAX_VIDEO_FRAME > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoBitrate0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1500
     * @tc.name      testPercentTokens0015
     * @tc.desc      Verify layout percentage tokens all end with a percent sign.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPercentTokens0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentTokens0015 begin');
      const tokens: string[] = [Constants.FULL_PERCENT, Constants.EIGHTY_FIVE_PERCENT,
        Constants.EIGHTY_PERCENT, Constants.SEVENTY_FIVE_PERCENT, Constants.SEVENTY_PERCENT,
        Constants.FORTY_PERCENT, Constants.THIRTY_PERCENT, Constants.FIFTEEN_PERCENT,
        Constants.TEN_PERCENT, Constants.ZERO_PERCENT];
      for (let i: number = 0; i < tokens.length; i++) {
        expect(tokens[i].endsWith('%')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPercentTokens0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1600
     * @tc.name      testBlurDurations0016
     * @tc.desc      Verify every blur animation duration is positive.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBlurDurations0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBlurDurations0016 begin');
      expect(BlurAnimateUtil.SHOW_BLUR_DURATION > 0).assertTrue();
      expect(BlurAnimateUtil.HIDE_BLUR_DURATION > 0).assertTrue();
      expect(BlurAnimateUtil.ROTATION_DURATION > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBlurDurations0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1700
     * @tc.name      testFlipDelay0017
     * @tc.desc      Verify the flip delay is shorter than one rotation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlipDelay0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlipDelay0017 begin');
      expect(BlurAnimateUtil.FLIP_DELAY >= 0).assertTrue();
      expect(BlurAnimateUtil.FLIP_DELAY < BlurAnimateUtil.ROTATION_DURATION).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlipDelay0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1800
     * @tc.name      testRotateAxis0018
     * @tc.desc      Verify the rotation axis sits at the half point.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRotateAxis0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotateAxis0018 begin');
      expect(BlurAnimateUtil.ROTATE_AXIS).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRotateAxis0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_1900
     * @tc.name      testFlipAngles0019
     * @tc.desc      Verify the minus ninety angle mirrors the ninety angle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlipAngles0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlipAngles0019 begin');
      expect(BlurAnimateUtil.IMG_FLIP_ANGLE_MINUS_90).assertEqual(-BlurAnimateUtil.IMG_FLIP_ANGLE_90);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlipAngles0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSP1_2000
     * @tc.name      testImageScale0020
     * @tc.desc      Verify the switch animation shrinks the image below one.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testImageScale0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImageScale0020 begin');
      expect(BlurAnimateUtil.IMG_SCALE > 0).assertTrue();
      expect(BlurAnimateUtil.IMG_SCALE < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImageScale0020 end');
    })

  })
}
