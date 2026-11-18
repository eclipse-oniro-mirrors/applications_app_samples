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

import Logger from '../Logger'
import { speechRecognizer } from '@kit.CoreSpeechKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'AudioRecordingToTextController';

export class AudioRecordingToTextController {

  private static audioRecordingToTextController: AudioRecordingToTextController;
  private asrEngine: speechRecognizer.SpeechRecognitionEngine | undefined = undefined;
  private sessionId: string = '123456';
  private notifyResultCallback?: (result: string, isComplete: boolean) => void;

  public static getInstance(): AudioRecordingToTextController {
    if (!AudioRecordingToTextController.audioRecordingToTextController) {
      Logger.info(TAG, 'no audioRecordingToTextController')
      AudioRecordingToTextController.audioRecordingToTextController = new AudioRecordingToTextController();
    }
    return AudioRecordingToTextController.audioRecordingToTextController;
  }

  async init() {
    await this.createByCallback();
    await this.sleep(500);
    this.setListener();
  }

  async createByCallback(): Promise<void> {
    let extraParam: Record<string, Object> = {'locate': 'CN', 'recognizerMode': 'short'};
    let initParamsInfo: speechRecognizer.CreateEngineParams = {
      // 语种，当前仅支持“zh-CN”中文。
      language: 'zh-CN',
      //模式。1为离线，当前仅支持离线模式。
      online: 1,
      extraParams: extraParam
    };

    return new Promise((resolve, reject) => {
      speechRecognizer.createEngine(initParamsInfo, (err: BusinessError, speechRecognitionEngine:
        speechRecognizer.SpeechRecognitionEngine) => {
          if (!err) {
            Logger.info(TAG, 'succeeded in creating engine.');
            this.asrEngine = speechRecognitionEngine;
            resolve();
          } else {
            Logger.error(TAG, `Failed to create engine. Message: ${err.message}.`);
            reject(err);
          }
        });
      });
    }

  async start() {
    let audioParam: speechRecognizer.AudioInfo = { audioType: 'pcm', sampleRate: 16000, soundChannel: 1, sampleBit: 16 }
    let extraParam: Record<string, Object> = {
      'recognitionMode': 0,
      'vadBegin': 2000,
      'vadEnd': 3000,
      'maxAudioDuration': 20000
    }
    let recognizerParams: speechRecognizer.StartParams = {
      sessionId: this.sessionId,
      audioInfo: audioParam,
      extraParams: extraParam
    }
    Logger.info(TAG, 'startListening start');
    try {
      this.asrEngine?.startListening(recognizerParams);
    } catch (err) {
      Logger.error(TAG, `error code: ${err.code}, message: ${err.message}.`)
    }
  }

  async sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async finish() {
    try {
      this.asrEngine?.finish(this.sessionId);
    } catch (err) {
      Logger.error(TAG, `error code: ${err.code}, message: ${err.message}.`)
    }
  }


  async release() {
    try {
      this.asrEngine?.shutdown();
    } catch (err) {
      Logger.error(TAG, `error code: ${err.code}, message: ${err.message}.`)
    }
  }

  async queryLanguagesCallback() {
    let languageQuery: speechRecognizer.LanguageQuery = {
      sessionId: this.sessionId
    };
    this.asrEngine?.listLanguages(languageQuery, (err: BusinessError, languages: Array<string>) => {
      if (!err) {
        Logger.info(TAG, `succeeded in listing languages, result: ${JSON.stringify(languages)}`);
      } else {
        Logger.error(TAG, `Failed to list languages. Message: ${err.message}.`);
      }
    });
  }

  async setListener() {
    let setListener: speechRecognizer.RecognitionListener = {
      // 开始识别成功回调
      onStart: (sessionId: string, eventMessage: string) => {
        Logger.info(TAG, `onStart, sessionId: ${sessionId} eventMessage: ${eventMessage}`);
      },
      onEvent: (sessionId: string, eventCode: number, eventMessage: string) => {
        Logger.info(TAG, `onEvent, sessionId: ${sessionId} eventCode: ${eventCode} eventMessage: ${eventMessage}`);
      },
      onResult: (sessionId: string, result: speechRecognizer.SpeechRecognitionResult) => {
        Logger.info(TAG, `onResult, sessionId: ${sessionId} result: ${JSON.stringify(result)}`);
        if (this.notifyResultCallback){
          this.notifyResultCallback(result.result, false);
        }
      },
      onComplete: (sessionId: string, eventMessage: string) => {
        Logger.info(TAG, `onComplete, sessionId: ${sessionId} eventMessage: ${eventMessage}`);
        if (this.notifyResultCallback){
           this.notifyResultCallback('', true);
        }
      },
      onError: (sessionId: string, errorCode: number, errorMessage: string) => {
        Logger.error(TAG, `onError, sessionId: ${sessionId} errorCode: ${errorCode} errorMessage: ${errorMessage}`);
      },
    }
    this.asrEngine?.setListener(setListener);
  }

  onResultChange(callback: (result: string, isComplete: boolean) => void) {
    this.notifyResultCallback = callback;
  }
}