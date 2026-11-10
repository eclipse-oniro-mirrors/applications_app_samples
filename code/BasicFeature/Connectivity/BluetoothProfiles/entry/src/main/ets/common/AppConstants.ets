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
 * 工程级常量：AppStorage 键名、路由 key、日志容量、hilog 参数与蓝牙权限名。
 * 这些字面量同时被页面、组件、纯逻辑与测试引用，改动会影响多处，故集中在此处锁定。
 */

import { text } from './StringResource';

export class StorageKeys {
  static readonly APP_LOGS: string = 'appLogs';
  static readonly LAYOUT_PROFILE: string = 'layoutProfile';
  static readonly BLUETOOTH_STATE: string = 'bluetoothState';
}

export enum RouteKey {
  HFP = 'hfp'
}

export function isRouteKey(value: string): boolean {
  return value === RouteKey.HFP;
}

/**
 * 首页标题与副标题：模块级常量在资源管理器绑定前就已求值，不能缓存解析结果，
 * 因此只暴露函数，调用时再经 StringResource 取真实文案。
 */
export function defaultNavTitle(): string {
  return text('app_title');
}

export function appSubtitle(): string {
  return text('app_subtitle');
}

/** 演示面收敛后只保留 HFP 一个 Profile */
export const PROFILE_COUNT: number = 1;

export const LOG_STORE_CAPACITY: number = 200;
export const PAGE_LOG_LIMIT: number = 20;
export const HOME_LOG_LIMIT: number = 30;

/** hilog domain：0xF811 为 Sample 仓库统一段，便于 `hdc shell hilog -T BluetoothProfiles` 过滤 */
export const HILOG_DOMAIN: number = 0xF811;
export const HILOG_TAG: string = 'BluetoothProfiles';

/** Profile 接口统一要求的用户授权权限，运行时需通过 abilityAccessCtrl 申请 */
export const BLUETOOTH_PERMISSION: string = 'ohos.permission.ACCESS_BLUETOOTH';
