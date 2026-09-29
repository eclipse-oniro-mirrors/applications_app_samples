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
import { router } from '@kit.ArkUI';
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import { AssessmentController } from '../common/controllers/AssessmentController';
import { ContextUtil } from '../common/utils/ContextUtil';
import Logger from '../common/utils/Logger';

/**
 * Entry page of the assessment sample, it configures the assessment parameters,
 * invokes the assessment APIs and shows the assessment state and the callback events.
 */
@Entry
@Component
struct Index {
  @StorageLink('assessmentActive') assessmentActive: boolean = false;
  @StorageProp('assessmentLogs') eventLogs: string[] = [];
  @StorageProp('assessmentEventSeq') @Watch('onAssessmentEvent') eventSeq: number = 0;
  @State durationIndex: number = 1;
  @State allowedApps: string[] = [AssessmentConstants.DEFAULT_ALLOWED_APP];
  @State inputBundle: string = '';
  @State queryDuration: number = AssessmentConstants.INVALID_DURATION;
  @State queryApps: string = '';
  private controller: AssessmentController = AssessmentController.getInstance();
  private durationCandidates: number[] = [
    AssessmentConstants.DURATION_DEFAULT,
    AssessmentConstants.DURATION_TEN_MINUTES,
    AssessmentConstants.DURATION_THIRTY_MINUTES,
    AssessmentConstants.DURATION_SIXTY_MINUTES
  ];
  private examPagePushed: boolean = false;

  onPageShow(): void {
    this.examPagePushed = false;
  }

  build() {
    List({ space: 12 }) {
      ListItem() {
        this.TitleArea()
      }

      ListItem() {
        this.ConfigCard()
      }

      ListItem() {
        this.OperationCard()
      }

      ListItem() {
        this.StatusCard()
      }
    }
    .width('100%')
    .height('100%')
    .padding($r('app.float.page_padding'))
    .backgroundColor($r('app.color.page_background'))
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }

