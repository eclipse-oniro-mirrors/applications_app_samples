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
 * 会话测试用的桩 Profile 与桩工厂。
 *
 * ProfileSession 依赖 ProfileLike 接口而不是 SDK 的类，因此用例可以注入这里的桩实例，
 * 让「有设备 / 无设备 / 查询抛错 / 订阅抛错 / 取消订阅抛错」这些分支在真机上同样能稳定跑到，
 * 不必依赖设备当场是否接着耳机。桩只复现方法调用与返回值，不复制会话自身的任何判断逻辑。
 */

import { ProfileFactory, ProfileLike, StateChangeParam } from '../../../../main/ets/utils/ProfileLike';

/** 模拟系统抛出的 BusinessError：保留数值 code 与英文 message，与真实异常同形状 */
export class StubError extends Error {
  public code: number;

  constructor(code: number, message: string) {
    super(message);
    this.name = 'BusinessError';
    this.code = code;
  }
}

/** 可控的 Profile 桩：记录调用次数，按字段决定返回值或抛出的错误码 */
export class ProfileStub implements ProfileLike {
  public devices: string[] = [];
  public state: number = 0;
  public devicesError: number = 0;
  public stateError: number = 0;
  public onError: number = 0;
  public offError: number = 0;
  public onCalls: number = 0;
  public offCalls: number = 0;
  public deviceCalls: number = 0;
  public stateCalls: number = 0;
  public lastDeviceId: string = '';
  private listener: ((param: StateChangeParam) => void) | null = null;

  constructor(devices: string[] = [], state: number = 0) {
    this.devices = devices.slice();
    this.state = state;
  }

  getConnectedDevices(): string[] {
    this.deviceCalls++;
    if (this.devicesError > 0) {
      throw new StubError(this.devicesError, `stub getConnectedDevices failed ${this.devicesError}`);
    }
    return this.devices.slice();
  }

  getConnectionState(deviceId: string): number {
    this.stateCalls++;
    this.lastDeviceId = deviceId;
    if (this.stateError > 0) {
      throw new StubError(this.stateError, `stub getConnectionState failed ${this.stateError}`);
    }
    return this.state;
  }

  on(type: 'connectionStateChange', callback: (param: StateChangeParam) => void): void {
    this.onCalls++;
    if (this.onError > 0) {
      throw new StubError(this.onError, `stub on failed ${this.onError}`);
    }
    if (type === 'connectionStateChange') {
      this.listener = callback;
    }
  }

  off(type: 'connectionStateChange', callback?: (param: StateChangeParam) => void): void {
    this.offCalls++;
    if (this.offError > 0) {
      throw new StubError(this.offError, `stub off failed ${this.offError}`);
    }
    if (type === 'connectionStateChange' && callback !== undefined) {
      this.listener = null;
    }
  }

  /** 模拟系统主动回调，只有订阅过的桩才会转发 */
  emit(param: StateChangeParam): boolean {
    if (this.listener === null) {
      return false;
    }
    this.listener(param);
    return true;
  }

  hasListener(): boolean {
    return this.listener !== null;
  }
}

/** 固定返回同一个桩实例的工厂 */
export function stubFactoryOf(stub: ProfileStub): ProfileFactory {
  return () => stub;
}

/** 每次调用都新建一个桩实例的工厂，用来验证会话只创建一次 */
export function countingFactoryOf(stubs: ProfileStub[]): ProfileFactory {
  return () => {
    const stub = new ProfileStub();
    stubs.push(stub);
    return stub;
  };
}

/** 抛错的工厂：模拟 createHfpAgProfile() 本身失败 */
export function throwingFactoryOf(code: number): ProfileFactory {
  return () => {
    throw new StubError(code, `stub create failed ${code}`);
  };
}

/** 构造一个连接状态变化回调入参 */
export function stateParam(deviceId: string, state: number, cause: number): StateChangeParam {
  const param: StateChangeParam = {
    deviceId: deviceId,
    state: state,
    cause: cause
  };
  return param;
}
