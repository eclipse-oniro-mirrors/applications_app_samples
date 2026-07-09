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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import TextToSpeechController from '../controller/TextToSpeechController';
import { RecordDialog } from '../components/RecordDialog';
import { MediaControlCenter } from '../controller/MediaControlCenter';

@Component
export struct NavigationPage {
  @State currentIndex: number = 0;
  @State isEnglish: boolean = false;
  // 设置播报内容
  @State originalText: string = "\n\t\t古人学问无遗力，少壮工夫老始成；\n\t\t" + "纸上得来终觉浅，绝知此事要躬行。\n\t\t";
  private tabList: ResourceStr[] =
    [$r('app.string.driving'), $r('app.string.take_a_taxi'), $r('app.string.bus_and_subway'), $r('app.string.ride'),
      $r('app.string.walking'), $r('app.string.train'), $r('app.string.coach')];
  private tabsController: TabsController = new TabsController();
  @State isRecord: boolean = false;

  async  aboutToAppear(){
    TextToSpeechController.createEngine();
    setTimeout(()=>{
      TextToSpeechController.setSpeakListener();
    },500)
    MediaControlCenter.getInstance().init();
  }

  aboutToDisappear(): void {
    MediaControlCenter.getInstance().release();
    TextToSpeechController.releaseResource();
  }