  @Builder
  TitleArea() {
    Column({ space: 8 }) {
      Text($r('app.string.index_title'))
        .fontSize($r('app.float.font_size_title'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_font'))
        .id('assessment_index_title')
      Text($r('app.string.index_intro'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ top: 8, bottom: 8 })
  }

  @Builder
  ConfigCard() {
    Column({ space: 12 }) {
      Text($r('app.string.config_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Text($r('app.string.duration_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
        ForEach(this.durationCandidates, (item: number, index: number) => {
          Text(this.formatDuration(item))
            .fontSize($r('app.float.font_size_caption'))
            .fontColor(this.durationIndex === index ?
            $r('app.color.card_background') : $r('app.color.body_font'))
            .backgroundColor(this.durationIndex === index ?
            $r('app.color.brand') : $r('app.color.page_background'))
            .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            .borderRadius(16)
            .margin({ right: 8, bottom: 8 })
            .onClick(() => {
              this.durationIndex = index;
            })
        }, (item: number, index: number) => `duration_${index}`)
      }
      .width('100%')

      Divider()
        .color($r('app.color.divider'))

      Text($r('app.string.allowed_apps_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      Row({ space: 8 }) {
        TextInput({ placeholder: $r('app.string.allowed_apps_placeholder'), text: this.inputBundle })
          .layoutWeight(1)
          .height(40)
          .id('assessment_bundle_input')
          .onChange((value: string) => {
            this.inputBundle = value;
          })
        Button($r('app.string.allowed_apps_add'))
          .height(40)
          .fontSize($r('app.float.font_size_caption'))
          .id('assessment_add_button')
          .onClick(() => {
            this.addAllowedApp();
          })
      }
      .width('100%')

      if (this.allowedApps.length === 0) {
        Text($r('app.string.allowed_apps_empty'))
          .fontSize($r('app.float.font_size_caption'))
          .fontColor($r('app.color.secondary_font'))
      } else {
        ForEach(this.allowedApps, (item: string) => {
          Row({ space: 8 }) {
            Text(item)
              .fontSize($r('app.float.font_size_caption'))
              .fontColor($r('app.color.body_font'))
              .layoutWeight(1)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
            Button($r('app.string.allowed_apps_remove'))
              .height(28)
              .fontSize($r('app.float.font_size_caption'))
              .backgroundColor($r('app.color.page_background'))
              .fontColor($r('app.color.warning'))
              .onClick(() => {
                this.removeAllowedApp(item);
              })
          }
          .width('100%')
          .padding({ top: 4, bottom: 4 })
        }, (item: string) => item)
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }

  @Builder
  OperationCard() {
    Column({ space: 12 }) {
      Text($r('app.string.operation_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Row({ space: 12 }) {
        Button($r('app.string.begin_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .enabled(!this.assessmentActive)
          .id('assessment_begin_button')
          .onClick(() => {
            this.onBeginClick();
          })
        Button($r('app.string.end_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.warning'))
          .enabled(this.assessmentActive)
          .id('assessment_end_button')
          .onClick(() => {
            this.onEndClick();
          })
      }
      .width('100%')

      Row({ space: 12 }) {
        Button($r('app.string.query_state_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.page_background'))
          .fontColor($r('app.color.body_font'))
          .id('assessment_query_state_button')
          .onClick(() => {
            this.onQueryStateClick();
          })
        Button($r('app.string.query_config_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.page_background'))
          .fontColor($r('app.color.body_font'))
          .id('assessment_query_config_button')
          .onClick(() => {
            this.onQueryConfigClick();
          })
      }
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }

  @Builder
  StatusCard() {
    Column({ space: 12 }) {
      Text($r('app.string.status_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Text(this.assessmentActive ? $r('app.string.state_active') : $r('app.string.state_inactive'))
        .fontSize($r('app.float.font_size_body'))
        .fontColor(this.assessmentActive ? $r('app.color.success') : $r('app.color.secondary_font'))

      Text($r('app.string.current_config_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      if (this.queryDuration === AssessmentConstants.INVALID_DURATION) {
        Text($r('app.string.current_config_none'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
      } else {
        Text($r('app.string.current_config_value', this.queryDuration, this.queryApps))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
      }

      Divider()
        .color($r('app.color.divider'))

      Text($r('app.string.event_log_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      if (this.eventLogs.length === 0) {
        Text($r('app.string.event_log_empty'))
          .fontSize($r('app.float.font_size_caption'))
          .fontColor($r('app.color.secondary_font'))
      } else {
        ForEach(this.eventLogs, (item: string) => {
          Text(item)
            .fontSize($r('app.float.font_size_caption'))
            .fontColor($r('app.color.body_font'))
            .width('100%')
        }, (item: string, index: number) => `${index}_${item}`)
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }

  private formatDuration(duration: number): Resource {
    if (duration === AssessmentConstants.DURATION_DEFAULT) {
      return $r('app.string.duration_default');
    }
    return $r('app.string.duration_minutes', duration / AssessmentConstants.MILLIS_PER_MINUTE);
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
    const apps: string[] = this.allowedApps.slice();
    apps.push(bundle);
    this.allowedApps = apps;
    this.inputBundle = '';
  }

  private removeAllowedApp(bundle: string): void {
    const apps: string[] = this.allowedApps.slice();
    const index: number = apps.indexOf(bundle);
    if (index < 0) {
      return;
    }
    apps.splice(index, 1);
    this.allowedApps = apps;
  }

  private onBeginClick(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    this.controller.begin(context, this.durationCandidates[this.durationIndex], this.allowedApps);
  }

  private onEndClick(): void {
    const context: common.UIAbilityContext | undefined = this.getAbilityContext();
    if (context === undefined) {
      return;
    }
    this.controller.end(context);
  }

  private onQueryStateClick(): void {
    this.assessmentActive = this.controller.queryActive();
  }

  private onQueryConfigClick(): void {
    const config: assessment.AssessmentConfig | undefined = this.controller.queryConfiguration();
    if (config === undefined) {
      this.queryDuration = AssessmentConstants.INVALID_DURATION;
      this.queryApps = '';
      return;
    }
    this.queryDuration = config.duration;
    this.queryApps = config.allowedApps.join(',');
  }

  private onAssessmentEvent(): void {
    const type: string = AppStorage.get<string>(AssessmentConstants.KEY_EVENT_TYPE) ?? '';
    const code: number = AppStorage.get<number>(AssessmentConstants.KEY_EVENT_CODE) ?? 0;
    Logger.info(`onAssessmentEvent, type: ${type}, code: ${code}`);
    if (type === AssessmentConstants.EVENT_API_ERROR) {
      this.showToast(code);
      return;
    }
    if (type === AssessmentConstants.EVENT_BEGIN && code === assessment.AssessmentErrorCode.OK) {
      this.pushExamPage();
    }
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
        message: `${AssessmentConstants.TAG} error code: ${code}`,
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
