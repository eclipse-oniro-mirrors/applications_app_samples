/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { camera } from '@kit.CameraKit';
import { describe, expect, it } from '@ohos/hypium';
import { CommonConstants as Const } from '../../../main/ets/common/CommonConstants';
import { CameraDataModel } from '../../../main/ets/model/CameraDataModel';
import { runTestCase } from './TestCaseLogger';

export default function cameraDataModelTest(): void {
  describe('CameraDataModelTest', () => {
    it('AVCodec_CameraDataModel_DefaultConfiguration_001', 0, () => {
      runTestCase('AVCodec_CameraDataModel_DefaultConfiguration_001', () => {
        const model = new CameraDataModel();
        expect(model.cameraWidth).assertEqual(Const.DEFAULT_WIDTH);
        expect(model.cameraHeight).assertEqual(Const.DEFAULT_HEIGHT);
        expect(model.frameRate).assertEqual(Const.FRAMERATE_VIDEO_30FPS);
        expect(model.videoCodecMime).assertEqual(Const.MIME_VIDEO_AVC);
        expect(model.bitRate).assertEqual(Const.BITRATE_VIDEO_20M);
        expect(model.bitrateMode).assertEqual(Const.VIDEO_BITRATE_MODE_CBR);
        expect(model.iFrameInterval).assertEqual(Const.I_FRAME_INTERVAL_100_MS);
        expect(model.audioSampleRate).assertEqual(Const.AUDIO_SAMPLE_RATE_48000);
        expect(model.audioChannelCount).assertEqual(Const.AUDIO_CHANNEL_COUNT_STEREO);
        expect(model.audioBitRate).assertEqual(Const.AUDIO_BITRATE_32K);
        expect(model.audioCaptureLatencyMode).assertEqual(Const.AUDIO_CAPTURE_LATENCY_NORMAL);
        expect(model.videoStabilizationMode).assertEqual(Const.VIDEO_STABILIZATION_AUTO);
        expect(model.outputFormat).assertEqual(Const.FORMAT_MP4);
        expect(model.outputfd).assertEqual(-1);
      });
    });

    it('AVCodec_CameraDataModel_CodecConfiguration_002', 0, () => {
      runTestCase('AVCodec_CameraDataModel_CodecConfiguration_002', () => {
        const model = new CameraDataModel();
        model.setCodecFormat(Const.TRUE, Const.MIME_VIDEO_HEVC);
        expect(model.isHDRVivid).assertEqual(Const.TRUE);
        expect(model.videoCodecMime).assertEqual(Const.MIME_VIDEO_HEVC);
        expect(model.format).assertEqual(camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP);
      });
    });

    it('AVCodec_CameraDataModel_ResolutionAndBitrate_003', 0, () => {
      runTestCase('AVCodec_CameraDataModel_ResolutionAndBitrate_003', () => {
        const model = new CameraDataModel();
        model.setResolution(Const.VIDEO_WIDTH_4K, Const.VIDEO_HEIGHT_4K, Const.BITRATE_VIDEO_30M);
        expect(model.cameraWidth).assertEqual(Const.VIDEO_WIDTH_4K);
        expect(model.cameraHeight).assertEqual(Const.VIDEO_HEIGHT_4K);
        expect(model.bitRate).assertEqual(Const.BITRATE_VIDEO_30M);
      });
    });
  });
}
