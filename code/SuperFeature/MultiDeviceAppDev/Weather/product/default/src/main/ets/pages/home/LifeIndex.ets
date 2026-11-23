/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { getLifeData, MyDataSource, SuitData, Style } from '@ohos/common'

@Preview
@Component
export default struct LifeIndex {
  private lifeData: SuitData[] = getLifeData(0)
  private lifeDataResource: MyDataSource<SuitData> = new MyDataSource(this.lifeData)

  build() {
    Grid() {
      LazyForEach(this.lifeDataResource, (item: SuitData) => {
        GridItem() {
          Column() {
            Image(item.src)
              .width(Style.ICON_SIZE_NORMAL)
              .height(Style.ICON_SIZE_NORMAL)
              .objectFit(ImageFit.Contain)
            Text(item.value)
              .fontSize(Style.FONT_SIZE_NORMAL)
              .fontColor($r('app.color.white'))
              .margin({ top: Style.LIFE_INDEX_VALUE_MARGIN_TOP })
            Text(item.desc)
              .fontSize(Style.FONT_SIZE_SMALL)
              .fontColor($r('app.color.text_white_60'))
              .margin({ top: Style.LIFE_INDEX_DESC_MARGIN_TOP })
          }
        }
      }, (item: SuitData) => item.desc)
    }
    .height(Style.CARD_HEIGHT)
    .columnsTemplate(Style.LIFE_INDEX_COLUMNS)
    .rowsTemplate(Style.LIFE_INDEX_ROWS)
    .backgroundColor(Style.CARD_BACKGROUND_COLOR)
    .borderRadius(Style.NORMAL_RADIUS)
  }

  aboutToAppear() {
    this.lifeDataResource.setData(this.lifeData)
  }
}