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
 * ProfileSession 依赖的最小能力集合。
 *
 * 为什么不直接用 baseProfile.BaseProfile：官方类型是类而不是接口，用例里没法按结构造桩，
 * 于是「查询设备」「查询连接状态」「订阅」「取消订阅」这四条分支在设备侧用例里只能碰到
 * 真机当前那一两条真实走向。这里把会话真正用到的方法抽成一个接口，
 * hfp.createHfpAgProfile() 的返回值按结构天然满足它（方法签名与 BaseProfile 完全一致），
 * 于是生产代码不需要任何类型转换，用例又能注入可控桩实例覆盖全部分支。
 */

import { baseProfile } from '@kit.ConnectivityKit';

/** 连接状态变化回调的入参，与 BaseProfile 的 'connectionStateChange' 回调一致 */
export type StateChangeParam = baseProfile.StateChangeParam;

export interface ProfileLike {
  /** 对应 BaseProfile.getConnectedDevices() */
  getConnectedDevices(): string[];

  /** 对应 BaseProfile.getConnectionState(deviceId) */
  getConnectionState(deviceId: string): number;

  /** 对应 BaseProfile.on('connectionStateChange', callback) */
  on(type: 'connectionStateChange', callback: (param: StateChangeParam) => void): void;

  /** 对应 BaseProfile.off('connectionStateChange', callback?) */
  off(type: 'connectionStateChange', callback?: (param: StateChangeParam) => void): void;
}

/** 会话创建实例的工厂签名：延迟创建，页面点「创建实例」时才真正调用 create 函数 */
export type ProfileFactory = () => ProfileLike;
