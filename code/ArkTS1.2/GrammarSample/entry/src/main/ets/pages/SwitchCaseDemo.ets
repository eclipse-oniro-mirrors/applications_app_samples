'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  HorizontalAlign,
  TextAlign,
  ClickEvent,
  ForEach,
  Row,
  FlexAlign,
  Margin,
  FontWeight,
  Builder,
  Image,
  Stack,
  Padding
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class StepModel {
  public title: string = '';
  public description: string = '';

  constructor(title: string, description: string) {
    this.title = title;
    this.description = description;
  }
}

@Entry
@Component
export struct SwitchCaseDemo {
  @State currentStep: number = 1;
  @State totalSteps: number = 6;
  // 步骤数据
  private stepData: StepModel[] = [
    new StepModel(
      '欢迎使用我们的应用',
      '这是一个简单易用的工具，帮助您更好地管理日常任务。我们将引导您完成基本设置。'
    ),
    new StepModel(
      '创建您的第一个任务',
      '点击"+"按钮，输入任务名称和描述，轻松创建新任务。您可以设置优先级和截止日期。'
    ),
    new StepModel(
      '管理任务状态',
      '您可以随时更新任务状态：待办、进行中或已完成。拖拽任务即可更改状态。'
    ),
    new StepModel(
      '设置提醒通知',
      '为重要任务设置提醒，确保不会错过任何截止日期。支持多种提醒方式。'
    ),
    new StepModel(
      '团队协作功能',
      '邀请团队成员共同处理任务，实时同步进度和备注，提高协作效率。'
    ),
    new StepModel(
      '开始使用吧！',
      '您已了解所有基本功能，现在可以开始使用应用了。如有疑问，请查看帮助中心。'
    )
  ];

