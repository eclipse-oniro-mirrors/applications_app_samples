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

import { pcmList } from '../model/PcmListData';
import { PcmItem } from '../viewmodel/PcmData';
import PcmItemBuilder from '../viewmodel/PcmItemBuilder';
import { Logger } from '../utils/Logger';
import { AVSessionController } from './AVSessionController';
import { resourceManager } from '@kit.LocalizationKit';
import { MediaControlCenterHandle } from './MediaControlCenterHandle';
import { BackgroundUtil } from '../utils/BackgroundUtil';
import { common } from '@kit.AbilityKit';
import { audio } from '@kit.AudioKit';

const TAG = 'MediaControlCenter';

export class MediaControlCenter {
  private avSessionController: AVSessionController | undefined = undefined;
  private mediaControlCenterHandle: MediaControlCenterHandle | undefined = undefined;
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');
  private pcmItemBuilder: PcmItemBuilder = new PcmItemBuilder();
  private pcmRawFileDescriptor: resourceManager.RawFileDescriptor | undefined = undefined;
  private pcmList: PcmItem[] = [];
  private musicIndex: number = 0;
  private audioSessionManager: audio.AudioSessionManager | undefined = undefined;
  private isInitted = false;
  private static mediaControlFunction: MediaControlCenter;

  constructor() {
    this.pcmList = pcmList;
    AppStorage.setOrCreate('pcmList', pcmList);
    this.pcmItemBuilder = new PcmItemBuilder();
  }

  // [Start loadPcmAssent]
  private async loadPcmAssent() {
    Logger.info(TAG, `loadPcmAssent  : info`);
    await this.pcmItemBuilder.build(this.pcmList[this.musicIndex]);
    Logger.info(TAG, `loadPcmAssent  : info`);
    this.pcmRawFileDescriptor = this.pcmItemBuilder.getRawFileDescriptor();
    if (!this.pcmRawFileDescriptor) {
      Logger.error(TAG, `loadPcmAssent faile : pcmRawFileDescriptor get failed`);
      return;
    }
    if (!this.mediaControlCenterHandle) {
      Logger.error(TAG, 'mediaControlCenterHandle is undefined');
      return;
    }
    this.mediaControlCenterHandle.loadPcmAssent(this.pcmRawFileDescriptor);
  }

  // [End loadPcmAssent]

  public static getInstance(): MediaControlCenter {
    if (!MediaControlCenter.mediaControlFunction) {
      MediaControlCenter.mediaControlFunction = new MediaControlCenter();
    }
    return MediaControlCenter.mediaControlFunction;
  }

  private async initAVSession() {
    this.avSessionController = AVSessionController.getInstance();
    await this.avSessionController.initAVSession();
  }

  private async initHandle() {
    this.mediaControlCenterHandle = MediaControlCenterHandle.getInstance();
    await this.mediaControlCenterHandle.init();
  }

  private async initAudioManager() {
    let audioManger = audio.getAudioManager();
    this.audioSessionManager = audioManger.getSessionManager();
    await this.activateAudioSession();
  }

  private async activateAudioSession(concurrencyMode: audio.AudioConcurrencyMode = audio.AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS) {
    if (!this.audioSessionManager) {
      return;
    }
    let strategy: audio.AudioSessionStrategy = {
      concurrencyMode: concurrencyMode
    };
    try {
      await this.audioSessionManager.activateAudioSession(strategy);
    } catch (error) {
      Logger.info(TAG, 'activateAudioSession Failed');
    }
    Logger.info(TAG, 'activateAudioSession SUCCESS');
  }

  public async init() {
    Logger.info(TAG, 'activateAudioSession init');
    if (this.isInitted) {
      return;
    }
    await this.initHandle();
    await this.loadPcmAssent();
    Logger.info(TAG, 'activateAudioSession loadPcmAssent');
    await this.initAVSession();
    await this.initAudioManager();
    this.isInitted = true;
  }

  public release() {
    if (!this.mediaControlCenterHandle) {
      Logger.error(TAG, 'mediaControlCenterHandle is undefined');
      return;
    }
    if (!this.avSessionController) {
      Logger.error(TAG, 'avSessionController is undefined');
      return;
    }
    this.avSessionController.unregisterSessionListener();
    this.mediaControlCenterHandle.release();
  }

  // [Start StartContinuousTask]
  public async play(index: number = this.musicIndex) {
    await this.loadPcmAssent();
    Logger.info(TAG, `index is ${index},musicIndex is ${this.musicIndex}`)
    if (!this.mediaControlCenterHandle) {
      Logger.error(TAG, 'mediaControlCenterHandle is undefined');
      return;
    }
    this.updateIsPlay(true);
    this.mediaControlCenterHandle.play();
    BackgroundUtil.startContinuousTask(this.context);
  }

  public pause() {
    if (!this.mediaControlCenterHandle) {
      Logger.error(TAG, 'mediaControlCenterHandle is undefined');
      return;
    }
    this.mediaControlCenterHandle.pause();
    this.updateIsPlay(false);
    BackgroundUtil.stopContinuousTask(this.context!);
  }

  // [End StartContinuousTask]

  public async stop() {
    if (!this.context) {
      return;
    }
    if (!this.mediaControlCenterHandle) {
      return;
    }
    await this.mediaControlCenterHandle.stop();
    Logger.info(TAG, 'stop success')
    BackgroundUtil.stopContinuousTask(this.context);
  }

  public updateIsPlay(isPlay: boolean) {
    Logger.info(TAG, `avSessionController isPlay is ${isPlay}`)
    AppStorage.setOrCreate<boolean>('isPlay', isPlay);
    if (!this.avSessionController) {
      Logger.error(TAG, `avSessionController is undefined`);
      return;
    }
  }
}