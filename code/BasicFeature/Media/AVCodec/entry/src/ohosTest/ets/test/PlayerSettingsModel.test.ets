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
import { PlayerSettingsModel } from '../../../main/ets/model/PlayerSettingsModel';
import { runTestCase } from './TestCaseLogger';

export default function playerSettingsModelTest(): void {
  describe('PlayerSettingsModelTest', () => {
    it('AVCodec_PlayerSettings_AllOptions_001', 0, () => {
      runTestCase('AVCodec_PlayerSettings_AllOptions_001', () => {
        const model = new PlayerSettingsModel();
        const applied = model.applyPickerValues([
          Const.VIDEO_DECODE_TYPE[2], Const.VIDEO_DECODER_RUN_MODE[1],
          Const.VIDEO_DECODER_SYNC_MODE[1], Const.VIDEO_DUMP_MODE[1], Const.VIDEO_LAST_FRAME_MODE[1],
          Const.VIDEO_FEATURE_MODE[1], Const.VIDEO_FEATURE_MODE[1], Const.VIDEO_FEATURE_MODE[1],
          Const.AUDIO_RENDERER_LATENCY_MODE[1]
        ]);
        expect(applied).assertTrue();
        expect(model.videoDecoderType).assertEqual(2);
        expect(model.videoDecoderRunMode).assertEqual(1);
        expect(model.videoDecoderSyncMode).assertEqual(1);
        expect(model.enableVideoDump).assertTrue();
        expect(model.retainLastFrame).assertFalse();
        expect(model.enableLowLatency).assertTrue();
        expect(model.outputInDecodingOrder).assertTrue();
        expect(model.convertHdrVividToBt709).assertTrue();
        expect(model.enableAudioLowLatency).assertTrue();
        expect(model.audioVolume).assertEqual(100);
      });
    });

    it('AVCodec_PlayerSettings_InvalidInput_002', 0, () => {
      runTestCase('AVCodec_PlayerSettings_InvalidInput_002', () => {
        const model = new PlayerSettingsModel();
        const applied = model.applyPickerValues([
          Const.VIDEO_DECODE_TYPE[1], 'InvalidMode',
          Const.VIDEO_DECODER_SYNC_MODE[1], Const.VIDEO_DUMP_MODE[1]
        ]);
        expect(applied).assertFalse();
        expect(model.videoDecoderType).assertEqual(0);
        expect(model.enableVideoDump).assertFalse();
      });
    });

    it('AVCodec_PlayerSettings_StructuredOptions_003', 0, () => {
      runTestCase('AVCodec_PlayerSettings_StructuredOptions_003', () => {
        const model = new PlayerSettingsModel();
        model.applyPickerValues([
          Const.VIDEO_DECODE_TYPE[1], Const.VIDEO_DECODER_RUN_MODE[1],
          Const.VIDEO_DECODER_SYNC_MODE[0], Const.VIDEO_DUMP_MODE[1], Const.VIDEO_LAST_FRAME_MODE[0],
          Const.VIDEO_FEATURE_MODE[0], Const.VIDEO_FEATURE_MODE[0], Const.VIDEO_FEATURE_MODE[0],
          Const.AUDIO_RENDERER_LATENCY_MODE[0]
        ]);
        const options = model.createPlayOptions({
          inputFileFd: 12,
          inputFileOffset: 4,
          inputFileSize: 1024,
          isSmartFluencySupported: true
        });
        expect(options.inputFileFd).assertEqual(12);
        expect(options.videoDecoderType).assertEqual(1);
        expect(options.videoDecoderRunMode).assertEqual(1);
        expect(options.enableVideoDump).assertTrue();
        expect(options.retainLastFrame).assertTrue();
        expect(options.enableLowLatency).assertFalse();
        expect(options.audioVolume).assertEqual(1);
        expect(options.enableAudioLowLatency).assertFalse();
      });
    });

    it('AVCodec_PlayerSettings_AudioVolume_004', 0, () => {
      runTestCase('AVCodec_PlayerSettings_AudioVolume_004', () => {
        const model = new PlayerSettingsModel();
        const applied = model.applyPickerValues([
          Const.VIDEO_DECODE_TYPE[0], Const.VIDEO_DECODER_RUN_MODE[0],
          Const.VIDEO_DECODER_SYNC_MODE[0], Const.VIDEO_DUMP_MODE[0]
        ], 35);
        expect(applied).assertTrue();
        expect(model.audioVolume).assertEqual(35);
        const options = model.createPlayOptions({
          inputFileFd: 1, inputFileOffset: 0, inputFileSize: 1, isSmartFluencySupported: false
        });
        expect(options.audioVolume).assertEqual(0.35);
      });
    });

    it('AVCodec_PlayerSettings_AudioTrack_005', 0, () => {
      runTestCase('AVCodec_PlayerSettings_AudioTrack_005', () => {
        const model = new PlayerSettingsModel();
        model.audioTrackIndex = 2;
        const options = model.createPlayOptions({
          inputFileFd: 1, inputFileOffset: 0, inputFileSize: 1, isSmartFluencySupported: false
        });
        expect(options.audioTrackIndex).assertEqual(2);
      });
    });
  });
}
