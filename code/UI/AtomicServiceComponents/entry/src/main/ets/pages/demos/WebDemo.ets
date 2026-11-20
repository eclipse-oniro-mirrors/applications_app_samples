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
  AtomicServiceWeb,
  AtomicServiceWebController,
  OnErrorReceiveEvent,
  OnMessageEvent,
  OnPageBeginEvent,
  OnPageEndEvent,
  OnProgressChangeEvent
} from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../common/Theme';
import { Logger } from '../../utils/Logger';
import { formatError } from '../../utils/ErrorUtil';
import { progressBucket, truncateMiddle } from '../../utils/FormatUtil';

@Component
export struct WebDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State controller: AtomicServiceWebController = new AtomicServiceWebController();
  @State progress: number = 0;
  private lastProgressBucket: number = -1;

  aboutToAppear(): void {
    Logger.info('Web', '生命周期', `进入 Web 演示页，页面高度 ${this.layout.webHeight}vp`);
  }

  aboutToDisappear(): void {
    Logger.info('Web', '生命周期', `离开 Web 演示页，最后进度 ${this.progress}%`);
  }

  private refreshPage(): void {
    try {
      this.controller.refresh();
      Logger.info('Web', '控制', '刷新页面');
    } catch (err) {
      const error = err as BusinessError;
      Logger.error('Web', '控制', formatError('刷新', error.code, error.message));
    }
  }

  private goBack(): void {
    try {
      this.controller.backward();
      Logger.info('Web', '控制', '后退一步');
    } catch (err) {
      const error = err as BusinessError;
      Logger.error('Web', '控制', formatError('后退', error.code, error.message));
    }
  }

  private goForward(): void {
    try {
      this.controller.forward();
      Logger.info('Web', '控制', '前进一步');
    } catch (err) {
      const error = err as BusinessError;
      Logger.error('Web', '控制', formatError('前进', error.code, error.message));
    }
  }

  private onProgress(event: OnProgressChangeEvent): void {
    this.progress = event.newProgress;
    const bucket = progressBucket(event.newProgress);
    if (bucket !== this.lastProgressBucket) {
      this.lastProgressBucket = bucket;
      Logger.debug('Web', '进度', `加载进度 ${event.newProgress}%`);
    }
  }

  build() {
    DemoPageScaffold({
      title: 'AtomicServiceWeb',
      subtitle: $r('app.string.web_page_subtitle'),
      logSource: 'Web',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Row({ space: AppSpacing.MD }) {
            Button($r('app.string.web_btn_refresh'))
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(AppColors.PRIMARY_SOFT)
              .fontColor(AppColors.PRIMARY)
              .onClick(() => this.refreshPage())
            Button($r('app.string.web_btn_back'))
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(AppColors.PRIMARY_SOFT)
              .fontColor(AppColors.PRIMARY)
              .onClick(() => this.goBack())
            Button($r('app.string.web_btn_forward'))
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(AppColors.PRIMARY_SOFT)
              .fontColor(AppColors.PRIMARY)
              .onClick(() => this.goForward())
            Blank()
            Text(`${this.progress}%`)
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
          }
          .width('100%')
          .padding(AppSpacing.XL)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          Column() {
            Progress({ value: this.progress, total: 100, type: ProgressType.Linear })
              .width('100%')
              .height(AppSize.PROGRESS)
              .color(AppColors.PRIMARY)

            AtomicServiceWeb({
              src: $rawfile('index.html'),
              controller: this.controller,
              onPageBegin: (event: OnPageBeginEvent) => {
                Logger.info('Web', '页面', `开始加载 ${event.url}`);
              },
              onPageEnd: (event: OnPageEndEvent) => {
                Logger.info('Web', '页面', `加载完成 ${event.url}，进度 ${this.progress}%`);
              },
              onProgressChange: (event: OnProgressChangeEvent) => {
                this.onProgress(event);
              },
              onMessage: (event: OnMessageEvent) => {
                Logger.info('Web', 'H5 消息', truncateMiddle(JSON.stringify(event.data), 200));
              },
              onErrorReceive: (event: OnErrorReceiveEvent) => {
                Logger.error('Web', '加载错误',
                  `${event.error.getErrorCode()} ${event.error.getErrorInfo()} ${event.request.getRequestUrl()}`);
              },
              onControllerAttached: () => {
                Logger.info('Web', '控制器', 'AtomicServiceWebController 已绑定');
              }
            })
              .width('100%')
              .height(this.layout.webHeight)
          }
          .width('100%')
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .clip(true)

          Column({ space: AppSpacing.SM }) {
            Text($r('app.string.web_local_title'))
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text($r('app.string.web_local_desc'))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: $r('app.string.log_title_web'), filterSource: 'Web' })
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
