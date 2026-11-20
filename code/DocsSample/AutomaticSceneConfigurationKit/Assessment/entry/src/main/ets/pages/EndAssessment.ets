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
// [Start assessment_end]
import { common } from '@kit.AbilityKit';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_Assessment]';

@Entry
@Component
struct Index {
  build() {
    Button($r('app.string.exam_submit'))
      .onClick(() => {
        this.endAssessment();
      })
  }

  // 结束由当前应用开启的评估，仅开启评估的应用可以结束该评估
  private endAssessment(): void {
    // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
    const host: common.Context | undefined = this.getUIContext().getHostContext();
    if (host === undefined) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'end failed, the host context is undefined');
      return;
    }
    const context: common.UIAbilityContext = host as common.UIAbilityContext;
    try {
      assessment.end(context);
      hilog.info(DOMAIN, TAG, '%{public}s', 'end called');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, '%{public}s', `end failed, code: ${err.code}, message: ${err.message}`);
    }
  }
}
// [End assessment_end]
