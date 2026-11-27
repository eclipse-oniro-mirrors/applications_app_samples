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
// [Start assessment_page_lifecycle]
// [StartExclude assessment_page_lifecycle]
import { common } from '@kit.AbilityKit';
import { AppStorageV2, CustomContentDialogV2 } from '@kit.ArkUI';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import { ContextUtil } from '../common/utils/ContextUtil';
import Logger from '../common/utils/Logger';
import { ExamHardeningUtil } from '../common/utils/ExamHardeningUtil';
import { ScreenRecordUtil } from '../common/utils/ScreenRecordUtil';
import AssessmentViewModel from '../viewmodel/AssessmentViewModel';
import ExamViewModel from '../viewmodel/ExamViewModel';
import SettingModel from '../model/SettingModel';
import QuestionCardView from '../view/QuestionCardView';
import ExamOperationView from '../view/ExamOperationView';
import OperationView from '../view/OperationView';
import StatusView from '../view/StatusView';

@Entry
@ComponentV2
struct ExamPage {
  @Local assessmentVM: AssessmentViewModel =
    AppStorageV2.connect(AssessmentViewModel, 'AssessmentViewModel', () => new AssessmentViewModel())!;
  @Local examVM: ExamViewModel = new ExamViewModel();
  @Local setting: SettingModel = AppStorageV2.connect(SettingModel, 'SettingModel', () => new SettingModel())!;
  @Local showSheet: boolean = false;
  private screenRecord: ScreenRecordUtil | null = null;
  private submitDialogId: number = 0;

  // [EndExclude assessment_page_lifecycle]
  aboutToAppear(): void {
    this.applyHardening();
    // [StartExclude assessment_page_lifecycle]
    this.examVM.initAnswers();
    this.examVM.startCountdown(this.assessmentVM.duration);
    // [EndExclude assessment_page_lifecycle]
  }

  aboutToDisappear(): void {
    // [StartExclude assessment_page_lifecycle]
    this.examVM.stopCountdown();
    // [EndExclude assessment_page_lifecycle]
    this.releaseHardening();
  }
  // [StartExclude assessment_page_lifecycle]

  onBackPress(): boolean {
    return true;
  }

  @Monitor('assessmentVM.eventSeq')
  onAssessmentEvent(mon: IMonitor): void {
    const type: string = this.assessmentVM.eventType;
    const code: number = this.assessmentVM.eventCode;
    const message: string = this.assessmentVM.eventMessage;
    Logger.info(`onAssessmentEvent, type: ${type}, code: ${code}, message: ${message}`);
    if (type === AssessmentConstants.EVENT_BEGIN && code !== assessment.AssessmentErrorCode.OK) {
      this.exitExam($r('app.string.exam_end_title'), this.formatReason(code));
      return;
    }
    if (type === AssessmentConstants.EVENT_INTERRUPTED) {
      this.exitExam($r('app.string.exam_interrupt_title'), this.formatReason(code));
      return;
    }
    if (type === AssessmentConstants.EVENT_END) {
      if (this.examVM.answeredCount === AssessmentConstants.INVALID_ANSWER) {
        this.exitExam($r('app.string.exam_end_title'), message);
        return;
      }
      this.exitExam($r('app.string.exam_finish_title'),
        $r('app.string.exam_finish_message', this.examVM.answeredCount, this.examVM.questionCount));
    }
  }

  build() {
    Navigation() {
      Column({ space: 12 }) {
        QuestionCardView({
          examViewModel: this.examVM
        })

        ExamOperationView({
          examViewModel: this.examVM,
          onSubmit: () => {
            this.onSubmitClick();
          }
        })

        this.DebugPanel()
      }
      .width('100%')
      .height('100%')
      .padding({
        top: $r('app.float.page_padding'),
        bottom: $r('app.float.page_bottom_padding'),
        left: $r('app.float.page_padding'),
        right: $r('app.float.page_padding')
      })
      .justifyContent(FlexAlign.Start)
      .bindSheet(this.showSheet, this.sheetContent, {
        title: { title: $r('app.string.debug_panel_title')   },
        detents: [SheetSize.MEDIUM, SheetSize.LARGE],
        preferType: SheetType.BOTTOM,
        onDisappear: () => {
          this.showSheet = false;
        }
      })
    }
    .title(this.examTitle)
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .hideBackButton(true)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }

