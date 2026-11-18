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
 
import { HalfScreenLaunchComponent } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import { HALF_SCREEN_APP_ID } from '../../common/AppConstants';
import { AppColors, AppRadius, AppSpacing, AppText, AppSize } from '../../common/Theme';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { Logger } from '../../utils/Logger';
import { formatError } from '../../utils/ErrorUtil';

@Component
export struct HalfScreenDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State lastFailed: boolean = false;
  @State lastResult: string = '';
  appId: string = HALF_SCREEN_APP_ID;

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
    this.lastResult = this.getString($r('app.string.half_result_idle'));
    Logger.info('HalfScreen', '生命周期', `进入半屏演示页，appId=${this.appId}，${this.layout.describe()}`);
  }

  aboutToDisappear(): void {
    Logger.info('HalfScreen', '生命周期', '离开半屏演示页');
  }

  build() {
    DemoPageScaffold({
      title: 'HalfScreenLaunchComponent',
      subtitle: $r('app.string.half_page_subtitle'),
      logSource: 'HalfScreen',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.CARD }) {
            Text($r('app.string.half_entry_title'))
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')

            HalfScreenLaunchComponent({
              appId: this.appId,
              options: {},
              onTerminated: (info: TerminationInfo) => {
                this.lastFailed = false;
                this.lastResult = this.getString($r('app.string.half_result_terminated'));
                Logger.info('HalfScreen', '终止', `目标原子化服务结束：${JSON.stringify(info.want)}`);
              },
              onError: (err: BusinessError) => {
                this.lastFailed = true;
                this.lastResult = this.getString($r('app.string.half_result_error'), err.code, err.message);
                Logger.error('HalfScreen', '错误',
                  `${formatError('拉起原子化服务', err.code, err.message)}；占位 appId 未在 AGC 注册，属预期结果`);
              },
              onReceive: (data: Record<string, Object>) => {
                Logger.info('HalfScreen', '接收', `收到目标服务数据：${JSON.stringify(data)}`);
              }
            }) {
              Column({ space: AppSpacing.MD }) {
                Image($r('sys.media.ohos_ic_public_phone'))
                  .width(AppSize.LOGO)
                  .height(AppSize.LOGO)
                  .fillColor(AppColors.PRIMARY)
                Text($r('app.string.half_trigger_title'))
                  .fontSize(AppText.SECTION)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(AppColors.TEXT_PRIMARY)
                Text($r('app.string.half_trigger_hint'))
                  .fontSize(AppText.SMALL)
                  .fontColor(AppColors.TEXT_TERTIARY)
              }
              .width('100%')
              .padding(AppSpacing.XLARGE)
              .backgroundColor(AppColors.HIGHLIGHT_BG)
              .borderRadius(AppRadius.LARGE)
            }

            Column({ space: AppSpacing.XS }) {
              Text($r('app.string.half_recent_title'))
                .fontSize(AppText.SMALL)
                .fontColor(AppColors.TEXT_TERTIARY)
                .width('100%')
              Text(this.lastResult)
                .fontSize(AppText.BODY)
                .fontColor(this.lastFailed ? AppColors.DANGER : AppColors.TEXT_SECONDARY)
                .width('100%')
            }
            .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.PAGE)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.MD }) {
            Text($r('app.string.half_stub_title'))
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text(this.getString($r('app.string.half_appid_prefix'), this.appId))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
            Text($r('app.string.half_stub_desc'))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: $r('app.string.log_title_half'), filterSource: 'HalfScreen' })
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
