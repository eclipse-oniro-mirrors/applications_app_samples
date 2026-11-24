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
// [Start assessment_query]
// [Start assessment_end]
// [StartExclude assessment_begin]
// [StartExclude assessment_query]
// [StartExclude assessment_end]
import { common } from '@kit.AbilityKit';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import Logger from '../common/utils/Logger';

@ObservedV2
export default class AssessmentViewModel {
  @Trace public isActive: boolean = false;
  @Trace public duration: number = 0;
  @Trace public logs: string[] = [];
  @Trace public eventType: string = '';
  @Trace public eventCode: number = 0;
  @Trace public eventMessage: string = '';
  @Trace public eventSeq: number = 0;
  @Trace public queryDuration: number = AssessmentConstants.INVALID_DURATION;
  @Trace public queryApps: string = '';

  // [EndExclude assessment_begin]
  // 评估过程回调
  private callback: assessment.IAssessmentCallback;

  constructor() {
    this.callback = {
      onBegin: (error: assessment.AssessmentError): void => {
        this.handleBegin(error);
      },
      onInterrupted: (info: assessment.AssessmentInterruptInfo): void => {
        // 评估被中断，业务侧可根据中断原因码做相应处理，如保存答题记录
        this.handleInterrupted(info);
      },
      onEnd: (): void => {
        this.handleEnd();
      }
    };
  }

  begin(context: common.UIAbilityContext, duration: number, allowedApps: string[]): void {
    // 评估配置：最大时长1小时（3600000毫秒）；
    // 评估期间允许运行包名为com.samples.assessment的应用
    const config: assessment.AssessmentConfig = {
      duration: duration,
      allowedApps: allowedApps
    };
    this.duration = duration;
    try {
      assessment.begin(context, config, this.callback);
      Logger.info(`begin called, duration: ${duration}, allowedApps: ${allowedApps.join(',')}`);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`begin failed, code: ${err.code}, message: ${err.message}`);
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
    }
  }
  // [StartExclude assessment_begin]
  // [EndExclude assessment_end]
  end(context: common.UIAbilityContext): void {
    try {
      assessment.end(context);
      Logger.info('end called');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`end failed, code: ${err.code}, message: ${err.message}`);
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
    }
  }
  // [StartExclude assessment_end]
  // [EndExclude assessment_query]
  queryActive(): boolean {
    try {
      const active: boolean = assessment.isActive();
      Logger.info(`isActive result: ${active}`);
      this.isActive = active;
      return active;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`isActive failed, code: ${err.code}, message: ${err.message}`);
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
      return false;
    }
  }

  queryConfiguration(): void {
    try {
      const config: assessment.AssessmentConfig = assessment.getConfiguration();
      Logger.info(`getConfiguration duration: ${config.duration}, allowedApps: ${config.allowedApps.join(',')}`);
      this.queryDuration = config.duration;
      this.queryApps = config.allowedApps.join(',');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`getConfiguration failed, code: ${err.code}, message: ${err.message}`);
      this.queryDuration = AssessmentConstants.INVALID_DURATION;
      this.queryApps = '';
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
    }
  }
  // [StartExclude assessment_query]

  @Computed
  get isQueryConfigAvailable(): boolean {
    return this.queryDuration !== AssessmentConstants.INVALID_DURATION;
  }

  private handleBegin(error: assessment.AssessmentError): void {
    const message: string = error.message ?? '';
    if (error.code === assessment.AssessmentErrorCode.OK) {
      Logger.info(`onBegin, assessment began successfully, message: ${message}`);
      this.isActive = true;
    } else {
      Logger.error(`onBegin, assessment begin failed, code: ${error.code}, message: ${message}`);
      this.isActive = false;
    }
    this.publishEvent(AssessmentConstants.EVENT_BEGIN, error.code, message);
  }

  private handleInterrupted(info: assessment.AssessmentInterruptInfo): void {
    Logger.warn(`onInterrupted, code: ${info.code}, message: ${info.message}`);
    this.isActive = false;
    this.publishEvent(AssessmentConstants.EVENT_INTERRUPTED, info.code, info.message);
  }

  private handleEnd(): void {
    Logger.info('onEnd, assessment ended');
    this.isActive = false;
    this.publishEvent(AssessmentConstants.EVENT_END, assessment.AssessmentErrorCode.OK, '');
  }

  private publishEvent(type: string, code: number, message: string): void {
    this.appendLog(`${type} code=${code} message=${message}`);
    this.eventType = type;
    this.eventCode = code;
    this.eventMessage = message;
    this.eventSeq += 1;
  }

  private appendLog(text: string): void {
    const logs: string[] = [text, ...this.logs];
    if (logs.length > AssessmentConstants.MAX_EVENT_LOG) {
      logs.pop();
    }
    this.logs = logs;
  }
}
// [EndExclude assessment_begin]
// [EndExclude assessment_query]
// [EndExclude assessment_end]
// [End assessment_begin]
// [End assessment_query]
// [End assessment_end]
