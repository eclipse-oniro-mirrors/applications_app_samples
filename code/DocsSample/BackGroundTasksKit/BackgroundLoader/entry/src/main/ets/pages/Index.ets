/*
 * Copyright (c) 2026-2026 Huawei Device Co., Ltd.
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

/**
 * @file Index.ets
 * @brief 后台加载任务示例的主界面
 *
 * 本文件提供了BackgroundLoader示例的用户交互界面，包含以下功能按钮：
 * - Register Task: 注册后台加载任务，弹出对话框输入abilityName和taskId
 * - Get Task Info: 查询后台加载任务信息，弹出对话框输入taskId
 * - Finish Task: 完成后台加载任务，弹出对话框输入abilityName和taskId
 * - Unregister Task: 注销后台加载任务，弹出对话框输入abilityName和taskId
 *
 * 自定义对话框：
 * - TaskInfoDialog: 输入abilityName和taskId的对话框
 * - TaskIdDialog: 输入taskId的对话框
 * - ResultDialog: 显示操作结果的对话框
 */

import { testCases } from '../entryability/EntryAbility'

/**
 * TaskInfoDialog 自定义对话框
 * 用于输入abilityName和taskId，支持注册/完成/注销任务时使用
 */
@CustomDialog
struct TaskInfoDialog {
  controller!: CustomDialogController
  @State abilityName: string = 'EntryAbility'
  @State taskId: string = '0';
  onConfirm!: (abilityName: string, taskId: number) => void

  build() {
    Column() {
      Text('abilityName')
        .fontSize(14)
        .margin({ top: 10, bottom: 4 })
      TextInput({ text: this.abilityName })
        .width('100%')
        .onChange((value: string) => {
          this.abilityName = value;
        })

      Text('taskId')
        .fontSize(14)
        .margin({ top: 10, bottom: 4 })
      TextInput({ text: this.taskId })
        .width('100%')
        .type(InputType.Number)
        .onChange((value: string) => {
          this.taskId = value;
        })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('Cancel')
          .onClick(() => {
            this.controller.close();
          })
          .backgroundColor('#cccccc')
          .fontColor('#333333')
        Button('OK')
          .onClick(() => {
            this.onConfirm(this.abilityName, Number(this.taskId));
            this.controller.close();
          })
      }
      .margin({ top: 20 })
    }
    .padding(20)
  }
}

/**
 * TaskIdDialog 自定义对话框
 * 用于输入taskId，支持查询任务信息时使用
 */
@CustomDialog
struct TaskIdDialog {
  controller!: CustomDialogController
  @State taskId: string = '0';
  onConfirm!: (abilityName: string, taskId: number) => void

  build() {
    Column() {
      Text('taskId')
        .fontSize(14)
        .margin({ top: 10, bottom: 4 })
      TextInput({ text: this.taskId })
        .width('100%')
        .type(InputType.Number)
        .onChange((value: string) => {
          this.taskId = value;
        })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('Cancel')
          .onClick(() => {
            this.controller.close();
          })
          .backgroundColor('#cccccc')
          .fontColor('#333333')
        Button('OK')
          .onClick(() => {
            this.onConfirm(Number(this.taskId));
            this.controller.close();
          })
      }
      .margin({ top: 20 })
    }
    .padding(20)
  }
}

/**
 * ResultDialog 自定义对话框
 * 用于展示API调用的返回结果，支持滚动查看长内容
 */
@CustomDialog
struct ResultDialog {
  controller!: CustomDialogController
  @State title: string = '';
  @State result: string = '';

  build() {
    Column() {
      Text(this.title)
        .fontSize(18)
        .fontWeight((FontWeight.Bold))
        .margin({ bottom: 12 })

      Scroll() {
        Text(this.result)
          .fontSize(14)
          .fontColor('#333333')
          .width('100%')
      }
      .width('100%')
      .constraintSize({ maxHeight: 200})

      Button('OK')
        .margin({ top: 16 })
        .onClick(() => {
          this.controller.close();
        })
    }
    .padding(20)
  }
}

/**
 * Index 主页面
 * 提供四个操作按钮，分别对应注册、查询、完成、注销后台加载任务
 * 每个按钮点击后弹出对应的输入对话框，确认后调用TestCases中的API并显示结果
 */
@Entry
@Component
struct Index {
  @State resultTitle: string = ''
  @State resultContent: string = ''
  resultDialogController: CustomDialogController = new CustomDialogController({
    builder: ResultDialog({
      title: this.resultTitle,
      result: this.resultContent,
    })
  })
  registerDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskInfoDialog({
      onConfirm: (abilityName: string, taskId: number) => {
        testCases.registerTask(abilityName, taskId).then((result: string) => {
          this.resultTitle = 'registerTask Result';
          this.resultContent = `abilityName: ${abilityName}\ntaskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })
  getTaskInfoDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskIdDialog({
      onConfirm: (taskId: number) => {
        testCases.getTaskInfo(taskId).then((result: string) => {
          this.resultTitle = 'getTaskInfo Result';
          this.resultContent = `taskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })
  finishTaskDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskInfoDialog({
      onConfirm: (abilityName: string, taskId: number) => {
        testCases.finishTask(abilityName, taskId).then((result: string) => {
          this.resultTitle = 'finishTask Result';
          this.resultContent = `abilityName: ${abilityName}\ntaskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })
  unregisterTaskDialogController: CustomDialogController = new CustomDialogController({
    builder: TaskInfoDialog({
      onConfirm: (abilityName: string, taskId: number) => {
        testCases.unregisterTask(abilityName, taskId).then((result: string) => {
          this.resultTitle = 'unregisterTask Result';
          this.resultContent = `abilityName: ${abilityName}\ntaskId: ${taskId}\n\n${result}`;
          this.resultDialogController.open();
        });
      }
    })
  })

  build() {
    Column() {
      Text('Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20})

      Grid() {
        GridItem() {
          Button('Register Task')
            .width('100%')
            .onClick(() => {
              this.registerDialogController.open();
            })
        }

        GridItem() {
          Button('Get Task Info')
            .width('100%')
            .onClick(() => {
              this.getTaskInfoDialogController.open();
            })
        }

        GridItem() {
          Button('Finish Task')
            .width('100%')
            .onClick(() => {
              this.finishTaskDialogController.open();
            })
        }

        GridItem() {
          Button('Unegister Task')
            .width('100%')
            .onClick(() => {
              this.unregisterTaskDialogController.open();
            })
        }
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(10)
      .columnsGap(10)
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
