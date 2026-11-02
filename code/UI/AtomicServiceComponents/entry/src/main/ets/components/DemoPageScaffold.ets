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
 
import { AppColors, AppSize, AppSpacing, AppText } from '../common/Theme';
import { canPopNavStack } from '../model/DemoLogic';
import { Logger } from '../utils/Logger';

@Component
export struct DemoPageScaffold {
  title: string = '';
  subtitle: string = '';
  logSource: string = '';
  navPathStack: NavPathStack = new NavPathStack();
  @StorageLink('navHideTitle') navHideTitle: boolean = false;
  @StorageLink('navGradient') navGradient: boolean = true;
  @BuilderParam content: () => void;

  private goBack(): void {
    if (!canPopNavStack(this.navPathStack.size())) {
      Logger.warn(this.logSource, '导航', '导航栈为空，忽略返回');
      return;
    }
    try {
      this.navPathStack.pop();
      Logger.info(this.logSource, '导航', '点击返回，关闭当前演示页');
    } catch (err) {
      Logger.error(this.logSource, '导航', `返回失败：${err}`);
    }
  }

  build() {
    Column({ space: AppSpacing.LG }) {
      Row({ space: AppSpacing.LG }) {
        if (this.navHideTitle) {
          Button('返回')
            .fontSize(AppText.BODY)
            .height(AppSize.BUTTON_SM)
            .backgroundColor(AppColors.PRIMARY_SOFT)
            .fontColor(AppColors.PRIMARY)
            .onClick(() => {
              this.goBack();
            })
        }

        Column({ space: AppSpacing.XS }) {
          Text(this.title)
            .fontSize(AppText.DISPLAY)
            .fontWeight(FontWeight.Bold)
            .fontColor(AppColors.TEXT_PRIMARY)
            .width('100%')
          Text(this.subtitle)
            .fontSize(AppText.LABEL)
            .fontColor(AppColors.TEXT_SECONDARY)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
      }
      .width('100%')
      .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, top: AppSpacing.XL, bottom: AppSpacing.MD })

      this.content()
    }
    .width('100%')
    .height('100%')
    .linearGradient(this.navGradient ? {
      angle: 180,
      colors: [[AppColors.GRADIENT_PRIMARY, 0], [AppColors.GRADIENT_SECONDARY, 0.55],
        [AppColors.GRADIENT_SECONDARY, 1]]
    } : {
      angle: 180,
      colors: [[AppColors.PAGE_BG, 0], [AppColors.PAGE_BG, 1]]
    })
    .padding({ bottom: AppSpacing.XLARGE })
  }
}
