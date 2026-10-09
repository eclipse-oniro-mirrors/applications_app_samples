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
   * 占满父容器的尺寸。
   */
  public static readonly FULL_SIZE: string = '100%';
  /**
   * 默认宽度。
   */
  public static readonly DEFAULT_WIDTH: number = 1920;
  /**
   * 默认高度。
   */
  public static readonly DEFAULT_HEIGHT: number = 1080;
  /**
   * 按钮宽度。
   */
  public static readonly BUTTON_WIDTH: number = 100;
  /**
   * 默认提示时长，单位为毫秒。
   */
  public static readonly DURATION: number = 2000;
  /**
   * Toast 距屏幕底部的距离。
   */
  public static readonly BOTTOM: number = 200;
  /**
   * 图片宽度。
   */
  public static readonly IMAGE_WIDTH: number = 50;
  /**
   * 图片高度。
   */
  public static readonly IMAGE_HEIGHT: number = 50;
  /**
   * 录像可选的视频编码类型。
   */
  public static readonly VIDEO_MIMETYPE: string[] = ['HDRVivid', 'H264', 'H265'];
  /**
   * 录像可选的输出封装格式。
   */
  public static readonly OUTPUT_FORMAT: string[] = ['MP4', 'FLV'];
  /**
   * 与 C API OH_AVOutputFormat 对应的输出格式枚举值。
   */
  public static readonly FORMAT_MP4: number = 2;
  public static readonly FORMAT_FLV: number = 14;
  /**
   * 录像可选的视频分辨率。
   */
  public static readonly VIDEO_RESOLUTION: string[] = ['4K', '1080P', '720P'];
  /**
   * 录像可选的视频帧率。
   */
  public static readonly VIDEO_FRAMERATE: string[] = ['30Fps', '60Fps'];
  /**
   * 录像可选的视频编码码率预设。
   */
  public static readonly VIDEO_BITRATE: string[] = ['10Mbps', '20Mbps', '30Mbps'];
  /**
   * 视频编码器的码率控制模式。
   */
  public static readonly VIDEO_BITRATE_MODE: string[] = ['CBR', 'VBR'];
  /**
   * 视频编码器关键帧间隔，单位为毫秒。
   */
  public static readonly VIDEO_I_FRAME_INTERVAL: string[] = ['100ms', '1s', '2s'];
  /** 录音参数预设。 */
  public static readonly AUDIO_SAMPLE_RATE: string[] = ['44100Hz', '48000Hz'];
  public static readonly AUDIO_CHANNEL_COUNT: string[] = ['Mono', 'Stereo'];
  public static readonly AUDIO_BITRATE: string[] = ['32kbps', '64kbps', '128kbps'];
  public static readonly AUDIO_CAPTURE_LATENCY_MODE: string[] = ['NormalLatency', 'LowLatency'];
  public static readonly VIDEO_STABILIZATION_MODE: string[] = ['Disabled', 'Auto'];
  /**
   * 视频解码器类型：自动、硬件或软件。
   */
  public static readonly VIDEO_DECODE_TYPE: string[] = ['Auto', 'Hardware', 'Software'];
  /**
   * 视频解码器送显模式。
   */
  /** 传递给 Native 播放器的内部模式值。 */
  public static readonly VIDEO_DECODER_RUN_MODE: string[] = ['SurfaceMode', 'BufferMode', 'OpenGLMode', 'VulkanMode'];
  public static readonly VIDEO_DECODER_RUN_MODE_DIRECT_OUTPUT: number = 0;
  public static readonly VIDEO_DECODER_RUN_MODE_OPENGL: number = 2;
  public static readonly VIDEO_DECODER_RUN_MODE_VULKAN: number = 3;
  /**
   * 视频解码器回调模式。
   */
  public static readonly VIDEO_DECODER_SYNC_MODE: string[] = ['ASYNC', 'SYNC'];
  /**
   * 是否在 Buffer 模式导出解码后的视频帧。
   */
  public static readonly VIDEO_DUMP_MODE: string[] = ['NoDump', 'Dump'];
  public static readonly VIDEO_LAST_FRAME_MODE: string[] = ['RetainLastFrame', 'ClearLastFrame'];
  public static readonly VIDEO_FEATURE_MODE: string[] = ['Disabled', 'Enabled'];
  /**
   * 音频渲染器输出时延模式。
   */
  public static readonly AUDIO_RENDERER_LATENCY_MODE: string[] = ['NormalLatency', 'LowLatency'];
  /**
   * NativeWindow 支持的视频变换类型。
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
   * NativeWindow 变换选项数量。
   */
  public static readonly TRANSFORM_TYPE_COUNT: number = 12;
  /**
   * 播放设置页各选择项的候选值。
   */
  public static readonly PLAYER_INFO: string[][] = [
    CommonConstants.VIDEO_DECODE_TYPE, CommonConstants.VIDEO_DECODER_RUN_MODE,
    CommonConstants.VIDEO_DECODER_SYNC_MODE, CommonConstants.VIDEO_DUMP_MODE
  ];
  /**
   * 录制设置页各选择项的候选值。
   */
  public static readonly RECORDER_INFO: string[][] = [
    CommonConstants.OUTPUT_FORMAT, CommonConstants.VIDEO_MIMETYPE, CommonConstants.VIDEO_RESOLUTION,
    CommonConstants.VIDEO_FRAMERATE, CommonConstants.VIDEO_DECODER_SYNC_MODE, CommonConstants.VIDEO_BITRATE,
    CommonConstants.VIDEO_BITRATE_MODE, CommonConstants.VIDEO_I_FRAME_INTERVAL,
    CommonConstants.AUDIO_SAMPLE_RATE, CommonConstants.AUDIO_CHANNEL_COUNT, CommonConstants.AUDIO_BITRATE,
    CommonConstants.AUDIO_CAPTURE_LATENCY_MODE, CommonConstants.VIDEO_STABILIZATION_MODE
  ];
  /**
   * 播放速度。
   */
  public static readonly PLAYBACK_SPEED: string[] = ['X1', 'X2', 'X3'];
  /**
   * 智能流畅解码的帧保留模式，仅 API 26 及以上版本可用。
   */
  public static readonly FRAME_RETENTION_MODE: string[] = ['FULL(全量直通)', 'ADAPTIVE(感知自适应)', 'UNIFORM(平滑定比)'];
  /**
   * 通用默认数值。
   */
  public static readonly DEFAULT_VALUE: number = 0;
  /**
   * AVC 视频 MIME 类型。
   */
  public static readonly MIME_VIDEO_AVC: string = 'video/avc';
  /**
   * HEVC 视频 MIME 类型。
   */
  public static readonly MIME_VIDEO_HEVC: string = 'video/hevc';
  /**
   * 2 Mbps 视频码率。
   */
  public static readonly BITRATE_VIDEO_2M: number = 2 * 1024 * 1024;
  /**
   * 10 Mbps 视频码率。
   */
  public static readonly BITRATE_VIDEO_10M: number = 10 * 1024 * 1024;
  /**
   * 20 Mbps 视频码率。
   */
  public static readonly BITRATE_VIDEO_20M: number = 20 * 1024 * 1024;
  /**
   * 30 Mbps 视频码率。
   */
  public static readonly BITRATE_VIDEO_30M: number = 30 * 1024 * 1024;
  /**
   * 固定码率模式，对应 OH_BitrateMode::BITRATE_MODE_CBR。
   */
  public static readonly VIDEO_BITRATE_MODE_CBR: number = 0;
  /**
   * 可变码率模式，对应 OH_BitrateMode::BITRATE_MODE_VBR。
   */
  public static readonly VIDEO_BITRATE_MODE_VBR: number = 1;
  /**
   * 关键帧间隔，单位为毫秒。
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
   * 30 fps。
   */
  public static readonly FRAMERATE_VIDEO_30FPS: number = 30;
  /**
   * 60 fps。
   */
  public static readonly FRAMERATE_VIDEO_60FPS: number = 60;
  /**
   * 行间距。
   */
  public static readonly ROW_SPACE: number = 10;
  /**
   * Picker 选项默认高度。
   */
  public static readonly DEFAULT_PICKER_ITEM_HEIGHT: number = 30;
  /**
   * Picker 已选文本字号。
   */
  public static readonly SELECTED_TEXT_STYLE_FONT_SIZE: number = 9;
  /**
   * 布尔值 true 对应的数值。
   */
  public static readonly TRUE: number = 1;
  /**
   * 布尔值 false 对应的数值。
   */
  public static readonly FALSE: number = 0;
  /**
   * 4K 视频宽度。
   */
  public static readonly VIDEO_WIDTH_4K: number = 3840;
  /**
   * 1080P 视频宽度。
   */
  public static readonly VIDEO_WIDTH_1080P: number = 1920;
  /**
   * 720P 视频宽度。
   */
  public static readonly VIDEO_WIDTH_720P: number = 1280;
  /**
   * 4K 视频高度。
   */
  public static readonly VIDEO_HEIGHT_4K: number = 2160;
  /**
   * 1080P 视频高度。
   */
  public static readonly VIDEO_HEIGHT_1080P: number = 1080;
  /**
   * 720P 视频高度。
   */
  public static readonly VIDEO_HEIGHT_720P: number = 720;
  /**
   * 相册、照片、视频和相机切换图标尺寸。
   */
  public static readonly ICON_SIZE: number = 200;
  /**
   * 底部控件相对位置。
   */
  public static readonly BOTTOM_POSITION: number = 0.8;
  /**
   * 像素单位。
   */
  public static readonly PX: string = 'px';
  /**
   * 默认相机输出配置。
   */
  public static readonly DEFAULT_PROFILE: camera.Profile = {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: {
      width: 1920,
      height: 1080
    }
  };
}
