/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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

// [Start continuous_include]
import { backgroundTaskManager } from '@kit.BackgroundTasksKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit'
import { BusinessError } from '@kit.BasicServicesKit';
import { AbilityConstant, UIAbility, Want, wantAgent, WantAgent } from '@kit.AbilityKit';
// 在原子化服务中，请删除WantAgent导入
// [End continuous_include]
import { common } from '@kit.AbilityKit';
import PlayerModel from '../../feature/BackgroundPlayerFeature';

// [Start continuous_task]
function callback(info: backgroundTaskManager.ContinuousTaskCancelInfo) {
  // 长时任务id
  console.info('OnContinuousTaskCancel callback id ' + info.id);
  // 长时任务取消原因
  console.info('OnContinuousTaskCancel callback reason ' + info.reason);
}

@Entry
@Component
struct AudioPlaybackIndex {
  @State message: string = 'ContinuousTask';
  // 通过getUIContext().getHostContext()方法，来获取page所在的UIAbility上下文
  private context: Context | undefined = this.getUIContext().getHostContext();
  private audioTaskOperation: Promise<void> = Promise.resolve();
  private audioTaskVersion: number = 0;

  // [StartExclude continuous_task]
  @State isSwitching: boolean = false;
  // 播放或暂停
  onPlayClick(): void {
    if (this.isSwitching) {
      console.info(`onPlayClick ignored, isSwitching`);
      return
    }
    console.info(`onPlayClick isPlaying= ${PlayerModel.isPlaying}`);
    if (PlayerModel.isPlaying) {
      PlayerModel.pauseMusic();
      // cancel continuous task
      PlayerModel.isPlaying = false;
      this.stopContinuousTask(false);
    } else {
      PlayerModel.preLoad(PlayerModel.playerIndex, this.context as common.UIAbilityContext, () => {
        PlayerModel.playMusic(-1, true, this.context as common.UIAbilityContext);
        // start continuous task
        PlayerModel.isPlaying = true;
        this.startContinuousTask(false);
      })
    }
  }

  // 上一首
  onPreviousClick(): void {
    if (this.isSwitching) {
      console.info(`onPreviousClick ignored, isSwitching`);
      return;
    }
    console.info(`onPreviousClick`);
    PlayerModel.playerIndex--;
    if (PlayerModel.playerIndex < 0 && PlayerModel.playlist.audioFiles.length >= 1) {
      PlayerModel.playerIndex = PlayerModel.playlist.audioFiles.length - 1;
    }
    this.isSwitching = true;
    PlayerModel.preLoad(PlayerModel.playerIndex, this.context as common.UIAbilityContext, () => {
      PlayerModel.playMusic(0, true, this.context as common.UIAbilityContext);
      this.isSwitching = false;
      PlayerModel.isPlaying = true;
      this.startContinuousTask(false);
    })
  }

  // 下一首
  onNextClick(): void {
    if (this.isSwitching) {
      console.info(`onNextClick ignored, isSwitching`);
      return;
    }
    console.info(`onNextClick`);
    PlayerModel.playerIndex++;
    if (PlayerModel.playerIndex >= PlayerModel.playlist.audioFiles.length) {
      PlayerModel.playerIndex = 0;
    }
    this.isSwitching = true;
    PlayerModel.preLoad(PlayerModel.playerIndex, this.context as common.UIAbilityContext, () => {
      PlayerModel.playMusic(0, true, this.context as common.UIAbilityContext);
      this.isSwitching = false;
      PlayerModel.isPlaying = true;
      this.startContinuousTask(false);
    })
  }

  // 查询当前UIability是否已经申请过特定类型的长时任务
  private hasAudioPlaybackTask(context: Context): Promise<boolean> {
    return backgroundTaskManager.getAllContinuousTasks(context, false).then((tasks) => {
      return tasks.some((task) => task.backgroundModes.includes('audioPlayback'));
    });
  }

  aboutToAppear() {
    PlayerModel.getPlaylist(() => {
      console.info(`on playlist generated`);
    })
  }
  // [EndExclude continuous_task]

