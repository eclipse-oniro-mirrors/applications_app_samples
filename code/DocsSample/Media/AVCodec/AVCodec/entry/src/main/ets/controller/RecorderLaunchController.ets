/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { LocalizedText } from '../common/LocalizedText';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo } from '@kit.CoreFileKit';
import recorder, { RecorderOptions } from 'librecorder.so';
import { CameraDataModel } from '../model/CameraDataModel';
import { RecorderPreprocessModel } from '../model/RecorderPreprocessModel';
import { DumpPolicyModel } from '../model/DumpPolicyModel';
import { CommonConstants as Const } from '../common/CommonConstants';
import Logger from '../common/utils/Logger';
import { deviceInfo } from '@kit.BasicServicesKit';
import { ConfigurationFeedback } from '../model/ConfigurationFeedback';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaSessionStore } from '../model/MediaSessionStore';

export class RecorderLaunchController {
  private launching: boolean = false;

  private async closeFileSafely(file: fileIo.File | undefined, label: string): Promise<void> {
    if (file === undefined) {
      return;
    }
    try {
      await fileIo.close(file);
    } catch (error) {
      Logger.error('RecorderLaunch', 'Failed to close ' + label + ': ' + JSON.stringify(error));
    }
  }

  async launch(ui: UIContext, data: CameraDataModel): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.launching) {
      return;
    }
    if (!MediaFileActivity.beginLaunch()) {
      ui.getPromptAction().showToast({ message: LocalizedText.get($r('app.string.recorder_cleanup_busy')) });
      return;
    }
    this.launching = true;
    const lease: MediaTaskLease | undefined = MediaTaskCoordinator.acquire('recording');
    if (lease === undefined) { this.launching = false; MediaFileActivity.endLaunch(); return; }
    let primary: fileIo.File | undefined = undefined;
    let secondary: fileIo.File | undefined = undefined;
    let initialized: boolean = false;
    let transferred: boolean = false;
    try {
      await MediaSessionStore.begin(context, { id: lease.id, operation: 'recording', startedAt: lease.startedAt });
      const constraint: string = ConfigurationFeedback.recordingConstraint(data, deviceInfo.sdkApiVersion);
      if (constraint.length > 0) {
        throw new Error(constraint);
      }
      const helper = photoAccessHelper.getPhotoAccessHelper(context);
      const extension: string = data.outputFormat === Const.FORMAT_FLV ? 'flv' : 'mp4';
      const title: string = 'AVCodecVideo_' + Date.now();
      data.outputUri = await helper.createAsset(photoAccessHelper.PhotoType.VIDEO, extension, { title: title });
      data.outputTitle = title + '.' + extension;
      primary = await fileIo.open(data.outputUri, fileIo.OpenMode.READ_WRITE);
      data.secondaryOutputUri = '';
      if (data.enableDualOutput) {
        data.secondaryOutputUri = await helper.createAsset(photoAccessHelper.PhotoType.VIDEO, extension,
          { title: title + '_secondary' });
        secondary = await fileIo.open(data.secondaryOutputUri, fileIo.OpenMode.READ_WRITE);
      }
      data.outputfd = primary.fd;
      data.secondaryOutputfd = secondary === undefined ? -1 : secondary.fd;
      const dumpPrefix: string = context.filesDir + '/recording_' + Date.now();
      const dumpExtension: string = data.videoCodecMime === Const.MIME_VIDEO_AVC ? '.h264' : '.h265';
      const primaryDump: string = data.enableVideoDump ? dumpPrefix + '_primary' + dumpExtension : '';
      const secondaryDump: string = data.enableVideoDump && data.enableDualOutput ?
        dumpPrefix + '_secondary' + dumpExtension : '';
      data.primaryDumpPath = primaryDump;
      data.secondaryDumpPath = secondaryDump;
      // 所有值在启动前形成快照；后续界面选项变化不会改动已经入队的 Native 初始化任务。
      const plan = RecorderPreprocessModel.forCamera(data);
      const options: RecorderOptions = {
        video: {
          mime: data.videoCodecMime ?? Const.MIME_VIDEO_AVC, codecName: data.videoCodecName,
          width: data.cameraWidth, height: data.cameraHeight, frameRate: data.frameRate,
          bitrate: data.bitRate, pixelFormat: data.format, bitrateMode: data.bitrateMode,
          iFrameInterval: data.iFrameInterval, hdrVivid: data.isHDRVivid !== 0, synchronous: data.isSync !== 0
        },
        audio: {
          sampleRate: data.audioSampleRate, channelCount: data.audioChannelCount,
          bitrate: data.audioBitRate, latencyMode: data.audioCaptureLatencyMode
        },
        preprocess: {
          mode: data.preprocMode, downsamplingWidth: data.downsamplingWidth,
          downsamplingHeight: data.downsamplingHeight, dropToFrameRate: data.dropToFrameRate,
          cropLeft: data.cropLeft, cropTop: data.cropTop, cropRight: data.cropRight, cropBottom: data.cropBottom
        },
        secondary: {
          enabled: data.enableDualOutput, fd: data.secondaryOutputfd,
          width: plan.secondaryWidth, height: plan.secondaryHeight
        },
        dump: {
          enabled: data.enableVideoDump, primaryPath: primaryDump, secondaryPath: secondaryDump,
          maxMiB: DumpPolicyModel.maxMiB, maxSeconds: DumpPolicyModel.maxSeconds
        },
        output: { fd: data.outputfd, format: data.outputFormat }
      };
      const result = await recorder.initNative(options);
      if (result.code !== 0 || result.outputId.length === 0) {
        const failure = recorder.getDiagnostics().failure;
        throw new Error(LocalizedText.get($r('app.string.recorder_configuration_failed_prefix')) + failure.stage + ' · ' + result.code + ' · ' + failure.message);
      }
      initialized = true;
      data.outputId = result.outputId;
      await ui.getRouter().pushUrl({ url: 'recorder/pages/Recorder', params: data });
      // 路由成功后，Recorder 页面负责在 Native 完成收尾后关闭这两个 fd。
      transferred = true;
    } catch (error) {
      Logger.error('RecorderLaunch', JSON.stringify(error));
      ui.getPromptAction().showToast({ message: String(error), duration: 5000 });
    } finally {
      if (!transferred) {
        if (initialized || recorder.getDiagnostics().active) {
          try {
            await recorder.stopEndNative();
          } catch (error) {
            Logger.error('RecorderLaunch', 'Failed to release native recorder: ' + JSON.stringify(error));
          }
        }
        if (!recorder.getDiagnostics().active) {
          await this.closeFileSafely(primary, 'primary output');
          await this.closeFileSafely(secondary, 'secondary output');
          data.outputfd = -1;
          data.secondaryOutputfd = -1;
          MediaTaskCoordinator.release(lease);
          await MediaSessionStore.finish(context, lease.id)
            .catch((error: Error): void => Logger.warn('RecorderLaunch', error.message));
        }
      }
      this.launching = false;
      MediaFileActivity.endLaunch();
    }
  }
}
