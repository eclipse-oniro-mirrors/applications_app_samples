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

const TAG = 'DuckSessionController';

export class DuckSessionController {
  private static instance: DuckSessionController;
  private audioSessionManager: audio.AudioSessionManager | null = null;

  public static getInstance(): DuckSessionController {
    if (!DuckSessionController.instance) {
      DuckSessionController.instance = new DuckSessionController();
    }
    return DuckSessionController.instance;
  }

  async activateDuckSession() {
    Logger.info(TAG, `activateDuckSession (modify mode)`);
    if (!this.audioSessionManager) {
      let audioManager = audio.getAudioManager();
      this.audioSessionManager = audioManager.getSessionManager();
    }
    let strategy: audio.AudioSessionStrategy = {
      concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
    };
    await this.audioSessionManager.activateAudioSession(strategy);
    Logger.info(TAG, `DUCK_OTHERS AudioSession activated (modify mode, no focus held).`);
  }

  async deactivateDuckSession() {
    Logger.info(TAG, `deactivateDuckSession`);
    if (this.audioSessionManager) {
      await this.audioSessionManager.deactivateAudioSession();
      Logger.info(TAG, `DUCK_OTHERS AudioSession deactivated.`);
    }
  }
}