  OnContinuousTaskCancel() {
    try {
      backgroundTaskManager.on('continuousTaskCancel', callback);
      console.info(`Succeeded in operationing OnContinuousTaskCancel.`);
    } catch (error) {
      console.error(`Operation OnContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    }
  }

  OffContinuousTaskCancel() {
    try {
      // callback参数不传，则取消所有已注册的回调
      backgroundTaskManager.off('continuousTaskCancel', callback);
      console.info(`Succeeded in operationing OffContinuousTaskCancel.`);
    } catch (error) {
      console.error(`Operation OffContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    }
  }

  // 申请长时任务.then()写法
  startContinuousTask(playOnSuccess: boolean = true): void {
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      // 点击通知后，将要执行的动作列表
      // 添加需要被拉起应用的bundleName和abilityName
      wants: [
        {
          bundleName: 'ohos.samples.continuoustask',
          abilityName: 'MainAbility'
        }
      ],
      // 指定点击通知栏消息后的动作是拉起ability
      actionType: wantAgent.OperationType.START_ABILITY,
      // 使用者自定义的一个私有值
      requestCode: 0,
      // 点击通知后，动作执行属性
      actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
      // 车钥匙长时任务子类型，从API version 16开始支持。只有申请bluetoothInteraction类型的长时任务，车钥匙子类型才能生效。
      // 确保extraInfo参数中的Key值为backgroundTaskManager.BackgroundModeType.SUB_MODE，否则子类型不生效。
      // extraInfo: {
        // [backgroundTaskManager.BackgroundModeType.SUB_MODE] :backgroundTaskManager.BackgroundSubMode.CAR_KEY
      // }
    };

    const context = this.context;
    if (context === undefined) {
      return;
    }
    const version: number = this.audioTaskVersion;
    this.audioTaskOperation = this.audioTaskOperation.then(() => {
      if (version !== this.audioTaskVersion) {
        return;
      }
      return this.hasAudioPlaybackTask(context).then((hasTask: boolean) => {
        if (hasTask || version !== this.audioTaskVersion) {
          return;
        }
        // 通过wantAgent模块下getWantAgent方法获取WantAgent对象
        // 在原子化服务中，请将回调参数的WantAgent类型替换为object。
        return wantAgent.getWantAgent(wantAgentInfo).then((wantAgentObj: WantAgent) => {
          if (version !== this.audioTaskVersion) {
            return;
          }
          let list: string[] = ['audioPlayback'];
          // let list: string[] = ['bluetoothInteraction']; 长时任务类型包含bluetoothInteraction，CAR_KEY子类型合法
          return backgroundTaskManager.startBackgroundRunning(context, list, wantAgentObj).then(() => {
            console.info('Operation startBackgroundRunning succeeded');
            // 此处执行具体的长时任务逻辑，如播音等。
            // 系统会对业务场景的真实性进行检测，如果没有实际执行对应的业务，系统可能会取消对应的长时任务并挂起应用。
            // [StartExclude continuous_task]
            if (playOnSuccess && version === this.audioTaskVersion && !PlayerModel.isPlaying) {
              this.onPlayClick();
            }
            // [EndExclude continuous_task]
          });
        });
      });
    }).catch((error: BusinessError) => {
      console.error(`Failed to ensure an audio playback task. Code is ${error.code}, message is ${error.message}`);
    });
  }

  // 取消长时任务.then()写法
  stopContinuousTask(pauseOnSuccess: boolean = true): void {
    const context = this.context;
    if (context === undefined) {
      return;
    }
    const version: number = ++this.audioTaskVersion;
    this.audioTaskOperation = this.audioTaskOperation.then(() => {
      return backgroundTaskManager.stopBackgroundRunning(context).then(() => {
        console.info('Operation stopBackgroundRunning succeeded');
        // [StartExclude continuous_task]
        if (pauseOnSuccess && version === this.audioTaskVersion && PlayerModel.isPlaying) {
          PlayerModel.pauseMusic();
          PlayerModel.isPlaying = false;
        }
        // [EndExclude continuous_task]
      });
    }).catch((error: BusinessError) => {
      console.error(`Failed to stop the audio playback task. Code is ${error.code}, message is ${error.message}`);
    });
  }

  build() {
    Row() {
      Column() {
        Text('Index')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button() {
          Text('申请长时任务').fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .backgroundColor('#0D9FFB')
        .width(250)
        .height(40)
        .id('applyContinuousTask')
        .onClick(() => {
          // 通过按钮申请长时任务
          this.startContinuousTask();
        })

        Button() {
          Text('取消长时任务').fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .backgroundColor('#0D9FFB')
        .width(250)
        .height(40)
        .id('resetContinuousTask')
        .onClick(() => {
          // 此处结束具体的长时任务的执行

          // 通过按钮取消长时任务
          this.stopContinuousTask();
        })

        Button() {
          Text('注册长时任务取消回调').fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .backgroundColor('#0D9FFB')
        .width(250)
        .height(40)
        .onClick(() => {
          // 通过按钮注册长时任务取消回调
          this.OnContinuousTaskCancel();
        })

        Button() {
          Text('取消注册长时任务取消回调').fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .backgroundColor('#0D9FFB')
        .width(250)
        .height(40)
        .onClick(() => {
          // 通过按钮取消注册长时任务取消回调
          this.OffContinuousTaskCancel();
        })
        // [StartExclude continuous_task]
        Text('播音业务功能')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('播放/暂停音乐').fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .backgroundColor('#0D9FFB')
        .width(250)
        .height(40)
        .id('playAndPause')
        .onClick(() => {
          this.onPlayClick();
        })
        Button() {
          Text('上一首').fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .backgroundColor('#0D9FFB')
        .width(250)
        .height(40)
        .onClick(() => {
          this.onPreviousClick();
        })
        Button() {
          Text('下一首').fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 10 })
        .backgroundColor('#0D9FFB')
        .width(250)
        .height(40)
        .onClick(() => {
          this.onNextClick();
        })
        // [EndExclude continuous_task]
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End continuous_task]