  @Builder
  examTitle() {
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
        .margin({ right: $r('app.float.space_medium') })
      if (this.assessmentVM.duration === AssessmentConstants.DURATION_DEFAULT) {
        Text($r('app.string.duration_default'))
          .fontSize($r('app.float.font_size_body'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.body_font'))
      } else {
        Text(this.examVM.formattedRemaining)
          .fontSize($r('app.float.font_size_body'))
          .fontWeight(FontWeight.Medium)
          .fontColor(this.examVM.isRemainingCritical ? $r('app.color.warning') : $r('app.color.brand'))
      }
    }
    .width('100%')
    .height('100%')
    .padding({
      left: $r('app.float.page_padding'),
      right: $r('app.float.page_padding')
    })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  DebugPanel() {
    Row() {
      Text($r('app.string.debug_panel_title'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.body_font'))
        .layoutWeight(1)
      Text($r('app.string.debug_panel_arrow'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))
    }
    .width('100%')
    .padding({
      left: $r('app.float.component_space'),
      right: $r('app.float.component_space'),
      top: $r('app.float.space_medium'),
      bottom: $r('app.float.space_medium')
    })
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
    .onClick(() => {
      this.showSheet = true;
    })
  }

  @Builder
  sheetContent() {
    Column({ space: 12 }) {
      OperationView({
        isActive: this.assessmentVM.isActive,
        onBegin: () => {
          const context: common.UIAbilityContext | undefined = this.getAbilityContext();
          if (context !== undefined) {
            this.assessmentVM.begin(context, this.assessmentVM.duration, []);
          }
        },
        onEnd: () => {
          const context: common.UIAbilityContext | undefined = this.getAbilityContext();
          if (context !== undefined) {
            this.assessmentVM.end(context);
          }
        },
        onQueryState: () => {
          this.assessmentVM.queryActive();
        },
        onQueryConfig: () => {
          this.assessmentVM.queryConfiguration();
        }
      })

      StatusView({ viewModel: this.assessmentVM })
    }
    .width('100%')
    .padding({
      bottom: $r('app.float.page_padding'),
      left: $r('app.float.page_padding'),
      right: $r('app.float.page_padding')
    })
  }

  private onSubmitClick(): void {
    this.examVM.submit();
    const answered: number = this.examVM.answeredCount;
    const total: number = this.examVM.questionCount;
    Logger.info(`onSubmitClick, answered: ${answered}/${total}`);
    this.getUIContext().getPromptAction().openCustomDialog({
      builder: () => {
        this.submitConfirmDialog();
      },
      autoCancel: false,
      alignment: DialogAlignment.Center
    }).then((dialogId: number) => {
      this.submitDialogId = dialogId;
    }).catch((error: BusinessError) => {
      Logger.error(`openCustomDialog failed, code: ${error.code}, message: ${error.message}`);
    });
  }

  @Builder
  submitConfirmDialog() {
    CustomContentDialogV2({
      primaryTitle: $r('app.string.exam_submit_confirm_title'),
      contentBuilder: () => {
        this.submitConfirmContent();
      }
    })
  }

  @Builder
  submitConfirmContent() {
    Column({ space: 12 }) {
      Text($r('app.string.exam_submit_confirm_message', this.examVM.answeredCount, this.examVM.questionCount))
        .fontSize($r('app.float.font_size_body'))
        .fontColor($r('app.color.secondary_font'))
        .textAlign(TextAlign.Center)
      Row({ space: 12 }) {
        Button($r('app.string.exam_submit_confirm_no'))
          .layoutWeight(1)
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.page_background'))
          .fontColor($r('app.color.body_font'))
          .onClick(() => {
            this.closeSubmitDialog();
          })
        Button($r('app.string.exam_submit_confirm_yes'))
          .layoutWeight(1)
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.success'))
          .onClick(() => {
            this.closeSubmitDialog();
            this.doSubmit();
          })
      }
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  private closeSubmitDialog(): void {
    try {
      this.getUIContext().getPromptAction().closeCustomDialog(this.submitDialogId);
    } catch (error) {
      const businessError: BusinessError = error as BusinessError;
      Logger.error(`closeCustomDialog failed, code: ${businessError.code}, message: ${businessError.message}`);
    }
  }

  private doSubmit(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    this.assessmentVM.end(context);
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

  private exitExam(title: Resource, message: string | Resource): void {
    this.examVM.stopCountdown();
    this.getUIContext().showAlertDialog({
      title: title,
      message: message,
      autoCancel: false,
      alignment: DialogAlignment.Center,
      confirm: {
        value: $r('app.string.dialog_confirm'),
        action: () => {

        }
      }
    });
    this.getUIContext().getRouter().back();
  }

  // [EndExclude assessment_page_lifecycle]
  private applyHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    ExamHardeningUtil.applyHardening(context, this.setting).catch((error: BusinessError) => {
      Logger.error(`applyHardening failed, code: ${error.code}, message: ${error.message}`);
    })
    // [StartExclude assessment_page_lifecycle]
    if (this.setting.screenRecord) {
      this.screenRecord = new ScreenRecordUtil(context);
      this.screenRecord.start({
        onRecordResult: (recordRes) => {
          if (!recordRes) {
            this.doSubmit();
          }
        }
      });
    }
    // [EndExclude assessment_page_lifecycle]
  }

  private releaseHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    // [StartExclude assessment_page_lifecycle]
    this.screenRecord?.stop();
    // [EndExclude assessment_page_lifecycle]
    ExamHardeningUtil.releaseHardening(context, this.setting).catch((error: BusinessError) => {
      Logger.error(`releaseHardening failed, code: ${error.code}, message: ${error.message}`);
    });
  }
  // [StartExclude assessment_page_lifecycle]

  private getAbilityContext(): common.UIAbilityContext | undefined {
    return ContextUtil.getAbilityContext(this.getUIContext());
  }
}
// [EndExclude assessment_page_lifecycle]
// [End assessment_page_lifecycle]
