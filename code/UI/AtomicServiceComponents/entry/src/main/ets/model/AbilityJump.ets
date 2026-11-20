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
  public key: string;
  public title: string;
  public bundleName: string;
  public abilityName: string;
  public expectation: string;

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
  new JumpTarget('settings', 'System Settings', 'com.ohos.settings', 'com.ohos.settings.MainAbility',
    'Succeeds when the settings app is built into the image'),
  new JumpTarget('self', 'This app (home)', SELF_BUNDLE_NAME, 'EntryAbility',
    'Reachable target used to verify the success callback'),
  new JumpTarget('missing', 'Not installed app', 'com.samples.not.installed', 'EntryAbility',
    'Used to observe error code 16000001 and its hint')
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
      return 'Waiting for target';
    case JumpState.SUCCESS:
      return 'Launched';
    case JumpState.REJECTED:
      return 'Launch rejected';
    case JumpState.TIMEOUT:
      return 'Timed out';
    default:
      return 'Idle';
  }
}

export function jumpErrorHint(code: number): string {
  switch (code) {
    case 16000001:
      return 'Target ability not found. Ensure the app is installed and the name is correct.';
    case 16000002:
      return 'Target ability type mismatch. Check the action and type.';
    case 16000004:
      return 'Target ability is not visible. Check the visibility configuration.';
    case 16000011:
      return 'Invalid Want parameters. Check bundleName and abilityName.';
    case 16000019:
      return 'No matching ability. Ensure the target is installed.';
    case 16000050:
      return 'Internal error. Try again later.';
    case 201:
      return 'Missing permission required to launch another app.';
    default:
      return 'Check the target bundleName and abilityName.';
  }
}

/** 跳转目标标题资源；页面展示统一走 $r */
export function jumpTargetTitleRes(key: string): Resource {
  switch (key) {
    case 'settings':
      return $r('app.string.jump_target_settings_title');
    case 'self':
      return $r('app.string.jump_target_self_title');
    default:
      return $r('app.string.jump_target_missing_title');
  }
}

/** 跳转目标预期结果资源 */
export function jumpTargetExpectationRes(key: string): Resource {
  switch (key) {
    case 'settings':
      return $r('app.string.jump_target_settings_expectation');
    case 'self':
      return $r('app.string.jump_target_self_expectation');
    default:
      return $r('app.string.jump_target_missing_expectation');
  }
}

/** 跳转状态资源；页面展示统一走 $r */
export function jumpStateNameRes(state: JumpState): Resource {
  switch (state) {
    case JumpState.WAITING:
      return $r('app.string.jump_state_waiting');
    case JumpState.SUCCESS:
      return $r('app.string.jump_state_success');
    case JumpState.REJECTED:
      return $r('app.string.jump_state_rejected');
    case JumpState.TIMEOUT:
      return $r('app.string.jump_state_timeout');
    default:
      return $r('app.string.jump_state_idle');
  }
}

/** 跳转错误码提示资源；页面展示统一走 $r */
export function jumpErrorHintRes(code: number): Resource {
  switch (code) {
    case 16000001:
      return $r('app.string.jump_error_16000001');
    case 16000002:
      return $r('app.string.jump_error_16000002');
    case 16000004:
      return $r('app.string.jump_error_16000004');
    case 16000011:
      return $r('app.string.jump_error_16000011');
    case 16000019:
      return $r('app.string.jump_error_16000019');
    case 16000050:
      return $r('app.string.jump_error_16000050');
    case 201:
      return $r('app.string.jump_error_201');
    default:
      return $r('app.string.jump_error_default');
  }
}

export function describeJumpResult(code: number, message: string): string {
  const detail = message.length > 0 ? message : 'Unknown error';
  return code > 0 ? `[${code}] ${detail}` : detail;
}

export function beginAttempt(previousToken: number): number {
  return previousToken + 1;
}

export function isActiveAttempt(token: number, activeToken: number): boolean {
  return token === activeToken;
}
