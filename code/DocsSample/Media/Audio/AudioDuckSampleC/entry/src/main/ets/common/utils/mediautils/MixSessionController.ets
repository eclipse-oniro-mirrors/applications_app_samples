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
import Logger from '../Logger';

const TAG = 'MixSessionController';

export class MixSessionController {
  private static instance: MixSessionController;
  private audioSessionManager: audio.AudioSessionManager | null = null;

  public static getInstance(): MixSessionController {
    if (!MixSessionController.instance) {
      MixSessionController.instance = new MixSessionController();
    }
    return MixSessionController.instance;
  }

  async enableMixMode() {
    Logger.info(TAG, `enableMixMode`);
    if (!this.audioSessionManager) {
      let audioManager = audio.getAudioManager();
      this.audioSessionManager = audioManager.getSessionManager();
    }
    this.audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
    let strategy: audio.AudioSessionStrategy = {
      concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
    };
    await this.audioSessionManager.activateAudioSession(strategy);
    Logger.info(TAG, `MIX_WITH_OTHERS AudioSession activated.`);
  }

  async disableMixMode() {
    Logger.info(TAG, `disableMixMode`);
    if (this.audioSessionManager) {
      await this.audioSessionManager.deactivateAudioSession();
      Logger.info(TAG, `Music AudioSession deactivated.`);
    }
  }
}
