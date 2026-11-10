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
 * Profile 会话：把「创建实例 → 查询设备 → 查询连接状态 → 订阅/取消订阅 → 释放」这一串
 * 官方文档只给了接口、没给调用顺序的操作串成一个对象，页面只用拿快照渲染。
 *
 * 约定：本类的所有对外方法都不抛异常，蓝牙接口抛出的 BusinessError 会被折算成
 * ProbeStatus + 错误码写进快照，因此页面无需再写 try/catch。
 *
 * 依赖的是 ProfileLike 而不是 baseProfile.BaseProfile：两者方法签名一致，
 * 生产代码传 hfp.createHfpAgProfile() 的返回值，用例传可控桩实例，代码路径完全相同。
 */

import { ProfileKind } from '../model/ProfileCatalog';
import { ProfileSnapshot } from '../model/ProfileSnapshot';
import { text } from '../common/StringResource';
import {
  ERROR_CODE_INVALID_PARAM,
  ProbeStatus,
  classifyErrorCode
} from '../model/ProfileState';
import { isValidDeviceId, maskDeviceId } from '../model/DeviceAddress';
import { LogLevel } from '../model/LogStore';
import { Logger } from './Logger';
import { codeOfThrown, describeThrown, messageOfThrown } from './ErrorUtil';
import { createFunctionNameOf } from './ProfileFactory';
import { ProfileFactory, ProfileLike } from './ProfileLike';
import { StateChangeParam } from './ProfileLike';

export class ProfileSession {
  private readonly factory: ProfileFactory;
  private readonly source: string;
  private readonly onChanged: ((snapshot: ProfileSnapshot) => void) | null;
  private profile: ProfileLike | null = null;
  private listener: ((param: StateChangeParam) => void) | null = null;
  private snapshot: ProfileSnapshot;

  constructor(factory: ProfileFactory, source: string,
              onChanged: ((snapshot: ProfileSnapshot) => void) | null = null) {
    this.factory = factory;
    this.source = source;
    this.onChanged = onChanged;
    this.snapshot = new ProfileSnapshot(ProfileKind.HFP, {});
  }

  getSnapshot(): ProfileSnapshot {
    return this.snapshot;
  }

  isCreated(): boolean {
    return this.profile !== null;
  }

  isSubscribed(): boolean {
    return this.listener !== null;
  }

  /** 创建实例：对应文档中的 hfp.createHfpAgProfile() */
  ensureProfile(): ProfileSnapshot {
    if (this.profile !== null) {
      return this.snapshot;
    }
    const action = createFunctionNameOf();
    try {
      this.profile = this.factory();
      return this.update(ProbeStatus.READY, 0, text('session_profile_created', action), LogLevel.INFO);
    } catch (err) {
      const code = codeOfThrown(err);
      const detail = describeThrown(action, code, messageOfThrown(err));
      return this.update(classifyErrorCode(code), code, detail, LogLevel.ERROR);
    }
  }

  /** 查询已连接设备：对应 BaseProfile.getConnectedDevices() */
  refreshDevices(): ProfileSnapshot {
    const profile = this.profile;
    if (profile === null) {
      return this.ensureProfile();
    }
    try {
      const devices: string[] = profile.getConnectedDevices();
      const status = devices.length > 0 ? ProbeStatus.READY : ProbeStatus.NO_DEVICE;
      this.snapshot = this.snapshot.withDevices(devices).withStatus(
        status, 0, text('session_devices_count', devices.length));
      Logger.info(this.source, 'getConnectedDevices', `count=${devices.length}`);
      this.notify();
      return this.snapshot;
    } catch (err) {
      const code = codeOfThrown(err);
      return this.update(classifyErrorCode(code), code,
        describeThrown('getConnectedDevices', code, messageOfThrown(err)), LogLevel.ERROR);
    }
  }

