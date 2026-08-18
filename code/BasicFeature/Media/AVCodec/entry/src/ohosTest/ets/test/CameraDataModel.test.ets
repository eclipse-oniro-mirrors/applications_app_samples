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
import { CameraDataModel } from '../../../main/ets/model/CameraDateModel';

export default function cameraDataModelTest(): void {
  describe('CameraDataModelTest', () => {
    it('shouldUseExpectedDefaultRecordingConfiguration', 0, () => {
      const model = new CameraDataModel();
      expect(model.cameraWidth).assertEqual(Const.DEFAULT_WIDTH);
      expect(model.cameraHeight).assertEqual(Const.DEFAULT_HEIGHT);
      expect(model.frameRate).assertEqual(Const.FRAMERATE_VIDEO_30FPS);
      expect(model.videoCodecMime).assertEqual(Const.MIME_VIDEO_AVC);
      expect(model.bitRate).assertEqual(Const.BITRATE_VIDEO_20M);
      expect(model.outputFormat).assertEqual(Const.FORMAT_MP4);
      expect(model.outputfd).assertEqual(-1);
    });

    it('shouldUpdateCodecConfiguration', 0, () => {
      const model = new CameraDataModel();
      model.setCodecFormat(Const.TRUE, Const.MIME_VIDEO_HEVC);
      expect(model.isHDRVivid).assertEqual(Const.TRUE);
      expect(model.videoCodecMime).assertEqual(Const.MIME_VIDEO_HEVC);
      expect(model.format).assertEqual(camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP);
    });

    it('shouldUpdateResolutionAndBitrateTogether', 0, () => {
      const model = new CameraDataModel();
      model.setResolution(Const.VIDEO_WIDTH_4K, Const.VIDEO_HEIGHT_4K, Const.BITRATE_VIDEO_30M);
      expect(model.cameraWidth).assertEqual(Const.VIDEO_WIDTH_4K);
      expect(model.cameraHeight).assertEqual(Const.VIDEO_HEIGHT_4K);
      expect(model.bitRate).assertEqual(Const.BITRATE_VIDEO_30M);
    });
  });
}
