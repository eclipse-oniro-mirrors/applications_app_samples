import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import {
  JUMP_TARGETS,
  JumpState,
  JumpTarget,
  beginAttempt,
  describeJumpResult,
  isActiveAttempt,
  jumpErrorHint,
  jumpStateName
} from '../../model/AbilityJump';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { JUMP_TIMEOUT_MS } from '../../common/AppConstants';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../common/Theme';
import { Logger } from '../../utils/Logger';

@Component
export struct CrossAbilityDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State state: JumpState = JumpState.IDLE;
  @State message: string = '尚未发起跳转';
  @State currentTarget: string = '';
  private activeToken: number = 0;
  private timeoutId: number = -1;

  aboutToAppear(): void {
    Logger.info('Jump', '生命周期', '进入应用间跳转演示页');
  }

  aboutToDisappear(): void {
    this.clearTimer();
    Logger.info('Jump', '生命周期', `离开应用间跳转演示页，最终状态 ${jumpStateName(this.state)}`);
  }

  private clearTimer(): void {
    if (this.timeoutId >= 0) {
      clearTimeout(this.timeoutId);
      this.timeoutId = -1;
    }
  }

  private jump(target: JumpTarget): void {
    let context: common.UIAbilityContext;
    try {
      context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    } catch (err) {
      this.state = JumpState.REJECTED;
      this.message = '获取 UIAbilityContext 失败';
      Logger.error('Jump', '跳转', this.message);
      return;
    }
    const want: Want = {
      bundleName: target.bundleName,
      abilityName: target.abilityName
    };
    this.activeToken = beginAttempt(this.activeToken);
    const token = this.activeToken;
    this.currentTarget = target.title;
    this.state = JumpState.WAITING;
    this.message = `正在拉起 ${target.title}…`;
    Logger.info('Jump', '跳转',
      `startAbility → ${target.describe()}（token=${token}，超时 ${JUMP_TIMEOUT_MS}ms）`);
    this.clearTimer();
    this.timeoutId = setTimeout(() => {
      this.timeoutId = -1;
      if (!isActiveAttempt(token, this.activeToken)) {
        return;
      }
      this.activeToken = beginAttempt(this.activeToken);
      this.state = JumpState.TIMEOUT;
      this.message = `${target.title} 超过 ${JUMP_TIMEOUT_MS / 1000} 秒未响应，已判定超时`;
      Logger.warn('Jump', '超时', this.message);
    }, JUMP_TIMEOUT_MS);
    context.startAbility(want).then(() => {
      if (!isActiveAttempt(token, this.activeToken)) {
        return;
      }
      this.clearTimer();
      this.state = JumpState.SUCCESS;
      this.message = `已拉起 ${target.title}`;
      Logger.info('Jump', '跳转', `${this.message}（${target.describe()}）`);
    }).catch((err: BusinessError) => {
      if (!isActiveAttempt(token, this.activeToken)) {
        return;
      }
      this.clearTimer();
      this.state = JumpState.REJECTED;
      this.message = `${describeJumpResult(err.code, err.message)}；${jumpErrorHint(err.code)}`;
      Logger.warn('Jump', '跳转', `拉起 ${target.title} 失败：${this.message}`);
    });
  }

  @Builder
  targetCard(target: JumpTarget) {
    Column({ space: AppSpacing.SM }) {
      Row({ space: AppSpacing.MD }) {
        Text(target.title)
          .fontSize(AppText.TITLE)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        Button('拉起')
          .fontSize(AppText.BODY)
          .height(AppSize.BUTTON)
          .backgroundColor(AppColors.PRIMARY)
          .fontColor(AppColors.WHITE)
          .onClick(() => {
            this.jump(target);
          })
      }
      .width('100%')

      Text(target.describe())
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.PRIMARY)
        .width('100%')
      Text(target.expectation)
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_SECONDARY)
        .width('100%')
    }
    .width('100%')
    .padding(AppSpacing.CARD)
    .backgroundColor(AppColors.CARD_BG)
    .borderRadius(AppRadius.LARGE)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    DemoPageScaffold({
      title: '应用间跳转',
      subtitle: '使用 startAbility 拉起其他应用。成功、拒绝与 3 秒超时三类结果都会写入日志。',
      logSource: 'Jump',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.MD }) {
            Text('目标应用')
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
            ForEach(JUMP_TARGETS, (target: JumpTarget) => {
              this.targetCard(target)
            }, (target: JumpTarget) => target.key)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.SM }) {
            Row() {
              Text('当前状态')
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(jumpStateName(this.state))
                .fontSize(AppText.TITLE)
                .fontColor(this.state === JumpState.REJECTED || this.state === JumpState.TIMEOUT ?
                  AppColors.DANGER : AppColors.PRIMARY)
            }
            .width('100%')

            Text(this.message)
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')

            Text(this.currentTarget.length > 0 ? `目标：${this.currentTarget}` : '目标：未选择')
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.SM }) {
            Text('实现说明')
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text('跳转使用 UIAbilityContext.startAbility 与显式 Want。示例内置三个目标：系统设置、本应用首页和未安装应用，分别对应成功、成功与 16000001 失败分支。每次发起都会生成新的 token，3 秒内没有结果则判定超时，迟到的回调会被 token 丢弃。')
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: 'Jump 事件', filterSource: 'Jump' })
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
