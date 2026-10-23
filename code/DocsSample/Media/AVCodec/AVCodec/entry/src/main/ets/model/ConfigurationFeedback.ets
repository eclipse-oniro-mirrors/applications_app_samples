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

import { LocalizedText } from '../common/LocalizedText';
import player, { DeviceCodecCapability } from 'libplayer.so';
import { CameraDataModel } from './CameraDataModel';
import { RecorderPreprocessModel } from './RecorderPreprocessModel';

export class ConfigurationFeedback {
  static playback(runMode: number, apiVersion: number): string {
    const lines: string[] = [LocalizedText.get($r('app.string.configuration_playback_next'))];
    if (runMode !== 1) {
      lines.push(LocalizedText.get($r('app.string.configuration_buffer_hint')));
    }
    if (runMode !== 0) {
      lines.push(LocalizedText.get($r('app.string.configuration_direct_output_hint')));
    }
    lines.push(LocalizedText.get($r('app.string.configuration_decoder_hint')));
    return lines.join('\n');
  }

  static recording(data: CameraDataModel, apiVersion: number): string {
    const unavailable: string = ConfigurationFeedback.recordingConstraint(data, apiVersion);
    if (unavailable.length > 0) {
      return unavailable;
    }
    return ConfigurationFeedback.queryRecording(data, apiVersion);
  }

  static recordingConstraint(data: CameraDataModel, apiVersion: number): string {
    const special: boolean = data.preprocMode !== 0 || data.dropToFrameRate > 0 || data.enableDualOutput;
    if (special && apiVersion < 26) {
      return LocalizedText.get($r('app.string.configuration_api26_required'));
    }
    if (special && (data.isSync !== 0 || data.videoCodecName.length > 0)) {
      return LocalizedText.get($r('app.string.configuration_async_required'));
    }
    if (data.outputFormat === 14 && data.videoCodecMime !== 'video/avc') {
      return LocalizedText.get($r('app.string.configuration_flv_codec'));
    }
    if (data.dropToFrameRate > 0 && data.dropToFrameRate >= data.frameRate) {
      return LocalizedText.get($r('app.string.configuration_drop_rate'));
    }
    return '';
  }

  private static queryRecording(data: CameraDataModel, apiVersion: number): string {
    if (apiVersion < 24) {
      return LocalizedText.get($r('app.string.configuration_capability_api'));
    }
    try {
      const codecs: DeviceCodecCapability[] = player.getDeviceCodecCapabilities().filter(
        (item: DeviceCodecCapability): boolean => item.codecType === 0 && item.mimeType === data.videoCodecMime &&
          (data.videoCodecName.length === 0 || item.codecName === data.videoCodecName));
      const plan = RecorderPreprocessModel.forCamera(data);
      const dimensions: number[][] = [[plan.primaryWidth, plan.primaryHeight]];
      if (data.enableDualOutput) {
        dimensions.push([plan.secondaryWidth, plan.secondaryHeight]);
      }
      for (let index: number = 0; index < dimensions.length; index++) {
        let supported: boolean = false;
        let reason: string = LocalizedText.get($r('app.string.configuration_encoder_missing'));
        for (const codec of codecs) {
          const result = player.checkVideoCapability({ codecName: codec.codecName, mimeType: codec.mimeType,
            codecType: 0, width: dimensions[index][0], height: dimensions[index][1],
            frameRate: index === 0 ? plan.outputFrameRate : data.frameRate });
          if (result.supported) {
            supported = true;
            break;
          }
          reason = result.reason;
        }
        if (!supported) {
          return (index === 0 ? LocalizedText.get($r('app.string.configuration_primary_prefix')) : LocalizedText.get($r('app.string.configuration_secondary_prefix'))) + reason + LocalizedText.get($r('app.string.configuration_actual_configure'));
        }
      }
      return LocalizedText.get($r('app.string.configuration_combination_passed'));
    } catch (_error) {
      return LocalizedText.get($r('app.string.configuration_query_failed'));
    }
  }
}
