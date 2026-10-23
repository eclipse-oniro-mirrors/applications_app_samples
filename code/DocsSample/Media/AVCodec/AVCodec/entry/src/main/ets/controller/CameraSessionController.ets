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

import { camera } from '@kit.CameraKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import { CameraDataModel } from '../model/CameraDataModel';
import { encoderProfileCameraCheck, previewProfileCameraCheck } from '../common/utils/CameraCheck';
import { CommonConstants as Const } from '../common/CommonConstants';
import Logger from '../common/utils/Logger';

export class CameraSessionController {
  private input: camera.CameraInput | undefined = undefined;
  private preview: camera.PreviewOutput | undefined = undefined;
  private output: camera.VideoOutput | undefined = undefined;
  private session: camera.VideoSession | undefined = undefined;
  private preparing: Promise<void> | undefined = undefined;
  private starting: Promise<void> | undefined = undefined;
  private releasing: Promise<void> | undefined = undefined;
  private closing: boolean = false;
  private outputStarted: boolean = false;

  prepare(ui: UIContext, data: CameraDataModel, surface: string): Promise<void> {
    if (this.preparing === undefined) { this.preparing = this.configure(ui, data, surface); }
    return this.preparing;
  }

  private async configure(ui: UIContext, data: CameraDataModel, surface: string): Promise<void> {
    const manager = camera.getCameraManager(ui.getHostContext());
    const devices: camera.CameraDevice[] = manager.getSupportedCameras();
    if (devices.length === 0 || manager.getSupportedSceneModes(devices[0]).indexOf(camera.SceneMode.NORMAL_VIDEO) < 0) {
      throw new Error('Video camera unavailable');
    }
    const encoding = encoderProfileCameraCheck(manager, data);
    const preview = previewProfileCameraCheck(manager, data);
    if (encoding === undefined || preview === undefined) { throw new Error('Camera profile unavailable'); }
    this.output = manager.createVideoOutput(encoding, data.outputId);
    this.preview = manager.createPreviewOutput(preview, surface);
    this.input = manager.createCameraInput(devices[0]);
    await this.input.open();
    if (this.closing) { return; }
    this.session = manager.createSession(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
    this.session.beginConfig();
    this.session.addInput(this.input);
    this.session.addOutput(this.preview);
    this.session.addOutput(this.output);
    const stabilization = data.videoStabilizationMode === Const.VIDEO_STABILIZATION_DISABLED ?
      camera.VideoStabilizationMode.OFF : camera.VideoStabilizationMode.AUTO;
    try {
      if (this.session.isVideoStabilizationModeSupported(stabilization)) {
        this.session.setVideoStabilizationMode(stabilization);
      }
    } catch (_error) { Logger.warn('RecorderCamera', 'Optional stabilization is unavailable'); }
    const color = data.isHDRVivid ? colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT :
      colorSpaceManager.ColorSpace.BT709_LIMIT;
    try {
      if (this.session.getSupportedColorSpaces().indexOf(color) >= 0) { this.session.setColorSpace(color); }
    } catch (_error) { Logger.warn('RecorderCamera', 'Optional color space is unavailable'); }
    await this.session.commitConfig();
    if (!this.closing) { await this.session.start(); }
  }

  start(): Promise<void> {
    if (this.output === undefined || this.closing) { return Promise.reject(new Error('Camera is not ready')); }
    this.starting = this.output.start().then((): void => { this.outputStarted = true; });
    return this.starting;
  }

  async stop(onFrameEnd: () => void): Promise<boolean> {
    this.closing = true;
    if (this.preparing !== undefined) { try { await this.preparing; } catch (_error) {} }
    if (this.starting !== undefined) { try { await this.starting; } catch (_error) {} }
    if (this.output !== undefined && this.outputStarted) {
      let listening: boolean = false;
      try {
        this.output.on('frameEnd', (): void => onFrameEnd());
        listening = true;
      } catch (_error) { Logger.warn('RecorderCamera', 'Camera frameEnd listener is unavailable'); }
      try { await this.output.stop(); }
      catch (error) {
        // 输出停止失败时先停整个相机会话，不能让它继续向即将收尾的编码 Surface 写入。
        await this.session?.stop();
        this.outputStarted = false;
        throw new Error('Camera output stop failed: ' + JSON.stringify(error));
      }
      this.outputStarted = false;
      return listening;
    }
    return false;
  }

  zoom(scale: number): void {
    if (this.session === undefined || this.closing) { return; }
    try {
      const range: number[] = this.session.getZoomRatioRange();
      if (range.length < 2) { return; }
      this.session.setZoomRatio(Math.max(range[0], Math.min(range[1], scale)));
    } catch (_error) { Logger.warn('RecorderCamera', 'Camera zoom is unavailable'); }
  }
  zoomRatio(): number {
    try { return this.session?.getZoomRatio() ?? 1; } catch (_error) { return 1; }
  }

  release(): Promise<void> {
    this.closing = true;
    if (this.releasing === undefined) { this.releasing = this.cleanup(); }
    return this.releasing;
  }

  private async cleanup(): Promise<void> {
    // 页面在准备或启动期间退出时，等待在途操作结束后再释放它创建的对象。
    if (this.preparing !== undefined) { try { await this.preparing; } catch (_error) {} }
    if (this.starting !== undefined) { try { await this.starting; } catch (_error) {} }
    try { await this.session?.stop(); } catch (_error) {}
    try { await this.input?.close(); } catch (_error) {}
    try { await this.preview?.release(); } catch (_error) {}
    try { this.output?.off('frameEnd'); } catch (_error) {}
    try { await this.output?.release(); } catch (_error) {}
    try { await this.session?.release(); } catch (_error) {}
    this.session = undefined;
    this.output = undefined;
    this.preview = undefined;
    this.input = undefined;
  }
}
