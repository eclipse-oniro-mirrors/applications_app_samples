/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

@Entry
@Component
struct RadioSample {
  @State radioItemWidth: number = 0;
  @State responseRegionIndex: number = 0;
  @State noResponseRegionIndex: number = 0;
  private context: Context = getContext(this);
  private cityNames: Resource[] = [$r('app.string.radio_beijing'), $r('app.string.radio_shanghai'), $r('app.string.radio_guangzhou'), $r('app.string.radio_shenzhen')];
  private widthValue: number = 20;
  private heightValue: number = 48;

  build() {
    Column() {
      TitleBar({ title: $r('app.string.radio_title') })
      Scroll() {
        Column({ space: 12 }) {
          IntroductionTitle({ introduction: $r("app.string.radio_no_response_region") })
          Column() {
            ForEach(this.cityNames, (item: Resource, index: number) => {
              Row() {
                // Only one option for the same group
                Radio({ value: this.context.resourceManager.getStringSync(item), group: 'noResponse' }).checked(false)
                  .checked(this.noResponseRegionIndex === index)
                  .onChange((isChecked: boolean) => {
                    if (isChecked) {
                      ShowToast.longToast(this.cityNames[index])
                      this.noResponseRegionIndex = index
                    }
                  }).id('city' + String(index))
                Text(item)
              }
            })
          }
          .columnStyle()
          .alignItems(HorizontalAlign.Start)

          IntroductionTitle({ introduction: $r("app.string.radio_has_response_region") })
          Column() {
            ForEach(this.cityNames, (item: Resource, index: number) => {
              Row() {
                Radio({ value: this.context.resourceManager.getStringSync(item), group: 'responseRegion' })
                  .size({ width: this.widthValue, height: this.heightValue })
                  .checked(this.responseRegionIndex === index)
                  .responseRegion({
                    x: 0,
                    y: 0,
                    width: this.radioItemWidth * (100 / this.widthValue) + '%',
                    height: '100%'
                  })
                  .onChange((isChecked: boolean) => {
                    if (isChecked) {
                      ShowToast.longToast(this.cityNames[index])
                      this.responseRegionIndex = index
                    }
                  })
                  .id('cityHot' + String(index))
                Text(item)
                  .height(this.heightValue)
              }
              .width('100%')
              .margin({ bottom: 6 })
              .backgroundColor($r('app.color.radio_response_region_color'))
              .onAreaChange((oldValue: Area, newValue: Area) => {
                // Get radio item width
                this.radioItemWidth = Number.parseInt(newValue.width.toString())
              })
            })
          }
          .columnStyle()
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 70 })
        }
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen
      }
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}