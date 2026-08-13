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

import { CommonConstants as Const } from '../common/CommonConstants';

export interface PlayerSourceOptions {
  inputFileFd: number;
  inputFileOffset: number;
  inputFileSize: number;
  isSmartFluencySupported: boolean;
}

export interface PlayerOptions extends PlayerSourceOptions {
  videoDecoderType: number;
  videoDecoderRunMode: number;
  videoDecoderSyncMode: number;
  enableVideoDump: boolean;
}

export class PlayerSettingsModel {
  public videoDecoderType: number = 0;
  public videoDecoderRunMode: number = 0;
  public videoDecoderSyncMode: number = 0;
  public enableVideoDump: boolean = false;

  applyPickerValues(values: string[]): boolean {
    if (values.length < Const.PLAYER_INFO.length) {
      return false;
    }
    const decoderType = Const.VIDEO_DECODE_TYPE.indexOf(values[0]);
    const runMode = Const.VIDEO_DECODER_RUN_MODE.indexOf(values[1]);
    const syncMode = Const.VIDEO_DECODER_SYNC_MODE.indexOf(values[2]);
    const dumpMode = Const.VIDEO_DUMP_MODE.indexOf(values[3]);
    if (decoderType < 0 || runMode < 0 || syncMode < 0 || dumpMode < 0) {
      return false;
    }
    this.videoDecoderType = decoderType;
    this.videoDecoderRunMode = runMode;
    this.videoDecoderSyncMode = syncMode;
    this.enableVideoDump = dumpMode === 1;
    return true;
  }

  createPlayOptions(source: PlayerSourceOptions): PlayerOptions {
    return {
      inputFileFd: source.inputFileFd,
      inputFileOffset: source.inputFileOffset,
      inputFileSize: source.inputFileSize,
      isSmartFluencySupported: source.isSmartFluencySupported,
      videoDecoderType: this.videoDecoderType,
      videoDecoderRunMode: this.videoDecoderRunMode,
      videoDecoderSyncMode: this.videoDecoderSyncMode,
      enableVideoDump: this.enableVideoDump
    };
  }
}
