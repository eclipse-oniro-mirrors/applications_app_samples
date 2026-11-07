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

/**
 * 演示页共用的展示型组件与配色映射。
 * tone 到颜色的映射做成纯函数，既方便页面复用，也能在本地单测里直接断言。
 */

import { common } from '@kit.AbilityKit';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';

export enum WidgetTone {
  NEUTRAL = 'neutral',
  PRIMARY = 'primary',
  SUCCESS = 'success',
  WARNING = 'warning',
  DANGER = 'danger'
}

export function toneTextColor(tone: WidgetTone): string {
  switch (tone) {
    case WidgetTone.PRIMARY:
      return AppColors.PRIMARY;
    case WidgetTone.SUCCESS:
      return AppColors.SUCCESS;
    case WidgetTone.WARNING:
      return AppColors.WARNING;
    case WidgetTone.DANGER:
      return AppColors.DANGER;
    default:
      return AppColors.TEXT_SECONDARY;
  }
}

export function toneSoftColor(tone: WidgetTone): string {
  switch (tone) {
    case WidgetTone.PRIMARY:
      return AppColors.PRIMARY_SOFT;
    case WidgetTone.SUCCESS:
      return AppColors.SUCCESS_SOFT;
    case WidgetTone.WARNING:
      return AppColors.WARNING_SOFT;
    case WidgetTone.DANGER:
      return AppColors.DANGER_SOFT;
    default:
      return AppColors.SOFT_BG;
  }
}

/**
 * 把资源取成本地化字符串，给只接受 string 的接口用（Navigation/NavDestination 的 title、
 * 需要拼进日志或结果行的文案）。带占位符的资源最多支持两个参数，够本示例使用。
 */
export function textOfResource(context: common.Context | undefined, res: Resource): string {
  if (context === undefined) {
    return '';
  }
  const args: Array<string | number> = res.params === undefined ? [] : res.params as Array<string | number>;
  if (args.length === 0) {
    return context.resourceManager.getStringSync(res.id);
  }
  if (args.length === 1) {
    return context.resourceManager.getStringSync(res.id, args[0]);
  }
  return context.resourceManager.getStringSync(res.id, args[0], args[1]);
}

/**
 * 注意：这几个展示组件的入参必须是 @Prop（不能用常规成员变量）。
 * 常规成员变量只在组件创建时赋值一次，父组件的 @State 变化不会同步进来，
 * 表现就是页面上「探测结果 / 状态胶囊 / 按钮文案」停留在首帧、不再刷新。
 */

/** 分组卡片：标题 + 可选副标题 + 自定义内容 */
@Component
export struct SectionCard {
  @Prop title: ResourceStr = '';
  @Prop subtitle: ResourceStr = '';
  @BuilderParam content: () => void;

  private hasSubtitle(): boolean {
    if (typeof this.subtitle === 'string') {
      return this.subtitle.length > 0;
    }
    return true;
  }

  build() {
    Column({ space: AppSpacing.MD }) {
      Row({ space: AppSpacing.MD }) {
        Text(this.title)
          .fontSize(AppText.TITLE)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        if (this.hasSubtitle()) {
          Text(this.subtitle)
            .fontSize(AppText.SMALL)
            .fontColor(AppColors.TEXT_TERTIARY)
        }
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      this.content()
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(AppSpacing.CARD)
    .backgroundColor(AppColors.CARD_BG)
    .borderRadius(AppRadius.CARD)
  }
}

/** 动作按钮：低饱和底色 + 高对比文字，避免一屏出现过多实心大按钮 */
@Component
export struct ActionButton {
  @Prop label: ResourceStr = '';
  @Prop tone: WidgetTone = WidgetTone.PRIMARY;
  @Prop actionEnabled: boolean = true;
  onAction: () => void = () => {
  };

  build() {
    Button(this.label)
      .fontSize(AppText.BODY)
      .fontColor(toneTextColor(this.tone))
      .backgroundColor(toneSoftColor(this.tone))
      .height(AppSize.BUTTON)
      .borderRadius(AppRadius.SMALL)
      .padding({ left: AppSpacing.XL, right: AppSpacing.XL })
      .enabled(this.actionEnabled)
      .opacity(this.actionEnabled ? 1 : 0.45)
      .onClick(() => {
        this.onAction();
      })
  }
}

/** 状态胶囊：用于展示 ProbeStatus / 权限 / 订阅状态 */
@Component
export struct StatusChip {
  @Prop text: ResourceStr = '';
  @Prop tone: WidgetTone = WidgetTone.NEUTRAL;

  build() {
    Text(this.text)
      .fontSize(AppText.SMALL)
      .fontColor(toneTextColor(this.tone))
      .backgroundColor(toneSoftColor(this.tone))
      .padding({
        left: AppSpacing.MD,
        right: AppSpacing.MD,
        top: AppSpacing.XS,
        bottom: AppSpacing.XS
      })
      .borderRadius(AppRadius.TAG)
  }
}

/** 键值行：左侧固定宽度标签，右侧展示值，mono 用于设备地址等需要等宽的文本 */
@Component
export struct KeyValueRow {
  @Prop label: ResourceStr = '';
  @Prop value: ResourceStr = '';
  @Prop mono: boolean = false;
  @Prop valueColor: string = AppColors.TEXT_STRONG;

  build() {
    Row({ space: AppSpacing.MD }) {
      Text(this.label)
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width(88)
      Text(this.value)
        .fontSize(this.mono ? AppText.SMALL : AppText.BODY)
        .fontColor(this.valueColor)
        .fontFamily(this.mono ? 'monospace' : 'sans-serif')
        .layoutWeight(1)
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
  }
}
