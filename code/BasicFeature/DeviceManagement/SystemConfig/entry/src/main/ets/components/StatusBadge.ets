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

import { PageConstants } from 'library';

/**
 * 状态标签组件属性接口。
 * 定义状态标签的输入参数。
 */
export interface StatusBadgeProps {
  /** 标签文本 */
  text: string;
  /** 标签颜色 */
  color: string;
  /** 背景颜色 */
  backgroundColor: string;
}

/**
 * 状态标签组件。
 * 显示带颜色的状态标签，用于标识操作结果或当前状态。
 */
@Component
export struct StatusBadge {
  /** 标签文本 */
  @Prop text: ResourceStr = '';
  /** 标签文字颜色 */
  @Prop textColor: string = PageConstants.COLOR_TEXT_PRIMARY;
  /** 标签背景颜色 */
  @Prop bgColor: string = PageConstants.COLOR_CARD;

  build() {
    Text(this.text)
      .fontSize(PageConstants.FONT_SIZE_SMALL)
      .fontColor(this.textColor)
      .backgroundColor(this.bgColor)
      .borderRadius(4)
      .padding({
        left: 8,
        right: 8,
        top: 4,
        bottom: 4
      })
  }
}
