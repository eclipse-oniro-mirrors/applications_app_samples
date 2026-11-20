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

import { promptAction } from '@kit.ArkUI';
import { Logger, StringRes } from '@ohos/common';

const TAG = 'MedicalAdvice';

class MyDataSource implements IDataSource {
  private list: number[] = [];
  private listener: DataChangeListener | undefined | null;

  constructor(list: number[]) {
    this.list = list;
  }

  public totalCount(): number {
    return this.list.length;
  }

  public getData(index: number): number {
    return this.list[index];
  }

  public registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener;
  }

  public unregisterDataChangeListener() {
  }
}

class P1 {
  public id?: string;
  public text?: string;
  public status?: string;
  public time?: string;
}

@Component
export struct MedicalAdvice {
  @State currentIndex: number = 0;
  @Consume('pageInfos') pageInfos: NavPathStack;
  private name: string = StringRes.get($r('app.string.patient_zhang_xiaotong'));
  private swiperController: SwiperController = new SwiperController();
  private data: MyDataSource = new MyDataSource([]);
  private arrList: P1[] = [
    {
      id: '1',
      text: StringRes.get($r('app.string.demo_test_blood_glucose')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '9:00'
    },
    {
      id: '2',
      text: StringRes.get($r('app.string.demo_drug_multi_enzyme')),
      status: StringRes.get($r('app.string.order_status_executed')),
      time: '11:00'
    },
    {
      id: '3',
      text: StringRes.get($r('app.string.demo_drug_calcium_gluconate')),
      status: StringRes.get($r('app.string.order_status_to_dispense')),
      time: '10:45'
    },
    {
      id: '4',
      text: StringRes.get($r('app.string.demo_drug_tiopronin')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '10:30'
    },
    {
      id: '4',
      text: StringRes.get($r('app.string.demo_drug_magnesium_isoglycyrrhizinate')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '10:30'
    },
    {
      id: '4',
      text: StringRes.get($r('app.string.demo_test_blood_pressure')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '10:15'
    },
    {
      id: '4',
      text: StringRes.get($r('app.string.demo_drug_glycyrrhizin')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '10:15'
    },
    {
      id: '4',
      text: StringRes.get($r('app.string.demo_drug_diisopropylamine')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '10:15'
    },
    {
      id: '4',
      text: StringRes.get($r('app.string.demo_test_temperature')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '07:45'
    },
    {
      id: '4',
      text: StringRes.get($r('app.string.demo_test_blood_glucose')),
      status: StringRes.get($r('app.string.order_status_waiting')),
      time: '07:30'
    },
  ];

  aboutToAppear(): void {
    let list: number[] = [];
    for (let i = 1; i <= 4; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list);
  }

  build() {
    NavDestination() {
      Column() {
        //header
        Row() {
          Image($r('app.media.nurse_back')).width(20).height(20).position({ x: 10, y: 10 })
            .onClick(() => {
              this.pageInfos.clear();
            });
          Text($r('app.string.order_execution_title'))
            .height(22)
            .fontColor('#fff')
            .fontSize(12);
        }.backgroundColor('#6fa7ff').width('100%').height(30).justifyContent(FlexAlign.Center);

        Row() {
        }
        .backgroundColor('#6fa7ff')
        .borderRadius({ bottomLeft: 10, bottomRight: 10 })
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Center);

        // patient info
        Row() {
          Row() {
          }
          .width(50)
          .height('66%')
          .backgroundColor(Color.White)
          .borderRadius(5)
          .shadow({
            radius: 20,
            color: $r('app.color.gray999'),
            offsetX: 2,
            offsetY: 2
          })
          .position({ x: '-14%', y: 20 });

          Column() {
            Row() {
              Text('12').fontSize(20).fontColor(Color.Orange);
              Text($r('app.string.bed_suffix')).fontSize(10).fontColor(Color.Gray).margin({ right: 10, bottom: 3 });
              Text(this.name).fontSize(16).fontColor($r('app.color.nurse_blue')).margin({ right: 10 });
              Text($r('app.string.patient_status_severe')).fontSize(10).fontColor(Color.Gray).margin({ bottom: 3 });
            }.margin({ top: 15, bottom: 10 }).alignItems(VerticalAlign.Bottom);

            Row() {
              Text($r('app.string.gender_female')).fontSize(10).fontColor(Color.Gray).margin({ right: 10 });
              Text($r('app.string.age_76')).fontSize(10).fontColor(Color.Gray);
            };
          }
          .width('84%')
          .height('80%')
          .backgroundColor(Color.White)
          .borderRadius(5)
          .shadow({
            radius: 20,
            color: $r('app.color.gray999'),
            offsetX: 2,
            offsetY: 2
          })
          .margin({ left: '9%' });

          Row() {
          }
          .width(50)
          .height('66%')
          .backgroundColor(Color.White)
          .borderRadius(5)
          .shadow({
            radius: 20,
            color: $r('app.color.gray999'),
            offsetX: 2,
            offsetY: 2
          })
          .position({ x: '96%', y: 20 });
        }.width('100%').height(90).position({ x: 0, y: 25 });

        // TAB
        Row() {
          Text($r('app.string.medical_order_injection'))
            .height(22)
            .border({
              width: { bottom: 2 },
              color: $r('app.color.nurse_blue'),
            })
            .fontSize(10)
            .fontColor(this.currentIndex === 0 ? $r('app.color.nurse_blue') : Color.Gray)
            .margin({ right: 10 });
          Text($r('app.string.medical_order_nursing'))
            .height(22)
            .border({
              width: { bottom: 2 },
              color: (this.currentIndex === 1 ? $r('app.color.nurse_blue') : Color.White),
            })
            .fontSize(10)
            .fontColor(this.currentIndex === 1 ? $r('app.color.nurse_blue') : Color.Gray)
            .margin({ left: 10 });
        }.margin({ top: 35 });

        Stack({ alignContent: Alignment.TopStart }) {
          Column() {
            //列表
            List({ space: 5, initialIndex: 0 }) {
              ForEach(this.arrList, (item: P1) => {
                ListItem() {
                  Column() {
                    Row() {
                      Text(item.text)
                        .fontSize(10)
                        .fontWeight(600)
                        .fontColor($r('app.color.nurse_blue'))
                        .lineHeight(14)
                        .width('70%')
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis });
                      Text(item.status).fontSize(9).fontColor(Color.Gray).lineHeight(14);
                    }.width('100%').justifyContent(FlexAlign.SpaceBetween);

                    Text(item.time)
                      .fontSize(9)
                      .fontColor(Color.Gray)
                      .lineHeight(14)
                      .width('100%')
                      .textAlign(TextAlign.Start);
                  }
                  .onClick(() => {
                    if (item.status == StringRes.get($r('app.string.order_status_to_dispense'))) {
                      this.pageInfos.pushPath({ name: 'Drug' }); //将name指定的NavDestination页面信息入栈
                    } else if (item.status == StringRes.get($r('app.string.order_status_waiting'))) {
                      promptAction.showDialog({
                        title: StringRes.get($r('app.string.plan_prefix')) + item.time,
                        message: item.text,
                        buttons: [
                          {
                            text: StringRes.get($r('app.string.action_execute')),
                            color: '#000000',
                          }
                        ],
                      })
                        .then(data => {
                          promptAction.showDialog({
                            title: StringRes.get($r('app.string.dialog_confirm_execution')),
                            buttons: [
                              {
                                text: StringRes.get($r('app.string.cancel')),
                                color: '#000000',
                              },
                              {
                                text: StringRes.get($r('app.string.confirm')),
                                color: '#000000',
                              }
                            ],
                          }).then(data => {
                            item.status = StringRes.get($r('app.string.order_status_executed'));
                            Logger.info(TAG, 'showActionMenu success, click button: ' + data.index);
                          });
                        });
                    }

                  })
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
          }.width('100%').height('85%');
        };
      };
    }.hideTitleBar(true);
  }
}