/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { PAGE_ID_NEW_BACK } from '../common/MenuIds';
import { logger } from '../util/Logger';

const TAG: string = 'New';

@Entry
@Component
struct New {
  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_back'))
          .size({ width: 20, height: 18 })
          .margin({ right: 18 })
          .id(PAGE_ID_NEW_BACK)
          .onClick(() => {
            const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            context.terminateSelf((err: BusinessError) => {
              logger.info(`${TAG} terminateSelf err:${JSON.stringify(err)}`);
            })
          })
        Text($r('app.string.NewAbility_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }.height(56)
      .padding({ left: 26, right: 26 })
      .width('100%')

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Column() {
          Image($r('app.media.pic_empty')).width('33%')
          Text($r('app.string.empty'))
            .fontSize(14)
        }
      }.width('100%')
      .height('90%')
    }
    .width('100%')
    .height('100%')
    .padding({ top: 36, bottom: 0 })
    .backgroundColor($r('sys.color.ohos_id_color_text_field_sub_bg'))
  }
}
