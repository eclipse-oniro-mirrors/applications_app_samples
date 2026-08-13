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
import { PlayerSettingsModel } from '../../../main/ets/model/PlayerSettingsModel';

export default function playerSettingsModelTest(): void {
  describe('PlayerSettingsModelTest', () => {
    it('shouldApplyAllPlayerSettings', 0, () => {
      const model = new PlayerSettingsModel();
      const applied = model.applyPickerValues([
        Const.VIDEO_DECODE_TYPE[2], Const.VIDEO_DECODER_RUN_MODE[1],
        Const.VIDEO_DECODER_SYNC_MODE[1], Const.VIDEO_DUMP_MODE[1]
      ]);
      expect(applied).assertTrue();
      expect(model.videoDecoderType).assertEqual(2);
      expect(model.videoDecoderRunMode).assertEqual(1);
      expect(model.videoDecoderSyncMode).assertEqual(1);
      expect(model.enableVideoDump).assertTrue();
    });

    it('shouldRejectInvalidSettingsWithoutPartialUpdate', 0, () => {
      const model = new PlayerSettingsModel();
      const applied = model.applyPickerValues([
        Const.VIDEO_DECODE_TYPE[1], 'InvalidMode',
        Const.VIDEO_DECODER_SYNC_MODE[1], Const.VIDEO_DUMP_MODE[1]
      ]);
      expect(applied).assertFalse();
      expect(model.videoDecoderType).assertEqual(0);
      expect(model.enableVideoDump).assertFalse();
    });

    it('shouldBuildStructuredPlayOptions', 0, () => {
      const model = new PlayerSettingsModel();
      model.applyPickerValues([
        Const.VIDEO_DECODE_TYPE[1], Const.VIDEO_DECODER_RUN_MODE[1],
        Const.VIDEO_DECODER_SYNC_MODE[0], Const.VIDEO_DUMP_MODE[1]
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
    });
  });
}
