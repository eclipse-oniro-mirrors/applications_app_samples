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

export default function commonConstantsTest(): void {
  describe('CommonConstantsTest', () => {
    it('shouldKeepNativeContainerFormatValues', 0, () => {
      expect(Const.FORMAT_MP4).assertEqual(2);
      expect(Const.FORMAT_FLV).assertEqual(14);
      expect(Const.OUTPUT_FORMAT).assertDeepEquals(['MP4', 'FLV']);
    });

    it('shouldExposeCompletePlayerSettings', 0, () => {
      expect(Const.PLAYER_INFO.length).assertEqual(4);
      expect(Const.VIDEO_DECODE_TYPE).assertDeepEquals(['Auto', 'Hardware', 'Software']);
      expect(Const.VIDEO_DECODER_RUN_MODE).assertDeepEquals(['SurfaceMode', 'BufferMode']);
      expect(Const.VIDEO_DECODER_SYNC_MODE).assertDeepEquals(['ASYNC', 'SYNC']);
      expect(Const.VIDEO_DUMP_MODE).assertDeepEquals(['NoDump', 'Dump']);
    });

    it('shouldExposeCompleteRecorderSettings', 0, () => {
      expect(Const.RECORDER_INFO.length).assertEqual(4);
      expect(Const.VIDEO_MIMETYPE).assertDeepEquals(['HDRVivid', 'H264', 'H265']);
      expect(Const.VIDEO_RESOLUTION).assertDeepEquals(['4K', '1080P', '720P']);
      expect(Const.VIDEO_FRAMERATE).assertDeepEquals(['30Fps', '60Fps']);
    });

    it('shouldProvideAllNativeWindowTransforms', 0, () => {
      expect(Const.TRANSFORM_TYPE_COUNT).assertEqual(12);
    });
  });
}
