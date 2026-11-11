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
 * 操作按钮组件属性接口。
 */
export interface ActionButtonProps {
  /** 按钮文本 */
  text: string;
  /** 按钮类型 */
  type: 'primary' | 'secondary' | 'danger';
  /** 是否禁用 */
  disabled: boolean;
  /** 点击回调 */
  onClick: () => void;
}

/**
 * 操作按钮组件。
 * 提供三种样式（主要、次要、危险）的按钮，支持禁用状态。
 */
@Component
export struct ActionButton {
  /** 按钮文本 */
  @Prop buttonText: ResourceStr = '';
  /** 按钮类型标识 */
  @Prop buttonType: string = 'primary';
  /** 是否禁用 */
  @Prop isDisabled: boolean = false;
  /** 点击回调 */
  onButtonClick: () => void = () => {};

  /**
   * 获取按钮背景颜色。
   * @returns {string} 背景颜色值
   */
  private getBackgroundColor(): string {
    if (this.isDisabled) {
      return '#BDBDBD';
    }
    switch (this.buttonType) {
      case 'primary':
        return PageConstants.COLOR_PRIMARY;
      case 'secondary':
        return PageConstants.COLOR_CARD;
      case 'danger':
        return PageConstants.COLOR_ERROR;
      default:
        return PageConstants.COLOR_PRIMARY;
    }
  }

  /**
   * 获取按钮文字颜色。
   * @returns {string} 文字颜色值
   */
  private getTextColor(): string {
    if (this.isDisabled) {
      return '#9E9E9E';
    }
    switch (this.buttonType) {
      case 'primary':
        return '#FFFFFF';
      case 'secondary':
        return PageConstants.COLOR_PRIMARY;
      case 'danger':
        return '#FFFFFF';
      default:
        return '#FFFFFF';
    }
  }

  /**
   * 获取按钮边框颜色。
   * @returns {string} 边框颜色值
   */
  private getBorderColor(): string {
    if (this.isDisabled) {
      return '#BDBDBD';
    }
    switch (this.buttonType) {
      case 'secondary':
        return PageConstants.COLOR_PRIMARY;
      default:
        return 'transparent';
    }
  }

  build() {
    Button(this.buttonText)
      .width('100%')
      .height(PageConstants.BUTTON_HEIGHT)
      .fontSize(PageConstants.FONT_SIZE_BODY)
      .fontColor(this.getTextColor())
      .backgroundColor(this.getBackgroundColor())
      .borderRadius(PageConstants.BUTTON_BORDER_RADIUS)
      .border({
        width: this.buttonType === 'secondary' ? 1 : 0,
        color: this.getBorderColor()
      })
      .enabled(!this.isDisabled)
      .onClick(() => {
        if (!this.isDisabled) {
          this.onButtonClick();
        }
      })
  }
}
