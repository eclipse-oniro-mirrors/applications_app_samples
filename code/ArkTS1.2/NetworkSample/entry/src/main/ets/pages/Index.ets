/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import {
  memo,
  __memo_context_type,
  __memo_id_type
} from '@ohos.arkui.stateManagement'; // should be insert by ui-plugins
import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Entry,
  JSON,
  HorizontalAlign,
  ButtonType,
  Row,
  Color,
  Image,
  FontWeight,
  Progress,
  ProgressType
} from '@ohos.arkui.component'; // TextAttribute should be insert by ui-plugins
import {
  State,
  MutableState,
  stateOf,
  observableProxy
} from '@ohos.arkui.stateManagement'; // should be insert by ui-plugins
import hilog from '@ohos.hilog';
import camera from '@ohos.multimedia.camera';
import request from '@ohos.request';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct MyStateSample {
  @State progressValueA: number = 0;
  @State progressValueB: number = 0;
  @State progressValueC: number = 0;
  @State isTaskFinished: boolean = true;
  private lock: boolean = true;
  private taskACompleted: boolean = false;
  private taskBCompleted: boolean = false;
  private checkTaskC: number;

  aboutToAppear(): void {
  }

  private updateProgress(task: string): void {
    if (task == 'A') {
      this.progressValueA = 100;
    } else if (task == 'B') {
      this.progressValueB = 100;
    } else if (task == 'C') {
      this.progressValueC = 100;
    }
  }

  completeTaskA(): void {
    this.taskACompleted = true;
    this.updateProgress('A');
    this.checkAndUnlock();
  }

  completeTaskB(): void {
    this.taskBCompleted = true;
    this.updateProgress('B');
    this.checkAndUnlock();
  }

  completeTaskC(): void {
    this.updateProgress('C');
    this.isTaskFinished = true;
  }

  // 检查并解锁任务C
  private checkAndUnlock(): void {
    if (this.taskACompleted && this.taskBCompleted && this.lock) {
      this.lock = false;
    }
  }

  // 检查任务C是否可以执行
  canRunTaskC(): boolean {
    return !this.lock;
  }

  download(context: common.UIAbilityContext, taskNo: string, url: string): void {
    let config = {
      action: request.agent.Action.DOWNLOAD, // 配置任务选项，这里配置为下载任务
      url: url, // 配置下载任务url
      overwrite: true, // 下载过程中路径已存在时的解决方案选择。true表示覆盖已存在的文件
      method: 'GET', // HTTP标准方法。下载时，使用GET或POST。
      saveas: './', // 这里'./'表示下载至应用当前缓存路径下。
      mode: request.agent.Mode.BACKGROUND, // 任务模式设置后台任务。
      gauge: true, // 后台任务的过程进度通知策略，仅应用于后台任务。true表示发出每个进度已完成或失败的通知。
      retry: false, // 默认为true，如果没有网络或者网络不满足时，会自动暂停waiting，等网络满足时进行一次重试。设置为false时，没网直接走失败回调
    } as request.agent.Config;
    (request.agent.create(context, config) as Promise<request.agent.Task>)
      .then((task: request.agent.Task) => {
        task.on('completed', (progress: request.agent.Progress) => {
          if (taskNo == 'A') {
            this.completeTaskA();
          } else if (taskNo == 'B') {
            this.completeTaskB();
          } else if (taskNo == 'C') {
            this.completeTaskC();
          }
          hilog.info(0x0000, 'testTag', `下载完成 ${taskNo}`);
        });
        task.on('failed', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'testTag', `下载失败`);
        }); // 下载任务失败回调

        task.on('resume', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'testTag', `重新启动`);
        }); // 重新启动任务回调

        task.on('pause', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'testTag', `暂停`);
        }); // 暂停任务回调

        task.on('progress', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'testTag', JSON.stringify(progress));
        }); // 下载进度更新回调
        task.start((err: BusinessError | null) => {
          if (err && err.code != 0) {
            hilog.error(0x0000, 'testTag',
              `Failed to task start with error message: ${err.message}, error code: ${err.code}`);
            return;
          } else if (err && err.code == 0) {
            hilog.info(0x0000, 'testTag',
              `启动下载任务 ${taskNo}`);
          }
        })
      })
      .catch((err: Error) => {
        hilog.error(0x0000, 'testTag',
          `Failed to task create with error message: ${err.message}, error code: ${err.code}`);
      });
  }

  runTaskA(context: common.UIAbilityContext): void {
    let urlA =
      'https://gitee.com/openharmony/applications_app_samples/raw/master/code/Solutions/Shopping/OrangeShopping/feature/navigationHome/src/main/resources/base/media/favor_list_tea.png'
    this.download(context, 'A', urlA);
  }

  runTaskB(context: common.UIAbilityContext): void {
    let urlB =
      'https://gitee.com/harmonyos-cases/cases/blob/master/CommonAppDevelopment/product/entry/src/main/resources/base/media/after_cache.png'
    this.download(context, 'B', urlB);
  }

  runTaskC(context: common.UIAbilityContext): void {
    if (this.canRunTaskC()) {
      let url =
        'https://gitee.com/harmonyos-cases/cases/blob/master/CommonAppDevelopment/product/entry/src/main/resources/base/media/icon_main_color.png'
      this.download(context, 'C', url);
    }
  }

  // 启动所有任务
  startAllTasks(): void {
    this.isTaskFinished = false;
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.runTaskA(context);
    this.runTaskB(context);
    // 检查任务C是否可以执行
    this.checkTaskC = setInterval(() => {
      if (this.canRunTaskC()) {
        this.runTaskC(context);
        clearInterval(Double.toInt(this.checkTaskC));
      }
    }, 200);
    if (this.progressValueC == 100) {
      clearInterval(Double.toInt(this.checkTaskC));
    }
  }
  build() {
    Column(undefined) {
      Text('网络场景')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin(20)
      Column() {
        Text(`任务A当前进度 ${this.progressValueA}%`)
          .fontSize(16)
        Progress({
          value: this.progressValueA,
          total: 100,
          type: ProgressType.Linear
        })
          .height(20)
          .width('90%')
          .margin(10)
      }.margin(30)

      Column() {
        Text(`任务B当前进度 ${this.progressValueB}%`)
          .fontSize(16)
        Progress({
          value: this.progressValueB,
          total: 100,
          type: ProgressType.Linear
        })
          .height(20)
          .width('90%')
          .margin(10)
      }.margin(30)

      Column() {
        Text(`任务C当前进度 ${this.progressValueC}%`)
          .fontSize(16)
        Progress({
          value: this.progressValueC,
          total: 100,
          type: ProgressType.Linear
        })
          .height(20)
          .width('90%')
          .margin(10)
      }.margin(30)

      Button('启动所有任务')
        .width('70%')
        .height(50)
        .backgroundColor('#409EFF')
        .fontColor(Color.White)
        .onClick((e: ClickEvent) => {
          this.startAllTasks()
        })
        .margin(10)
        .enabled(this.isTaskFinished)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}
