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

import media from '@ohos.multimedia.media';
import { BusinessError } from '@ohos.base';

export interface AVPlayerListener {
  onPlaying() : void;
  onPaused() : void;
  onDurationChanged(duration: double) : void;
  onBufferedTimeChanged(buffered: double) : void;
  onTimeUpdate(time: double) : void;
  onEnded() : void;
  onError() : void;
  onVideoSizeChanged(width: double, height: double): void;
  onDestroyed(): void;
  onSeekFinished(): void;
  onSeeking(): void;
  onReadyStateChanged(): void;
  onPlaybackRateChanged(playbackRate: double): void;
  onVolumeChanged(volume: double): void;
}

export interface PlayerParam {
  url?: string;
  listener?: AVPlayerListener;
  httpHeaders?: Record<string, string>;
}

export interface PlayCommand {
  func: () => void;
  name?: string;
}

interface CheckPlayCommandResult {
  ignore: boolean;
  index_to_remove: int;
}

export class AVPlayerDemo {
  constructor() {}
  private surfaceID: string = ''; // surfaceID用于播放画面显示，具体的值需要通过Xcomponent接口获取，相关文档链接见上面Xcomponent创建方法

  avPlayer?: media.AVPlayer;
  prepared: boolean = false;

  commands: PlayCommand[] = [];

