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
  jumpErrorHintRes,
  jumpStateName,
  jumpStateNameRes,
  jumpTargetExpectationRes,
  jumpTargetTitleRes
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
  @State message: string = '';
  @State currentTarget: string = '';
  private activeToken: number = 0;
  private timeoutId: number = -1;

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
    this.message = this.getString($r('app.string.jump_msg_idle'));
    Logger.info('Jump', '生命周期', '进入应用间跳转演示页');
  }

  aboutToDisappear(): void {
    this.clearTimer();
    // 使在途 startAbility 的 token 失效：页面销毁后迟到的 resolve/reject 不再写回 @State
    this.activeToken = beginAttempt(this.activeToken);
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
      this.message = this.getString($r('app.string.jump_msg_context_failed'));
      Logger.error('Jump', '跳转', this.message);
      return;
    }
    const want: Want = {
      bundleName: target.bundleName,
      abilityName: target.abilityName
    };
    this.activeToken = beginAttempt(this.activeToken);
    const token = this.activeToken;
    this.currentTarget = this.getString(jumpTargetTitleRes(target.key));
    this.state = JumpState.WAITING;
    this.message = this.getString($r('app.string.jump_msg_starting'), this.currentTarget);
    Logger.info('Jump', '跳转',
      `startAbility → ${target.describe()}（超时 ${JUMP_TIMEOUT_MS}ms）`);
    this.clearTimer();
    this.timeoutId = setTimeout(() => {
      this.timeoutId = -1;
      if (!isActiveAttempt(token, this.activeToken)) {
        return;
      }
      this.activeToken = beginAttempt(this.activeToken);
      this.state = JumpState.TIMEOUT;
      this.message = this.getString($r('app.string.jump_msg_timeout'),
        this.getString(jumpTargetTitleRes(target.key)), JUMP_TIMEOUT_MS / 1000);
      Logger.warn('Jump', '超时', this.message);
    }, JUMP_TIMEOUT_MS);
    context.startAbility(want).then(() => {
      if (!isActiveAttempt(token, this.activeToken)) {
        return;
      }
      this.clearTimer();
      this.state = JumpState.SUCCESS;
      this.message = this.getString($r('app.string.jump_msg_success'),
        this.getString(jumpTargetTitleRes(target.key)));
      Logger.info('Jump', '跳转', `${this.message}（${target.describe()}）`);
    }).catch((err: BusinessError) => {
      if (!isActiveAttempt(token, this.activeToken)) {
        return;
      }
      this.clearTimer();
      this.state = JumpState.REJECTED;
      this.message = `${describeJumpResult(err.code, err.message)}；${this.getString(jumpErrorHintRes(err.code))}`;
      Logger.warn('Jump', '跳转', `拉起 ${target.title} 失败：${this.message}`);
    });
  }

  @Builder
  targetCard(target: JumpTarget) {
    Column({ space: AppSpacing.SM }) {
      Row({ space: AppSpacing.MD }) {
        Text(jumpTargetTitleRes(target.key))
          .fontSize(AppText.TITLE)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        Button($r('app.string.jump_btn_launch'))
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
      Text(jumpTargetExpectationRes(target.key))
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
      title: $r('app.string.dest_jump'),
      subtitle: $r('app.string.jump_page_subtitle'),
      logSource: 'Jump',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.MD }) {
            Text($r('app.string.jump_section_targets'))
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
              Text($r('app.string.label_current_state'))
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(jumpStateNameRes(this.state))
                .fontSize(AppText.TITLE)
                .fontColor(this.state === JumpState.REJECTED || this.state === JumpState.TIMEOUT ?
                  AppColors.DANGER : AppColors.PRIMARY)
            }
            .width('100%')

            Text(this.message)
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')

            Text(this.currentTarget.length > 0 ?
              $r('app.string.jump_target_prefix', this.currentTarget) : $r('app.string.jump_target_none'))
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
            Text($r('app.string.label_impl_title'))
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text($r('app.string.jump_impl_desc'))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: $r('app.string.log_title_jump'), filterSource: 'Jump' })
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
