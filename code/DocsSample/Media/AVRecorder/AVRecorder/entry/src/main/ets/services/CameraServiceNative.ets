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

import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import camera from '@ohos.multimedia.camera';
import { Resolution } from './CommonTypes';

type OutputProfiles = Array<camera.Profile>;

export default class CameraServiceNative {
  private cameraManager: camera.CameraManager | undefined = undefined;
  private cameras: Array<camera.CameraDevice> | undefined = undefined;
  private cameraOutputCapability: camera.CameraOutputCapability | undefined = undefined;
  private videoOutputProfiles: OutputProfiles | undefined = undefined;
  private previewProfiles: OutputProfiles | undefined = undefined;
  private cameraInput: camera.CameraInput | undefined = undefined;
  private previewOutput: camera.PreviewOutput | undefined = undefined;
  private videoOutput: camera.VideoOutput | undefined = undefined;
  private captureSession: camera.VideoSession | undefined = undefined;
  private videoResolution: Resolution = { frameWidth: 1920, frameHeight: 1080} as Resolution;
  private cameraIndex: number = 0;

  init(context: common.Context): void {
    if (this.cameraManager) {
      return;
    }
    this.cameraManager = camera.getCameraManager(context);
    if (this.cameraManager) {
      console.info('[CameraServiceNative/init] getCameraManager succeeded');
    } else {
      console.error('[CameraServiceNative/init] getCameraManager failed');
      return;
    }
    this.cameras = this.cameraManager.getSupportedCameras();
    if (this.cameras) {
      console.info('[CameraServiceNative/init] getCameras succeeded');
    } else {
      console.error('[CameraServiceNative/init] getCameras failed');
      return;
    }
    this.cameraOutputCapability = this.cameraManager.getSupportedOutputCapability(this.cameras[this.cameraIndex],
      camera.SceneMode.NORMAL_VIDEO);
    this.videoOutputProfiles = this.cameraOutputCapability.videoProfiles;
  }

  async createInput(): Promise<void> {
    try {
      if (this.cameraManager && this.cameras && this.cameras.length > 0) {
        this.cameraInput = this.cameraManager.createCameraInput(this.cameras[this.cameraIndex]);
        if (this.cameraInput) {
          console.info('[CameraServiceNative/createInput] createCameraInput succeeded');
        } else {
          console.error('[CameraServiceNative/createInput] createCameraInput failed');
          return;
        }
        await this.cameraInput.open();
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create CameraInput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  selectProfile(profiles: OutputProfiles, resolution: Resolution): number {
    for (let index = 0; index < profiles.length; index++) {
      let candidate = profiles[index];
      if (candidate.size.height == resolution.frameHeight && candidate.size.width == resolution.frameWidth) {
        return index;
      }
    }
    return 0;
  }

  selectVideoOutputProfile(profiles: OutputProfiles, resolution: Resolution): number {
    for (let index = 0; index < profiles.length; index++) {
      let candidate = profiles[index];
      if (candidate.size.height == resolution.frameHeight && candidate.size.width == resolution.frameWidth) {
        return index;
      }
    }
    return 0;
  }

  createPreviewOutput(previewSurfaceId: string): void {
    try {
      if (this.cameraOutputCapability && this.cameraManager) {
        this.previewProfiles = this.cameraOutputCapability.previewProfiles;
        let index: number = this.selectProfile(this.previewProfiles, this.videoResolution);
        this.previewOutput = this.cameraManager.createPreviewOutput(this.previewProfiles[index], previewSurfaceId);
        if (this.previewOutput) {
          console.info('[CameraServiceNative] createPreviewOutput succeeded');
        } else {
          console.error('[CameraServiceNative] createPreviewOutput failed');
        }
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create PreviewOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async createCaptureSession(): Promise<void> {
    try {
      if (this.cameraManager) {
        this.captureSession = this.cameraManager.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
        if (!this.captureSession) {
          console.error('[CameraServiceNative] createCaptureSession failed');
          return;
        }
        this.captureSession.beginConfig();
        this.captureSession.addInput(this.cameraInput);
        this.captureSession.addOutput(this.previewOutput);
        await this.captureSession.commitConfig();
        console.info('[CameraServiceNative] createCaptureSession succeeded');
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create CaptureSession, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async startCaptureSession(): Promise<void> {
    try {
      if (!this.captureSession) {
        console.error('[CameraServiceNative/startCaptureSession] CaptureSession does not exists');
        return;
      }
      await this.captureSession.start();
      console.info('[CameraServiceNative] startCaptureSession succeeded');
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to start CaptureSession, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async restartVideoOutput(surfaceId: string): Promise<void> {
    try {
      if (this.captureSession) {
        await this.captureSession.stop();
        this.captureSession.beginConfig();
        await this.removeVideoOutput();
        await this.createVideoOutput(surfaceId);
        this.captureSession.addOutput(this.videoOutput);
        await this.captureSession.commitConfig();
        await this.startCaptureSession();
        if (this.videoOutput) {
          await this.videoOutput.start();
        } else {
          console.error('[CameraServiceNative/restartVideoOutput] videoOutput is null');
          return;
        }
      }
      console.info('[CameraServiceNative] restartVideoOutput succeeded');
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to restart VideoOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async removeVideoOutput(): Promise<void> {
    try {
      if (this.captureSession && this.videoOutput) {
        this.captureSession.removeOutput(this.videoOutput);
        console.info('[CameraServiceNative] removeVideoOutput succeeded');
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to remove VideoOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async createVideoOutput(surfaceId: string): Promise<void> {
    try {
      if (this.videoOutputProfiles && this.cameraManager) {
        let index: number = this.selectVideoOutputProfile(this.videoOutputProfiles, this.videoResolution);
        const profile = this.videoOutputProfiles[index] as never;
        this.videoOutput = this.cameraManager.createVideoOutput(profile, surfaceId);
        if (!this.videoOutput) {
          console.error('[CameraServiceNative/createVideoOutput] create videoOutPut fail');
          return;
        }
      } else {
        console.error('[CameraServiceNative] createVideoOutput failed');
        return;
      }
      console.info('[CameraServiceNative] createVideoOutput succeeded');
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create VideoOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async stopVideoOutput(): Promise<void> {
    try {
      await this.videoOutput?.stop();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to stop VideoOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async startVideoOutput(): Promise<void> {
    try {
      await this.videoOutput?.start();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to start VideoOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async release(): Promise<void> {
    try {
      await this.captureSession?.stop();
      this.cameraInput = undefined;
      await this.previewOutput?.release();
      this.previewOutput = undefined;
      await this.videoOutput?.release();
      this.videoOutput = undefined;
      await this.captureSession?.release();
      this.captureSession = undefined;
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to release camera resources, error code: ${err.code}, message: ${err.message}`);
    }
  }

}