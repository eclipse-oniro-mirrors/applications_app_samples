'use static'
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
import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import emitter from '@ohos.events.emitter';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import common from '@ohos.app.ability.common';
import media from '@ohos.multimedia.media';
import audio from '@ohos.multimedia.audio';
import drm from '@ohos.multimedia.drm';
import { ReadOptions } from '@ohos.file.fs';

import fs from '@ohos.file.fs';
import { globalContext } from '../entryability/GlobalContext';
import {
  Entry,
  Text,
  TextAlign,
  ButtonType,
  FontWeight,
  Column,
  Component,
  Row,
  Button,
  ClickEvent,
  TouchEvent,
  Image,
  Scroll,
  Scroller,
  Blank,
  SliderChangeMode,
  Slider,
  SliderStyle,
  Select,
  ArrowPosition,
  MenuAlignType,
  OnSelectCallback,
  ColumnOptions,
  RowOptions,
  SelectOption,
  Margin,
  $r,
  Color,
  Padding,
  Visibility,
  Stack,
  Resource,
  FlexAlign,
  Alignment,
  TouchType,
  XComponent,
  XComponentController,
  XComponentOptions,
  XComponentType
} from '@ohos.arkui.component' // should be insert by ui-plugins
import { State, StorageLink } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { Context, UIContext } from '@ohos.arkui.UIContext'
import resourceManager from '@ohos.resourceManager';
import { Position } from 'arkui.component.units'
import { Color } from 'arkui.component.enums'


const PROPORTION = 0.99; // 占屏幕比例
const SURFACE_W = 0.9; // 表面宽比例
const SURFACE_H = 1.78; // 表面高比例
const SET_INTERVAL = 100; // interval间隔时间
const TIME_ONE = 60000;
const TIME_TWO = 1000;
const SPEED_ZERO = 0;
const SPEED_ONE = 1;
const SPEED_TWO = 2;
const SPEED_THREE = 3;
const SPEED_COUNT = 4;
let innerEventFalse: emitter.InnerEvent = {
  eventId: 1,
  priority: emitter.EventPriority.HIGH
};
let innerEventTrue: emitter.InnerEvent = {
  eventId: 2,
  priority: emitter.EventPriority.HIGH
};
let innerEventWH: emitter.InnerEvent = {
  eventId: 3,
  priority: emitter.EventPriority.HIGH
};

@Entry
@Component
struct Index {
  tag: string = 'AVPlayManager';
  private xComponentController: XComponentController = new XComponentController();
  private avPlayer: media.AVPlayer | undefined = undefined;
  private surfaceId: string = '';
  private intervalID: int = -1;
  private seekTime: number = -1;
  private context: common.UIAbilityContext = globalContext.getAbilityContext();

  @State title: Resource = $r('app.string.EntryAbility_label');
  @State fileName: string = 'test1.mp4';
  @State isSwiping: boolean = false; // 用户滑动过程中
  @State isPaused: boolean = true; // 暂停播放
  @State XComponentFlag: boolean = true;
  @State speedSelect: number = 0; // 倍速选择
  @State speedList: Resource[] = [$r('app.string.video_speed_1_0X'), $r('app.string.video_speed_1_25X'), $r('app.string.video_speed_1_75X'), $r('app.string.video_speed_2_0X')];
  @StorageLink('durationTime') durationTime: number = 0; // 视频总时长
  @StorageLink('currentTime') currentTime: number = 0; // 视频当前时间
  @StorageLink('speedName') speedName: Resource = $r('app.string.video_speed_1_0X');
  @StorageLink('speedIndex') speedIndex: int = 0; // 倍速索引
  @State surfaceW: number | null = null;
  @State surfaceH: number | null = null;
  @State percent: number = 0;
  @State windowWidth: number = 300;
  @State windowHeight: number = 200;
  @State subtitle: string | undefined = '';
  @State seekMode: media.SeekMode = media.SeekMode.SEEK_PREV_SYNC;

  getDurationTime(): number {
    return this.durationTime;
  }

  getCurrentTime(): number {
    return this.currentTime;
  }

