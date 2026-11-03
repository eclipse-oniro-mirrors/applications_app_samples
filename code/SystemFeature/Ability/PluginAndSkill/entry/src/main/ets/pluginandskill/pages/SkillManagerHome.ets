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

import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../../util/Logger';
import {
  PAGE_PADDING,
  SECTION_SPACING,
  TITLE_FONT_SIZE,
  BODY_FONT_SIZE,
  CONTENT_MAX_WIDTH
} from '../../util/Constant';

const BUTTON_HEIGHT = 48;

@Entry
@Component
struct SkillManagerHome {
  private async navigateTo(url: string): Promise<void> {
    try {
      await this.getUIContext().getRouter().pushUrl({ url: url });
    } catch (error) {
      const err = error as BusinessError;
      Logger.error('Failed to open skill page: ' + err.code + ', ' + err.message);
    }
  }

  build(): void {
    Column({ space: SECTION_SPACING }) {
      Text($r('app.string.skill_page_title'))
        .id('skill_page_title')
        .fontSize(TITLE_FONT_SIZE)
        .fontWeight(FontWeight.Bold)
      Text($r('app.string.skill_page_description'))
        .id('skill_page_description')
        .fontSize(BODY_FONT_SIZE)
        .fontColor($r('app.color.secondary_text'))

      Button($r('app.string.self_skill_query_title'))
        .id('self_skill_query_button')
        .width('100%')
        .height(BUTTON_HEIGHT)
        .onClick(() => {
          this.navigateTo('pluginandskill/pages/SelfSkillQueryPage');
        })
      Button($r('app.string.bundle_skill_query_title'))
        .id('bundle_skill_query_button')
        .width('100%')
        .height(BUTTON_HEIGHT)
        .onClick(() => {
          this.navigateTo('pluginandskill/pages/BundleSkillQueryPage');
        })
      Button($r('app.string.all_skills_query_title'))
        .id('all_skills_query_button')
        .width('100%')
        .height(BUTTON_HEIGHT)
        .onClick(() => {
          this.navigateTo('pluginandskill/pages/AllSkillsQueryPage');
        })
    }
    .width('100%')
    .height('100%')
    .constraintSize({ maxWidth: CONTENT_MAX_WIDTH })
    .justifyContent(FlexAlign.Center)
    .padding(PAGE_PADDING)
    .backgroundColor($r('app.color.page_background'))
  }
}
