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

import { describe, expect, it } from '@ohos/hypium';
import { CommonConstants as Const } from '../../../main/ets/common/CommonConstants';
import { CameraDataModel } from '../../../main/ets/model/CameraDataModel';
import { RecorderSettingsModel } from '../../../main/ets/model/RecorderSettingsModel';
import { runTestCase } from './TestCaseLogger';

export default function recorderSettingsModelTest(): void {
  describe('RecorderSettingsModelTest', () => {
    it('AVCodec_RecorderSettings_AllOptions_001', 0, () => {
      runTestCase('AVCodec_RecorderSettings_AllOptions_001', () => {
        const settings = new RecorderSettingsModel();
        const cameraData = new CameraDataModel();
        const applied = settings.applyPickerValues([
          Const.OUTPUT_FORMAT[1], Const.VIDEO_MIMETYPE[0], Const.VIDEO_RESOLUTION[0],
          Const.VIDEO_FRAMERATE[1], Const.VIDEO_DECODER_SYNC_MODE[1], Const.VIDEO_BITRATE[0],
          Const.VIDEO_BITRATE_MODE[1], Const.VIDEO_I_FRAME_INTERVAL[2], Const.AUDIO_SAMPLE_RATE[0],
          Const.AUDIO_CHANNEL_COUNT[0], Const.AUDIO_BITRATE[2], Const.AUDIO_CAPTURE_LATENCY_MODE[1],
          Const.VIDEO_STABILIZATION_MODE[0]
        ], cameraData);
        expect(applied).assertTrue();
        expect(cameraData.outputFormat).assertEqual(Const.FORMAT_FLV);
        expect(cameraData.isHDRVivid).assertEqual(Const.TRUE);
        expect(cameraData.cameraWidth).assertEqual(Const.VIDEO_WIDTH_4K);
        expect(cameraData.frameRate).assertEqual(Const.FRAMERATE_VIDEO_60FPS);
        expect(cameraData.isSync).assertEqual(1);
        expect(cameraData.bitRate).assertEqual(Const.BITRATE_VIDEO_10M);
        expect(cameraData.bitrateMode).assertEqual(Const.VIDEO_BITRATE_MODE_VBR);
        expect(cameraData.iFrameInterval).assertEqual(Const.I_FRAME_INTERVAL_2_S);
        expect(cameraData.audioSampleRate).assertEqual(Const.AUDIO_SAMPLE_RATE_44100);
        expect(cameraData.audioChannelCount).assertEqual(Const.AUDIO_CHANNEL_COUNT_MONO);
        expect(cameraData.audioBitRate).assertEqual(Const.AUDIO_BITRATE_128K);
        expect(cameraData.audioCaptureLatencyMode).assertEqual(Const.AUDIO_CAPTURE_LATENCY_LOW);
        expect(cameraData.videoStabilizationMode).assertEqual(Const.VIDEO_STABILIZATION_DISABLED);
      });
    });

    it('AVCodec_RecorderSettings_IncompleteOptions_002', 0, () => {
      runTestCase('AVCodec_RecorderSettings_IncompleteOptions_002', () => {
        const settings = new RecorderSettingsModel();
        const cameraData = new CameraDataModel();
        const applied = settings.applyPickerValues([
          Const.OUTPUT_FORMAT[0], Const.VIDEO_MIMETYPE[2], Const.VIDEO_RESOLUTION[2]
        ], cameraData);
        expect(applied).assertFalse();
        expect(cameraData.videoCodecMime).assertEqual(Const.MIME_VIDEO_AVC);
        expect(cameraData.cameraWidth).assertEqual(Const.DEFAULT_WIDTH);
      });
    });
  });
}
