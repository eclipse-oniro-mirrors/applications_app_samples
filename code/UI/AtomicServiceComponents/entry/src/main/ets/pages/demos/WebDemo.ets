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
      subtitle: '加载本地 rawfile 页面，两页之间可跳转，通过控制器操作前进、后退、刷新，并接收 H5 消息。',
      logSource: 'Web',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Row({ space: AppSpacing.MD }) {
            Button('刷新')
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(AppColors.PRIMARY_SOFT)
              .fontColor(AppColors.PRIMARY)
              .onClick(() => this.refreshPage())
            Button('后退')
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(AppColors.PRIMARY_SOFT)
              .fontColor(AppColors.PRIMARY)
              .onClick(() => this.goBack())
            Button('前进')
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
            Text('本地页面说明')
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text('页面位于 resources/rawfile/index.html 与 page2.html，不依赖网络。两页可互相跳转，跳转后“后退 / 前进”会在浏览历史中切换页面，onPageBegin / onPageEnd 同步记录。H5 中的“发送消息”按钮会调用 AtomicServiceWeb 注入的 JS SDK；如果当前运行环境未注入 JS SDK，页面会在状态区提示，不会崩溃。')
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: 'Web 事件', filterSource: 'Web' })
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
