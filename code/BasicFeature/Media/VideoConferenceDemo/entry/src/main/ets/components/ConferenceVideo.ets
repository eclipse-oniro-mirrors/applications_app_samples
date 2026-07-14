/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { media } from '@kit.MediaKit';
import { common } from '@kit.AbilityKit';
import Constants from '../common/Constants';
import { Logger } from '../common/utils/Logger';

@Component
export struct ConferenceVideo {
  private xComponentId: string = '';
  private rawFileName: string = 'video.mp4'
  private uiContext = this.getUIContext();
  private avPlayer: media.AVPlayer | null = null;
  private context = this.uiContext.getHostContext() as common.UIAbilityContext;
  private xComponentController: XComponentController = new XComponentController();

  aboutToDisappear(): void {
    this.releasePlayer();
  }

  async getRawFd(resourceName: string): Promise<media.AVFileDescriptor> {
    const context = this.context as common.UIAbilityContext;
    const fileDescriptor = await context.resourceManager.getRawFd(resourceName);
    return {
      fd: fileDescriptor.fd,
      offset: fileDescriptor.offset,
      length: fileDescriptor.length,
    };
  }

  async initAVPlayer() {
    const fdSrc: media.AVFileDescriptor = await this.getRawFd(this.rawFileName);
    this.avPlayer = await media.createAVPlayer();

    this.avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
      Logger.info(`[AVPlayer] State changed to: ${state}`);

      switch (state) {
        case 'initialized':
          const surfaceId = this.xComponentId;
          if (surfaceId) {
            this.avPlayer!.surfaceId = surfaceId;
            this.avPlayer!.audioRendererInfo = Constants.RENDERER_INFO;
            await this.avPlayer!.prepare();
          }
          break;
        case 'prepared':
          this.avPlayer!.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
          this.avPlayer!.loop = true;
          this.avPlayer!.setVolume(0.3);
          await this.avPlayer!.play();
          break;
        case 'completed':
          Logger.info('播放完成')
          break;
        case 'error':
          this.releasePlayer();
          break;
      }
    });

    this.avPlayer.on('error', (err: BusinessError) => {
      Logger.error(`AVPlayer error: ${err.code} - ${err.message}`);
      this.releasePlayer();
    });

    this.avPlayer.fdSrc = fdSrc;
  }

  async releasePlayer() {
    if (!this.avPlayer) {
      return;
    }
    await this.avPlayer.stop();
    await this.avPlayer.release();
    this.avPlayer = null;
  }

  build() {
    XComponent({
      id: this.xComponentId,
      type: XComponentType.SURFACE,
      controller: this.xComponentController
    })
      .width('100%')
      .height('100%')
      .onLoad(() => {
        this.xComponentId = this.xComponentController.getXComponentSurfaceId();
        this.initAVPlayer();
      })
  }
}