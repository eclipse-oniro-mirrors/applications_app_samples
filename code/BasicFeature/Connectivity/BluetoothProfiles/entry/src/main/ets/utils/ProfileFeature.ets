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
 * HFP 的 AG 角色探测：创建实例 → 用 getConnectedDevices() 验证实例真的可用。
 *
 * 为什么单独放在这里而不是塞进 ProfileSession：会话对外只持有 ProfileLike 并缓存实例，
 * 而这里是一次性探测（建完即丢弃），页面需要一个「创建成功了吗、能查到几台」的即时结论，
 * 不受会话状态影响。
 *
 * 早期版本这里还并列提供过 HFP 的 HF 角色探测：它在示例设备类型上直接返回 801，
 * 拿不到任何真实数据，已随入口一并删除，只保留 AG。
 */

import { ProfileLike } from './ProfileLike';
import { text } from '../common/StringResource';
import { ERROR_CODE_CAPABILITY_UNSUPPORTED, ProbeStatus, classifyErrorCode } from '../model/ProfileState';
import { Logger } from './Logger';
import { codeOfThrown, describeThrown, messageOfThrown } from './ErrorUtil';
import { createFunctionNameOf, profileFactoryOf } from './ProfileFactory';

const SOURCE: string = 'ProfileFeature';

/** 实例创建失败时设备查询根本没发生，用 -1 区别于「查询成功且为 0 台」 */
export const DEVICE_COUNT_UNKNOWN: number = -1;

/** AG 角色探测结果：记录实例是否创建成功，以及创建成功后 getConnectedDevices() 的台数 */
export class HfpAgResult {
  createFunction: string;
  created: boolean;
  deviceCount: number;
  status: ProbeStatus;
  code: number;
  message: string;

  constructor(createFunction: string, created: boolean, deviceCount: number,
              status: ProbeStatus, code: number, message: string) {
    this.createFunction = createFunction;
    this.created = created;
    this.deviceCount = deviceCount;
    this.status = status;
    this.code = code;
    this.message = message;
  }

  /** 页面展示用的一行结论 */
  describe(): string {
    if (!this.created) {
      return text('feature_ag_create_failed', this.createFunction, this.code);
    }
    if (this.deviceCount === DEVICE_COUNT_UNKNOWN) {
      return text('feature_ag_query_failed', this.code);
    }
    return text('feature_ag_connected', this.deviceCount);
  }

  /**
   * 创建失败时补一句成因：AG 入口在 phone/tablet/2in1/tv/car/wearable 六种设备类型上
   * 都登记了实现，因此这里的 801 一般是蓝牙服务尚未就绪，而不是设备形态不支持。
   * 返回空串表示没有需要额外解释的失败。
   */
  reason(): string {
    if (this.created || this.code !== ERROR_CODE_CAPABILITY_UNSUPPORTED) {
      return '';
    }
    return text('feature_ag_hint');
  }

  /** 实例可用时的设备台数，创建失败时为 -1，页面用它决定是否允许继续查询连接状态 */
  usableDeviceCount(): number {
    return this.created ? this.deviceCount : DEVICE_COUNT_UNKNOWN;
  }
}

/** 记录一次探测结果，成功与失败分别落 INFO / ERROR 日志（日志用英文） */
export function probeHfpAg(): HfpAgResult {
  const action = createFunctionNameOf();
  try {
    const profile: ProfileLike = profileFactoryOf()();
    return countDevices(action, profile);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, action, `create failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = describeThrown(action, code, messageOfThrown(err));
    return new HfpAgResult(action, false, DEVICE_COUNT_UNKNOWN, classifyErrorCode(code), code, message);
  }
}

/** 创建成功后的第二步：实例可用性以 getConnectedDevices() 为准，它才会真正走到蓝牙服务 */
function countDevices(action: string, profile: ProfileLike): HfpAgResult {
  try {
    const devices: string[] = profile.getConnectedDevices();
    Logger.info(SOURCE, action, `create succeeded, getConnectedDevices returned ${devices.length} device(s)`);
    const message = text('feature_ag_count_ok', action, devices.length);
    return new HfpAgResult(action, true, devices.length, ProbeStatus.READY, 0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, action,
      `getConnectedDevices failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = describeThrown(text('feature_ag_query_action', action), code, messageOfThrown(err));
    return new HfpAgResult(action, true, DEVICE_COUNT_UNKNOWN, classifyErrorCode(code), code, message);
  }
}

/**
 * 用一个已构造好的实例探测，供用例注入桩实例覆盖成功、空列表、异常三条分支；
 * 生产代码走 probeHfpAg()。
 */
export function probeHfpAgWith(profile: ProfileLike): HfpAgResult {
  return countDevices(createFunctionNameOf(), profile);
}
