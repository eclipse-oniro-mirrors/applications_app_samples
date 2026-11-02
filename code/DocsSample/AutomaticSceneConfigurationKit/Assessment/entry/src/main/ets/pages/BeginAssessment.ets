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
// [Start assessment_begin]
import { common } from '@kit.AbilityKit';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_Assessment]';

// 评估过程回调
const assessmentCallback: assessment.IAssessmentCallback = {
  onBegin: (error: assessment.AssessmentError): void => {
    // AssessmentError.message为可选字段，取值前先做空值兜底
    const message: string = error.message ?? '';
    if (error.code === assessment.AssessmentErrorCode.OK) {
      hilog.info(DOMAIN, TAG, '%{public}s', `onBegin, assessment began successfully, message: ${message}`);
    } else {
      hilog.error(DOMAIN, TAG, '%{public}s',
        `onBegin, assessment begin failed, code: ${error.code}, message: ${message}`);
    }
  },
  onInterrupted: (info: assessment.AssessmentInterruptInfo): void => {
    // 评估被中断，业务侧可根据中断原因码做相应处理，如保存答题记录
    hilog.warn(DOMAIN, TAG, '%{public}s', `onInterrupted, code: ${info.code}, message: ${info.message}`);
  },
  onEnd: (): void => {
    hilog.info(DOMAIN, TAG, '%{public}s', 'onEnd, assessment ended');
  }
};

@Entry
@Component
struct Index {
  build() {
    Button('开始评估')
      .onClick(() => {
        this.beginAssessment();
      })
  }

  private beginAssessment(): void {
    // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
    const host: common.Context | undefined = this.getUIContext().getHostContext();
    if (host === undefined) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'begin failed, the host context is undefined');
      return;
    }
    const context: common.UIAbilityContext = host as common.UIAbilityContext;
    // 评估配置：最大时长1小时（3600000毫秒）；
    // 评估期间允许运行包名为com.samples.assessment的应用
    const config: assessment.AssessmentConfig = {
      duration: 3600000,
      allowedApps: ['com.samples.assessment']
    };
    try {
      assessment.begin(context, config, assessmentCallback);
      hilog.info(DOMAIN, TAG, '%{public}s', 'begin called, waiting for user confirmation');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, '%{public}s', `begin failed, code: ${err.code}, message: ${err.message}`);
    }
  }
}
// [End assessment_begin]
