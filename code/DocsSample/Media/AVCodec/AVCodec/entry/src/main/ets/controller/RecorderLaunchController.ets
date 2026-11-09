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
import { fileIo } from '@kit.CoreFileKit';
import recorder from 'librecorder.so';
import { CameraDataModel } from '../model/CameraDataModel';
import { RecorderOutputController } from './RecorderOutputController';
import Logger from '../common/utils/Logger';
import { deviceInfo } from '@kit.BasicServicesKit';
import { ConfigurationFeedback } from '../model/ConfigurationFeedback';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaSessionStore } from '../model/MediaSessionStore';

export class RecorderLaunchController {
  private launching: boolean = false;

  private async closeFileSafely(fd: number, label: string): Promise<void> {
    if (fd < 0) {
      return;
    }
    try {
      await fileIo.close(fd);
    } catch (error) {
      Logger.error('RecorderLaunch', 'Failed to close ' + label + ': ' + JSON.stringify(error));
    }
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
    const lease: MediaTaskLease | undefined = MediaTaskCoordinator.acquire('recording');
    if (lease === undefined) { this.launching = false; MediaFileActivity.endLaunch(); return false; }
    if (route) { data.recordingGroupId = lease.id; data.segmentIndex = 1; }
    let initialized: boolean = false;
    let transferred: boolean = false;
    try {
      await MediaSessionStore.begin(context, { id: lease.id, operation: 'recording', startedAt: lease.startedAt });
      const constraint: string = ConfigurationFeedback.recordingConstraint(data, deviceInfo.sdkApiVersion);
      if (constraint.length > 0) {
        throw new Error(constraint);
      }
      await RecorderOutputController.open(context, data);
      initialized = true;
      if (route) { await ui.getRouter().pushUrl({ url: 'recorder/pages/Recorder', params: data }); }
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
          await this.closeFileSafely(data.outputfd, 'primary output');
          await this.closeFileSafely(data.secondaryOutputfd, 'secondary output');
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
    return transferred;
  }
}
