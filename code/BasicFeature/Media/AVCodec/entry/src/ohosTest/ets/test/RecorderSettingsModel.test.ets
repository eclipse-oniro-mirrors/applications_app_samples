/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { CameraDataModel } from '../../../main/ets/model/CameraDateModel';
import { RecorderSettingsModel } from '../../../main/ets/model/RecorderSettingsModel';

export default function recorderSettingsModelTest(): void {
  describe('RecorderSettingsModelTest', () => {
    it('shouldApplyRecorderSettingsTogether', 0, () => {
      const settings = new RecorderSettingsModel();
      const cameraData = new CameraDataModel();
      const applied = settings.applyPickerValues([
        Const.VIDEO_MIMETYPE[0], Const.VIDEO_RESOLUTION[0],
        Const.VIDEO_FRAMERATE[1], Const.VIDEO_DECODER_SYNC_MODE[1]
      ], cameraData);
      expect(applied).assertTrue();
      expect(cameraData.isHDRVivid).assertEqual(Const.TRUE);
      expect(cameraData.cameraWidth).assertEqual(Const.VIDEO_WIDTH_4K);
      expect(cameraData.frameRate).assertEqual(Const.FRAMERATE_VIDEO_60FPS);
      expect(cameraData.isSync).assertEqual(1);
    });

    it('shouldRejectIncompleteRecorderSettings', 0, () => {
      const settings = new RecorderSettingsModel();
      const cameraData = new CameraDataModel();
      const applied = settings.applyPickerValues([
        Const.VIDEO_MIMETYPE[2], Const.VIDEO_RESOLUTION[2]
      ], cameraData);
      expect(applied).assertFalse();
      expect(cameraData.videoCodecMime).assertEqual(Const.MIME_VIDEO_AVC);
      expect(cameraData.cameraWidth).assertEqual(Const.DEFAULT_WIDTH);
    });
  });
}
