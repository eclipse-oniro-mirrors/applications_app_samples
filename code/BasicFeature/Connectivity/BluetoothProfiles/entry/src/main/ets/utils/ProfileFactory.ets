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
 * HFP（AG 角色）的创建入口，对应官方文档里缺失的「如何真正 new 出一个 Profile 实例」。
 *
 * @ohos.bluetooth.hfp 只导出 createHfpAgProfile，返回值继承自 baseProfile.BaseProfile，
 * 后续的 getConnectedDevices / getConnectionState / on('connectionStateChange') 完全一致。
 * 因此示例把「创建」单独收敛到这里，业务侧只面向 ProfileLike 编程。
 *
 * 早期版本这里还并列提供过 PAN（createPanProfile）、MAP（createMapMseProfile）
 * 与 HFP 的 HF 角色（createHfpHfProfile）三个入口，真机上都拿不到可用链路，已随演示页一并删除。
 */

import { hfp } from '@kit.ConnectivityKit';
import { ProfileFactory, ProfileLike } from './ProfileLike';

/** HFP：以 AG（音频网关）角色创建实例，对端为耳机/车机等免提设备 */
export function createHfpProfile(): hfp.HandsFreeAudioGatewayProfile {
  return hfp.createHfpAgProfile();
}

/** 供 ProfileSession 延迟创建的工厂：实例在页面触发「创建实例」时才真正产生 */
export function profileFactoryOf(): ProfileFactory {
  return () => createHfpProfile();
}

/** 文档中的 create 函数名，创建失败时用它在日志里标明是哪个入口出错 */
export function createFunctionNameOf(): string {
  return 'hfp.createHfpAgProfile';
}

/**
 * 判断一个对象是否具备会话需要的最少方法。用例用它校验桩实例与真实实例的形状一致，
 * 页面不需要调用。
 */
export function isProfileLike(value: ProfileLike | null): boolean {
  if (value === null) {
    return false;
  }
  return typeof value.getConnectedDevices === 'function' &&
    typeof value.getConnectionState === 'function' &&
    typeof value.on === 'function' &&
    typeof value.off === 'function';
}
