/*
* Copyright (C) 2023 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import AVSessionManager from '@ohos.multimedia.avsession';
import bundle from '@ohos.bundle';
import Log from '../common/Logger';

const TAG = "ControllerComponent";

export default class control {
  private isPlaying: boolean = false;
  private isLyric: boolean = false;
  private bundleNameMap: Map<string, string> = new Map();
  private controllerMap: Map<string, AVSessionManager.AVSessionController> = new Map();
  private metaDataMap: Map<string, AVSessionManager.AVMetadata> = new Map();
  private playStateMap: Map<string, AVSessionManager.PlaybackState> = new Map();
  private queueTitleMap: Map<string, string> = new Map();
  private queueItemsMap: Map<string, Array<AVSessionManager.AVQueueItem>> = new Map();
  private lyricMap: Map<string, string> = new Map();
  private sessionArray: Array<string> = new Array();
  private isPlayingLink: SubscribedAbstractProperty< boolean> | undefined = undefined;
  private isLyricLink: SubscribedAbstractProperty< boolean> | undefined = undefined;
  private bundleNameMapLink: SubscribedAbstractProperty< Map<string, string>> | undefined = undefined;
  private metaDataMapLink: SubscribedAbstractProperty< Map<string, AVSessionManager.AVMetadata>> | undefined = undefined;
  private playStateMapLink: SubscribedAbstractProperty< Map<string, AVSessionManager.PlaybackState>> | undefined = undefined;
  private queueTitleMapLink: SubscribedAbstractProperty< Map<string, string>> | undefined = undefined;
  private queueItemsMapLink: SubscribedAbstractProperty< Map<string, AVSessionManager.AVQueueItem[]>> | undefined = undefined;
  private lyricMapLink: SubscribedAbstractProperty< Map<string, string>> | undefined = undefined;
  private sessionArrayLink: SubscribedAbstractProperty<string[]> | undefined = undefined;

  constructor() {
    Log.info(TAG, 'constructor');
    this.initLink();
    Log.info(TAG, 'constructor done');
    this.interval();
  }

  async initLink(): Promise<void> {
    Log.info(TAG, 'initLink');
    this.isPlayingLink = AppStorage.setAndLink< boolean>('isPlaying', false);
    this.isLyricLink = AppStorage.setAndLink<boolean>('isLyric', false);
    this.bundleNameMapLink = AppStorage.setAndLink< Map<string, string>>('bundleNameMap', new Map());
    this.metaDataMapLink = AppStorage.setAndLink< Map<string, AVSessionManager.AVMetadata>>('metaDataMap', new Map());
    this.playStateMapLink = AppStorage.setAndLink< Map<string, AVSessionManager.PlaybackState>>('playStateMap', new Map());
    this.queueItemsMapLink = AppStorage.setAndLink< Map<string, AVSessionManager.AVQueueItem[]>>('queueItemsMap', new Map());
    this.queueTitleMapLink = AppStorage.setAndLink< Map<string, string>>('queueTitleMap', new Map());
    this.lyricMapLink = AppStorage.setAndLink< Map<string, string>>('lyricMap', new Map());
    this.sessionArrayLink = AppStorage.setAndLink< string[]>('sessionArray', []);
    Log.info(TAG, 'initLink done');
  }

  async startControl(): Promise<void> {
    Log.info(TAG, 'startControl');
    for (let i = 0; i < this.sessionArray.length; i++) {
      let oldController: AVSessionManager.AVSessionController | undefined =
        this.controllerMap.get(this.sessionArray[i]);
      if (oldController) {
        try {
          await oldController.destroy();
        } catch (error) {
          Log.info(TAG, 'destroy old controller failed : ' + JSON.stringify(error));
        }
      }
    }
    this.sessionArray = [];
    this.controllerMap = new Map();
    this.metaDataMap = new Map();
    this.playStateMap = new Map();
    this.queueTitleMap = new Map();
    this.queueItemsMap = new Map();
    this.lyricMap = new Map();
    this.bundleNameMap = new Map();
    this.isPlaying = false;
    let sessionDesList: Array<AVSessionManager.AVSessionDescriptor> = await AVSessionManager.getAllSessionDescriptors();
    Log.info(TAG, 'session des length : ' + sessionDesList.length);
    for (let i = 0; i < sessionDesList.length; i++) {
      let descriptor: AVSessionManager.AVSessionDescriptor = sessionDesList[i];
      let sessionId: string = descriptor.sessionId;
      Log.info(TAG, 'session des sessionId : ' + sessionId);
      let controller: AVSessionManager.AVSessionController = await AVSessionManager.createController(sessionId);
      await this.getBundleName(descriptor);
      Log.info(TAG, 'getBundleName done : ' + sessionId);
      await this.makeListener(controller);
      Log.info(TAG, 'makeListener done : ' + sessionId);
      await this.getMetaData(controller);
      Log.info(TAG, 'makeListener done : ' + sessionId);
      this.sessionArray[i] = sessionId;
      this.controllerMap.set(sessionId, controller);
    }
    this.isPlayingLink!.set(this.isPlaying);
    Log.info(TAG, 'session info done to link isPlaying');
    this.publishMap(this.metaDataMapLink!, this.metaDataMap);
    Log.info(TAG, 'session info done to link metaDataMap');
    this.publishMap(this.playStateMapLink!, this.playStateMap);
    Log.info(TAG, 'session info done to link playStateMap');
    this.publishMap(this.queueItemsMapLink!, this.queueItemsMap);
    Log.info(TAG, 'session info done to link queueItemsMap');
    this.publishMap(this.queueTitleMapLink!, this.queueTitleMap);
    Log.info(TAG, 'session info done to link queueTitleMap');
    this.publishMap(this.bundleNameMapLink!, this.bundleNameMap);
    Log.info(TAG, 'session info done to link bundleNameMap');
    this.publishMap(this.lyricMapLink!, this.lyricMap);
    Log.info(TAG, 'session info done to link lyricMap');
    this.sessionArrayLink!.set(this.sessionArray.slice());
    Log.info(TAG, 'session info done to link sessionArray');
    Log.info(TAG, 'startControl done ');
  }

  async getBundleName(descriptor: AVSessionManager.AVSessionDescriptor): Promise<void> {
    Log.info(TAG, 'getBundleName sessionId  : ' + descriptor.sessionId);
    let bundleAppName: string = descriptor.elementName.bundleName;
    try {
      bundleAppName = await bundle.getAbilityLabel(descriptor.elementName.bundleName,
        descriptor.elementName.abilityName);
    } catch (error) {
      Log.info(TAG, 'getAbilityLabel failed, fallback to bundleName : ' + JSON.stringify(error));
    }
    Log.info(TAG, 'getBundleName name : ' + bundleAppName);
    this.bundleNameMap.set(descriptor.sessionId, '来自 ' + bundleAppName);
    Log.info(TAG, 'getBundleName name finished');
  }

  async getMetaData(controller: AVSessionManager.AVSessionController): Promise<void> {
    let that = this;
    let sessionId: string = controller.sessionId;
    let metadata: AVSessionManager.AVMetadata = await controller.getAVMetadata();
    that.metaDataMap.set(sessionId, metadata);
    Log.info(TAG, 'get metadata  : ' + metadata.title + ' for session :' + sessionId);
    let queueTitle: string = await controller.getAVQueueTitle();
    Log.info(TAG, 'get queue queueTitle  : ' + queueTitle);
    that.queueTitleMap.set(sessionId, queueTitle);
    let queueItems: Array<AVSessionManager.AVQueueItem> = await controller.getAVQueueItems();
    Log.info(TAG, 'get queue items  : ' + queueItems.length);
    that.queueItemsMap.set(sessionId, queueItems);
    let avPlayState: AVSessionManager.AVPlaybackState = await controller.getAVPlaybackState();
    let playState: AVSessionManager.PlaybackState | undefined = avPlayState.state;
    if (playState !== undefined) {
      that.playStateMap.set(sessionId, playState);
    }
    that.isPlaying = (playState == AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY);
    Log.info(TAG, 'get playState  : ' + that.isPlaying);
  }

  async makeListener(controller: AVSessionManager.AVSessionController): Promise<void> {
    let that = this;
    let sessionId: string = controller.sessionId;
    controller.on('metadataChange', 'all', (metadata: AVSessionManager.AVMetadata) => {
      Log.info(TAG, 'get metadata: ' + metadata.title + ' for session :' + sessionId);
      let dataMap: Map<string, AVSessionManager.AVMetadata> | undefined = that.metaDataMapLink?.get();
      that.metaDataMapLink?.set(null);
      Log.info(TAG, 'get metadata check link first: ' + JSON.stringify(that.metaDataMapLink?.get()));
      dataMap?.set(sessionId, metadata);
      if (that.metaDataMapLink?.get() == null) {
        Log.info(TAG, 'get metadata check link NULL');
      } else {
        Log.info(TAG, 'get metadata check link second: ' +
          JSON.stringify((that.metaDataMapLink?.get()?.get(sessionId))));
      }
      if (dataMap) {
        Log.info(TAG, 'get metadata check map: ' + JSON.stringify((dataMap)));
      } else {
        Log.info(TAG, 'get metadata check map NULL');
      }

      that.metaDataMapLink?.set(dataMap);
      if (that.metaDataMapLink?.get() == null) {
        Log.info(TAG, 'get metadata check link NULL');
      } else {
        Log.info(TAG, 'get metadata check link end: ' +
          JSON.stringify((that.metaDataMapLink?.get()?.get(sessionId))?.title));
      }
    });
    controller.on('playbackStateChange', 'all', async (playState: AVSessionManager.AVPlaybackState) => {
      Log.info(TAG, 'get playbackState: ' + playState.state + ' for session:' + sessionId);
      if (playState.state !== undefined) {
        that.playStateMap.set(sessionId, playState.state);
      }
      that.isPlaying = (playState.state == AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY);
      that.isPlayingLink!.set(that.isPlaying);
      that.playStateMapLink!.set(null);
      that.playStateMapLink!.set(that.playStateMap);
    });
    controller.on('queueItemsChange', (items: Array<AVSessionManager.AVQueueItem>) => {
      Log.info(TAG, 'get queueItems: ' + items.length + ' for session :' + sessionId);
      that.queueItemsMap.set(sessionId, items);
      that.queueItemsMapLink!.set(null);
      that.queueItemsMapLink!.set(that.queueItemsMap);
    });
    controller.on('queueTitleChange', (title: string) => {
      Log.info(TAG, 'get queueTitle  : ' + title + ' for session :' + sessionId);
      that.queueTitleMap.set(sessionId, title);
      that.queueTitleMapLink!.set(null);
      that.queueTitleMapLink!.set(that.queueTitleMap);
    });
    controller.on('sessionEvent', async (sessionEvent: string, args) => {
      let lyricStruct = await controller.getExtras();
      let lyricLineNum: number = Number(lyricStruct.lyricsLineNumber);
      that.lyricMap.set(sessionId, String(lyricLineNum + ' : ' + args!.lyrics));
      that.lyricMapLink!.set(null);
      that.lyricMapLink!.set(that.lyricMap);
    });
  }

  private publishMap<T>(link: SubscribedAbstractProperty<Map<string, T>>, source: Map<string, T>): void {
    let target: Map<string, T> | undefined = link.get();
    if (!target) {
      target = new Map<string, T>();
    }
    target.clear();
    source.forEach((value: T, key: string) => {
      target!.set(key, value);
    });
    link.set(null);
    link.set(target);
  }

  private getController(sessionId: string): AVSessionManager.AVSessionController | undefined {
    if (!sessionId) {
      return undefined;
    }
    return this.controllerMap.get(sessionId);
  }

  async play(sessionId: string): Promise<void> {
    let controller: AVSessionManager.AVSessionController | undefined = this.getController(sessionId);
    if (!controller) {
      Log.info(TAG, 'play skipped, no controller for session : ' + sessionId);
      return;
    }
    let command: AVSessionManager.AVControlCommand = {
      command: 'play',
      parameter: undefined
    }
    await controller.sendControlCommand(command);
  }

  async pause(sessionId: string): Promise<void> {
    let controller: AVSessionManager.AVSessionController | undefined = this.getController(sessionId);
    if (!controller) {
      Log.info(TAG, 'pause skipped, no controller for session : ' + sessionId);
      return;
    }
    let command: AVSessionManager.AVControlCommand = {
      command: 'pause',
      parameter: undefined
    }
    await controller.sendControlCommand(command);
  }

  async next(sessionId: string): Promise<void> {
    let controller: AVSessionManager.AVSessionController | undefined = this.getController(sessionId);
    if (!controller) {
      Log.info(TAG, 'next skipped, no controller for session : ' + sessionId);
      return;
    }
    let command: AVSessionManager.AVControlCommand = {
      command: 'playNext',
      parameter: undefined
    }
    await controller.sendControlCommand(command);
  }

  async previous(sessionId: string): Promise<void> {
    let controller: AVSessionManager.AVSessionController | undefined = this.getController(sessionId);
    if (!controller) {
      Log.info(TAG, 'previous skipped, no controller for session : ' + sessionId);
      return;
    }
    let command: AVSessionManager.AVControlCommand = {
      command: 'playPrevious',
      parameter: undefined
    }
    await controller.sendControlCommand(command);
  }

  async skip(sessionId: string, itemId: number): Promise<void> {
    let controller: AVSessionManager.AVSessionController | undefined = this.getController(sessionId);
    if (!controller) {
      Log.info(TAG, 'skip skipped, no controller for session : ' + sessionId);
      return;
    }
    Log.info(TAG, 'on skip to : ' + controller + ' | ' + itemId)
    await controller.skipToQueueItem(itemId);
  }

  async getLyric(sessionId: string): Promise<void> {
    let controller: AVSessionManager.AVSessionController | undefined = this.getController(sessionId);
    if (!controller) {
      Log.info(TAG, 'getLyric skipped, no controller for session : ' + sessionId);
      return;
    }
    this.isLyric = !this.isLyric;
    this.isLyricLink!.set(this.isLyric);
    await controller.sendCommonCommand('lyrics', {
      'lyrics': this.isLyric
    });
  }

  async interval(): Promise<void> {
    setInterval(async () => {
      let controller: AVSessionManager.AVSessionController | undefined =
        this.controllerMap.get(this.sessionArray[0]);
      if (!controller) {
        return;
      }
      try {
        await controller.sendCommonCommand('lyrics', {
          'lyrics': this.isLyric
        });
      } catch (error) {
        Log.info(TAG, 'interval send lyrics failed : ' + JSON.stringify(error));
      }
    }, 1000)
  }
}
