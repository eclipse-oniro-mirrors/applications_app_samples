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
 * 工程级常量：AppStorage 键名、路由 key、日志容量、hilog 参数与三个接口所需权限名。
 * 这些字面量同时被页面、组件、纯逻辑与测试引用，改动会影响多处，故集中在此处锁定。
 */

import { text } from './StringResource';

export class StorageKeys {
  public static readonly APP_LOGS: string = 'appLogs';
}

export enum RouteKey {
  EXTENSION = 'extension',
  LINK = 'link',
  CHANNEL = 'channel'
}

export function isRouteKey(value: string): boolean {
  return value === RouteKey.EXTENSION || value === RouteKey.LINK || value === RouteKey.CHANNEL;
}

/**
 * 首页标题与副标题。模块级常量在 import 求值时就已经定型，那时 ResourceManager 还没绑定，
 * 所以常量本身只存资源名，展示与断言统一走 defaultNavTitle() / appSubtitle() 在运行时解析。
 */
export const DEFAULT_NAV_TITLE: string = 'app_title';
export const APP_SUBTITLE: string = 'app_subtitle';

export function defaultNavTitle(): string {
  return text(DEFAULT_NAV_TITLE);
}

export function appSubtitle(): string {
  return text(APP_SUBTITLE);
}

/** 目录固定三项：分布式扩展、链路增强、代理通道 */
export const FEATURE_COUNT: number = 3;

export const LOG_STORE_CAPACITY: number = 200;
export const PAGE_LOG_LIMIT: number = 20;
export const HOME_LOG_LIMIT: number = 30;

/** hilog domain：0xF811 为 Sample 仓库统一段，便于 `hdc shell hilog -T DistributedExtension` 过滤 */
export const HILOG_DOMAIN: number = 0xF811;
export const HILOG_TAG: string = 'DistributedExtension';

/** linkEnhance 的 Server / Connection 方法统一要求的用户授权权限 */
export const DATASYNC_PERMISSION: string = 'ohos.permission.DISTRIBUTED_DATASYNC';

/** proxyChannelManager 的通道方法统一要求的用户授权权限 */
export const BLUETOOTH_PERMISSION: string = 'ohos.permission.ACCESS_BLUETOOTH';

/** 示例里默认使用的服务名与对端参数：serve 端与会话端必须用同一个 name 才能互通 */
export const DEFAULT_SERVER_NAME: string = 'sample_link_server';
export const DEFAULT_CONNECTION_NAME: string = 'sample_link_server';

/** 代理通道只支持 BR（经典蓝牙），对端参数由 MAC 地址 + 服务 UUID 指定 */
export const DEFAULT_PEER_ADDRESS: string = '12:34:56:78:9A:BC';
export const DEFAULT_PEER_UUID: string = '0000A002-0000-1000-8000-00805F9B34FB';

/** linkEnhance.Connection.sendData 的单次上限（d.ts：maximum length is 1024 bytes） */
export const LINK_PAYLOAD_LIMIT: number = 1024;

/** proxyChannelManager.sendData 的单次上限（d.ts：maximum length is 4096 bytes） */
export const CHANNEL_API_PAYLOAD_LIMIT: number = 4096;

/** 演示输入框的软上限：远小于接口上限，方便一眼看清字节数 */
export const CHANNEL_PAYLOAD_LIMIT: number = 256;

/** 代理通道页「发现附近设备」最多保留的候选数：经典蓝牙发现结果通常是一屏，演练只需近处几台 */
export const BT_PEER_LIMIT: number = 8;

/** distributed 扩展在 bundleManager.ExtensionAbilityType 里的取值 */
export const EXTENSION_TYPE_DISTRIBUTED: number = 28;

/** 能力位：linkEnhance / proxyChannelManager / DistributedExtensionAbility 共用同一个 syscap */
export const APP_COLLABORATION_SYSCAP: string = 'SystemCapability.DistributedSched.AppCollaboration';
