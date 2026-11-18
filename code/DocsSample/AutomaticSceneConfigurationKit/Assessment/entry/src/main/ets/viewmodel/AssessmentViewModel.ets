import { common } from '@kit.AbilityKit';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import Logger from '../common/utils/Logger';

@ObservedV2
export default class AssessmentViewModel {
  @Trace isActive: boolean = false;
  @Trace duration: number = 0;
  @Trace logs: string[] = [];
  @Trace eventType: string = '';
  @Trace eventCode: number = 0;
  @Trace eventMessage: string = '';
  @Trace eventSeq: number = 0;
  @Trace queryDuration: number = AssessmentConstants.INVALID_DURATION;
  @Trace queryApps: string = '';

  private callback: assessment.IAssessmentCallback;

  constructor() {
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

  begin(context: common.UIAbilityContext, duration: number, allowedApps: string[]): void {
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
