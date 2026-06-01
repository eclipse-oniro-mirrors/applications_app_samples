'use static'

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

// [Start parallelComponents_start]
// ArkTS-Sta示例
import { Entry, Text, Column, Component, Button, ClickEvent, Margin, Row, GridItem, Image, ImageFit, $r, Grid, ForEach } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ParallelOption, ParallelizeUI } from '@ohos.arkui.Parallelize';

class WeatherInfo {
  city:string = ''
  temperature:number = 0
  weather:int = 0
  constructor(city:string, temperature:number, weather:int) {
    this.city = city
    this.temperature = temperature
    this.weather = weather
  }
  getImg():string {
    switch (this.weather) {
      case 0:
        return 'app.media.cloudy'
      case 1:
        return 'app.media.snow'
      case 2:
        return 'app.media.sunny'
      case 3:
        return 'app.media.rain'
      default:
        break;
    }
    return 'app.media.sunny'
  }
}

let array : Array<WeatherInfo> = new Array<WeatherInfo>();

array!.push(new WeatherInfo('杭州', 40, 3));
array!.push(new WeatherInfo('上海', 39, 2));
array!.push(new WeatherInfo('南京', 37, 1));
array!.push(new WeatherInfo('苏州', 36, 0));
array!.push(new WeatherInfo('湖州', 35, 3));
array!.push(new WeatherInfo('无锡', 34, 2));
array!.push(new WeatherInfo('常州', 32, 1));
array!.push(new WeatherInfo('嘉兴', 31, 1));


@Entry
@Component
struct Page {
  @State infos :Array<WeatherInfo> = new Array<WeatherInfo>();

  aboutToAppear() {
    this.infos.push(array[0])
    this.infos.push(array[1])
    this.infos.push(array[2])
    this.infos.push(array[3])
  }

  build() {
    Column() {
      Button('Update')
        .onClick((e: ClickEvent) => {
          this.infos[0] = new WeatherInfo('北京', 30, 2); // 外层状态变量刷新
        })
        .width(200)
        .height(50)
      Grid() {
        ParallelizeUI<WeatherInfo>(undefined,
          () => { return new WeatherInfo(this.infos[0].city, this.infos[0].temperature, this.infos[0].weather); },
          (param: WeatherInfo) => {
            // 第一个GridItem使用并行创建
            GridItem() {
              Row() {
                Column() {
                  Text(param.city).fontSize('25')
                  Text(param.temperature.toString()).fontSize('25')
                }
                Image($r(param.getImg()))
                  .objectFit(ImageFit.Contain)
              }
              .width('100%')
              .height('100%')
            }
            .width('100%')
            .height(100)
            .borderWidth(2).borderColor(0xAFEEEE)
          })
        // 剩余3个GridItem使用串行创建
        ForEach(this.infos.slice(1), (item: WeatherInfo) => {
          GridItem() {
            Row() {
              Column() {
                Text(item.city).fontSize('25')
                Text(item.temperature.toString()).fontSize('25')
              }
              Image($r(item.getImg()))
                .objectFit(ImageFit.Contain)
            }
            .width('100%')
            .height('100%')
          }
          .width('100%')
          .height(100)
          .borderWidth(2).borderColor(0xAFEEEE)
        })
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(20)
      .rowsGap(20)
      .width('100%')
      .height('100%')
      .margin({ top: 100 } as Margin)
    }
  }
}
// [End parallelComponents_start]
