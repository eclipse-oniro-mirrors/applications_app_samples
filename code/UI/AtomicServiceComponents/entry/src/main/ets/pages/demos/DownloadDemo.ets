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
 
import {
  DownloadContentOptions,
  DownloadDescription,
  DownloadFileButton,
  DownloadIconStyle,
  DownloadLayoutDirection,
  DownloadStyleOptions
} from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import {
  DownloadState,
  downloadStateName,
  nextDownloadState
} from '../../model/DownloadFlow';
import { buildDownloadContent, buildDownloadFileName, formatBytes } from '../../utils/FormatUtil';
import { errorInfo, formatError } from '../../utils/ErrorUtil';
import { saveTextToSandbox } from '../../utils/FileUtil';
import { DownloadPicker, PickerOutcome } from '../../utils/PickerUtil';
import { Logger } from '../../utils/Logger';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { PICKER_TIMEOUT_MS } from '../../common/AppConstants';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../common/Theme';

@Component
export struct DownloadDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State iconFilled: boolean = true;
  @State horizontal: boolean = true;
  @State state: DownloadState = DownloadState.IDLE;
  @State lastPath: string = '';
  @State contentOptions: DownloadContentOptions = {
    icon: DownloadIconStyle.FULL_FILLED,
    text: DownloadDescription.DOWNLOAD
  };
  @State styleOptions: DownloadStyleOptions = {
    iconSize: '28vp',
    layoutDirection: DownloadLayoutDirection.HORIZONTAL,
    fontSize: '16fp',
    fontStyle: FontStyle.Normal,
    fontWeight: FontWeight.Medium,
    fontColor: AppColors.WHITE,
    iconColor: AppColors.WHITE,
    textIconSpace: '8vp'
  };
  private picker: DownloadPicker | null = null;

  private getString(resource: Resource, ...args: Array<string | number>): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id, ...args);
    } catch (err) {
      return '';
    }
  }

  aboutToAppear(): void {
    Logger.info('Download', '生命周期',
      `进入下载演示页，设备形态 ${this.layout.form}，文档选择器${this.layout.pickerSupported ? '可用' : '不可用'}`);
  }

  aboutToDisappear(): void {
    if (this.picker !== null) {
      this.picker.dispose();
      this.picker = null;
    }
    Logger.info('Download', '生命周期', `离开下载演示页，最终状态 ${this.getString(downloadStateName(this.state))}`);
  }

  private toggleIcon(): void {
    this.iconFilled = !this.iconFilled;
    this.contentOptions = {
      icon: this.iconFilled ? DownloadIconStyle.FULL_FILLED : DownloadIconStyle.LINES,
      text: DownloadDescription.DOWNLOAD_FILE
    };
    Logger.info('Download', '样式', `图标切换为 ${this.iconFilled ? 'FULL_FILLED' : 'LINES'}`);
  }

  private toggleLayout(): void {
    this.horizontal = !this.horizontal;
    this.styleOptions = {
      iconSize: '28vp',
      layoutDirection: this.horizontal ? DownloadLayoutDirection.HORIZONTAL : DownloadLayoutDirection.VERTICAL,
      fontSize: '16fp',
      fontStyle: FontStyle.Normal,
      fontWeight: FontWeight.Medium,
      fontColor: AppColors.WHITE,
      iconColor: AppColors.WHITE,
      textIconSpace: '8vp'
    };
    Logger.info('Download', '样式', `排列切换为 ${this.horizontal ? 'HORIZONTAL' : 'VERTICAL'}`);
  }

  private downloadAction(): void {
    // 选择器打开期间重复点击会覆盖 this.picker，旧实例的定时器无人清理并可能触发过期回调，
    // 导致重复写沙箱与状态被旧结果覆盖；这里以 this.picker 作为“进行中”判据直接忽略。
    if (this.picker !== null) {
      Logger.warn('Download', '下载', '文档选择器已打开，忽略重复点击');
      return;
    }
    this.state = DownloadState.PICKING;
    Logger.info('Download', '下载',
      `开始下载，pickerSupported=${this.layout.pickerSupported}，目标=${this.layout.pickerSupported ? '选择器' : '沙箱'}`);
    if (!this.layout.pickerSupported) {
      this.saveToSandbox(`设备形态 ${this.layout.form} 未提供文档选择器`);
      return;
    }
    try {
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      this.picker = new DownloadPicker(context);
      this.picker.open((outcome: PickerOutcome) => {
        this.handlePickerOutcome(outcome);
      });
      Logger.info('Download', '下载', `已打开文档选择器（DOWNLOAD 模式），超时 ${PICKER_TIMEOUT_MS}ms`);
    } catch (err) {
      const error = err as BusinessError;
      Logger.error('Download', '下载', formatError('打开文档选择器', error.code, error.message));
      this.saveToSandbox(`选择器不可用：${error.message}`);
    }
  }

  private handlePickerOutcome(outcome: PickerOutcome): void {
    this.picker = null;
    if (outcome.success) {
      this.state = nextDownloadState(this.state, true);
      this.lastPath = outcome.path;
      Logger.info('Download', '下载', `选择器返回保存路径：${outcome.path}`);
      return;
    }
    const info = errorInfo(outcome.code, outcome.message);
    if (outcome.timedOut) {
      Logger.warn('Download', '下载', `选择器超时：${info.describe()}`);
      this.saveToSandbox(`${info.message}（超过 ${PICKER_TIMEOUT_MS / 1000} 秒）`);
      return;
    }
    Logger.warn('Download', '下载', `选择器失败：${info.describe()}；${info.hint}`);
    this.saveToSandbox(`选择器不可用 ${info.describe()}`);
  }

  private saveToSandbox(reason: string): void {
    try {
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const fileName = buildDownloadFileName(new Date());
      const result = saveTextToSandbox(context.filesDir, fileName, buildDownloadContent(new Date()));
      if (result.success) {
        this.state = nextDownloadState(DownloadState.PICKING, false);
        this.lastPath = result.path;
        Logger.warn('Download', '下载',
          `${reason}，已降级写入沙箱：${result.path}（${formatBytes(result.bytes)}）`);
      } else {
        this.state = DownloadState.FAILED;
        Logger.error('Download', '下载', `${reason}；${result.message}`);
      }
    } catch (err) {
      const error = err as BusinessError;
      this.state = DownloadState.FAILED;
      Logger.error('Download', '下载',
        `${reason}；获取 UIAbilityContext 失败：${formatError('写入沙箱', error.code, error.message)}`);
    }
  }

  build() {
    DemoPageScaffold({
      title: 'DownloadFileButton',
      subtitle: $r('app.string.download_page_subtitle'),
      logSource: 'Download',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.PAGE }) {
            Text($r('app.string.download_section_preview'))
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')

            ForEach([`${this.iconFilled}-${this.horizontal}`], (key: string) => {
              DownloadFileButton({
                contentOptions: this.contentOptions,
                styleOptions: this.styleOptions
              })
                .backgroundColor(AppColors.PRIMARY)
                .borderRadius(AppRadius.PILL)
                .padding({
                  top: AppSpacing.XL,
                  bottom: AppSpacing.XL,
                  left: AppSpacing.XLARGE,
                  right: AppSpacing.XLARGE
                })
                .enabled(this.state !== DownloadState.PICKING)
                .onClick(() => this.downloadAction())
            }, (key: string) => key)

            Text(this.getString($r('app.string.download_style_summary'),
              this.iconFilled ? this.getString($r('app.string.download_icon_filled')) :
                this.getString($r('app.string.download_icon_lines')),
              this.horizontal ? this.getString($r('app.string.orientation_horizontal')) :
                this.getString($r('app.string.orientation_vertical'))))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')

            Row({ space: AppSpacing.MD }) {
              Button($r('app.string.download_btn_toggle_icon'))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .onClick(() => this.toggleIcon())
              Button($r('app.string.download_btn_toggle_layout'))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .onClick(() => this.toggleLayout())
            }
            .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.PAGE)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.SM }) {
            Row() {
              Text($r('app.string.label_current_state'))
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(downloadStateName(this.state))
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.PRIMARY)
            }
            .width('100%')

            Text(this.getString($r('app.string.download_device_info'), this.layout.form,
              this.layout.pickerSupported ? this.getString($r('app.string.available')) :
                this.getString($r('app.string.unavailable'))))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')

            Text(this.lastPath.length > 0 ? this.lastPath : this.getString($r('app.string.download_empty')))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')
              .maxLines(3)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          Column({ space: AppSpacing.SM }) {
            Text($r('app.string.label_impl_title'))
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text($r('app.string.download_impl_desc'))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: $r('app.string.log_title_download'), filterSource: 'Download' })
        }
        .width('100%')
        .constraintSize({ maxWidth: this.layout.pageMaxWidth })
        .padding(AppSpacing.PAGE)
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
  }
}
