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

import { common, wantAgent } from '@kit.AbilityKit';
import { avSession } from '@kit.AVSessionKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { MediaControlCenter } from './MediaControlCenter';

const TAG = 'AVSessionController';

export class AVSessionController {
  private context: common.UIAbilityContext | undefined = undefined;
  private avSession: avSession.AVSession | undefined = undefined;
  private musicIndex: number | undefined = 0;
  private mediaControlCenter: MediaControlCenter | undefined = undefined;
  private static avSessionController: AVSessionController;

  public static getInstance(): AVSessionController {
    if (!AVSessionController.avSessionController) {
      AVSessionController.avSessionController = new AVSessionController();
    }
    return AVSessionController.avSessionController;
  }

  // [Start initAVSession]
  public async initAVSession() {
    this.context = AppStorage.get('context');
    if (!this.context) {
      Logger.info(TAG, `session create failed, conext is undefined`);
      return;
    }
    this.mediaControlCenter = MediaControlCenter.getInstance();
    this.avSession = await avSession.createAVSession(this.context, 'PLAY_AUDIO', 'audio');
    await this.avSession.activate();
    Logger.info(TAG, `session create successed : sessionId : ${this.avSession.sessionId}`);
    await this.setAVMetadata();
    this.setLaunchAbility();
    this.setListenerForMesFromController();
  }

  // [End initAVSession]

  // [Start setLaunchAbility]
  // Set LaunchAbility.
  private setLaunchAbility() {
    if (!this.context) {
      return;
    }
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: this.context.abilityInfo.bundleName,
          abilityName: this.context.abilityInfo.name
        }
      ],
      operationType: wantAgent.OperationType.START_ABILITIES,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
    };
    wantAgent.getWantAgent(wantAgentInfo).then((agent) => {
      if (this.avSession) {
        this.avSession.setLaunchAbility(agent);
      }
    })
      .catch((err: BusinessError) => {
        Logger.error(TAG, `getWantAgent failed: code: ${err.code}, message: ${err.message}`);
      });
  }

  // [End setLaunchAbility]


  // [Start setAVMetadata]
  // Set metadata
  public async setAVMetadata() {
    this.musicIndex = AppStorage.get('selectIndex') ? AppStorage.get('selectIndex') : 0;
    Logger.info(TAG, 'current musicIndex is:' + this.musicIndex);
    if (this.musicIndex === undefined) {
      this.musicIndex = 0;
    }
    try {
      if (this.context) {
        let metadata: avSession.AVMetadata = {
          assetId: `${this.musicIndex}`,
          avQueueName: 'OHAudioQueue',
          avQueueId: 'OHAudioQueueQueueId',
        };
        if (this.avSession) {
          this.avSession.setAVMetadata(metadata).then(() => {
            Logger.info(TAG, 'SetAVMetadata successfully');
          }).catch((err: BusinessError) => {
            Logger.error(TAG, `SetAVMetadata BusinessError: code: ${err.code}, message: ${err.message}`);
          });
        }
      }
    } catch (error) {
      Logger.error(TAG, `SetAVMetadata faile, code: ${(error as BusinessError).code}`);
    }
  }

  // [End setAVMetadata]

  // [Start setListenerForMesFromController]
  // Set listening events
  async setListenerForMesFromController() {
    if (!this.avSession) {
      return;
    }
    this.avSession.on('play', this.onPlay);
    this.avSession.on('pause', this.onPause);
  }

  // [End setListenerForMesFromController]

  // Set playback listening
  private onPlay: () => void = () => {
    Logger.info(TAG, `on play , do play task`);
    if (!this.mediaControlCenter) {
      Logger.error(TAG, 'mediaControlFunction is undefined in onPlay');
      return;
    }
    this.mediaControlCenter.play()
  }
  // Set pause listening
  private onPause: () => void = () => {
    Logger.info(TAG, `on pause , do pause task`);
    if (!this.mediaControlCenter) {
      Logger.error(TAG, 'mediaControlFunction is undefined in onPause');
      return;
    }
    this.mediaControlCenter.pause();
  }

  async unregisterSessionListener() {
    if (!this.avSession) {
      return;
    }
    this.avSession.off('play');
    this.avSession.off('pause');
    this.avSession.destroy();
  }
}
