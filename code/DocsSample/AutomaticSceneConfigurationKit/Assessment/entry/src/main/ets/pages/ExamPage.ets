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
import { AppStorageV2, window } from '@kit.ArkUI';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import { ContextUtil } from '../common/utils/ContextUtil';
import Logger from '../common/utils/Logger';
import { ExamHardeningUtil } from '../common/utils/ExamHardeningUtil';
import AssessmentViewModel from '../viewmodel/AssessmentViewModel';
import ExamViewModel from '../viewmodel/ExamViewModel';
import SettingModel from '../model/SettingModel';
import ExamHeaderView from '../view/ExamHeaderView';
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
  @Local statusBarHeight: number = 0;
  @Local showSheet: boolean = false;
  private dialogShown: boolean = false;

  aboutToAppear(): void {
    this.applyHardening();
    this.loadStatusBarHeight();
    this.examVM.initAnswers();
    this.examVM.startCountdown(this.assessmentVM.duration);
  }

  aboutToDisappear(): void {
    this.examVM.stopCountdown();
    this.releaseHardening();
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
  }

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
      this.showExitDialog($r('app.string.exam_end_title'), this.formatReason(code));
      return;
    }
    if (type === AssessmentConstants.EVENT_INTERRUPTED) {
      this.showExitDialog($r('app.string.exam_interrupt_title'), this.formatReason(code));
      return;
    }
    if (type === AssessmentConstants.EVENT_END) {
      if (this.examVM.answeredCount === AssessmentConstants.INVALID_ANSWER) {
        this.showExitDialog($r('app.string.exam_end_title'), message);
        return;
      }
      this.showExitDialog($r('app.string.exam_finish_title'),
        $r('app.string.exam_finish_message', this.examVM.answeredCount, this.examVM.questionCount));
    }
  }

  build() {
    Column({ space: 12 }) {
      ExamHeaderView({
        examViewModel: this.examVM,
        examDuration: this.assessmentVM.duration
      })

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
      top: this.statusBarHeight + 16,
      bottom: $r('app.float.page_padding'),
      left: $r('app.float.page_padding'),
      right: $r('app.float.page_padding')
    })
    .backgroundColor($r('app.color.page_background'))
    .justifyContent(FlexAlign.Start)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    .bindSheet(this.showSheet, this.sheetContent, {
      detents: [SheetSize.MEDIUM, SheetSize.LARGE],
      preferType: SheetType.BOTTOM,
      onDisappear: () => {
        this.showSheet = false;
      }
    })
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
    .padding({ top: $r('app.float.sheet_top_padding'), bottom: $r('app.float.page_padding'), left: $r('app.float.page_padding'), right: $r('app.float.page_padding') })
  }

  private onSubmitClick(): void {
    this.examVM.submit();
    Logger.info(`onSubmitClick, answered: ${this.examVM.answeredCount}`);
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

  private showExitDialog(title: Resource, message: string | Resource): void {
    if (this.dialogShown) {
      return;
    }
    this.dialogShown = true;
    this.examVM.stopCountdown();
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

  private async loadStatusBarHeight(): Promise<void> {
    try {
      const context: common.UIAbilityContext | undefined = this.getAbilityContext();
      if (context === undefined) {
        return;
      }
      const mainWindow: window.Window = await window.getLastWindow(context);
      const avoidArea = mainWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      this.statusBarHeight = px2vp(avoidArea.topRect.height);
      Logger.info(`loadStatusBarHeight: ${this.statusBarHeight}vp`);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`loadStatusBarHeight failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  private applyHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    ExamHardeningUtil.applyHardening(context, this.setting).catch((error: BusinessError) => {
      Logger.error(`applyHardening failed, code: ${error.code}, message: ${error.message}`);
    });
  }

  private releaseHardening(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    ExamHardeningUtil.releaseHardening(context, this.setting).catch((error: BusinessError) => {
      Logger.error(`releaseHardening failed, code: ${error.code}, message: ${error.message}`);
    });
  }

  private getAbilityContext(): common.UIAbilityContext | undefined {
    return ContextUtil.getAbilityContext(this.getUIContext());
  }
}
