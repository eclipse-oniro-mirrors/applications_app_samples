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


import { fileIo } from '@kit.CoreFileKit';
import { media } from '@kit.MediaKit';
import player, { MediaInfo } from 'libplayer.so';
import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel';
import { CommonConstants as Const } from '../common/CommonConstants';
import Logger from '../common/utils/Logger';

const TAG: string = 'SeekPreview';
const SEEK_PREVIEW_INTERVAL_MS: number = 100;
const SEEK_PREVIEW_WIDTH: number = 320;
const SEEK_PREVIEW_HEIGHT: number = 180;

export class SeekPreviewController {
  private seekPreviewTimer: number = 0;
  private seekPreviewRequestId: number = 0;
  private seekPreviewGeneration: number = 0;
  private seekPreviewFetchRunning: boolean = false;
  private seekPreviewLastFetchTimeMs: number = 0;

  private model: PlaybackViewModel;
  private getSource: () => string | null;
  private getMediaInfo: () => MediaInfo | undefined;

  constructor(model: PlaybackViewModel, getSource: () => string | null,
    getMediaInfo: () => MediaInfo | undefined) {
    this.model = model;
    this.getSource = getSource;
    this.getMediaInfo = getMediaInfo;
  }

  reset(): void {
    this.cancelSeekPreviewRequest();
    this.releaseSeekPreviewFrame();
    this.seekPreviewLastFetchTimeMs = 0;
  }

  releaseSeekPreviewFrame(): void {
    if (this.model.seekPreviewFrame === undefined) {
      return;
    }
    const frame = this.model.seekPreviewFrame;
    this.model.seekPreviewFrame = undefined;
    frame.release((error) => {
      if (error !== undefined) {
        Logger.error(TAG, 'Release seek preview frame failed: ' + JSON.stringify(error));
      }
    });
  }

  cancelSeekPreviewRequest(): void {
    // 松手和换视频会结束本次预览，普通的位置更新只合并请求，不作废已在生成的帧。
    this.seekPreviewGeneration++;
    this.seekPreviewRequestId++;
    this.model.seekPreviewVisible = false;
    this.model.seekPreviewFailed = false;
    if (this.seekPreviewTimer !== 0) {
      clearTimeout(this.seekPreviewTimer);
      this.seekPreviewTimer = 0;
    }
  }

  scheduleSeekPreview(): void {
    if (!this.model.isSeeking || !this.model.hasVideo || this.getSource() === null) {
      return;
    }
    this.model.seekPreviewVisible = true;
    this.seekPreviewRequestId++;
    if (this.seekPreviewTimer !== 0 || this.seekPreviewFetchRunning) {
      return;
    }
    const elapsedMs = Date.now() - this.seekPreviewLastFetchTimeMs;
    const delayMs = Math.max(0, SEEK_PREVIEW_INTERVAL_MS - elapsedMs);
    this.seekPreviewTimer = setTimeout(() => {
      this.seekPreviewTimer = 0;
      this.seekPreviewLastFetchTimeMs = Date.now();
      this.fetchSeekPreview(this.model.seekPreviewUs, this.seekPreviewRequestId,
        this.seekPreviewGeneration);
    }, delayMs);
  }

