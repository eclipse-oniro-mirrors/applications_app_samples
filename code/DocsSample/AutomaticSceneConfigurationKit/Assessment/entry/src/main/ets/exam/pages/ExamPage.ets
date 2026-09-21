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
import { AssessmentConstants } from '../../common/constants/AssessmentConstants';
import { AssessmentController } from '../../common/controllers/AssessmentController';
import { ContextUtil } from '../../common/utils/ContextUtil';
import Logger from '../../common/utils/Logger';
import { ExamQuestion, ExamRepository } from '../model/ExamQuestion';
import { ExamHardeningUtil } from '../utils/ExamHardeningUtil';

/**
 * The mock exam page, it is displayed while the device is in assessment mode.
 *
 * The page counts down with the duration of AssessmentConfig, records the answers locally and
 * calls assessment.end when the examinee submits the paper. It also reacts to the
 * onInterrupted and onEnd callbacks of the assessment service, and applies the application
 * side hardening while the page is displayed.
 */
@Entry
@Component
struct ExamPage {
  @StorageProp('assessmentEventSeq') @Watch('onAssessmentEvent') eventSeq: number = 0;
  @StorageProp('assessmentDuration') examDuration: number = 0;
  @State currentIndex: number = 0;
  @State answers: number[] = [];
  @State remainingSeconds: number = 0;
  private questions: ExamQuestion[] = ExamRepository.getQuestions();
  private controller: AssessmentController = AssessmentController.getInstance();
  private timerId: number = -1;
  private answeredCount: number = AssessmentConstants.INVALID_ANSWER;
  private dialogShown: boolean = false;

  aboutToAppear(): void {
    this.applyHardening();
    const answers: number[] = [];
    for (let i = 0; i < this.questions.length; i++) {
      answers.push(AssessmentConstants.INVALID_ANSWER);
    }
    this.answers = answers;
    this.remainingSeconds = Math.floor(this.examDuration / AssessmentConstants.MILLIS_PER_SECOND);
    if (this.remainingSeconds > 0) {
      this.startCountdown();
    }
  }

  aboutToDisappear(): void {
    this.stopCountdown();
    this.releaseHardening();
  }