  showTips() {
    try {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.ui_displayed'),
        duration: 2000
      })
    } catch (error) {
      let err = error as BusinessError;
      hilog.error(0x0000, 'GoCompany',
        `showToast failed. code=${err.code}, message=${err.message}`);
    }
  }

  @Builder
  recordDialogBuilder() {
    RecordDialog({ isRecord: this.isRecord })
  }

  @Builder
  myBuilder() {
    Column() {
      Row() {
        Row() {
          Image($r('app.media.directions'))
            .height(46)
            .width(8)
            .margin({ left: 16 })
            .draggable(false)

          Column() {
            Text($r('app.string.my_position'))
              .backgroundColor($r('app.color.textInput_background'))
              .fontSize(17)
              .height(40)
              .fontWeight(FontWeight.Medium)

            Divider()
              .strokeWidth(1)
              .lineCap(LineCapStyle.Round)

            Text($r('app.string.my_company'))
              .backgroundColor($r('app.color.textInput_background'))
              .fontSize(17)
              .height(40)
              .fontWeight(FontWeight.Medium)
          }
          .width('60%')
          .padding({ left: 15 })
          .alignItems(HorizontalAlign.Start)

          Image($r('app.media.swap'))
            .width(24)
            .margin({ left: 30, right: 12 })
            .onClick(() => {
              this.showTips();
            })
            .draggable(false)
          Image($r('app.media.mic'))
            .width(24)
            .onClick(() => {
              this.showTips();
            })
            .draggable(false)
        }
        .width('100%')
        .height(91)
        .backgroundColor($r('app.color.textInput_background'))
        .borderRadius(20)
        .layoutWeight(1)
      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .height(115)
      .padding({ top: 24 })

      Row() {
        this.TabList();
      }
      .height(126)
      .margin({ top: 4 })

      Row() {
        Button() {
          Text($r('app.string.start_navigating'))
            .fontSize(17)
            .fontColor($r('app.color.linearGradient_color1'))
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .height(42)
        .backgroundColor($r('app.color.button_background'))
        .onClick(() => {
          MediaControlCenter.getInstance().play();
        })
      }
      .height(40)
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Bottom)
      .width('100%')
      .backgroundColor(Color.White)
      .margin({ top: 8 })
      .onClick(() => {
        this.showTips();
      })
    }
    .backgroundColor(Color.White)
    .padding({ left: 16, right: 16 })
    .height(301)
    .width('100%')
    .borderRadius({ topLeft: 32, topRight: 32 })
  }

  @Builder
  PlanList() {
    Row() {
      Column({ space: 4 }) {
        Text('12分钟')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)

        Text('4.7公里')
          .fontSize(11)
          .fontColor(Color.Black)

        Text('推荐')
          .fontSize(11)
          .fontColor(Color.Black)
      }
      .width(168)
      .height(70)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, top: 6 })
      .borderRadius(12)
      .shadow({
        radius: 10,
        color: $r('app.color.linearGradient_color1')
      })
      .onClick(() => {
        this.showTips();
      })

      Column({ space: 4 }) {
        Text('15分钟')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)

        Text('5.6公里')
          .fontSize(11)
          .fontColor(Color.Black)

        Text('备选路线一')
          .fontSize(11)
          .fontColor(Color.Black)
      }
      .width(168)
      .height(70)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, top: 6 })
      .borderRadius(12)
      .shadow({
        radius: 10,
        color: $r('app.color.shadow_color')
      })
      .onClick(() => {
        this.showTips();
      })
    }
    .width('100%')
    .padding({ left: 2, right: 2 })
    .justifyContent(FlexAlign.SpaceBetween)
    .height(82)
  }

  @Builder
  TabBuilder(type: ResourceStr, targetIndex: number) {
    Row() {
      Image($r('app.media.path_2'))
        .height(16)
        .width(20)
        .margin({ right: 4 })
        .draggable(false)
        .visibility(this.currentIndex === 0 ? Visibility.Visible : Visibility.None)
      Text(type)
        .fontSize(14)
        .fontColor((this.currentIndex === targetIndex) ? $r('app.color.button_fontColor') :
          $r('app.color.text_fontColor7'))
    }
    .onClick(() => {
      if (targetIndex !== 0) {
        this.showTips();
      }
    })
    .justifyContent(FlexAlign.Center)
    .backgroundColor((this.currentIndex === targetIndex) ? $r('app.color.backgroundColor') :
      $r('app.color.start_window_background'))
    .borderRadius(14)
    .height(28)
    .width(80)
  }

  @Builder
  TabList() {
    Tabs({ barPosition: BarPosition.Start, controller: this.tabsController }) {
      ForEach(this.tabList, (_: ResourceStr, index: number) => {
        TabContent() {
          if (index === 0) {
            this.PlanList();
          }
        }
        .tabBar(this.TabBuilder(this.tabList[index], index))
      }, (item: ResourceStr) => item.toString())
    }
    .barHeight(45)
    .width('100%')
    .scrollable(true)
    .barMode(BarMode.Scrollable)
  }

  build() {
    NavDestination() {
      Column() {
        Image($r('app.media.routes2'))
          .width(148)
          .height(260)
          .draggable(false)
          .position({
            x: 120,
            y: 100
          })
          .onClick(() => {
            this.showTips();
          })
          .draggable(false)
        Image($r('app.media.detection'))
          .width(84)
          .height(84)
          .draggable(false)
          .position({
            x: 306,
            y: 328
          })
          .onClick(() => {
            this.showTips();
          })
          .draggable(false)

        Button() {
          Text('模拟AI助手')
            .fontSize(16)
            .fontColor($r('app.color.linearGradient_color1'))
            .fontWeight(FontWeight.Medium)
        }
        .type(ButtonType.Capsule)
        .width(120)
        .height(36)
        .backgroundColor($r('app.color.button_background'))
        .position({
          x: 16,
          y: 364
        })
        .onClick(() => {
          this.isRecord = true;
        })
        .bindSheet($$this.isRecord, this.recordDialogBuilder(), {
          detents: [SheetSize.FIT_CONTENT],
          blurStyle: BlurStyle.Thick,
          showClose: false,
          dragBar: false,
          backgroundColor: Color.White,
          onDisappear: (() => {
            // this.loadAudioFiles();
          })
        })

        this.myBuilder();
      }
      .justifyContent(FlexAlign.End)
      .width('100%')
      .height('100%')
    }
    .backgroundImage(this.isEnglish ? $r('app.media.backgroundMap_en') : $r('app.media.backgroundMap'))
    .backgroundImageSize({ width: '100%', height: '100%' })
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
    .height('100%')
    .width('100%')
  }
}