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
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AssessmentConstants } from '../constants/AssessmentConstants';
import Logger from '../utils/Logger';

/**
 * Encapsulation of the assessment APIs.
 *
 * The controller is a singleton, it publishes the assessment state and the callback
 * events to AppStorage so that every page of the sample can observe them.
 */
export class AssessmentController {
  private static instance: AssessmentController = new AssessmentController();
  private logs: string[] = [];
  private callback: assessment.IAssessmentCallback;

  private constructor() {
    this.callback = {
      onBegin: (error: assessment.AssessmentError): void => {
        this.handleBegin(error);
      },
      onInterrupted: (info: assessment.AssessmentInterruptInfo): void => {
        this.handleInterrupted(info);
      },
      onEnd: (): void => {
        this.handleEnd();
      }
    };
  }

  public static getInstance(): AssessmentController {
    return AssessmentController.instance;
  }

  /**
   * Begins an assessment session, the system displays a confirmation dialog first.
   *
   * @param context context of the UIAbility that enters assessment mode.
   * @param duration maximum assessment duration in milliseconds, 0 means no explicit limit.
   * @param allowedApps bundle names that are allowed to run during the assessment.
   */
  public begin(context: common.UIAbilityContext, duration: number, allowedApps: string[]): void {
    const config: assessment.AssessmentConfig = {
      duration: duration,
      allowedApps: allowedApps
    };
    AppStorage.setOrCreate<number>(AssessmentConstants.KEY_DURATION, duration);
    try {
      assessment.begin(context, config, this.callback);
      Logger.info(`begin called, duration: ${duration}, allowedApps: ${allowedApps.join(',')}`);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`begin failed, code: ${err.code}, message: ${err.message}`);
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
    }
  }

  /**
   * Ends the assessment session that is started by the current application.
   *
   * @param context context of the UIAbility that exits assessment mode.
   */
  public end(context: common.UIAbilityContext): void {
    try {
      assessment.end(context);
      Logger.info('end called');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`end failed, code: ${err.code}, message: ${err.message}`);
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
    }
  }

  /**
   * Queries whether an assessment session is active.
   *
   * @returns true if the device is in assessment mode.
   */
  public queryActive(): boolean {
    try {
      const active: boolean = assessment.isActive();
      Logger.info(`isActive result: ${active}`);
      this.setActive(active);
      return active;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`isActive failed, code: ${err.code}, message: ${err.message}`);
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
      return false;
    }
  }

  /**
   * Queries the configuration of the current assessment session.
   *
   * @returns the current assessment configuration, or undefined when the query fails.
   */
  public queryConfiguration(): assessment.AssessmentConfig | undefined {
    try {
      const config: assessment.AssessmentConfig = assessment.getConfiguration();
      Logger.info(`getConfiguration duration: ${config.duration}, allowedApps: ${config.allowedApps.join(',')}`);
      return config;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`getConfiguration failed, code: ${err.code}, message: ${err.message}`);
      this.publishEvent(AssessmentConstants.EVENT_API_ERROR, err.code, err.message);
      return undefined;
    }
  }

  private handleBegin(error: assessment.AssessmentError): void {
    const message: string = error.message ?? '';
    if (error.code === assessment.AssessmentErrorCode.OK) {
      Logger.info(`onBegin, assessment began successfully, message: ${message}`);
      this.setActive(true);
    } else {
      Logger.error(`onBegin, assessment begin failed, code: ${error.code}, message: ${message}`);
      this.setActive(false);
    }
    this.publishEvent(AssessmentConstants.EVENT_BEGIN, error.code, message);
  }

  private handleInterrupted(info: assessment.AssessmentInterruptInfo): void {
    Logger.warn(`onInterrupted, code: ${info.code}, message: ${info.message}`);
    this.setActive(false);
    this.publishEvent(AssessmentConstants.EVENT_INTERRUPTED, info.code, info.message);
  }

  private handleEnd(): void {
    Logger.info('onEnd, assessment ended');
    this.setActive(false);
    this.publishEvent(AssessmentConstants.EVENT_END, assessment.AssessmentErrorCode.OK, '');
  }

  private setActive(active: boolean): void {
    AppStorage.setOrCreate<boolean>(AssessmentConstants.KEY_ACTIVE, active);
  }

  private publishEvent(type: string, code: number, message: string): void {
    this.appendLog(`${type} code=${code} message=${message}`);
    AppStorage.setOrCreate<string>(AssessmentConstants.KEY_EVENT_TYPE, type);
    AppStorage.setOrCreate<number>(AssessmentConstants.KEY_EVENT_CODE, code);
    AppStorage.setOrCreate<string>(AssessmentConstants.KEY_EVENT_MESSAGE, message);
    const seq: number = (AppStorage.get<number>(AssessmentConstants.KEY_EVENT_SEQ) ?? 0) + 1;
    AppStorage.setOrCreate<number>(AssessmentConstants.KEY_EVENT_SEQ, seq);
  }

  private appendLog(text: string): void {
    const logs: string[] = this.logs.slice();
    logs.unshift(text);
    if (logs.length > AssessmentConstants.MAX_EVENT_LOG) {
      logs.pop();
    }
    this.logs = logs;
    AppStorage.setOrCreate<string[]>(AssessmentConstants.KEY_LOGS, logs);
  }
}