  onBackPress(): boolean {
    Logger.info('onBackPress, end the assessment before leaving the exam page');
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context !== undefined) {
      this.controller.end(context);
    }
    return false;
  }

  build() {
    Column({ space: 12 }) {
      this.HeaderArea()
      this.QuestionCard()
      this.OperationArea()
    }
    .width('100%')
    .height('100%')
    .padding($r('app.float.page_padding'))
    .backgroundColor($r('app.color.page_background'))
    .justifyContent(FlexAlign.Start)
  }

  @Builder
  HeaderArea() {
    Row() {
      Text($r('app.string.exam_title'))
        .fontSize($r('app.float.font_size_title'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_font'))
        .id('assessment_exam_title')
      Blank()
      Text($r('app.string.exam_remaining_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))
        .margin({ right: 8 })
      if (this.examDuration === AssessmentConstants.DURATION_DEFAULT) {
        Text($r('app.string.duration_default'))
          .fontSize($r('app.float.font_size_body'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.body_font'))
      } else {
        Text(this.formatRemaining())
          .fontSize($r('app.float.font_size_body'))
          .fontWeight(FontWeight.Medium)
          .fontColor(this.remainingSeconds > AssessmentConstants.SECONDS_PER_MINUTE ?
          $r('app.color.brand') : $r('app.color.warning'))
      }
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  QuestionCard() {
    Column({ space: 12 }) {
      Text($r('app.string.exam_progress', this.currentIndex + 1, this.questions.length))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      Text(this.currentQuestion().stem)
        .fontSize($r('app.float.font_size_body'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))
        .width('100%')

      ForEach(this.currentQuestion().options, (item: Resource, index: number) => {
        Row({ space: 8 }) {
          Text(String.fromCharCode(AssessmentConstants.OPTION_LABEL_BASE + index))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor(this.isOptionSelected(index) ?
            $r('app.color.card_background') : $r('app.color.secondary_font'))
          Text(item)
            .fontSize($r('app.float.font_size_body'))
            .fontColor(this.isOptionSelected(index) ?
            $r('app.color.card_background') : $r('app.color.body_font'))
            .layoutWeight(1)
        }
        .width('100%')
        .padding($r('app.float.card_padding'))
        .borderRadius($r('app.float.card_radius'))
        .backgroundColor(this.isOptionSelected(index) ?
        $r('app.color.brand') : $r('app.color.page_background'))
        .alignItems(VerticalAlign.Center)
        .onClick(() => {
          this.selectOption(index);
        })
      }, (item: Resource, index: number) => `option_${index}`)
    }
    .width('100%')
    .layoutWeight(1)
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }

  @Builder
  OperationArea() {
    Row({ space: 12 }) {
      Button($r('app.string.exam_previous'))
        .layoutWeight(1)
        .height(44)
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.card_background'))
        .fontColor($r('app.color.body_font'))
        .enabled(this.currentIndex > 0)
        .onClick(() => {
          this.currentIndex -= 1;
        })
      Button($r('app.string.exam_next'))
        .layoutWeight(1)
        .height(44)
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.card_background'))
        .fontColor($r('app.color.body_font'))
        .enabled(this.currentIndex < this.questions.length - 1)
        .onClick(() => {
          this.currentIndex += 1;
        })
      Button($r('app.string.exam_submit'))
        .layoutWeight(1)
        .height(44)
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.success'))
        .onClick(() => {
          this.onSubmitClick();
        })
    }
    .width('100%')
  }

  private currentQuestion(): ExamQuestion {
    return this.questions[this.currentIndex];
  }

  private isOptionSelected(index: number): boolean {
    return this.answers[this.currentIndex] === index;
  }

  private selectOption(index: number): void {
    const answers: number[] = this.answers.slice();
    answers[this.currentIndex] = index;
    this.answers = answers;
  }

  private countAnswered(): number {
    let answered: number = 0;
    for (let i = 0; i < this.answers.length; i++) {
      if (this.answers[i] !== AssessmentConstants.INVALID_ANSWER) {
        answered++;
      }
    }
    return answered;
  }

  private formatRemaining(): string {
    const minutes: number = Math.floor(this.remainingSeconds / AssessmentConstants.SECONDS_PER_MINUTE);
    const seconds: number = this.remainingSeconds % AssessmentConstants.SECONDS_PER_MINUTE;
    const minuteText: string = `${minutes}`.padStart(AssessmentConstants.TEXT_PAD_LENGTH, '0');
    const secondText: string = `${seconds}`.padStart(AssessmentConstants.TEXT_PAD_LENGTH, '0');
    return `${minuteText}:${secondText}`;
  }

  private startCountdown(): void {
    this.timerId = setInterval(() => {
      if (this.remainingSeconds <= 0) {
        this.stopCountdown();
        return;
      }
      this.remainingSeconds -= 1;
    }, AssessmentConstants.COUNTDOWN_INTERVAL);
  }

  private stopCountdown(): void {
    if (this.timerId < 0) {
      return;
    }
    clearInterval(this.timerId);
    this.timerId = -1;
  }

  private onSubmitClick(): void {
    this.answeredCount = this.countAnswered();
    Logger.info(`onSubmitClick, answered: ${this.answeredCount}`);
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    this.controller.end(context);
  }

  private onAssessmentEvent(): void {
    const type: string = AppStorage.get<string>(AssessmentConstants.KEY_EVENT_TYPE) ?? '';
    const code: number = AppStorage.get<number>(AssessmentConstants.KEY_EVENT_CODE) ?? 0;
    const message: string = AppStorage.get<string>(AssessmentConstants.KEY_EVENT_MESSAGE) ?? '';
    Logger.info(`onAssessmentEvent, type: ${type}, code: ${code}, message: ${message}`);
    if (type === AssessmentConstants.EVENT_BEGIN && code !== assessment.AssessmentErrorCode.OK) {
      this.showExitDialog($r('app.string.exam_end_title'), this.formatReason(code));
      return;
    }
    if (type === AssessmentConstants.EVENT_INTERRUPTED) {
      this.showExitDialog($r('app.string.exam_interrupt_title'), this.formatReason(code));
      return;
    }
    if (type === AssessmentConstants.EVENT_END) {
      if (this.answeredCount === AssessmentConstants.INVALID_ANSWER) {
        this.showExitDialog($r('app.string.exam_end_title'), message);
        return;
      }
      this.showExitDialog($r('app.string.exam_finish_title'),
        $r('app.string.exam_finish_message', this.answeredCount, this.questions.length));
    }
  }

  private formatReason(code: number): Resource {
    if (code === assessment.AssessmentErrorCode.USER_CANCEL) {
      return $r('app.string.reason_user_cancel');
    }
    if (code === assessment.AssessmentErrorCode.TIMEOUT) {
      return $r('app.string.reason_timeout');
    }
    if (code === assessment.AssessmentErrorCode.SYSTEM_ERROR) {
      return $r('app.string.reason_system_error');
    }
    if (code === assessment.AssessmentErrorCode.ENV_ANOMALY) {
      return $r('app.string.reason_env_anomaly');
    }
    return $r('app.string.reason_unknown');
  }

  private showExitDialog(title: Resource, message: string | Resource): void {
    if (this.dialogShown) {
      return;
    }
    this.dialogShown = true;
    this.stopCountdown();
    this.getUIContext().showAlertDialog({
      title: title,
      message: message,
      autoCancel: false,
      alignment: DialogAlignment.Center,
      confirm: {
        value: $r('app.string.dialog_confirm'),
        action: () => {
          this.getUIContext().getRouter().back();
        }
      }
    });
  }

  // The assessment service does not cover the window form, the capture of the application
  // window, the pasteboard and the input method panel, so the exam page hardens them itself.
  private applyHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    ExamHardeningUtil.applyHardening(context).catch((error: BusinessError) => {
      Logger.error(`applyHardening failed, code: ${error.code}, message: ${error.message}`);
    });
  }

  private releaseHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    ExamHardeningUtil.releaseHardening(context).catch((error: BusinessError) => {
      Logger.error(`releaseHardening failed, code: ${error.code}, message: ${error.message}`);
    });
  }

  private getAbilityContext(): common.UIAbilityContext | undefined {
    return ContextUtil.getAbilityContext(this.getUIContext());
  }
}