  /** 查询指定设备的连接状态：对应 BaseProfile.getConnectionState(deviceId) */
  refreshState(deviceId: string): ProfileSnapshot {
    const profile = this.profile;
    if (profile === null) {
      return this.ensureProfile();
    }
    if (!isValidDeviceId(deviceId)) {
      // 回填到界面的设备标识同样只给脱敏形式
      return this.update(ProbeStatus.FAILED, ERROR_CODE_INVALID_PARAM,
        text('session_invalid_device',
          deviceId.length > 0 ? maskDeviceId(deviceId) : text('session_empty_device')), LogLevel.WARN);
    }
    try {
      const state: number = profile.getConnectionState(deviceId);
      this.snapshot = this.snapshot.withConnection(deviceId, state);
      Logger.info(this.source, 'getConnectionState', `device=${maskDeviceId(deviceId)}, state=${state}`);
      this.notify();
      return this.snapshot;
    } catch (err) {
      const code = codeOfThrown(err);
      return this.update(classifyErrorCode(code), code,
        describeThrown('getConnectionState', code, messageOfThrown(err)), LogLevel.ERROR);
    }
  }

  /** 订阅连接状态变化：对应 BaseProfile.on('connectionStateChange', callback) */
  subscribe(): ProfileSnapshot {
    const profile = this.profile;
    if (profile === null) {
      return this.ensureProfile();
    }
    if (this.listener !== null) {
      return this.snapshot;
    }
    const listener = (param: StateChangeParam): void => {
      this.handleStateChange(param);
    };
    try {
      profile.on('connectionStateChange', listener);
      this.listener = listener;
      this.snapshot = this.snapshot.withSubscription(true);
      Logger.info(this.source, 'on', 'subscribed connectionStateChange');
      this.notify();
      return this.snapshot;
    } catch (err) {
      const code = codeOfThrown(err);
      return this.update(classifyErrorCode(code), code,
        describeThrown(text('session_subscribe_action'), code, messageOfThrown(err)), LogLevel.ERROR);
    }
  }

  /** 取消订阅：对应 BaseProfile.off('connectionStateChange', callback) */
  unsubscribe(): ProfileSnapshot {
    const profile = this.profile;
    const listener = this.listener;
    if (profile === null || listener === null) {
      return this.snapshot;
    }
    try {
      profile.off('connectionStateChange', listener);
      this.listener = null;
      this.snapshot = this.snapshot.withSubscription(false);
      Logger.info(this.source, 'off', 'unsubscribed connectionStateChange');
      this.notify();
      return this.snapshot;
    } catch (err) {
      const code = codeOfThrown(err);
      return this.update(classifyErrorCode(code), code,
        describeThrown(text('session_unsubscribe_action'), code, messageOfThrown(err)), LogLevel.ERROR);
    }
  }

  /** 页面退出时释放：先取消订阅，再丢弃实例引用，避免回调打到已销毁的页面 */
  release(): void {
    const profile = this.profile;
    const listener = this.listener;
    if (profile !== null && listener !== null) {
      try {
        profile.off('connectionStateChange', listener);
      } catch (err) {
        Logger.warn(this.source, 'off', `unsubscribe on release failed, detail=${messageOfThrown(err)}`);
      }
    }
    this.listener = null;
    this.profile = null;
    this.snapshot = this.snapshot.withSubscription(false)
      .withStatus(ProbeStatus.IDLE, 0, text('session_released'));
    Logger.info(this.source, 'release', 'profile instance released');
    this.notify();
  }

  /** 订阅回调的实际处理：更新当前设备与连接状态，并刷新一次设备列表 */
  handleStateChange(param: StateChangeParam): ProfileSnapshot {
    const state: number = param.state;
    this.snapshot = this.snapshot.withConnection(param.deviceId, state);
    Logger.info(this.source, 'connectionStateChange',
      `device=${maskDeviceId(param.deviceId)}, state=${state}, cause=${param.cause}`);
    this.notify();
    return this.snapshot;
  }

  /** 已订阅时把回调转交给会话，未订阅时什么也不做，供用例模拟系统回调 */
  dispatchParam(param: StateChangeParam): ProfileSnapshot {
    if (this.listener === null) {
      return this.snapshot;
    }
    this.listener(param);
    return this.snapshot;
  }

  private update(status: ProbeStatus, code: number, message: string, level: LogLevel): ProfileSnapshot {
    this.snapshot = this.snapshot.withStatus(status, code, message);
    Logger.record(level, this.source, 'state', `status=${status}, code=${code}`);
    this.notify();
    return this.snapshot;
  }

  private notify(): void {
    if (this.onChanged !== null) {
      this.onChanged(this.snapshot);
    }
  }
}
