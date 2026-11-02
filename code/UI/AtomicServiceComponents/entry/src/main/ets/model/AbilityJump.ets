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
 
export enum JumpState {
  IDLE = 0,
  WAITING = 1,
  SUCCESS = 2,
  REJECTED = 3,
  TIMEOUT = 4
}

export class JumpTarget {
  key: string;
  title: string;
  bundleName: string;
  abilityName: string;
  expectation: string;

  constructor(key: string, title: string, bundleName: string, abilityName: string, expectation: string) {
    this.key = key;
    this.title = title;
    this.bundleName = bundleName;
    this.abilityName = abilityName;
    this.expectation = expectation;
  }

  describe(): string {
    return `${this.bundleName}/${this.abilityName}`;
  }
}

export const SELF_BUNDLE_NAME: string = 'com.samples.atomicservicecomponents';

export const JUMP_TARGETS: JumpTarget[] = [
  new JumpTarget('settings', '系统设置', 'com.ohos.settings', 'com.ohos.settings.MainAbility',
    '镜像内置设置应用时走成功分支'),
  new JumpTarget('self', '本应用首页', SELF_BUNDLE_NAME, 'EntryAbility',
    '确定可达的目标，用于验证成功回调'),
  new JumpTarget('missing', '未安装的应用', 'com.samples.not.installed', 'EntryAbility',
    '用于观察 16000001 错误码与提示')
];

export function jumpTargetByKey(key: string): JumpTarget | null {
  for (const target of JUMP_TARGETS) {
    if (target.key === key) {
      return target;
    }
  }
  return null;
}

export function jumpStateName(state: JumpState): string {
  switch (state) {
    case JumpState.WAITING:
      return '等待目标响应';
    case JumpState.SUCCESS:
      return '已拉起';
    case JumpState.REJECTED:
      return '拉起被拒绝';
    case JumpState.TIMEOUT:
      return '等待超时';
    default:
      return '待发起';
  }
}

export function jumpErrorHint(code: number): string {
  switch (code) {
    case 16000001:
      return '目标 Ability 不存在，请确认应用已安装且名称正确';
    case 16000002:
      return '目标 Ability 类型不匹配，请检查 action 与类型';
    case 16000004:
      return '目标 Ability 不可见，请检查可见性配置';
    case 16000011:
      return 'Want 参数无效，请检查 bundleName 与 abilityName';
    case 16000019:
      return '没有匹配的 Ability，请确认目标已安装';
    case 16000050:
      return '内部错误，可稍后重试';
    case 201:
      return '缺少跨应用拉起所需权限';
    default:
      return '请检查目标 bundleName 与 abilityName';
  }
}

export function describeJumpResult(code: number, message: string): string {
  const detail = message.length > 0 ? message : '未知错误';
  return code > 0 ? `[${code}] ${detail}` : detail;
}

export function beginAttempt(previousToken: number): number {
  return previousToken + 1;
}

export function isActiveAttempt(token: number, activeToken: number): boolean {
  return token === activeToken;
}
