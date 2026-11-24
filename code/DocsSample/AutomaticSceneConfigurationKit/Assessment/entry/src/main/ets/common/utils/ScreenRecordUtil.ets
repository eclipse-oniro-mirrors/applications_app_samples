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
import { media } from '@kit.MediaKit';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';
import Logger from './Logger';

export interface RecordRetCallback {
  onRecordResult: (isSuccess: boolean, errCode: number) => void;
}

export class ScreenRecordUtil {
  private uiContext: common.UIAbilityContext;
  private recorder?: media.AVScreenCaptureRecorder;
  private fileFd: number = -1;
  private outputPath: string = '';
  private windowId: number = -1;
  private recordRetCallback?: RecordRetCallback;

  constructor(context: common.UIAbilityContext) {
    this.uiContext = context;
  }

  private async init(): Promise<void> {
    try {
      this.recorder = await media.createAVScreenCaptureRecorder();
      this.recorder.on('stateChange', (state: media.AVScreenCaptureStateCode) => {
        Logger.info(`ScreenRecordUtil stateChange: ${state}`);
        if (state === media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED) {
          Logger.info('ScreenRecordUtil: recording started successfully');
          this.recordRetCallback?.onRecordResult(true, media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED);
        } else if (state === media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_CANCELED) {
          Logger.warn('ScreenRecordUtil: recording canceled by user');
          this.recordRetCallback?.onRecordResult(false, media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_CANCELED);
          this.stop();
        } else if (state === media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER) {
          Logger.warn('ScreenRecordUtil: recording stopped by user');
          this.recordRetCallback?.onRecordResult(false,
            media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER);
          this.stop();
        } else if (state === media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_INTERRUPTED_BY_OTHER) {
          Logger.warn('ScreenRecordUtil: recording interrupted by other');
          this.recordRetCallback?.onRecordResult(false,
            media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_INTERRUPTED_BY_OTHER);
          this.stop();
        } else if (state === media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_CALL) {
          Logger.warn('ScreenRecordUtil: recording stopped by call');
          this.recordRetCallback?.onRecordResult(false,
            media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_CALL);
          this.stop();
        }
      });

      this.recorder.on('error', (error: BusinessError) => {
        Logger.error(`ScreenRecordUtil error: code=${error.code}, message=${error.message}`);
      });
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`ScreenRecordUtil init failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  private async prepare(): Promise<void> {
    try {
      if (this.recorder === undefined) {
        await this.init();
      }

      this.outputPath = `${this.uiContext.filesDir}/screen_record_${Date.now()}.mp4`;
      const file: fileIo.File = fileIo.openSync(
        this.outputPath,
        fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC
      );
      this.fileFd = file.fd;

      await this.recorder?.init({
        fd: this.fileFd,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4
      });
      Logger.info('ScreenRecordUtil init done');

      await this.configure();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`ScreenRecordUtil prepare failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  private async configure() {
    try {
      await this.recorder?.setMicEnabled(false);
      const currentWindow: window.Window = await window.getLastWindow(this.uiContext);
      this.windowId = currentWindow.getWindowProperties().id;
      if (this.windowId >= 0) {
        await this.recorder?.skipPrivacyMode([this.windowId]);
        Logger.info('ScreenRecordUtil skipPrivacyMode done');
      }
      Logger.info('ScreenRecordUtil configure done');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`ScreenRecordUtil configure failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  async start(callback?: RecordRetCallback): Promise<void> {
    this.recordRetCallback = callback;
    try {
      await this.prepare();
      Logger.info('ScreenRecordUtil: calling startRecording...');
      await this.recorder?.startRecording();
      Logger.info(`ScreenRecordUtil startRecording done, output: ${this.outputPath}`);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`ScreenRecordUtil start failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  async stop(): Promise<string> {
    try {
      await this.recorder?.stopRecording();
      Logger.info('ScreenRecordUtil stopRecording done');

      await this.recorder?.release();
      Logger.info('ScreenRecordUtil release done');

      if (this.fileFd >= 0) {
        fileIo.closeSync(this.fileFd);
        this.fileFd = -1;
      }

      Logger.info(`ScreenRecordUtil output: ${this.outputPath}`);
      return this.outputPath;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`ScreenRecordUtil stop failed, code: ${err.code}, message: ${err.message}`);
      return '';
    }
  }
}