  async fetchSeekPreview(targetUs: number, requestId: number, generation: number): Promise<void> {
    const source: string | null = this.getSource();
    if (this.seekPreviewFetchRunning || source === null || !this.model.seekPreviewVisible ||
      generation !== this.seekPreviewGeneration) {
      return;
    }
    this.seekPreviewFetchRunning = true;
    this.model.seekPreviewFailed = false;
    let previewFile: fileIo.File | undefined = undefined;
    let imageGenerator: media.AVImageGenerator | undefined = undefined;
    let fetchedFrame: PixelMap | undefined = undefined;
    try {
      try {
        const mediaInfo = this.getMediaInfo() ?? player.getMediaInfo();
        const rotation = mediaInfo.video.rotation % 360;
        const normalizedRotation = rotation < 0 ? rotation + 360 : rotation;
        const hasVideoGeometry: boolean = mediaInfo.video.width > 0 && mediaInfo.video.height > 0;
        const isRotatedPortrait: boolean = (normalizedRotation === 90 || normalizedRotation === 270) &&
          (!hasVideoGeometry || mediaInfo.video.width >= mediaInfo.video.height);
        const isNativePortrait: boolean = normalizedRotation === 0 &&
          mediaInfo.video.height > mediaInfo.video.width;
        let previewRotation: number = 0;
        if (isRotatedPortrait) {
          previewRotation = normalizedRotation;
        } else if (isNativePortrait) {
          // 原生竖屏视频没有旋转信息时，仍按竖屏预览。
          previewRotation = 90;
        } else if (normalizedRotation === 180) {
          previewRotation = 180;
        }
        this.model.seekPreviewRotation = previewRotation;
      } catch (error) {
        // 预览旋转信息缺失时按 0° 生成。
        Logger.info(TAG, 'Seek preview rotation unavailable: ' + JSON.stringify(error));
        this.model.seekPreviewRotation = 0;
      }
      previewFile = fileIo.openSync(source, fileIo.OpenMode.READ_ONLY);
      const previewFileState = fileIo.statSync(previewFile.fd);
      imageGenerator = await media.createAVImageGenerator();
      imageGenerator.fdSrc = {
        fd: previewFile.fd,
        offset: Const.DEFAULT_VALUE,
        length: previewFileState.size
      };
      const isPortraitPreview = this.model.seekPreviewRotation === 90 ||
        this.model.seekPreviewRotation === 270;
      const frame: PixelMap = await imageGenerator.fetchFrameByTime(targetUs,
        media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, {
          // 竖屏预览交换请求宽高，以匹配最终显示方向。
          width: isPortraitPreview ? SEEK_PREVIEW_HEIGHT : SEEK_PREVIEW_WIDTH,
          height: isPortraitPreview ? SEEK_PREVIEW_WIDTH : SEEK_PREVIEW_HEIGHT
        });
      if (frame === undefined || frame === null) {
        throw new Error('Image generator returned an empty preview frame');
      }
      fetchedFrame = frame;
      // 生成器已应用旋转，不能再次旋转 PixelMap。
      // 同一次拖动中先显示已取到的帧，再处理最新位置，避免连续移动时始终没有预览。
      if (!this.model.isSeeking || !this.model.seekPreviewVisible ||
        generation !== this.seekPreviewGeneration || source !== this.getSource()) {
        frame.release((error) => {
          if (error !== undefined) {
            Logger.error(TAG, 'Release stale seek preview frame failed: ' + JSON.stringify(error));
          }
        });
        fetchedFrame = undefined;
        return;
      }
      this.releaseSeekPreviewFrame();
      this.model.seekPreviewFrame = frame;
      fetchedFrame = undefined;
    } catch (error) {
      if (this.model.seekPreviewVisible && generation === this.seekPreviewGeneration &&
        source === this.getSource()) {
        this.model.seekPreviewFailed = true;
        Logger.error(TAG, 'Fetch seek preview failed: ' + JSON.stringify(error));
      }
      if (fetchedFrame !== undefined) {
        fetchedFrame.release((releaseError) => {
          if (releaseError !== undefined) {
            Logger.error(TAG, 'Release failed seek preview frame failed: ' + JSON.stringify(releaseError));
          }
        });
        fetchedFrame = undefined;
      }
    } finally {
      if (imageGenerator !== undefined) {
        try {
          await imageGenerator.release();
        } catch (error) {
          Logger.error(TAG, 'Release image generator failed: ' + JSON.stringify(error));
        }
      }
      if (previewFile !== undefined) {
        try {
          fileIo.closeSync(previewFile);
        } catch (error) {
          Logger.error(TAG, 'Close seek preview file failed: ' + JSON.stringify(error));
        }
      }
      this.seekPreviewFetchRunning = false;
      if (this.model.isSeeking && this.model.seekPreviewVisible &&
        (generation !== this.seekPreviewGeneration ||
        requestId !== this.seekPreviewRequestId)) {
        this.scheduleSeekPreview();
      }
    }
  }

}
