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
import recorder from 'librecorder.so';
import { CameraDataModel } from '../model/CameraDataModel';
import { RecorderOutputController } from './RecorderOutputController';
import Logger from '../common/utils/Logger';
import { deviceInfo } from '@kit.BasicServicesKit';
import { ConfigurationFeedback } from '../model/ConfigurationFeedback';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaSessionStore } from '../model/MediaSessionStore';
import { RecordingFileCloser } from './RecordingFileCloser';

export class RecorderLaunchController {
  private launching: boolean = false;
  private revision: number = 0;

  cancel(): void {
    ++this.revision;
  }

  async launch(ui: UIContext, data: CameraDataModel, route: boolean = true): Promise<boolean> {
    const context = ui.getHostContext();
    if (context === undefined || this.launching) {
      return false;
    }
    if (!MediaFileActivity.beginLaunch()) {
      ui.getPromptAction().showToast({ message: LocalizedText.get($r('app.string.recorder_cleanup_busy')) });
      return false;
    }
    this.launching = true;
    const request: number = ++this.revision;
    const lease: MediaTaskLease | undefined = MediaTaskCoordinator.acquire('recording');
    if (lease === undefined) { this.launching = false; MediaFileActivity.endLaunch(); return false; }
    if (route) { data.recordingGroupId = lease.id; data.segmentIndex = 1; }
    let initialized: boolean = false;
    let transferred: boolean = false;
    try {
      await MediaSessionStore.begin(context, { id: lease.id, operation: 'recording', startedAt: lease.startedAt });
      if (request !== this.revision) { return false; }
      const constraint: string = ConfigurationFeedback.recordingConstraint(data, deviceInfo.sdkApiVersion);
      if (constraint.length > 0) {
        throw new Error(constraint);
      }
      await RecorderOutputController.open(context, data);
      initialized = true;
      if (request !== this.revision) { return false; }
      // 路由发出后由其结果决定资源归属；页面隐藏不能撤销成功交接。
      if (route) { await ui.getRouter().pushUrl({ url: 'recorder/pages/Recorder', params: data }); }
      // 路由成功后，Recorder页面负责在Native完成收尾后关闭这两个fd。
      transferred = true;
    } catch (error) {
      Logger.error('RecorderLaunch', JSON.stringify(error));
      if (request === this.revision) {
        ui.getPromptAction().showToast({ message: String(error), duration: 5000 });
      }
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
          const primaryClosed: boolean = await RecordingFileCloser.close(data.outputfd);
          const secondaryClosed: boolean = await RecordingFileCloser.close(data.secondaryOutputfd);
          if (primaryClosed) { data.outputfd = -1; }
          if (secondaryClosed) { data.secondaryOutputfd = -1; }
          if (primaryClosed && secondaryClosed) {
            MediaTaskCoordinator.release(lease);
            await MediaSessionStore.finish(context, lease.id)
              .catch((error: Error): void => Logger.warn('RecorderLaunch', error.message));
          } else {
            MediaTaskCoordinator.cancelling(lease);
            if (request === this.revision) {
              ui.getPromptAction().showToast({ message: $r('app.string.recorder_close_unconfirmed'), duration: 5000 });
            }
          }
        }
      }
      this.launching = false;
      MediaFileActivity.endLaunch();
    }
    return transferred;
  }
}
