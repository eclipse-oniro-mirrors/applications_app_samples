/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import { media } from '@kit.MediaKit';
import type { BusinessError } from '@kit.BasicServicesKit';
import Logger from './Logger';

export interface AudioRecorderPort {
  onStateChange(callback: (state: string) => void): void;
  onError(callback: (message: string) => void): void;
  prepare(config: media.AVRecorderConfig): Promise<void>;
  start(): Promise<void>;
  pause(): Promise<void>;
  resume(): Promise<void>;
  stop(): Promise<void>;
  reset(): Promise<void>;
  release(): Promise<void>;
}

export type AudioRecorderFactory = () => Promise<AudioRecorderPort>;

class NativeAudioRecorderPort implements AudioRecorderPort {
  private recorder: media.AVRecorder;

  constructor(recorder: media.AVRecorder) {
    this.recorder = recorder;
  }

  onStateChange(callback: (state: string) => void): void {
    this.recorder.on('stateChange', (state: media.AVRecorderState): void => callback(state));
  }

  onError(callback: (message: string) => void): void {
    this.recorder.on('error', (error: BusinessError): void => callback(error.message));
  }

  prepare(config: media.AVRecorderConfig): Promise<void> {
    return this.recorder.prepare(config);
  }

  start(): Promise<void> {
    return this.recorder.start();
  }

  pause(): Promise<void> {
    return this.recorder.pause();
  }

  resume(): Promise<void> {
    return this.recorder.resume();
  }

  stop(): Promise<void> {
    return this.recorder.stop();
  }

  reset(): Promise<void> {
    return this.recorder.reset();
  }

  release(): Promise<void> {
    return this.recorder.release();
  }
}

async function createAudioRecorder(): Promise<AudioRecorderPort> {
  return new NativeAudioRecorderPort(await media.createAVRecorder());
}

export default class RecordModel {
  private tag: string = 'RecordModel';
  private audioRecorder: AudioRecorderPort | undefined = undefined;
  private factory: AudioRecorderFactory;
  private initialization: number = 0;
  private state: string = 'idle';
  private teardown: Promise<void> | undefined = undefined;

  constructor(factory: AudioRecorderFactory = createAudioRecorder) {
    this.factory = factory;
  }

  async initAudioRecorder(handleStateChange: () => void): Promise<void> {
    const initialization: number = ++this.initialization;
    await this.cleanup(false);
    if (initialization !== this.initialization) {
      return;
    }
    const recorder: AudioRecorderPort = await this.factory();
    if (initialization !== this.initialization) {
      await recorder.release();
      return;
    }
    this.audioRecorder = recorder;
    this.state = 'idle';
    Logger.info(this.tag, 'create audioRecorder success');

    recorder.onStateChange((state: string): void => {
      if (this.audioRecorder !== recorder) {
        return;
      }
      this.state = state;
      Logger.info(this.tag, 'case state has changed, new state is ' + state);
      switch (state) {
        case 'idle':
          break;
        case 'prepared':
          Logger.info(this.tag, 'setCallback prepare case callback is called');
          recorder.start().catch((error: Error): void => {
            Logger.error(this.tag, 'audioRecorder start failed: ' + error.message);
          });
          break;
        case 'started':
          Logger.info(this.tag, 'setCallback start case callback is called');
          handleStateChange();
          break;
        case 'paused':
          Logger.info(this.tag, 'audioRecorder pause finish');
          handleStateChange();
          break;
        case 'stopped':
          Logger.info(this.tag, 'audioRecorder stop called');
          break;
        case 'released':
          break;
        case 'error':
          Logger.info(this.tag, 'case error state');
          break;
        default:
          Logger.info(this.tag, 'case state is unrecognized');
          break;
      }
    });
    recorder.onError((message: string): void => {
      if (this.audioRecorder === recorder) {
        Logger.info(this.tag, 'audioRecorder error: ' + message);
      }
    });
  }

  async release(): Promise<void> {
    this.initialization++;
    await this.cleanup(false);
  }

  private async cleanup(finish: boolean): Promise<void> {
    if (this.teardown !== undefined) {
      await this.teardown;
      return;
    }
    const recorder: AudioRecorderPort | undefined = this.audioRecorder;
    if (recorder === undefined) {
      return;
    }
    const state: string = this.state;
    this.audioRecorder = undefined;
    this.state = 'idle';
    const teardown: Promise<void> = (async (): Promise<void> => {
      try {
        if (finish && (state === 'started' || state === 'paused')) {
          await recorder.stop();
          await recorder.reset();
        }
      } finally {
        await recorder.release();
      }
    })();
    this.teardown = teardown;
    try {
      await teardown;
    } finally {
      this.teardown = undefined;
    }
  }

  async startRecorder(fd: number): Promise<void> {
    Logger.info(this.tag, `startRecorder, fd = ${fd}`);
    if (this.audioRecorder !== undefined) {
      const config: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: {
          audioBitrate: 48000,
          audioChannels: 2,
          audioCodec: media.CodecMimeType.AUDIO_AAC,
          audioSampleRate: 48000,
          fileFormat: media.ContainerFormatType.CFT_MPEG_4A
        },
        url: 'fd://' + fd
      };
      Logger.info(this.tag, 'start prepare');
      await this.audioRecorder.prepare(config);
    } else {
      Logger.error(this.tag, 'case failed, audioRecorder is null');
    }
  }

  pause(): void {
    Logger.info(this.tag, 'audioRecorder pause called');
    if (this.audioRecorder !== undefined) {
      this.audioRecorder.pause().catch((error: Error): void => {
        Logger.error(this.tag, 'audioRecorder pause failed: ' + error.message);
      });
    }
  }

  resume(): void {
    Logger.info(this.tag, 'audioRecorder resume called');
    if (this.audioRecorder !== undefined) {
      this.audioRecorder.resume().catch((error: Error): void => {
        Logger.error(this.tag, 'audioRecorder resume failed: ' + error.message);
      });
    }
  }

  async finish(): Promise<void> {
    this.initialization++;
    await this.cleanup(true);
  }
}