  timeConvert(time: number): string {
    let min: number = Math.floor(time / TIME_ONE);
    let second: string = ((time % TIME_ONE) / TIME_TWO).toFixed(0);
    // return `${min}:${(+second < TIME_THREE ? '0' : '') + second}`;
    second = second.padStart(2, '0');
    return `${min}:${second}`;
  }

  async msleepAsync(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time.toInt());
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  async avSetupVideoAndSubtitle() {
    // 通过UIAbilityContext的resourceManager成员的getRawFd接口获取媒体资源播放地址。
    // 返回类型为{fd,offset,length},fd为HAP包fd地址，offset为媒体资源偏移量，length为播放长度。
    if (this.context == undefined) return;
    let fileDescriptorVideo = await this.context.resourceManager.getRawFd(this.fileName);
    let avFileDescriptor: media.AVFileDescriptor =
      { fd: fileDescriptorVideo.fd, offset: fileDescriptorVideo.offset, length: fileDescriptorVideo.length };

    if (this.avPlayer) {
      console.info(`${this.tag}: init avPlayer release2createNew`);
      this.avPlayer?.release();
      await this.msleepAsync(1500);
    }
    // 创建avPlayer实例对象
    this.avPlayer = await media.createAVPlayer();

    // 创建状态机变化回调函数
    await this.setAVPlayerCallback((avPlayer: media.AVPlayer) => {
      this.percent = avPlayer.width / avPlayer.height;
      this.setVideoWH();
      this.durationTime = this.getDurationTime();
      setInterval(() => { // 更新当前时间
        if (!this.isSwiping) {
          this.currentTime = this.getCurrentTime();
        }
      }, SET_INTERVAL);
    });

    // 为fdSrc赋值触发initialized状态机上报
    this.avPlayer!.fdSrc = avFileDescriptor;

    // [Start addSubtitleFromFd]
    // 设定字幕
    let fileDescriptorSub = await this.context.resourceManager.getRawFd('test1.srt');
    this.avPlayer!.addSubtitleFromFd(fileDescriptorSub.fd, fileDescriptorSub.offset, fileDescriptorSub.length);
    // [End addSubtitleFromFd]
  }

  // [Start offSubtitleUpdate]
  // (可选)当需要不显示字幕的时候，使用视频播放的AVPlayer实例注销字幕回调函数
  // async avTurnOffSubtitle() {
  //   this.avPlayer?.offSubtitleUpdate();
  // }
  // [End offSubtitleUpdate]

  avPlay(): void {
    if (this.avPlayer) {
      try {
        this.avPlayer?.play();
      } catch (e) {
        console.error(`${this.tag}: avPlay = ${JSON.stringify(e)}`);
      }
    }
  }

  avPause(): void {
    if (this.avPlayer) {
      try {
        this.avPlayer?.pause();
        console.info(`${this.tag}: avPause==`);
      } catch (e) {
        console.error(`${this.tag}: avPause== ${JSON.stringify(e)}`);
      }
    }
  }

  async avSeek(seekTime: int, mode: SliderChangeMode): Promise<void> {
    if (this.avPlayer) {
      try {
        console.info(`${this.tag}: videoSeek  seekTime== ${seekTime}`);
        this.avPlayer!.seek(seekTime, this.seekMode);
        this.currentTime = seekTime;
      } catch (e) {
        console.error(`${this.tag}: videoSeek== ${JSON.stringify(e)}`);
      }
    }
  }

  avSetSpeed(speed: media.PlaybackSpeed): void {
    if (this.avPlayer) {
      try {
        this.avPlayer!.setSpeed(speed);
        console.info(`${this.tag}: avSetSpeed enum ${speed}`);
      } catch (e) {
        console.error(`${this.tag}: avSetSpeed == ${JSON.stringify(e)}`);
      }
    }
  }

