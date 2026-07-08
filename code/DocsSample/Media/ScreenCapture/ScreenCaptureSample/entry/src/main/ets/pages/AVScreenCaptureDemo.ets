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

// [Start screenCapture_arkts_demo]
// [Start screenCapture_arkts_import]
import { common } from '@kit.AbilityKit';
// [Start screenCapture_arkts_interface_import]
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { media } from '@kit.MediaKit';
import { fileIo } from '@kit.CoreFileKit';
// [End screenCapture_arkts_interface_import]
import { display } from '@kit.ArkUI';
// [End screenCapture_arkts_import]

export class AVScreenCaptureDemo {
  private captureFile: fileIo.File | undefined = undefined;
  private captureConfig: media.AVScreenCaptureRecordConfig | undefined = undefined;
  // [Start screenCapture_arkts_create]
  // 声明一个AVScreenCaptureRecorder，并赋值给screenCapture成员变量。
  private screenCapture?: media.AVScreenCaptureRecorder;

  async createAVScreenCapture(): Promise<void> {
    // 创建一个AVScreenCaptureRecorder，并赋值给screenCapture成员变量。
    this.screenCapture = await media.createAVScreenCaptureRecorder();
  }
  // [End screenCapture_arkts_create]

  closeFile(): void {
    if (!this.captureFile) {
      return;
    }
    try {
      fileIo.closeSync(this.captureFile.fd);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to close fd, error code: ${err.code}, message: ${err.message}`);
    }
  }
  // [Start screenCapture_arkts_config]
  openFile(context: Context): void {
    const path: string = context.filesDir + '/screenCapture.mp4';
    this.captureFile = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  }

  setConfig(context: Context): void {
    this.openFile(context);
    if (!this.captureFile) {
      console.error(`处理异常情况`)
      return;
    }
    let displayClass: display.Display | undefined = undefined;
    try {
      displayClass = display.getDefaultDisplaySync();
      console.info(`The display info is: ${JSON.stringify(displayClass)}`);
    } catch (exception) {
      console.error(`Failed to get default display. Code: ${exception.code}, message: ${exception.message}`);
    }
    if (!displayClass) {
      console.error(`Failed to get displayClass.`);
      return;
    }
    this.captureConfig = {
        // 开发者可根据屏幕宽高设置相应尺寸。
        // 屏幕宽度应设置为64的倍数。
        frameWidth: displayClass.width,
        // 根据屏幕的高设置高度。
        frameHeight: displayClass.height,
        // 参考应用文件访问与管理开发示例新建并读写一个文件fd。
        fd: this.captureFile.fd,
        // 可选参数及其默认值。
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 2,
        audioBitrate: 96000,
        displayId: 0,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4
      };
  }
  // [End screenCapture_arkts_config]

  registerScreenCaptureCallback(): void {
    // [Start screenCapture_arkts_Callback]
    this.screenCapture?.on('stateChange', async (infoType: media.AVScreenCaptureStateCode) => {
      switch (infoType) {
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED:
          console.info(`录屏成功开始后会收到的回调`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_CANCELED:
          this.screenCapture?.release();
          this.screenCapture = undefined;
          console.info(`不允许使用录屏功能`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER:
          this.screenCapture?.release();
          this.screenCapture = undefined;
          console.info(`通过录屏胶囊结束录屏，底层录制会停止`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_INTERRUPTED_BY_OTHER:
          console.info(`录屏因其他中断而停止，底层录制会停止`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_CALL:
          console.info(`录屏过程因通话中断，底层录制会停止`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNAVAILABLE:
          console.info(`录屏麦克风不可用`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_MUTED_BY_USER:
          console.info(`录屏麦克风被用户静音`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNMUTED_BY_USER:
          console.info(`录屏麦克风被用户取消静音`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_ENTER_PRIVATE_SCENE:
          // 目前可以从系统直接注册监听到进入隐私场景。
          console.info(`录屏进入隐私场景`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_EXIT_PRIVATE_SCENE:
          console.info(`录屏退出隐私场景`);
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER_SWITCHES:
          console.info(`用户账号切换，底层录制会停止`);
          break;
        default:
          break;
      }
    })
    this.screenCapture?.on('error', (err) => {
      console.error(`处理异常情况, code is ${err.code}, message is ${err.message}.`);
    })
    // [End screenCapture_arkts_Callback]
  }

  unRegisterScreenCaptureCallback(): void {
    this.screenCapture?.off('stateChange');
    this.screenCapture?.off('error');
  }

  async startRecording(context: Context): Promise<void> {
    this.createAVScreenCapture();
    if (!this.screenCapture) {
      return;
    }
    this.setConfig(context);
    // [Start screenCapture_arkts_init]
    await this.screenCapture?.init(this.captureConfig);
    // [End screenCapture_arkts_init]
    this.registerScreenCaptureCallback();
    // [Start screenCapture_arkts_skipPrivacyMode]
    let windowIDs: number[] = [57, 86];
    await this.screenCapture?.skipPrivacyMode(windowIDs);
    // [End screenCapture_arkts_skipPrivacyMode]
    // [Start screenCapture_arkts_startRecording]
    await this.screenCapture?.startRecording();
    // [End screenCapture_arkts_startRecording]
  }

  async stopRecording(): Promise<void> {
    if (!this.screenCapture) {
      this.closeFile();
      return;
    }
    // [Start screenCapture_arkts_stopRecording]
    await this.screenCapture?.stopRecording();
    // [End screenCapture_arkts_stopRecording]
    this.unRegisterScreenCaptureCallback();
    // 调用release()方法销毁实例，释放资源。
    // [Start screenCapture_arkts_release]
    await this.screenCapture?.release();
    // [End screenCapture_arkts_release]

    // 最后需要关闭创建的录屏文件;
    this.closeFile();
  }
}
// [End screenCapture_arkts_demo]

// [Start screenCapture_arkts_interface_init]
async function testInit() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 创建文件。
  let filesDir = '/data/storage/el2/base/haps';
  let file = fileIo.openSync(filesDir + '/screenCapture.mp4', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);

  let avCaptureConfig: media.AVScreenCaptureRecordConfig = {
      fd: file.fd, // 文件需要先由调用者创建，通常是MP4文件，赋予写权限，将文件fd传给此参数。
      frameWidth: 640,
      frameHeight: 480
      // 补充其他参数。
  };

  // 调用init方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.init(avCaptureConfig).then(() => {
      console.info('Succeeded in initializing avScreenCaptureRecorder');
    }).catch((err: BusinessError) => {
      console.error(`Failed to init avScreenCaptureRecorder. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_init]

// [Start screenCapture_arkts_interface_startRecording]
async function testStartRecording() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用startRecording方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.startRecording().then(() => {
      console.info('Succeeded in starting avScreenCaptureRecorder');
    }).catch((err: BusinessError) => {
      console.error(`Failed to start avScreenCaptureRecorder. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_startRecording]

// [Start screenCapture_arkts_interface_stopRecording]
async function testStopRecording() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用stopRecording方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.stopRecording().then(() => {
      console.info('Succeeded in stopping avScreenCaptureRecorder');
    }).catch((err: BusinessError) => {
      console.error(`Failed to stop avScreenCaptureRecorder. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_stopRecording]

// [Start screenCapture_arkts_interface_pauseRecording]
async function testPauseRecording() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用pauseRecording方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.pauseRecording().then(() => {
      console.info('Succeeded in pausing avScreenCaptureRecorder');
    }).catch((err: BusinessError) => {
      console.error(`Failed to pause avScreenCaptureRecorder. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_pauseRecording]

// [Start screenCapture_arkts_interface_resumeRecording]
async function testResumeRecording() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用resumeRecording方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.resumeRecording().then(() => {
      console.info('Succeeded in resuming avScreenCaptureRecorder');
    }).catch((err: BusinessError) => {
      console.error(`Failed to resume avScreenCaptureRecorder. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_resumeRecording]

// [Start screenCapture_arkts_interface_addWatermark]
async function testAddWaterMark() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  let watermark: image.PixelMap | undefined = undefined; // 可以通过获取本地资源文件并转换为PixelMap，水印图像不能为空。
  let watermarkConfig: media.WatermarkConfiguration = { top: 100, left: 100, width: 100, height: 100 };

  if (watermark && avScreenCaptureRecorder) {
      avScreenCaptureRecorder.addWatermark(watermark, watermarkConfig).then((num: number) => {
        console.info(`Succeeded in adding watermark, watermarkNum is ${num}`);
      })
      .catch((error: BusinessError) => {
        console.error(`Failed to add watermark and catch error is: Code: ${error.code}, message: ${error.message}`);
      });
  }
}
// [End screenCapture_arkts_interface_addWatermark]

// [Start screenCapture_arkts_interface_skipPrivacyMode]
async function testSkipPrivacyMode() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用skipPrivacyMode方法。
  if (avScreenCaptureRecorder) {
    let windowIDs = [];
    avScreenCaptureRecorder.skipPrivacyMode(windowIDs).then(() => {
      console.info('Succeeded in skipping privacy mode');
    }).catch((err: BusinessError) => {
      console.error(`Failed to skip privacy mode. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_skipPrivacyMode]

// [Start screenCapture_arkts_interface_setMicEnabled]
async function testSetMicEnable() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用setMicEnabled方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.setMicEnabled(true).then(() => {
      console.info('Succeeded in setting microphone enabled.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to set microphone enabled. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_setMicEnabled]

// [Start screenCapture_arkts_interface_setPickerMode]
async function testSetPickerMode() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用setPickerMode方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.setPickerMode(media.PickerMode.WINDOW_ONLY).then(() => {
      console.info('Succeeded in setting picker mode.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to set picker mode. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_setPickerMode]

// [Start screenCapture_arkts_interface_excludePickerWindows]
async function testExcludePickerWindows() {
  let excludedWindows: number[] = [101, 102, 103];
  
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用excludePickerWindows方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.excludePickerWindows(excludedWindows).then(() => {
      console.info('Succeeded in excluding picker windows.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to exclude picker windows. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_excludePickerWindows]

// [Start screenCapture_arkts_interface_presentPicker]
async function testPresentPicker() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用presentPicker方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.presentPicker().then(() => {
      console.info('Succeeded in presenting picker avScreenCaptureRecorder.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to present picker avScreenCaptureRecorder. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_presentPicker]

// [Start screenCapture_arkts_interface_setContentAutoRotation]
async function testSetContentAutoRotation() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用setContentAutoRotation方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.setContentAutoRotation(true).then(() => {
      console.info('Succeeded in enabling setContentAutoRotation.');
    }).catch((err: BusinessError) => {
      console.error(`Failed to enable setContentAutoRotation. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_setContentAutoRotation]

// [Start screenCapture_arkts_interface_release]
async function testRelease() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用release方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.release().then(() => {
      console.info('Succeeded in releasing avScreenCaptureRecorder');
    }).catch((err: BusinessError) => {
      console.error(`Failed to release avScreenCaptureRecorder. Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_release]

// [Start screenCapture_arkts_interface_onStateChange]
async function testOnStateChange() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用on方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.on('stateChange', (state: media.AVScreenCaptureStateCode) => {
        console.info('avScreenCaptureRecorder stateChange to ' + state);
    });
  }
}
// [End screenCapture_arkts_interface_onStateChange]

// [Start screenCapture_arkts_interface_onError]
async function testOnError() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用on方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.on('error', (err: BusinessError) => {
      console.error(`avScreenCaptureRecorder error: Code: ${err.code}, message: ${err.message}`);
    });
  }
}
// [End screenCapture_arkts_interface_onError]

// [Start screenCapture_arkts_interface_offStateChange]
async function testOffStateChange() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用off方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.off('stateChange');
  }
}
// [End screenCapture_arkts_interface_offStateChange]

// [Start screenCapture_arkts_interface_offError]
async function testOffError() {
  // 创建录屏实例。
  let avScreenCaptureRecorder = await media.createAVScreenCaptureRecorder();

  // 其余流程。

  // 调用off方法。
  if (avScreenCaptureRecorder) {
    avScreenCaptureRecorder.off('error');
  }
}
// [End screenCapture_arkts_interface_offError]
