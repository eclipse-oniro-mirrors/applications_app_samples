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

/**
 * 编解码器概要信息，与native侧CodecBriefInfo对应。
 */
export interface CodecBrief {
  name: string;
  mime: string;
  isHardware: boolean;
  isSecure: boolean;
  maxInstances: number;
}

/**
 * 场景化示例条目。
 */
export interface ScenarioItem {
  id: number;
  name: Resource;
}

/**
 * 场景化示例分组。
 */
export interface ScenarioGroup {
  title: Resource;
  items: ScenarioItem[];
}

/**
 * 编解码器类别定义，与native侧CodecCategory对应。
 */
export class CodecCategoryConstants {
  public static readonly VIDEO_DECODER: number = 0;
  public static readonly VIDEO_ENCODER: number = 1;
  public static readonly AUDIO_DECODER: number = 2;
  public static readonly AUDIO_ENCODER: number = 3;
  public static readonly CATEGORY_NAMES: Resource[] = [
    $r('app.string.category_video_decoder'),
    $r('app.string.category_video_encoder'),
    $r('app.string.category_audio_decoder'),
    $r('app.string.category_audio_encoder')
  ];
}

/**
 * 场景化示例分组数据，与开发指南《获取支持的编解码能力》的场景一一对应。
 */
export const SCENARIO_GROUPS: ScenarioGroup[] = [
  {
    title: $r('app.string.group_obtain_capability_instance'),
    items: [
      { id: 0, name: $r('app.string.item_obtain_capability_way1') },
      { id: 1, name: $r('app.string.item_obtain_capability_way2') },
      { id: 2, name: $r('app.string.item_obtain_capability_way3') }
    ]
  },
  {
    title: $r('app.string.group_create_codec_by_name'),
    items: [
      { id: 3, name: $r('app.string.item_create_h264_sw_decoder') }
    ]
  },
  {
    title: $r('app.string.group_configure_by_hw_sw'),
    items: [
      { id: 4, name: $r('app.string.item_diff_config_frame_rate') }
    ]
  },
  {
    title: $r('app.string.group_create_multiple_codecs'),
    items: [
      { id: 5, name: $r('app.string.item_create_multi_hw_decoder') }
    ]
  },
  {
    title: $r('app.string.group_control_encoding_quality'),
    items: [
      { id: 6, name: $r('app.string.item_cbr_vbr_mode') },
      { id: 7, name: $r('app.string.item_cq_mode') },
      { id: 8, name: $r('app.string.item_sqr_mode') },
      { id: 9, name: $r('app.string.item_cbrhq_mode') }
    ]
  },
  {
    title: $r('app.string.group_query_complexity_range'),
    items: [
      { id: 10, name: $r('app.string.item_complexity_range') }
    ]
  },
  {
    title: $r('app.string.group_set_audio_params'),
    items: [
      { id: 11, name: $r('app.string.item_sample_rate_channels_bitrate') }
    ]
  },
  {
    title: $r('app.string.group_query_profile_level'),
    items: [
      { id: 12, name: $r('app.string.item_query_supported_levels') },
      { id: 13, name: $r('app.string.item_validate_profile_level') }
    ]
  },
  {
    title: $r('app.string.group_set_video_resolution'),
    items: [
      { id: 14, name: $r('app.string.item_validate_resolution_combo') },
      { id: 15, name: $r('app.string.item_query_height_by_width') },
      { id: 16, name: $r('app.string.item_query_width_by_height') }
    ]
  },
  {
    title: $r('app.string.group_set_video_frame_rate'),
    items: [
      { id: 17, name: $r('app.string.item_validate_frame_rate') },
      { id: 18, name: $r('app.string.item_select_frame_rate_by_size') }
    ]
  },
  {
    title: $r('app.string.group_set_video_pixel_format'),
    items: [
      { id: 19, name: $r('app.string.item_query_pixel_formats') }
    ]
  },
  {
    title: $r('app.string.group_query_feature_support'),
    items: [
      { id: 20, name: $r('app.string.item_long_term_ref_frame') }
    ]
  },
  {
    title: $r('app.string.group_filter_secure_decoder'),
    items: [
      { id: 21, name: $r('app.string.item_filter_h264_secure_decoder') }
    ]
  },
  {
    title: $r('app.string.group_video_encoding_low_latency'),
    items: [
      { id: 22, name: $r('app.string.item_video_call_cbr_1080p_30fps') },
      { id: 23, name: $r('app.string.item_request_idr_dynamically') },
      { id: 24, name: $r('app.string.item_cbrhq_config') }
    ]
  },
  {
    title: $r('app.string.group_video_encoding_live_streaming'),
    items: [
      { id: 25, name: $r('app.string.item_live_vbr_1080p_25fps') },
      { id: 26, name: $r('app.string.item_live_sqr_config') }
    ]
  },
  {
    title: $r('app.string.group_video_encoding_offline'),
    items: [
      { id: 27, name: $r('app.string.item_video_share_vbr_1080p_30fps') },
      { id: 28, name: $r('app.string.item_video_share_sqr_config') }
    ]
  },
  {
    title: $r('app.string.group_b_frame_encoding'),
    items: [
      { id: 29, name: $r('app.string.item_b_frame_support') },
      { id: 30, name: $r('app.string.item_enable_b_frame') }
    ]
  },
  {
    title: $r('app.string.group_temporal_scalability_global'),
    items: [
      { id: 31, name: $r('app.string.item_temporal_scalability_support') },
      { id: 32, name: $r('app.string.item_create_hw_encoder') },
      { id: 33, name: $r('app.string.item_config_temporal_params') },
      { id: 34, name: $r('app.string.item_enable_temporal_scalability_dynamically') },
      { id: 35, name: $r('app.string.item_disable_temporal_scalability_dynamically') }
    ]
  },
  {
    title: $r('app.string.group_temporal_scalability_ltr'),
    items: [
      { id: 36, name: $r('app.string.item_ltr_support_and_count') },
      { id: 37, name: $r('app.string.item_config_max_ltr_count') },
      { id: 38, name: $r('app.string.item_ltr_callback_buffer_mode') },
      { id: 39, name: $r('app.string.item_ltr_callback_surface_input_mode') }
    ]
  }
];
