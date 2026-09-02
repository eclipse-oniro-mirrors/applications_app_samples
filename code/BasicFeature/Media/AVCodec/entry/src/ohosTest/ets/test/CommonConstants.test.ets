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
import { runTestCase } from './TestCaseLogger';

export default function commonConstantsTest(): void {
  describe('CommonConstantsTest', () => {
    it('AVCodec_CommonConstants_ContainerFormats_001', 0, () => {
      runTestCase('AVCodec_CommonConstants_ContainerFormats_001', () => {
        expect(Const.FORMAT_MP4).assertEqual(2);
        expect(Const.FORMAT_FLV).assertEqual(14);
        expect(Const.OUTPUT_FORMAT).assertDeepEquals(['MP4', 'FLV']);
      });
    });

    it('AVCodec_CommonConstants_PlayerSettings_002', 0, () => {
      runTestCase('AVCodec_CommonConstants_PlayerSettings_002', () => {
        expect(Const.PLAYER_INFO.length).assertEqual(4);
        expect(Const.VIDEO_DECODE_TYPE).assertDeepEquals(['Auto', 'Hardware', 'Software']);
        expect(Const.VIDEO_DECODER_RUN_MODE).assertDeepEquals(['SurfaceMode', 'BufferMode']);
        expect(Const.VIDEO_DECODER_SYNC_MODE).assertDeepEquals(['ASYNC', 'SYNC']);
        expect(Const.VIDEO_DUMP_MODE).assertDeepEquals(['NoDump', 'Dump']);
        expect(Const.VIDEO_LAST_FRAME_MODE).assertDeepEquals(['RetainLastFrame', 'ClearLastFrame']);
        expect(Const.VIDEO_FEATURE_MODE).assertDeepEquals(['Disabled', 'Enabled']);
        expect(Const.AUDIO_RENDERER_LATENCY_MODE).assertDeepEquals(['NormalLatency', 'LowLatency']);
      });
    });

    it('AVCodec_CommonConstants_RecorderSettings_003', 0, () => {
      runTestCase('AVCodec_CommonConstants_RecorderSettings_003', () => {
        expect(Const.RECORDER_INFO.length).assertEqual(13);
        expect(Const.RECORDER_INFO[0]).assertDeepEquals(Const.OUTPUT_FORMAT);
        expect(Const.VIDEO_MIMETYPE).assertDeepEquals(['HDRVivid', 'H264', 'H265']);
        expect(Const.VIDEO_RESOLUTION).assertDeepEquals(['4K', '1080P', '720P']);
        expect(Const.VIDEO_FRAMERATE).assertDeepEquals(['30Fps', '60Fps']);
        expect(Const.VIDEO_BITRATE).assertDeepEquals(['10Mbps', '20Mbps', '30Mbps']);
        expect(Const.VIDEO_BITRATE_MODE).assertDeepEquals(['CBR', 'VBR']);
        expect(Const.VIDEO_I_FRAME_INTERVAL).assertDeepEquals(['100ms', '1s', '2s']);
        expect(Const.AUDIO_SAMPLE_RATE).assertDeepEquals(['44100Hz', '48000Hz']);
        expect(Const.AUDIO_CHANNEL_COUNT).assertDeepEquals(['Mono', 'Stereo']);
        expect(Const.AUDIO_BITRATE).assertDeepEquals(['32kbps', '64kbps', '128kbps']);
        expect(Const.AUDIO_CAPTURE_LATENCY_MODE).assertDeepEquals(['NormalLatency', 'LowLatency']);
        expect(Const.VIDEO_STABILIZATION_MODE).assertDeepEquals(['Disabled', 'Auto']);
        expect(Const.RECORDER_INFO[8]).assertDeepEquals(Const.AUDIO_SAMPLE_RATE);
        expect(Const.RECORDER_INFO[9]).assertDeepEquals(Const.AUDIO_CHANNEL_COUNT);
        expect(Const.RECORDER_INFO[10]).assertDeepEquals(Const.AUDIO_BITRATE);
        expect(Const.RECORDER_INFO[11]).assertDeepEquals(Const.AUDIO_CAPTURE_LATENCY_MODE);
        expect(Const.RECORDER_INFO[12]).assertDeepEquals(Const.VIDEO_STABILIZATION_MODE);
      });
    });

    it('AVCodec_CommonConstants_NativeWindowTransforms_004', 0, () => {
      runTestCase('AVCodec_CommonConstants_NativeWindowTransforms_004', () => {
        expect(Const.TRANSFORM_TYPE_COUNT).assertEqual(12);
      });
    });
  });
}
