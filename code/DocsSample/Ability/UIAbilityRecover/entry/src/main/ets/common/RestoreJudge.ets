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

// [Start restore_judge]
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { deviceInfo } from '@kit.BasicServicesKit';

const RECOVERY_KEY = 'ohos.ability.params.abilityRecoveryRestart';

/**
 * 恢复启动判定（版本隔离）。
 * 部分低版本系统中，设备重启后的重拉也会把 launchReason 标记为 APP_RECOVERY，
 * 因此低版本不能单独依赖 launchReason 判定恢复，需要结合系统键与恢复数据存在性共同判定；
 * API 26 起系统不再误标，launchReason 单独成立即可判定恢复启动。
 */
export class RestoreJudge {
  private static restoring: boolean = false;

  /**
   * 在 UIAbility 的 onCreate 中调用一次。
   * - flag：全版本保险信号，系统键 abilityRecoveryRestart 为 true 时一定是恢复启动；
   * - byReason：launchReason 信号，API 26 起可信可单独成立，低版本可能误标只能作辅助；
   * - byData：本应用恢复键存在于 want.parameters 中——恢复键只在恢复启动时由系统合并回来，
   *   是低版本最可靠的信号，单独成立即可判定为恢复启动。
   */
  static init(want: Want, launchParam: AbilityConstant.LaunchParam, appRestoreKeys: string[]): void {
    const raw = want?.parameters?.[RECOVERY_KEY] as boolean | string | undefined;
    const flag = raw === true || raw === 'true';
    const byReason = launchParam?.launchReason === AbilityConstant.LaunchReason.APP_RECOVERY;
    const byData = appRestoreKeys.some(k => want?.parameters?.[k] !== undefined);
    // API 26 起 launchReason 可信；低版本误标风险，须系统键或恢复键佐证
    const reasonTrusted: boolean = deviceInfo.sdkApiVersion >= 26;
    RestoreJudge.restoring = flag || (reasonTrusted && byReason) || byData;
  }

  /** 页面/Ability 任意处调用：当前是否恢复启动（含恢复流程未结束期间）。 */
  static isRestoring(): boolean {
    return RestoreJudge.restoring;
  }

  /** 恢复流程完整结束后调用，放行正常导航逻辑（否则自动跳首页等守卫会永久拦截）。 */
  static finishRestore(): void {
    RestoreJudge.restoring = false;
  }
}
// [End restore_judge]