  // 注册avplayer回调函数
  async setAVPlayerCallback(callback: (avPlayer: media.AVPlayer) => void, vType?: number): Promise<void> {
    // seek操作结果回调函数
    if (this.avPlayer == null) {
      console.error(`${this.tag}: avPlayer has not init!`);
      return;
    }
    this.avPlayer?.onSeekDone((seekDoneTime: int) => {
      console.info(`${this.tag}: setAVPlayerCallback AVPlayer seek succeeded, seek time is ${seekDoneTime}`);
    });
    this.avPlayer?.onSpeedDone((speed) => {
      console.info(`${this.tag}: setAVPlayerCallback AVPlayer speedDone, speed is ${speed}`);
    });
    // error回调监听函数,当avPlayer在操作过程中出现错误时调用reset接口触发重置流程
    this.avPlayer?.onError((err: BusinessError) => {
      console.error(`${this.tag}: setAVPlayerCallback Invoke avPlayer failed ${JSON.stringify(err)}`);
      if (this.avPlayer == null) {
        console.error(`${this.tag}: avPlayer has not init on error`);
        return;
      }
      this.avPlayer?.reset();
    });
    // 状态机变化回调函数
    this.avPlayer?.onStateChange((state, reason) => {
      if (this.avPlayer == null) {
        console.info(`${this.tag}: avPlayer has not init on state change`);
        return;
      }
      switch (state) {
        case 'idle': // 成功调用reset接口后触发该状态机上报
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state idle called.`);
          break;
        case 'initialized': // avplayer 设置播放源后触发该状态上报
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state initialized called.`);
          if (this.surfaceId) {
            this.avPlayer!.surfaceId = this.surfaceId; // 设置显示画面，当播放的资源为纯音频时无需设置
            console.info(`${this.tag}: setAVPlayerCallback this.avPlayer.surfaceId = ${this.avPlayer!.surfaceId}`);
            this.avPlayer?.prepare();
          }
          break;
        case 'prepared': // prepare调用成功后上报该状态机
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state prepared called.`);
          // [Start onBufferingUpdate]
          this.avPlayer?.onBufferingUpdate((infoType: media.BufferingInfoType, value: int) => {
            console.info(`${this.tag}: bufferingUpdate called, infoType value: ${infoType}, value:${value}`);
          })
          // [End onBufferingUpdate]
          this.durationTime = this.avPlayer!.duration;
          this.currentTime = this.avPlayer!.currentTime;
          this.avPlayer?.play(); // 调用播放接口开始播放
          console.info(`${this.tag}:
            setAVPlayerCallback speedSelect: ${this.speedSelect}, duration: ${this.durationTime}`);
          if (this.speedSelect != -1) {
            switch (this.speedSelect) {
              case SPEED_ZERO:
                this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
                break;
              case SPEED_ONE:
                this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_25_X);
                break;
              case SPEED_TWO:
                this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_75_X);
                break;
              case SPEED_THREE:
                this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
                break;
            }
          }
          callback(this.avPlayer!);
          break;
        case 'playing': // play成功调用后触发该状态机上报
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state playing called.`);
          if (this.intervalID != -1) {
            clearInterval(this.intervalID)
          }
          this.intervalID = setInterval(() => { // 更新当前时间
            AppStorage.setOrCreate('durationTime', this.durationTime);
            AppStorage.setOrCreate('currentTime', this.currentTime);
          }, 100);
          let eventDataTrue: emitter.EventData = {
            data: {
              'flag': true
            }
          };
          let innerEventTrue: emitter.InnerEvent = {
            eventId: 2,
            priority: emitter.EventPriority.HIGH
          };
          emitter.emit(innerEventTrue, eventDataTrue);
          break;
        case 'completed': // 播放结束后触发该状态机上报
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state completed called.`);
          let eventDataFalse: emitter.EventData = {
            data: {
              'flag': false
            }
          };
          let innerEvent: emitter.InnerEvent = {
            eventId: 1,
            priority: emitter.EventPriority.HIGH
          };
          emitter.emit(innerEvent, eventDataFalse);
          if (this.intervalID != -1) {
            clearInterval(this.intervalID)
          }
          this.avPlayer!!.offBufferingUpdate();
          AppStorage.setOrCreate('currentTime', this.durationTime);
          break;
        case 'released':
          console.info(`${this.tag}: setAVPlayerCallback released called.`);
          break
        case 'stopped':
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state stopped called.`);
          break
        case 'error':
          console.error(`${this.tag}: setAVPlayerCallback AVPlayer state error called.`);
          break
        case 'paused':
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state paused called.`);
          break
        default:
          console.info(`${this.tag}: setAVPlayerCallback AVPlayer state unknown called.`);
          break;
      }
    });
    // 时间上报监听函数
    this.avPlayer!.onTimeUpdate((time: int) => {
      this.currentTime = time;
    });
    // [Start onSubtitleUpdate]
    // 字幕回调函数
    this.avPlayer!.onSubtitleUpdate((info: media.SubtitleInfo) => {
      if (!!info) {
        let text = (!info.text) ? '' : info.text;
        let startTime = (!info.startTime) ? 0 : info.startTime;
        let duration = (!info.duration) ? 0 : info.duration;
        console.info(`${this.tag}: subtitleUpdate info: text=${text} startTime=${startTime} duration=${duration}`);
        this.subtitle = text;
      } else {
        console.info(`${this.tag}: subtitleUpdate info is null`);
      }
    });
    // [End onSubtitleUpdate]
  }

  aboutToAppear() {
    this.windowWidth = display.getDefaultDisplaySync().width;
    this.windowHeight = display.getDefaultDisplaySync().height;
    this.surfaceW = this.windowWidth * SURFACE_W;
    this.surfaceH = (this.surfaceW as number) / SURFACE_H;
    this.isPaused = true;
    this.context = globalContext.getAbilityContext() as common.UIAbilityContext;
  }

  aboutToDisappear() {
    if (this.avPlayer == null) {
      console.info(`${this.tag}: avPlayer has not init aboutToDisappear`);
      return;
    }
    this.avPlayer?.release((err) => {
      if (err == null) {
        console.info(`${this.tag}: videoRelease release success`);
      } else {
        console.error(`${this.tag}: videoRelease release failed, error message is = ${JSON.stringify(err.message)}`);
      }
    });
    emitter.off(innerEventFalse.eventId);
  }

  onPageHide() {
    this.avPause();
    this.isPaused = false;
  }

  setVideoWH(): void {
    if (this.percent >= 1) { // 横向视频
      this.surfaceW = Math.round(this.windowWidth * PROPORTION);
      this.surfaceH = Math.round((this.surfaceW!) / this.percent);
    } else { // 纵向视频
      this.surfaceH = Math.round(this.windowHeight * PROPORTION);
      this.surfaceW = Math.round((this.surfaceH!) * this.percent);
    }
  }

  @Builder
  CoverXComponent() {
    XComponent({
      // 装载视频容器
      type: XComponentType.SURFACE,
      controller: this.xComponentController
    })
      .id('VideoView')
      .visibility(this.XComponentFlag ? Visibility.Visible : Visibility.Hidden)
      .onLoad(() => {
        this.surfaceId = this.xComponentController.getXComponentSurfaceId();
        this.avSetupVideoAndSubtitle();
      })
      .height(`${this.surfaceH}px`)
      .width(`${this.surfaceW}px`)
  }

  build() {
    Column() {
      Stack() {
        Column() {
          this.CoverXComponent()
        }
        .align(Alignment.TopStart)
        .margin({ top: 80 })
        .id('VideoView')
        .justifyContent(FlexAlign.Center)

        Text()
          .height(`${this.surfaceH}px`)
          .width(`${this.surfaceW}px`)
          .margin({ top: 80 })
          .backgroundColor(Color.Black)
          .opacity($r('app.float.size_zero_five'))
          .visibility(this.isSwiping ? Visibility.Visible : Visibility.Hidden)

        Row() {
          Text(this.timeConvert(this.currentTime))
            .id("currentTime")
            .fontSize($r('app.float.size_24'))
            .opacity($r('app.float.size_1'))
            .fontColor($r("app.color.slider_selected"))
          Text("/" + this.timeConvert(this.durationTime))
            .id("durationTime")
            .fontSize($r('app.float.size_24'))
            .opacity($r('app.float.size_1'))
            .fontColor(Color.White)
        }
        .margin({ top: 80 })
        .visibility(this.isSwiping ? Visibility.Visible : Visibility.Hidden)

        Column() {

          Blank()

          Column() {
            // 进度条
            Row() {
              Row() {
                // 播放、暂停键
                Image(this.isPaused ? $r("app.media.ic_video_play") : $r("app.media.ic_video_pause"))// 暂停/播放
                  .id(this.isPaused ? 'pause' : 'play')
                  .width($r('app.float.size_40'))
                  .height($r('app.float.size_40'))
                  .onClick(() => {
                    if (this.isPaused) {
                      this.avPause();
                      this.isPaused = false;
                    } else {
                      this.avPlay();
                      this.isPaused = true;
                    }
                  })
                // 左侧时间
                Text(this.timeConvert(this.currentTime))
                  .id("currentTimeText")
                  .fontColor(Color.White)
                  .textAlign(TextAlign.End)
                  .fontWeight(FontWeight.Regular)
                  .margin({ left: $r('app.float.size_10') })
              }

              // 进度条
              Row() {
                Slider({
                  value: this.currentTime,
                  min: 0,
                  max: this.durationTime,
                  style: SliderStyle.OutSet
                })
                  .id('Slider')
                  .blockColor(Color.White)
                  .trackColor(Color.Gray)
                  .selectedColor($r("app.color.slider_selected"))
                  .showTips(false)
                  .onChange((value: number, mode: SliderChangeMode) => {
                    if (this.seekTime !== value) {
                      this.seekTime = value.toInt();
                      this.avSeek(value.toInt(), mode);
                    }
                  })
              }
              .layoutWeight(1)

              Row() {
                // 右侧时间
                Text(this.timeConvert(this.durationTime))
                  .id("durationTimeText")
                  .fontColor(Color.White)
                  .fontWeight(FontWeight.Regular)

                // 倍速按钮
                Button(this.speedName, { type: ButtonType.Normal })
                  .border({ width: $r('app.float.size_1'), color: Color.White })
                  .width(75)
                  .height($r('app.float.size_40'))
                  .fontSize($r('app.float.size_15'))
                  .borderRadius($r('app.float.size_24'))
                  .fontColor(Color.White)
                  .backgroundColor(Color.Black)
                  .opacity($r('app.float.size_1'))
                  .margin({ left: $r('app.float.size_10') })
                  .id('Speed')
                  .onClick(() => {
                    this.speedIndex = (this.speedIndex + 1) % SPEED_COUNT;
                    this.speedSelect = this.speedIndex;
                    this.speedName = this.speedList[this.speedIndex];
                    if(!this.avPlayer) return;
                    switch (this.speedSelect) {
                      case 0:
                        this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
                        break;
                      case 1:
                        this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_25_X);
                        break;
                      case 2:
                        this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_75_X);
                        break;
                      case 3:
                        this.avSetSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
                        break;
                    }
                  })
              }
            }
            .justifyContent(FlexAlign.Center)
            .padding({ left: $r('app.float.size_25'), right: $r('app.float.size_30') })
            .width('100%')
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
        }
        .width('100%')
        .height('100%')
      }
      .backgroundColor(Color.Black)
      .height('90%')
      .width('100%')

      Row() {
        Text(this.title)
          .fontSize($r('app.float.size_20'))
          .fontColor(Color.White)
          .opacity($r('app.float.size_zero_six'))
          .fontWeight(FontWeight.Regular)
          .textAlign(TextAlign.Center)
          .margin({ top: 10 })
      }
      Row() {
        Text(this.subtitle)
          .fontSize($r('app.float.size_20'))
          .fontColor(Color.White)
          .opacity($r('app.float.size_zero_six'))
          .fontWeight(FontWeight.Regular)
          .textAlign(TextAlign.Center)
      }
    }.backgroundColor(Color.Black)
    .height('100%')
    .width('100%')
  }
}
