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

import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { textToSpeech } from '@kit.CoreSpeechKit';
import { TreeMap } from '@kit.ArkTS';
import { Logger } from '../utils/Logger';

const TAG = '[TextToSpeechController]';

class TextToSpeechController {
  private ttsEngine: textToSpeech.TextToSpeechEngine | undefined = undefined;
  private pcmData: TreeMap<number, Uint8Array> = new TreeMap();
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');

  // Create an instance of TextToSpeechEngine.
  public createEngine(): void {
    let extraParam: Record<string, Object> = {
      'style': 'interaction-broadcast', // Radio style
      'locate': 'CN',
      'name': 'EngineName', // Engine name
      'isBackStage': 'true' // Support background broadcasting.
    };
    let initParamsInfo: textToSpeech.CreateEngineParams = {
      language: 'zh-CN',
      person: 0, // Timbre
      online: 1, // Offline mode
      extraParams: extraParam
    };
    textToSpeech.createEngine(initParamsInfo, (err: BusinessError, data: textToSpeech.TextToSpeechEngine) => {
      if (!err) {
        Logger.info(TAG, 'createEngine succeed');
        this.ttsEngine = data;
      } else {
        Logger.error(TAG, `Failed to createEngine. code: ${err.code}, message: ${err.message}`);
      }
    })
  }

  public onData = (requestId: string, audio: ArrayBuffer, response: textToSpeech.SynthesisResponse) => {
    let uint8Array: Uint8Array = new Uint8Array(audio);
    try {
      this.pcmData.set(response.sequence, uint8Array);
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `Failed to set pcmData. code: ${err.code}, message: ${err.message}`);
    }
  }
  public onComplete = (requestId: string, response: textToSpeech.CompleteResponse) => {
    let context: common.UIAbilityContext | undefined = AppStorage.get('context');
    Logger.info(TAG, `onComplete, requestId: ${requestId} response: ${JSON.stringify(response)}`);
    let buffers: ArrayBuffer[] = new Array();
    try {
      this.pcmData?.forEach((value: Uint8Array) => {
        buffers.push(value.buffer.slice(0));
      })
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `code: ${err.code}, message: ${err.message}`);
    }
    let audioData = this.concatenateArrayBuffers(buffers);
    let fileDir = context?.filesDir + '/audioExample.pcm';
    fileIo.createStream(fileDir, 'w+')
      .then((stream: fileIo.Stream) => {
        stream.write(audioData)
          .catch((err: BusinessError) => Logger.error(TAG,
            `Failed to write audioData. code: ${err.code}, message: ${err.message}`));
      })
      .catch((err: BusinessError) => Logger.error(TAG,
        `Failed to createStream. code: ${err.code}, message: ${err.message}`));
  }

  // Set the synthetic broadcast callback.
  public setSpeakListener() {
    if (!this.ttsEngine) {
      return;
    }
    let speakListener: textToSpeech.SpeakListener = {
      // Start broadcasting the callback.
      onStart(requestId: string, response: textToSpeech.StartResponse) {
        Logger.info(TAG, `onStart, requestId: ${requestId} response: ${JSON.stringify(response)}`);
      },
      // Callback for synthesis completion and broadcast completion.
      onComplete: this.onComplete,
      // Stop broadcasting callback.
      onStop(requestId: string, response: textToSpeech.StopResponse) {
        Logger.info(TAG, `onStop, requestId: ${requestId} response: ${JSON.stringify(response)}`);
      },
      // Return audio stream.
      onData: this.onData,
      // Error callback.
      onError(requestId: string, errorCode: number, errorMessage: string) {
        Logger.error(`onError, requestId: ${requestId} errorCode: ${errorCode} errorMessage: ${errorMessage}`);
      }
    }
    this.ttsEngine.setListener(speakListener);

    // Set broadcast-related parameters.
    let speakParams: textToSpeech.SpeakParams = {
      requestId: '123456' + Date.now(), // Synthetic broadcast ID.
      extraParams: {
        'speed': 1, // Speech rate.
        'volume': 2, // Volume
        'pitch': 1, // Tone
        'languageContext': 'zh-CN', // The language used for playing Arabic numerals.
        'audioType': 'pcm', // Audio type
        'soundChannel': 3,
        'playType': 0, // Synthesis type: Only synthesize without broadcasting, return audio stream.
        'queueMode': 0
      }
    }
    try {
      let speechStr = this.context?.resourceManager.getStringSync($r('app.string.speech_text').id);
      if (speechStr) {
        this.ttsEngine.speak(speechStr, speakParams);
      }
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `Failed to speak. code: ${err.code}, message: ${err.message}`);
    }
  }

  public concatenateArrayBuffers(buffers: ArrayBuffer[]): ArrayBuffer {
    const totalLength = buffers.reduce((sum, buffer) => sum + buffer.byteLength, 0);
    const concatenateBuffer = new ArrayBuffer(totalLength);
    let offset = 0;
    for (const buffer of buffers) {
      const uint8Array = new Uint8Array(buffer);
      new Uint8Array(concatenateBuffer, offset, uint8Array.length).set(uint8Array);
      offset += uint8Array.length;
    }
    return concatenateBuffer;
  }

  public speechText(text: string) {
    // 设置播报内容
    let originalText: string = text;
    // 设置播报相关参数
    let extraParam: Record<string, Object> = {
      'queueMode': 0,
      'speed': 1,
      'volume': 2,
      'pitch': 1,
      'languageContext': 'zh-CN',
      'audioType': 'pcm',
      'soundChannel': 3,
      'playType': 1
    };
    let speakParams: textToSpeech.SpeakParams = {
      requestId: '123456' + Date.now(), // requestId在同一实例内仅能用一次，请勿重复设置
      extraParams: extraParam
    };
    // 调用播报方法
    // 开发者可以通过修改speakParams主动设置播报策略
    try {
      this.ttsEngine?.speak(originalText, speakParams);
    } catch (err) {
      Logger.error(TAG, `error code: ${err.code}, message: ${err.message}.`)
    }
  }

  // Release resources.
  public releaseResource() {
    if (!this.ttsEngine) {
      return;
    }
    // Shut down the engine to free up engine resources.
    this.ttsEngine.shutdown();
  }
}

export default new TextToSpeechController();