  setSurfaceID(surface_id: string): undefined {
    console.info(`AVPlayerDemo.setSurfaceID : ${surface_id}`);
    this.surfaceID = surface_id;
  }
  // 注册avplayer回调函数
  setAVPlayerCallback(avPlayer?: media.AVPlayer, listener?: AVPlayerListener): undefined {
    // seek操作结果回调函数
    avPlayer?.onSeekDone((seekDoneTime: int):void => {
      listener?.onSeeking();
      listener?.onSeekFinished();
      console.info(`AVPlayer seek succeeded, seek time is ${seekDoneTime}`);
    });
    // error回调监听函数,当avPlayer在操作过程中出现错误时调用reset接口触发重置流程
    avPlayer?.onError((err: BusinessError):void => {
      console.error(`Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
      listener?.onError();
      avPlayer?.reset(); // 调用reset重置资源，触发idle状态
    });
    // 状态机变化回调函数
    avPlayer?.onStateChange((
      state: "idle"|"initialized"|"prepared"|"playing"|"paused"|"completed"|"stopped"|"released"|"error",
      reason: media.StateChangeReason):void => {
      switch (state) {
        case 'idle': // 成功调用reset接口后触发该状态机上报
          console.info('AVPlayer state idle called.');
          avPlayer?.release(); // 调用release接口销毁实例对象
          break;
        case 'initialized': // avplayer 设置播放源后触发该状态上报
          console.info('AVPlayer state initialized called.');
          avPlayer!.surfaceId = this.surfaceID;// 设置显示画面，当播放的资源为纯音频时无需设置
          avPlayer?.prepare();
          break;
        case 'prepared': // prepare调用成功后上报该状态机
          console.info('AVPlayer state prepared called.');
          listener?.onReadyStateChanged();
          this.prepared = true;
          this.schedule();
          break;
        case 'playing': // play成功调用后触发该状态机上报
          console.info('AVPlayer state playing called.');
          listener?.onPlaying();
          break;
        case 'paused': // pause成功调用后触发该状态机上报
          console.info('AVPlayer state paused called.');
          listener?.onPaused();
          break;
        case 'completed': // 播放结束后触发该状态机上报
          console.info('AVPlayer state completed called.');
          avPlayer?.stop(); //调用播放结束接口
          break;
        case 'stopped': // stop接口成功调用后触发该状态机上报
          console.info('AVPlayer state stopped called.');
          listener?.onEnded();
          break;
        case 'released':
          this.prepared = false;
          listener?.onDestroyed();
          console.info('AVPlayer state released called.');
          break;
        default:
          console.info('AVPlayer state unknown called.');
          break;
      }
    });
    avPlayer?.onDurationUpdate((duration: int):void => {
      console.info(`AVPlayer state durationUpdate success,new duration is :${duration}`);
      listener?.onDurationChanged(duration/1000);
    });
    avPlayer?.onTimeUpdate((time: int):void => {
      listener?.onTimeUpdate(time/1000);
    });
    avPlayer?.onBufferingUpdate((infoType: media.BufferingInfoType, value: int):void => {
      console.info(`AVPlayer state bufferingUpdate success,and infoType value is:${infoType}, value is : ${value}`);
      if (infoType == media.BufferingInfoType.BUFFERING_PERCENT) {}
      listener?.onBufferedTimeChanged(value);
    })
    avPlayer?.onVideoSizeChange((width: int, height: int):void => {
      console.info(`AVPlayer state videoSizeChange success,and width is:${width}, height is : ${height}`);
      listener?.onVideoSizeChanged(width, height);
    })
    avPlayer?.onVolumeChange((volume: double):void => {
      console.info(`AVPlayer state volumeChange success,new volume is :${volume}`);
      listener?.onVolumeChanged(volume);
    });
    avPlayer?.onSpeedDone((speed: int) => {
      console.info(`AVPlayer state speedDone success,new speed is :${speed}`);
      let realSpeed = 0.00;
      if(speed == 0){realSpeed = 0.75;}
      if(speed == 1){realSpeed = 1.00;}
      if(speed == 2){realSpeed = 1.25;}
      if(speed == 3){realSpeed = 1.50;}
      listener?.onPlaybackRateChanged(realSpeed);
    })
  }

  // 以下示例通过URL设置网络地址来播放直播码流
  async avPlayerLiveDemo(playerParam: PlayerParam) {
    // 创建avPlayer实例对象
    this.avPlayer = await media.createAVPlayer();
    // 创建状态机变化回调函数
    this.setAVPlayerCallback(this.avPlayer, playerParam.listener);

    let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(
      playerParam.url ?? '',
      playerParam.httpHeaders) ;
    let strategy: media.PlaybackStrategy = {
      preferredWidth: 100,
      preferredHeight: 100,
      preferredBufferDuration: 100,
      preferredHdr: false
    };
    this.avPlayer?.setMediaSource(mediaSource as media.MediaSource, strategy);
    console.info(`AVPlayer url:[${playerParam.url}]`);
  }
  schedule(): undefined {
    if (!this.avPlayer) {
      return;
    }
    if (!this.prepared) {
      return;
    }
    if (this.commands.length > 0) {
      let command = this.commands.shift();
      if (command) {
        command.func();
      }
      if (this.commands.length > 0) {
        setTimeout(() => {
          this.schedule();
        });
      }
    }
  }
  private checkCommand(selfName: string, oppositeName: string) {
    let index_to_remove = -1;
    let ignore_this_action = false;
    let index = this.commands.length - 1;
    while (index >= 0) {
      if (this.commands[index].name == selfName) {
        ignore_this_action = true;
        break;
      }
      if (this.commands[index].name == oppositeName) {
        index_to_remove = index;
        break;
      }
      index--;
    }

    let result : CheckPlayCommandResult = {
      ignore: ignore_this_action,
      index_to_remove: index_to_remove,
    };
    return result;
  }
  play(): undefined {
    let commandName = 'play';
    let checkResult = this.checkCommand(commandName, 'pause');
    if (checkResult.ignore) {
      console.info(`AVPlayer ${commandName} ignored.`);
      this.schedule();
      return;
    }
    if (checkResult.index_to_remove >= 0) {
      let removedCommand = this.commands.splice(checkResult.index_to_remove, 1);
      console.info(`AVPlayer ${JSON.stringify(removedCommand)} removed.`);
      return;
    }
    this.commands.push({ func: ()=>{
      console.info('AVPlayer.play()');
      this.avPlayer?.play();
    }, name: commandName});
    this.schedule();
  }
  pause(): undefined {
    let commandName = 'pause';
    let checkResult = this.checkCommand(commandName, 'play');
    console.info(`checkResult:${JSON.stringify(checkResult)}`);
    if (checkResult.ignore) {
      console.info(`AVPlayer ${commandName} ignored.`);
      this.schedule();
      return;
    }
    if (checkResult.index_to_remove >= 0) {
      let removedCommand = this.commands.splice(checkResult.index_to_remove, 1);
      console.info(`AVPlayer ${JSON.stringify(removedCommand)} removed.`);
      return;
    }
    this.commands.push({ func: ()=>{
      console.info('AVPlayer.pause()');
      this.avPlayer?.pause();
    }, name: commandName});
    this.schedule();
  }
  release(): undefined {
    this.commands.push({ func: ()=>{
      console.info('AVPlayer.release()');
      this.avPlayer?.release();
    }});
    this.schedule();
  }
  seek(time: double): undefined {
    this.commands.push({ func: ()=>{
      console.info(`AVPlayer.seek(${time})`);
      this.avPlayer?.seek((time * 1000).toInt());
    }});
    this.schedule();
  }
  setVolume(volume: double): undefined {
    this.commands.push({ func: ()=>{
      console.info(`AVPlayer.setVolume(${volume})`);
      this.avPlayer?.setVolume(volume);
    }});
    this.schedule();
  }
  setPlaybackRate(playbackRate: double): undefined {
    let speed = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
    let delta = 0.05;
    playbackRate += delta;
    if (playbackRate < 1) {
      speed = media.PlaybackSpeed.SPEED_FORWARD_0_75_X;
    } else if (playbackRate < 1.25) {
      speed = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
    } else if (playbackRate < 1.5) {
      speed = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
    } else if (playbackRate < 2) {
      speed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
    } else {
      speed = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
    }
    this.commands.push({ func: ()=>{
      console.info(`AVPlayer.setSpeed(${speed})`);
      this.avPlayer?.setSpeed(speed);
    }});
    this.schedule();
  }
}