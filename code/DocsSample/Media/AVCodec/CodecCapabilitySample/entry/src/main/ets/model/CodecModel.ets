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
  name: string;
}

/**
 * 场景化示例分组。
 */
export interface ScenarioGroup {
  title: string;
  items: ScenarioItem[];
}

/**
 * 编解码器类别定义，与native侧CodecCategory对应。
 */
export class CodecCategoryConstants {
  static readonly VIDEO_DECODER: number = 0;
  static readonly VIDEO_ENCODER: number = 1;
  static readonly AUDIO_DECODER: number = 2;
  static readonly AUDIO_ENCODER: number = 3;
  static readonly CATEGORY_NAMES: string[] = ['视频解码器', '视频编码器', '音频解码器', '音频编码器'];
}

/**
 * 场景化示例分组数据，与开发指南《获取支持的编解码能力》的场景一一对应。
 */
export const SCENARIO_GROUPS: ScenarioGroup[] = [
  {
    title: '通用开发指导：获得能力实例',
    items: [
      { id: 0, name: '方式一：OH_AVCodec_GetCapability' },
      { id: 1, name: '方式二：OH_AVCodec_GetCapabilityByCategory' },
      { id: 2, name: '方式三：OH_AVCodec_GetCapabilityList' }
    ]
  },
  {
    title: '创建指定名称的编解码器',
    items: [
      { id: 3, name: '通过名称创建H.264软件解码器' }
    ]
  },
  {
    title: '针对软硬件类别差异化配置编解码器参数',
    items: [
      { id: 4, name: '基于软硬件类别差异化配置帧率' }
    ]
  },
  {
    title: '创建多路编解码器',
    items: [
      { id: 5, name: '硬件优先创建多路解码器' }
    ]
  },
  {
    title: '控制编码质量',
    items: [
      { id: 6, name: 'CBR/VBR码控模式' },
      { id: 7, name: 'CQ码控模式' },
      { id: 8, name: 'SQR码控模式' },
      { id: 9, name: 'CBRHQ码控模式' }
    ]
  },
  {
    title: '查询编码器支持复杂度范围',
    items: [
      { id: 10, name: '复杂度等级范围查询' }
    ]
  },
  {
    title: '设置正确的音频编解码参数',
    items: [
      { id: 11, name: '采样率/通道数/码率校验' }
    ]
  },
  {
    title: '查询编解码档次和级别支持情况',
    items: [
      { id: 12, name: '查询档次支持的级别' },
      { id: 13, name: '直接校验档次和级别组合' }
    ]
  },
  {
    title: '设置正确的视频宽高',
    items: [
      { id: 14, name: '校验视频宽高组合' },
      { id: 15, name: '已知视频宽度查询高度范围' },
      { id: 16, name: '已知视频高度查询宽度范围' }
    ]
  },
  {
    title: '设置正确的视频帧率',
    items: [
      { id: 17, name: '校验帧率是否在可选范围内' },
      { id: 18, name: '按尺寸选择合适的帧率配置' }
    ]
  },
  {
    title: '设置正确的视频像素格式信息',
    items: [
      { id: 19, name: '查询支持的像素格式' }
    ]
  },
  {
    title: '查询编解码特性支持情况',
    items: [
      { id: 20, name: '长期参考帧特性查询' }
    ]
  },
  {
    title: '筛选特定MIME类型的安全解码器（DRM播放场景）',
    items: [
      { id: 21, name: '筛选H.264安全解码器' }
    ]
  },
  {
    title: '各类场景的视频编码基础参数配置：低时延场景',
    items: [
      { id: 22, name: '视频通话CBR 1080p@30fps配置' },
      { id: 23, name: '运行中动态请求IDR帧' },
      { id: 24, name: 'CBRHQ码控配置' }
    ]
  },
  {
    title: '各类场景的视频编码基础参数配置：实时流媒体编码',
    items: [
      { id: 25, name: '直播VBR 1080p@25fps配置' },
      { id: 26, name: '直播SQR码控配置' }
    ]
  },
  {
    title: '各类场景的视频编码基础参数配置：离线编码场景',
    items: [
      { id: 27, name: '视频分享VBR 1080p@30fps配置' },
      { id: 28, name: '视频分享SQR码控配置' }
    ]
  },
  {
    title: '高压缩率B帧编码',
    items: [
      { id: 29, name: 'B帧特性校验' },
      { id: 30, name: '配置使能B帧' }
    ]
  },
  {
    title: '时域可分层编码：全局时域可分层特性',
    items: [
      { id: 31, name: '特性支持校验' },
      { id: 32, name: '创建硬件编码器实例' },
      { id: 33, name: '配置时域分层参数' },
      { id: 34, name: '动态开启时域可分层' },
      { id: 35, name: '动态关闭时域可分层' }
    ]
  },
  {
    title: '时域可分层编码：长期参考帧特性',
    items: [
      { id: 36, name: 'LTR特性与数目校验' },
      { id: 37, name: '配置最大LTR数目' }
    ]
  }
];
