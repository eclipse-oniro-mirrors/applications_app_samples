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
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ContextUtil } from '../common/utils/ContextUtil';
import { ExamHardeningUtil } from './AssessmentHardening';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_Assessment]';

// 在评估页面的生命周期中启用与恢复加固措施，对应开发指南「应用侧加固建议」一节
@Entry
@Component
struct ExamPageLifecycle {
  // [Start assessment_page_lifecycle]
  aboutToAppear(): void {
    this.applyHardening();
  }

  aboutToDisappear(): void {
    this.releaseHardening();
  }

  private applyHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    ExamHardeningUtil.applyHardening(context).catch((error: BusinessError) => {
      hilog.error(DOMAIN, TAG, '%{public}s', `applyHardening failed, code: ${error.code}, message: ${error.message}`);
    });
  }
  // [End assessment_page_lifecycle]

  private releaseHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    ExamHardeningUtil.releaseHardening(context).catch((error: BusinessError) => {
      hilog.error(DOMAIN, TAG, '%{public}s', `releaseHardening failed, code: ${error.code}, message: ${error.message}`);
    });
  }

  private getAbilityContext(): common.UIAbilityContext | undefined {
    return ContextUtil.getAbilityContext(this.getUIContext());
  }

  build() {
    Column() {
      Text('Assessment hardening')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
