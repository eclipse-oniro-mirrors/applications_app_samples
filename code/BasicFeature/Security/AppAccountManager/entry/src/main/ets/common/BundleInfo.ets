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

import router from '@ohos.router'
import { BaseDataSource } from './BaseDataSource'
import { BundleCatalog, BundleEntry } from '../model/BundleCatalog'

class MyDataSource extends BaseDataSource<BundleEntry> {
  private dataArray: BundleEntry[] = BundleCatalog.entries()

  public totalCount(): number {
    return this.dataArray.length
  }

  public getData(index: number): BundleEntry | undefined {
    return this.dataArray[index]
  }

  public replaceData(result: BundleEntry[]): void {
    this.dataArray = result
  }
}

@Component
export struct BundleInfo {
  @State dataSet: MyDataSource = new MyDataSource()
  @Prop isWideLayout: boolean
  @Prop isSidebar: boolean = false
  @Prop selectedBundleName: string = ''

  private cardColor(item: BundleEntry): Resource {
    if (this.isSidebar && this.selectedBundleName === item.name) {
      return $r('app.color.card_selected')
    }
    return $r('app.color.card_normal')
  }

  build() {
    Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
      LazyForEach(this.dataSet, (item: BundleEntry) => {
        Row() {
          Image(item.img)
            .margin(10)
            .width('40%')
            .height('60%')
            .objectFit(ImageFit.Contain)

          Text(item.text)
            .margin(10)
            .fontSize(20)

          Image($r('app.media.right'))
            .margin(10)
            .width('15%')
            .height('20%')
            .layoutWeight(1)
            .objectFit(ImageFit.Contain)
        }
        .id(BundleCatalog.idOf(item.name))
          .margin(5)
          .width(this.isSidebar ? '95%' : (this.isWideLayout ? '48%' : '95%'))
          .height(this.isSidebar ? 90 : (this.isWideLayout ? 150 : '20%'))
          .borderRadius(20)
          .backgroundColor(this.cardColor(item))
          .onClick(() => {
            if (this.isSidebar) {
              AppStorage.SetOrCreate<string>('selectedBundleName', item.name)
              return
            }
            router.push({
              url: 'pages/Login',
              params: {
                bundleName: item.name
              }
            })
          })
      }, (item: BundleEntry) => item.name)
    }
    .width('100%')
      .height('100%')
      .layoutWeight(1)
  }
}