  // 步骤指示器组件
  @Builder
  StepIndicator(step: number) {
    Column() {
      if (step == this.currentStep) {
        // 当前步骤
        Column() {
          Text(step.toString())
            .fontSize(16)
            .fontColor('#FFFFFF')
            .backgroundColor('#007AFF')
            .borderRadius(20)
            .width(40)
            .height(40)
            .textAlign(TextAlign.Center)
        }

      } else if (step < this.currentStep) {
        // 已完成步骤
        Column() {
          Text('P')
            .fontSize(16)
            .fontColor('#FFFFFF')
            .backgroundColor('#34C759')
            .borderRadius(20)
            .width(40)
            .height(40)
            .textAlign(TextAlign.Center)
        }
        .onClick(() => {
          // 点击已完成的步骤可以返回查看
          this.currentStep = step;
        })
      } else {
        // 未完成步骤
        Text(step.toString())
          .fontSize(16)
          .fontColor('#8E8E93')
          .backgroundColor('#F2F2F7')
          .borderRadius(20)
          .width(40)
          .height(40)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            // 点击指示器可跳转到对应步骤
            this.currentStep = step;
          })
      }
    }
    .margin({ right: 10 } as Margin)
  }

  // 进度条组件
  @Builder
  ProgressBar() {
    Row() {
      // 已完成部分
      Column()
        .width(`${(this.currentStep - 1) / (this.totalSteps - 1) * 100}%`)
        .height(4)
        .backgroundColor('#34C759')

      // 未完成部分
      Column()
        .width(`${(this.totalSteps - this.currentStep) / (this.totalSteps - 1) * 100}%`)
        .height(4)
        .backgroundColor('#F2F2F7')
    }
    .width('80%')
    .borderRadius(2)
    .margin({ bottom: 20, top: 10 } as Margin)
  }

  build() {
    Column() {
      // 顶部步骤指示器
      Row() {
        ForEach(this.stepData, (item: StepModel, index: number) => {
          this.StepIndicator(index + 1)
        })
      }
      .margin({ top: 30, bottom: 10 } as Margin)
      .justifyContent(FlexAlign.SpaceAround)
      .width('90%')

      // 进度条
      this.ProgressBar()

      // 步骤内容 - 使用switch/case根据当前步骤显示不同内容
      switch (this.currentStep.toInt()) {
        case 1:
        Column() {
          Text(this.stepData[(this.currentStep-1).toInt()].title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, top: 10 } as Margin)
            .textAlign(TextAlign.Center)

          Text(this.stepData[(this.currentStep-1).toInt()].description)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 20 } as Margin)
            .padding({ left: 10, right: 10 } as Padding)
        }
        .height('40%')
        .width('100%')

          break;
        case 2:
        Column() {
          Text(this.stepData[(this.currentStep-1).toInt()].title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, top: 10 } as Margin)
            .textAlign(TextAlign.Center)

          Text(this.stepData[(this.currentStep-1).toInt()].description)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 20 } as Margin)
            .padding({ left: 10, right: 10 } as Padding)
        }
        .height('40%')
        .width('100%')

          break;
        case 3:
        Column() {
          Text(this.stepData[(this.currentStep-1).toInt()].title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, top: 10 } as Margin)
            .textAlign(TextAlign.Center)

          Text(this.stepData[(this.currentStep-1).toInt()].description)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 20 } as Margin)
            .padding({ left: 10, right: 10 } as Padding)
        }
        .height('40%')
        .width('100%')

          break;
        case 4:
        Column() {
          Text(this.stepData[(this.currentStep-1).toInt()].title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, top: 10 } as Margin)
            .textAlign(TextAlign.Center)

          Text(this.stepData[(this.currentStep-1).toInt()].description)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 20 } as Margin)
            .padding({ left: 10, right: 10 } as Padding)
        }
        .height('40%')
        .width('100%')

          break;
        case 5:
        Column() {
          Text(this.stepData[(this.currentStep-1).toInt()].title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, top: 10 } as Margin)
            .textAlign(TextAlign.Center)

          Text(this.stepData[(this.currentStep-1).toInt()].description)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 20 } as Margin)
            .padding({ left: 10, right: 10 } as Padding)
        }
        .height('40%')
        .width('100%')

          break;
        case 6:
        Column() {
          Text(this.stepData[(this.currentStep-1).toInt()].title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, top: 10 } as Margin)
            .textAlign(TextAlign.Center)

          Text(this.stepData[(this.currentStep-1).toInt()].description)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 20 } as Margin)
            .padding({ left: 10, right: 10 } as Padding)
        }
        .height('40%')
        .width('100%')

          break;
        default:
          Text('无效的步骤')
          break;
      }
      Column() {
        // 附加提示信息（根据步骤显示不同提示）
        if (this.currentStep === 2) {
          Text('提示：您可以长按任务进行更多操作')
            .fontSize(14)
            .fontColor('#8E8E93')
            .margin({ top: 10, bottom: 10 } as Margin)
        } else if (this.currentStep === 4) {
          Text('提示：系统将在预定时间前15分钟提醒您')
            .fontSize(14)
            .fontColor('#8E8E93')
            .margin({ top: 10, bottom: 10 } as Margin)
        }
      }
      .width('100%')
      .height('15%')

      // 导航按钮
      Row() {
        if (this.currentStep < this.totalSteps) {
          Button('上一步')
            .onClick((e: ClickEvent) => {
              if (this.currentStep > 1) {
                this.currentStep--;
              }
            })
            .fontSize(14)
            .margin({ right: 20 } as Margin)
            .backgroundColor(this.currentStep > 1 ? '#007AFF' : '#F2F2F7')
            .fontColor(this.currentStep > 1 ? '#FFFFFF' : '#000000')
            .width(150)

          Button('下一步')
            .onClick((e: ClickEvent) => {
              if (this.currentStep < this.totalSteps) {
                this.currentStep++;
              }
            })
            .fontSize(14)
            .backgroundColor('#007AFF')
            .fontColor('#FFFFFF')
            .width(150)
        } else {
          Button('开始使用')
            .onClick((e: ClickEvent) => {
              // 跳转到主界面
              console.log('跳转到主界面');
            })
            .fontSize(14)
            .backgroundColor('#34C759')
            .fontColor('#FFFFFF')
            .width(150)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 30, bottom: 20 } as Margin)

      Column() {
        // 跳过引导链接
        if (this.currentStep < this.totalSteps) {
          Text('跳过引导')
            .fontSize(14)
            .fontColor('#8E8E93')
            .onClick((e: ClickEvent) => {
              // 直接跳转到最后一步
              this.currentStep = this.totalSteps;
            })
            .margin({ bottom: 10 } as Margin)
        }
      }
      .width('100%')
      .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}