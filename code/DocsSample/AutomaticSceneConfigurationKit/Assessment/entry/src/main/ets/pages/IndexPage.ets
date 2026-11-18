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
import { AppStorageV2, router, window } from '@kit.ArkUI';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import { ContextUtil } from '../common/utils/ContextUtil';
import Logger from '../common/utils/Logger';
import { ExamHardeningUtil } from '../common/utils/ExamHardeningUtil';
import AssessmentViewModel from '../viewmodel/AssessmentViewModel';
import SettingModel from '../model/SettingModel';
import TitleView from '../view/TitleView';
import ConfigView from '../view/ConfigView';
import SettingView from '../view/SettingView';
import OperationView from '../view/OperationView';
import StatusView from '../view/StatusView';

@Entry
@ComponentV2
struct IndexPage {
  @Local viewModel: AssessmentViewModel = AppStorageV2.connect(AssessmentViewModel, 'AssessmentViewModel', () => new AssessmentViewModel())!;
  @Local setting: SettingModel = AppStorageV2.connect(SettingModel, 'SettingModel', () => new SettingModel())!;
  @Local durationIndex: number = 1;
  @Local allowedApps: string[] = [
    AssessmentConstants.DEFAULT_ALLOWED_APP,
    AssessmentConstants.EMERGENCY_ALLOWED_APP,
    AssessmentConstants.SCREEN_READER_ALLOWED_APP
  ];
  @Local inputBundle: string = '';
  @Local statusBarHeight: number = 0;
  private examPagePushed: boolean = false;

  private durationCandidates: number[] = [
    AssessmentConstants.DURATION_DEFAULT,
    AssessmentConstants.DURATION_TEN_MINUTES,
    AssessmentConstants.DURATION_THIRTY_MINUTES,
    AssessmentConstants.DURATION_SIXTY_MINUTES
  ];

  onPageShow(): void {
    this.examPagePushed = false;
    this.loadStatusBarHeight();
  }

  @Monitor('viewModel.eventSeq')
  onAssessmentEvent(mon: IMonitor): void {
    const type: string = this.viewModel.eventType;
    const code: number = this.viewModel.eventCode;
    Logger.info(`onAssessmentEvent, type: ${type}, code: ${code}`);
    if (type === AssessmentConstants.EVENT_API_ERROR) {
      this.showToast(code);
      return;
    }
    if (type === AssessmentConstants.EVENT_BEGIN && code === assessment.AssessmentErrorCode.OK) {
      this.pushExamPage();
    }
  }

  build() {
    List({ space: 12 }) {
      ListItem() {
        TitleView()
      }

      ListItem() {
        ConfigView({
          durationIndex: this.durationIndex,
          allowedApps: this.allowedApps,
          inputBundle: this.inputBundle,
          onDurationChange: (index: number) => {
            this.durationIndex = index;
          },
          onInputChange: (value: string) => {
            this.inputBundle = value;
          },
          onAddApp: () => {
            this.addAllowedApp();
          },
          onRemoveApp: (bundle: string) => {
            this.removeAllowedApp(bundle);
          }
        })
      }

      ListItem() {
        SettingView({ setting: this.setting })
      }

      ListItem() {
        OperationView({
          isActive: this.viewModel.isActive,
          onBegin: () => {
            this.onBeginClick();
          },
          onEnd: () => {
            this.onEndClick();
          },
          onQueryState: () => {
            this.onQueryStateClick();
          },
          onQueryConfig: () => {
            this.onQueryConfigClick();
          }
        })
      }

      ListItem() {
        StatusView({ viewModel: this.viewModel })
      }
    }
    .width('100%')
    .height('100%')
    .padding({ top: this.statusBarHeight + 16, bottom: $r('app.float.page_padding'), left: $r('app.float.page_padding'), right: $r('app.float.page_padding') })
    .backgroundColor($r('app.color.page_background'))
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
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

  private addAllowedApp(): void {
    const bundle: string = this.inputBundle.trim();
    if (bundle.length === 0) {
      Logger.warn('addAllowedApp, the bundle name is empty');
      return;
    }
    if (this.allowedApps.indexOf(bundle) >= 0) {
      Logger.warn(`addAllowedApp, ${bundle} is already in the whitelist`);
      this.inputBundle = '';
      return;
    }
    if (this.allowedApps.length >= AssessmentConstants.MAX_ALLOWED_APPS) {
      Logger.warn('addAllowedApp, the whitelist is full');
      return;
    }
    this.allowedApps.push(bundle);
    this.inputBundle = '';
  }

  private removeAllowedApp(bundle: string): void {
    const index: number = this.allowedApps.indexOf(bundle);
    if (index < 0) {
      return;
    }
    this.allowedApps.splice(index, 1);
  }

  private onBeginClick(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    if (!this.setting.allowDeveloperMode && ExamHardeningUtil.isDeveloperModeEnabled(context)) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.toast_developer_mode_blocked'),
        duration: AssessmentConstants.TOAST_DURATION
      });
      return;
    }
    if (!this.setting.allowEmulator && ExamHardeningUtil.isEmulator()) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.toast_emulator_blocked'),
        duration: AssessmentConstants.TOAST_DURATION
      });
      return;
    }
    this.viewModel.begin(context, this.durationCandidates[this.durationIndex], this.allowedApps);
  }

  private onEndClick(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    this.viewModel.end(context);
  }

  private onQueryStateClick(): void {
    this.viewModel.queryActive();
  }

  private onQueryConfigClick(): void {
    this.viewModel.queryConfiguration();
  }

  private pushExamPage(): void {
    if (this.examPagePushed) {
      return;
    }
    this.examPagePushed = true;
    const options: router.RouterOptions = {
      url: AssessmentConstants.PAGE_EXAM
    };
    this.getUIContext().getRouter().pushUrl(options).catch((err: BusinessError) => {
      this.examPagePushed = false;
      Logger.error(`pushUrl failed, code: ${err.code}, message: ${err.message}`);
    });
  }

  private showToast(code: number): void {
    try {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.toast_error_code', AssessmentConstants.TAG, code),
        duration: AssessmentConstants.TOAST_DURATION
      });
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`showToast failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  private getAbilityContext(): common.UIAbilityContext | undefined {
    return ContextUtil.getAbilityContext(this.getUIContext());
  }
}
