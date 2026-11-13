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
 * Props interface for the action button component.
 */
export interface ActionButtonProps {
  /** Button text */
  text: string;
  /** Button type */
  type: 'primary' | 'secondary' | 'danger';
  /** Whether the button is disabled */
  disabled: boolean;
  /** Click callback */
  onClick: () => void;
}

/**
 * Action button component.
 * Provides three styles (primary, secondary, danger) and supports a disabled state.
 */
@Component
export struct ActionButton {
  /** Button text */
  @Prop buttonText: ResourceStr = '';
  /** Button type identifier */
  @Prop buttonType: string = 'primary';
  /** Whether the button is disabled */
  @Prop isDisabled: boolean = false;
  /** Click callback */
  onButtonClick: () => void = () => {};

  /**
   * Gets the button background color.
   * @returns {string} The background color value
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
   * Gets the button text color.
   * @returns {string} The text color value
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
   * Gets the button border color.
   * @returns {string} The border color value
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
