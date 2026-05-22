'use static';
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

import { audio } from '@kit.AudioKit';
import { Entry, Row, Component, Column, Button } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import media from '@ohos.multimedia.media';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  private soundPool: media.SoundPool | undefined = undefined;
  private soundId: int = 0;
  private streamId: int = 0;

  build() {
    Row() {
      Column() {
        Button('playSoundPool')
          .width(100)
          .height(100)
          .onClick(() => {
            this.PlaySoundPool()
          })
          .id('playSoundPoolButton')
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear(): void {
    this.create();
  }

  aboutToDisappear(): void {
    this.release();
  }

  async create() {
    try {
      // [Start create]
      // audioRendererInfo中的参数usage取值为STREAM_USAGE_UNKNOWN，STREAM_USAGE_MUSIC，STREAM_USAGE_MOVIE。
      // STREAM_USAGE_AUDIOBOOK时，SoundPool播放短音时为混音模式，不会打断其他音频播放。
      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC, // 音频流使用类型：音乐。根据业务场景配置，参考StreamUsage。
        rendererFlags: 1 // 音频渲染器标志。
      }
      // 创建soundPool实例。
      this.soundPool = await media.createSoundPool(14,audioRendererInfo);
      // [End create]
      // 注册监听。
      this.loadCallback();
      this.finishPlayCallback();
      this.setErrorCallback();

      // [Start load_sound]
      // 加载音频资源。
      let context = this.getUIContext().getHostContext();
      let fileDescriptor = await context!.resourceManager.getRawFd('test.ogg');
      this.soundId = await this.soundPool!.load(fileDescriptor.fd, fileDescriptor.offset, fileDescriptor.length);
      console.info(`load soundPool soundId: ${this.soundId}`)
      // [End load_sound]
    } catch (e) {
      console.error('createSoundPool error: ' + e);
    }
  }

  async loadCallback() {
    // [Start load_callback]
    // 加载完成回调。
    this.soundPool!.onLoadComplete((soundId_: int) => {
      this.soundId = soundId_;
      console.info('loadComplete soundId: ' + soundId_);
    })
    // [End load_callback]
  }

  // [Start play_finished_callback]
  // 设置播放完成监听。
  async finishPlayCallback() {
    this.soundPool!.onPlayFinished(() => {
      console.info('receive play finished message');
      // 可进行下次播放。
    })
  }
  // [End play_finished_callback]
  // [Start error_callback]
  // 设置错误类型监听。
  async setErrorCallback() {
    this.soundPool!.onError((error: BusinessError) => {
      console.error('error happened,message is :' + error.code);
      console.error('error happened,message is :' + error.message);
    })
  }
  // [End error_callback]

  async PlaySoundPool() {
    // [Start play_sound]
    let playParameters: media.PlayParameters = {
      loop: 1, // 循环1次，即播放2次。
      rate: 1, // 1倍速播放。
      leftVolume: 0.5, // 取值范围[0.0-1.0]。
      rightVolume: 0.5, // 取值范围[0.0-1.0]。
      priority: 0, // 最低优先级。
    };
    // 开始播放，调用play可携带播放参数PlayParameters。请在音频资源加载完毕，即收到loadComplete回调之后再执行play操作。
    let playCallback = (error: BusinessError<void> | null, streamID: int | undefined): void => {
      if (error) {
        console.error(`play sound Error: errCode is ${error.code}, errMessage is ${error.message}`)
      } else if (streamID) {
        this.streamId = streamID;
        console.info('Succeeded in playing soundId:' + this.streamId);
      } else {
        console.info('failed to play sound: streamId is null.');
      }
    };
    this.soundPool!.play(this.soundId, playParameters, playCallback);
    // [End play_sound]
    // [Start set_loop]
    // 设置循环播放次数。
    await this.soundPool!.setLoop(this.streamId, 2); // 播放3次。
    // [End set_loop]
    // [Start set_priority]
    // 设置对应流的优先级。
    await this.soundPool!.setPriority(this.streamId, 1);
    // [End set_priority]
    // [Start set_volume]
    // 设置音量。
    await this.soundPool!.setVolume(this.streamId, 0.5, 0.5);
    // [End set_volume]
  }

  async release() {
    // [Start stop_playing]
    // 终止指定流的播放。
    await this.soundPool!.stop(this.streamId);
    // [End stop_playing]
    // [Start unload_sound]
    // 卸载音频资源。
    await this.soundPool!.unload(this.soundId);
    // [End unload_sound]
    //关闭监听。
    this.setOffCallback();
    // [Start release]
    // 释放SoundPool。
    await this.soundPool!.release();
    // [End release]
  }

  async setOffCallback() {
    // [Start off_callback_load_completed]
    this.soundPool!.offLoadComplete();
    // [End off_callback_load_completed]
    // [Start off_callback_play_finished]
    this.soundPool!.offPlayFinished();
    // [End off_callback_play_finished]
    // [Start off_callback_error]
    this.soundPool!.offError();
    // [End off_callback_error]
  }
}