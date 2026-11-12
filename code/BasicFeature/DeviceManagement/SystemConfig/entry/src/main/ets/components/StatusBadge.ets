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
 * Props interface for the status badge component.
 * Defines the input parameters of the status badge.
 */
export interface StatusBadgeProps {
  /** Badge text */
  text: string;
  /** Badge color */
  color: string;
  /** Background color */
  backgroundColor: string;
}

/**
 * Status badge component.
 * Displays a colored badge used to indicate the operation result or current status.
 */
@Component
export struct StatusBadge {
  /** Badge text */
  @Prop text: ResourceStr = '';
  /** Badge text color */
  @Prop textColor: string = PageConstants.COLOR_TEXT_PRIMARY;
  /** Badge background color */
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
