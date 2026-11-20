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

import { Logger, StringRes } from '@ohos/common';

const TAG = 'Drug';

class P {
  public id?: string;
  public text?: string;
  public amount?: string;
  public time?: string;
  public bedname?: string;
  public patientname?: string;
  public sex?: string;
  public age?: string;
  public frequency?: string;
  public type?: string;
}

@Component
export struct Drug {
  @State currentIndex: number = 0;
  @Consume('pageInfos') pageInfos: NavPathStack;
  private name = StringRes.get($r('app.string.patient_zhang_xiaotong'));
  private arrList: P[] = [
    {
      id: '88342333',
      text: StringRes.get($r('app.string.demo_drug_calcium_10')),
      amount: '20ml',
      time: '2024-05-09 9:00',
      bedname: StringRes.get($r('app.string.demo_bed_12')),
      patientname: this.name,
      sex: StringRes.get($r('app.string.gender_female')),
      age: StringRes.get($r('app.string.demo_age_32')),
      frequency: 'q8h',
      type: StringRes.get($r('app.string.infusion_type'))
    },
    {
      id: '88342332',
      text: StringRes.get($r('app.string.demo_drug_diisopropylamine_oxide')),
      amount: '20ml',
      time: '2024-05-09 9:00',
      bedname: StringRes.get($r('app.string.demo_bed_12')),
      patientname: this.name,
      sex: StringRes.get($r('app.string.gender_female')),
      age: StringRes.get($r('app.string.demo_age_32')),
      frequency: 'q8h',
      type: StringRes.get($r('app.string.infusion_type'))
    },
    {
      id: '88342335',
      text: StringRes.get($r('app.string.demo_drug_glycyrrhizin_2')),
      amount: '20ml',
      time: '2024-05-09 9:00',
      bedname: StringRes.get($r('app.string.demo_bed_12')),
      patientname: this.name,
      sex: StringRes.get($r('app.string.gender_female')),
      age: StringRes.get($r('app.string.demo_age_32')),
      frequency: 'q8h',
      type: StringRes.get($r('app.string.infusion_type'))
    },
    {
      id: '88342334',
      text: StringRes.get($r('app.string.demo_drug_tiopronin')),
      amount: '20ml',
      time: '2024-05-09 9:00',
      bedname: StringRes.get($r('app.string.demo_bed_12')),
      patientname: this.name,
      sex: StringRes.get($r('app.string.gender_female')),
      age: StringRes.get($r('app.string.demo_age_32')),
      frequency: 'q8h',
      type: StringRes.get($r('app.string.infusion_type'))
    },
  ];

  build() {
    NavDestination() {
      Column() {
        //header
        Row() {
          Image($r('app.media.nurse_back_gray')).width(20).height(20).position({ x: 10, y: 10 })
            .onClick(() => {
              this.pageInfos.popToName('MedicalAdvice');
            });
        }
        .backgroundColor(Color.White)
        .width('100%')
        .height(30)
        .justifyContent(FlexAlign.Center)
        .shadow({
          radius: 20,
          color: Color.Gray,
          offsetX: 2,
          offsetY: 2
        });

        Stack({ alignContent: Alignment.TopStart }) {
          Column() {
            //列表
            List({ space: 5, initialIndex: 0 }) {
              ForEach(this.arrList, (item: P) => {
                ListItem() {
                  Column() {
                    Row() {
                      Text(item.bedname).fontSize(8).fontColor(Color.Gray).margin({ right: 10 });
                      Text(item.patientname).fontSize(8).fontColor(Color.Gray).margin({ right: 10 });
                      Text(item.sex).fontSize(8).fontColor(Color.Gray).margin({ right: 10 });
                      Text(item.age).fontSize(8).fontColor(Color.Gray).margin({ right: 10 });
                      Text('ID：' + item.id).fontSize(8).fontColor(Color.Gray);
                    }.width('100%');

                    Row() {
                      Text(item.text)
                        .fontSize(10)
                        .fontWeight(600)
                        .fontColor($r('app.color.nurse_blue'))
                        .lineHeight(12)
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .margin({ right: 5 });
                      Text('(' + item.amount + ')').fontSize(9).fontColor(Color.Gray).lineHeight(12);
                    }.width('100%').margin({ top: 4, bottom: 4 });

                    Row() {
                      Text(StringRes.get($r('app.string.frequency_prefix')) + item.frequency).fontSize(8).fontColor(Color.Gray).margin({ right: 10 });
                      Text(item.type).fontSize(8).fontColor(Color.Gray).margin({ right: 40 });
                      Text(StringRes.get($r('app.string.receive_time_prefix')) + item.time).fontSize(8).fontColor(Color.Gray);
                    }.width('100%');
                  }
                  .width('96%')
                  .padding(5)
                  .margin({ top: 5, left: 5, right: 5 })
                  .backgroundColor(Color.White)
                  .shadow({
                    radius: 20,
                    color: $r('app.color.gray999'),
                    offsetX: 2,
                    offsetY: 2
                  })
                  .borderRadius(5);

                };
              });
            }
            .listDirection(Axis.Vertical) // 排列方向
            .edgeEffect(EdgeEffect.None) // 滑动到边缘无效果
            .chainAnimation(false) // 联动特效关闭
            .onScrollIndex((firstIndex: number, lastIndex: number) => {
              Logger.info(TAG, 'first' + firstIndex);
              Logger.info(TAG, 'last' + lastIndex);
            })
            .width('100%')
            .height('100%')
            .padding(5);
          }.width('100%').height('95%');
        };

      };
    }.hideTitleBar(true);
  }
}