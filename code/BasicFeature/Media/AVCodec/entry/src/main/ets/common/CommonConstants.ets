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

export class CommonConstants {
  /**
   * Full size.
   */
  public static readonly FULL_SIZE: string = '100%';
  /**
   * Default width.
   */
  public static readonly DEFAULT_WIDTH: number = 1920;
  /**
   * Default height.
   */
  public static readonly DEFAULT_HEIGHT: number = 1080;
  /**
   * Button width.
   */
  public static readonly BUTTON_WIDTH: number = 100;
  /**
   * Duration.
   */
  public static readonly DURATION: number = 2000;
  /**
   * The distance between toast dialog box and the bottom of screen.
   */
  public static readonly BOTTOM: number = 200;
  /**
   * Image width.
   */
  public static readonly IMAGE_WIDTH: number = 50;
  /**
   * Image height.
   */
  public static readonly IMAGE_HEIGHT: number = 50;
  /**
   * Video mime type.
   */
  public static readonly VIDEO_MIMETYPE: string[] = ['HDRVivid', 'H264', 'H265'];
  /**
   * Output container format.
   */
  public static readonly OUTPUT_FORMAT: string[] = ['MP4', 'FLV'];
  /**
   * Output format enum values matching NDK OH_AVOutputFormat.
   */
  public static readonly FORMAT_MP4: number = 2;
  public static readonly FORMAT_FLV: number = 14;
  /**
   * Video resolution.
   */
  public static readonly VIDEO_RESOLUTION: string[] = ['4K', '1080P', '720P'];
  /**
   * Video framerate.
   */
  public static readonly VIDEO_FRAMERATE: string[] = ['30Fps', '60Fps'];
  /**
   * Video encoding bitrate presets.
   */
  public static readonly VIDEO_BITRATE: string[] = ['10Mbps', '20Mbps', '30Mbps'];
  /**
   * Video encoder bitrate control modes.
   */
  public static readonly VIDEO_BITRATE_MODE: string[] = ['CBR', 'VBR'];
  /**
   * Video encoder key-frame intervals in milliseconds.
   */
  public static readonly VIDEO_I_FRAME_INTERVAL: string[] = ['100ms', '1s', '2s'];
  /** Audio recording presets. */
  public static readonly AUDIO_SAMPLE_RATE: string[] = ['44100Hz', '48000Hz'];
  public static readonly AUDIO_CHANNEL_COUNT: string[] = ['Mono', 'Stereo'];
  public static readonly AUDIO_BITRATE: string[] = ['32kbps', '64kbps', '128kbps'];
  public static readonly AUDIO_CAPTURE_LATENCY_MODE: string[] = ['NormalLatency', 'LowLatency'];
  public static readonly VIDEO_STABILIZATION_MODE: string[] = ['Disabled', 'Auto'];
  /**
   * Video decode type (hardware vs software).
   */
  public static readonly VIDEO_DECODE_TYPE: string[] = ['Auto', 'Hardware', 'Software'];
  /**
   * Video decoder run modes.
   */
  public static readonly VIDEO_DECODER_RUN_MODE: string[] = ['SurfaceMode', 'BufferMode'];
  /**
   * Video decoder synchronization mode.
   */
  public static readonly VIDEO_DECODER_SYNC_MODE: string[] = ['ASYNC', 'SYNC'];
  /**
   * Whether to dump decoded video frames in BufferMode.
   */
  public static readonly VIDEO_DUMP_MODE: string[] = ['NoDump', 'Dump'];
  public static readonly VIDEO_LAST_FRAME_MODE: string[] = ['RetainLastFrame', 'ClearLastFrame'];
  public static readonly VIDEO_FEATURE_MODE: string[] = ['Disabled', 'Enabled'];
  /**
   * Audio renderer output latency modes.
   */
  public static readonly AUDIO_RENDERER_LATENCY_MODE: string[] = ['NormalLatency', 'LowLatency'];
  /**
   * Video transform type.
   */
  public static getTransformTypes(): string[] {
    return [
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_ROTATE_NONE').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_ROTATE_90').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_ROTATE_180').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_ROTATE_270').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_H').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_V').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_H_ROT90').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_V_ROT90').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_H_ROT180').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_V_ROT180').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_H_ROT270').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.NATIVEBUFFER_FLIP_V_ROT270').id)
    ];
  }
  /**
   * Number of NativeWindow transform options.
   */
  public static readonly TRANSFORM_TYPE_COUNT: number = 12;
  /**
   * Video playerInfo.
   */
  public static readonly PLAYER_INFO: string[][] = [
    CommonConstants.VIDEO_DECODE_TYPE, CommonConstants.VIDEO_DECODER_RUN_MODE,
    CommonConstants.VIDEO_DECODER_SYNC_MODE, CommonConstants.VIDEO_DUMP_MODE
  ];
  /**
   * Video recorderInfo.
   */
  public static readonly RECORDER_INFO: string[][] = [
    CommonConstants.OUTPUT_FORMAT, CommonConstants.VIDEO_MIMETYPE, CommonConstants.VIDEO_RESOLUTION,
    CommonConstants.VIDEO_FRAMERATE, CommonConstants.VIDEO_DECODER_SYNC_MODE, CommonConstants.VIDEO_BITRATE,
    CommonConstants.VIDEO_BITRATE_MODE, CommonConstants.VIDEO_I_FRAME_INTERVAL,
    CommonConstants.AUDIO_SAMPLE_RATE, CommonConstants.AUDIO_CHANNEL_COUNT, CommonConstants.AUDIO_BITRATE,
    CommonConstants.AUDIO_CAPTURE_LATENCY_MODE, CommonConstants.VIDEO_STABILIZATION_MODE
  ];
  /**
   * Playback speed.
   */
  public static readonly PLAYBACK_SPEED: string[] = ['X1', 'X2', 'X3'];
  /**
   * Frame retention mode for smart fluency decoding (API 26+).
   */
  public static readonly FRAME_RETENTION_MODE: string[] = ['FULL(全量直通)', 'ADAPTIVE(感知自适应)', 'UNIFORM(平滑定比)'];
  /**
   * Default value.
   */
  public static readonly DEFAULT_VALUE: number = 0;
  /**
   * Video avc mime type.
   */
  public static readonly MIME_VIDEO_AVC: string = 'video/avc';
  /**
   * Video hevc mime type.
   */
  public static readonly MIME_VIDEO_HEVC: string = 'video/hevc';
  /**
   * 2M bitrate.
   */
  public static readonly BITRATE_VIDEO_2M: number = 2 * 1024 * 1024;
  /**
   * 10M bitrate.
   */
  public static readonly BITRATE_VIDEO_10M: number = 10 * 1024 * 1024;
  /**
   * 20M bitrate.
   */
  public static readonly BITRATE_VIDEO_20M: number = 20 * 1024 * 1024;
  /**
   * 30M bitrate.
   */
  public static readonly BITRATE_VIDEO_30M: number = 30 * 1024 * 1024;
  /**
   * Default video bitrate mode, matching OH_BitrateMode::BITRATE_MODE_CBR.
   */
  public static readonly VIDEO_BITRATE_MODE_CBR: number = 0;
  /**
   * Variable video bitrate mode, matching OH_BitrateMode::BITRATE_MODE_VBR.
   */
  public static readonly VIDEO_BITRATE_MODE_VBR: number = 1;
  /**
   * Key-frame intervals in milliseconds.
   */
  public static readonly I_FRAME_INTERVAL_100_MS: number = 100;
  public static readonly I_FRAME_INTERVAL_1_S: number = 1000;
  public static readonly I_FRAME_INTERVAL_2_S: number = 2000;
  public static readonly AUDIO_SAMPLE_RATE_44100: number = 44100;
  public static readonly AUDIO_SAMPLE_RATE_48000: number = 48000;
  public static readonly AUDIO_CHANNEL_COUNT_MONO: number = 1;
  public static readonly AUDIO_CHANNEL_COUNT_STEREO: number = 2;
  public static readonly AUDIO_BITRATE_32K: number = 32000;
  public static readonly AUDIO_BITRATE_64K: number = 64000;
  public static readonly AUDIO_BITRATE_128K: number = 128000;
  public static readonly AUDIO_CAPTURE_LATENCY_NORMAL: number = 0;
  public static readonly AUDIO_CAPTURE_LATENCY_LOW: number = 1;
  public static readonly VIDEO_STABILIZATION_DISABLED: number = 0;
  public static readonly VIDEO_STABILIZATION_AUTO: number = 1;
  /**
   * 30 FPS.
   */
  public static readonly FRAMERATE_VIDEO_30FPS: number = 30;
  /**
   * 60 FPS.
   */
  public static readonly FRAMERATE_VIDEO_60FPS: number = 60;
  /**
   * Row space.
   */
  public static readonly ROW_SPACE: number = 10;
  /**
   * Default picker item height.
   */
  public static readonly DEFAULT_PICKER_ITEM_HEIGHT: number = 30;
  /**
   * Selected text style font size.
   */
  public static readonly SELECTED_TEXT_STYLE_FONT_SIZE: number = 9;
  /**
   * The number corresponding to true.
   */
  public static readonly TRUE: number = 1;
  /**
   * The number corresponding to false.
   */
  public static readonly FALSE: number = 0;
  /**
   * 4K video width.
   */
  public static readonly VIDEO_WIDTH_4K: number = 3840;
  /**
   * 1080P video width.
   */
  public static readonly VIDEO_WIDTH_1080P: number = 1920;
  /**
   * 720P video width.
   */
  public static readonly VIDEO_WIDTH_720P: number = 1280;
  /**
   * 4K video height.
   */
  public static readonly VIDEO_HEIGHT_4K: number = 2160;
  /**
   * 1080P video height.
   */
  public static readonly VIDEO_HEIGHT_1080P: number = 1080;
  /**
   * 720P video height.
   */
  public static readonly VIDEO_HEIGHT_720P: number = 720;
  /**
   * Album, photo, video, and camera switch icons size.
   */
  public static readonly ICON_SIZE: number = 200;
  /**
   * Bottom position.
   */
  public static readonly BOTTOM_POSITION: number = 0.8;
  /**
   * PX.
   */
  public static readonly PX: string = 'px';
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
}
