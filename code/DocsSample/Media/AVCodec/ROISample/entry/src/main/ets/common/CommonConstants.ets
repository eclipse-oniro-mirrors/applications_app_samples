/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { camera } from '@kit.CameraKit';
import { Permissions } from '@kit.AbilityKit';

export class CommonConstants {
  /**
   * Key prefix.
   * */
  public static readonly KEY_PREFIX: string = 'live_stream';
  /**
   * MICROPHONE permission.
   * */
  public static MICROPHONE_PERMISSION: Permissions = 'ohos.permission.MICROPHONE';
  /**
   * CAMERA permission.
   * */
  public static CAMERA_PERMISSION: Permissions = 'ohos.permission.CAMERA';
  /**
   * DISTRIBUTED_DATASYNC permission.
   * */
  public static DISTRIBUTED_DATASYNC: Permissions = 'ohos.permission.DISTRIBUTED_DATASYNC';
  /**
   * Index page Tag.
   */
  public static readonly INDEX_TAG: string = '[Sample_HMOSLiveStream]';
  /**
   * Recorder page Tag.
   */
  public static readonly RECORDER_TAG: string = '[Sample_HMOSLiveStream]';
  /**
   * Default ID.
   */
  public static readonly DEFAULT_ID: string = '-1';
  /**
   * Default time.
   */
  public static readonly DEFAULT_TIME: string = '00:00';
  /**
   * PX.
   */
  public static readonly PX: string = 'px';
  /**
   * Default value.
   */
  public static readonly DEFAULT_VALUE: number = 0;
  /**
   * Default profile.
   */
  public static readonly DEFAULT_PROFILE: camera.Profile = {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: {
      width: 1920,
      height: 1080
    }
  };
  /**
   * Video avc mime type.
   */
  public static readonly MIME_VIDEO_AVC: string = 'video/avc';
  /**
   * Video hevc mime type.
   */
  public static readonly MIME_VIDEO_HEVC: string = 'video/hevc';
  /**
   * Default width.
   */
  public static readonly DEFAULT_WIDTH: number = 1920;
  /**
   * Default height.
   */
  public static readonly DEFAULT_HEIGHT: number = 1080;
  /**
   * 4K video width.
   */
  public static readonly VIDEO_WIDTH_4K: number = 3840;
  /**
   * 4K video height.
   */
  public static readonly VIDEO_HEIGHT_4K: number = 2160;
  /**
   * 1080P video width.
   */
  public static readonly VIDEO_WIDTH_1080P: number = 1920;
  /**
   * 1080P video height.
   */
  public static readonly VIDEO_HEIGHT_1080P: number = 1080;
  /**
   * 720P video width.
   */
  public static readonly VIDEO_WIDTH_720P: number = 1280;
  /**
   * 720P video height.
   */
  public static readonly VIDEO_HEIGHT_720P: number = 720;
  /**
   * 3M bitrate.
   */
  public static readonly BITRATE_VIDEO_3M: number = 3 * 1024 * 1024;
  /**
   * 10M bitrate.
   */
  public static readonly BITRATE_VIDEO_10M: number = 1.6 * 1024 * 1024;
  /**
   * 20M bitrate.
   */
  public static readonly BITRATE_VIDEO_20M: number = 20 * 1024 * 1024;
  /**
   * 30M bitrate.
   */
  public static readonly BITRATE_VIDEO_30M: number = 30 * 1024 * 1024;
  /**
   * 24 FPS.
   */
  public static readonly FRAMERATE_VIDEO_24FPS: number = 24;
  /**
   * 30 FPS.
   */
  public static readonly FRAMERATE_VIDEO_30FPS: number = 30;
  /**
   * 60 FPS.
   */
  public static readonly FRAMERATE_VIDEO_60FPS: number = 60;
  /**
   * Duration.
   */
  public static readonly DURATION: number = 2000;
  /**
   * BGM replay interval in milliseconds.
   */
  public static readonly BGM_REPLAY_INTERVAL: number = 204000;
  /**
   * Icon button size.
   */
  public static readonly ICON_BUTTON_SIZE: number = 28;
  /**
   * Icon margin left.
   */
  public static readonly ICON_MARGIN_LEFT: number = 12;
  /**
   * The distance between toast dialog box and the bottom of screen.
   */
  public static readonly BOTTOM: number = 80;
  /**
   * Default picker item height.
   */
  public static readonly DEFAULT_PICKER_ITEM_HEIGHT: number = 30;
  /**
   * Selected text style font size.
   */
  public static readonly SELECTED_TEXT_STYLE_FONT_SIZE: number = 15;
  /**
   * Video mime type.
   */
  public static readonly VIDEO_MIMETYPE: string[] = ['HDRVivid', 'SDR'];
  /**
   * Video resolution.
   */
  public static readonly VIDEO_RESOLUTION: string[] = ['4K', '1080P'];
  /**
   * Video framerate.
   */
  public static readonly VIDEO_FRAMERATE: string[] = ['30Fps', '60Fps'];
  public static readonly DYNAMIC_FRAME_SWITCH: ResourceStr[] =
    [$r('app.string.dynamic_frame_rate'), $r('app.string.fixed_frame_rate')];
  /**
   * The number corresponding to true.
   */
  public static readonly TRUE: number = 1;
  /**
   * The number corresponding to false.
   */
  public static readonly FALSE: number = 0;
  /**
   * Min range.
   */
  public static readonly MIN_RANGE: number = 1;
  /**
   * Max range.
   */
  public static readonly MAX_RANGE: number = 30;
  /**
   * Full size.
   */
  public static readonly FULL_SIZE: string = '100%';
  /**
   * ROI id.
   */
  public static readonly ROI_ID: string = 'roi_id';
  /**
   * BGM id.
   */
  public static readonly BGM_ID: string = 'bgm_id';
  /**
   * Global Var PREFIX.
   */
  public static readonly GLOBAL_PREFIX: string = 'HMOS_LiveStream';
  /**
   * BGM file.
   */
  public static readonly BGM_FILENAME: string = 'Delacey_DreamItPossible.mp3';
}