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
  @State lastResult: string = '尚未触发拉起';
  appId: string = HALF_SCREEN_APP_ID;

  aboutToAppear(): void {
    Logger.info('HalfScreen', '生命周期', `进入半屏演示页，appId=${this.appId}，${this.layout.describe()}`);
  }

  aboutToDisappear(): void {
    Logger.info('HalfScreen', '生命周期', '离开半屏演示页');
  }

  build() {
    DemoPageScaffold({
      title: 'HalfScreenLaunchComponent',
      subtitle: '半屏嵌入启动原子化服务。当前使用占位 appId，开发板上会走 onError 降级路径。',
      logSource: 'HalfScreen',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.CARD }) {
            Text('嵌入启动入口')
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')

            HalfScreenLaunchComponent({
              appId: this.appId,
              options: {},
              onTerminated: (info: TerminationInfo) => {
                this.lastFailed = false;
                this.lastResult = '目标原子化服务已结束';
                Logger.info('HalfScreen', '终止', `目标原子化服务结束：${JSON.stringify(info.want)}`);
              },
              onError: (err: BusinessError) => {
                this.lastFailed = true;
                this.lastResult = `拉起失败（${err.code}）：${err.message.length > 0 ? err.message : '未知错误'}。占位 appId 无法在离线开发板解析，属预期结果。`;
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
                Text('点击触发拉起测试')
                  .fontSize(AppText.SECTION)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(AppColors.TEXT_PRIMARY)
                Text('占位 appId · 预期返回 onError，结果见下方')
                  .fontSize(AppText.SMALL)
                  .fontColor(AppColors.TEXT_TERTIARY)
              }
              .width('100%')
              .padding(AppSpacing.XLARGE)
              .backgroundColor(AppColors.HIGHLIGHT_BG)
              .borderRadius(AppRadius.LARGE)
            }

            Column({ space: AppSpacing.XS }) {
              Text('最近一次结果')
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
            Text('打桩说明')
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text(`当前 appId：${this.appId}`)
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
            Text('嵌入式拉起要求目标原子化服务已在 AGC 分配 appId，并且目标 Ability 继承 EmbeddableUIAbility。开发板离线环境不具备这两个条件，因此这里展示真实的 onError 降级路径。接入真实服务时，只需替换 appId，并确保目标服务支持嵌入式运行；未授权时系统会改为跳出式拉起。')
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: 'HalfScreen 事件', filterSource: 'HalfScreen' })
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
