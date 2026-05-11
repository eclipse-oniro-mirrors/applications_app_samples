'use static'

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
import media from '@ohos.multimedia.media';
import { Resolution } from './CommonTypes';
import AVRecorderService from './AVRecorderService';

export default class CameraService {
  private cameraManager: camera.CameraManager | undefined = undefined;
  private cameras: Array<camera.CameraDevice> | undefined = undefined;
  private cameraOutputCapability: camera.CameraOutputCapability | undefined = undefined;
  private videoProfiles: Array<camera.VideoProfile> | undefined = undefined;
  private previewProfiles: Array<camera.Profile> | undefined = undefined;
  private cameraInput: camera.CameraInput | undefined = undefined;
  private previewOutput: camera.PreviewOutput | undefined = undefined;
  private videoOutput: camera.VideoOutput | undefined = undefined;
  private captureSession: camera.VideoSession | undefined = undefined;
  private videoResolution: Resolution = { frameWidth: 1920, frameHeight: 1080} as Resolution;
  private cameraIndex: int = 0;

  init(context: common.Context): void {
    if (this.cameraManager) {
      return;
    }
    this.cameraManager = camera.getCameraManager(context);
    if (this.cameraManager) {
      console.info('[CameraService/init] getCameraManager succeeded');
    } else {
      console.error('[CameraService/init] getCameraManager failed');
      return;
    }
    this.cameras = this.cameraManager!.getSupportedCameras();
    if (this.cameras) {
      console.info('[CameraService/init] getCameras succeeded');
    } else {
      console.error('[CameraService/init] getCameras failed');
      return;
    }
    this.cameraOutputCapability = this.cameraManager!.getSupportedOutputCapability(this.cameras![this.cameraIndex],
      camera.SceneMode.NORMAL_VIDEO);
    this.videoProfiles = this.cameraOutputCapability!.videoProfiles;
  }

  async createInput(): Promise<void> {
    try {
      if (this.cameraManager && this.cameras && this.cameras!.length > 0) {
        this.cameraInput = this.cameraManager!.createCameraInput(this.cameras![this.cameraIndex]);
        if (this.cameraInput) {
          console.info('[CameraService/createInput] createCameraInput succeeded');
        } else {
          console.error('[CameraService/createInput] createCameraInput failed');
          return;
        }
        await this.cameraInput!.open();
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create CameraInput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  selectProfile(profiles: Array<camera.Profile>, resolution: Resolution): int {
    for (let index = 0; index < profiles.length; index++) {
      let profile = profiles[index];
      if (profile.size.height == resolution.frameHeight && profile.size.width == resolution.frameWidth) {
        return index;
      }
    }
    return 0;
  }

  selectVideoProfile(profiles: Array<camera.VideoProfile>, resolution: Resolution): int {
    for (let index = 0; index < profiles.length; index++) {
      let profile = profiles[index];
      if (profile.size.height == resolution.frameHeight && profile.size.width == resolution.frameWidth) {
        return index;
      }
    }
    return 0;
  }

  createPreviewOutput(recorderService: AVRecorderService, previewSurfaceId: string): void {
    try {
      if (this.cameraOutputCapability && this.cameraManager) {
        this.previewProfiles = this.cameraOutputCapability!.previewProfiles;
        let index: int = this.selectProfile(this.previewProfiles!, this.videoResolution);
        if (this.previewProfiles![index].format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
          console.info('[CameraService/createPreviewOutput] case format is VIDEO_SOURCE_TYPE_SURFACE_YUV');
          recorderService.configVideoSourceType(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV);
        } else {
          console.info('[CameraService/createPreviewOutput] case format is VIDEO_SOURCE_TYPE_SURFACE_ES');
          recorderService.configVideoSourceType(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES);
        }
        this.previewOutput = this.cameraManager!.createPreviewOutput(this.previewProfiles![index], previewSurfaceId);
        if (this.previewOutput) {
          console.info('[CameraService] createPreviewOutput succeeded');
        } else {
          console.error('[CameraService] createPreviewOutput failed');
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
        this.captureSession = this.cameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
        if (!this.captureSession) {
          console.error('[CameraService] createCaptureSession failed');
          return;
        }
        this.captureSession!.beginConfig();
        this.captureSession!.addInput(this.cameraInput!);
        this.captureSession!.addOutput(this.previewOutput!);
        await this.captureSession!.commitConfig();
        console.info('[CameraService] createCaptureSession succeeded');
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create CaptureSession, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async startCaptureSession(): Promise<void> {
    try {
      if (!this.captureSession) {
        console.error('[CameraService/startCaptureSession] CaptureSession does not exists');
        return;
      }
      await this.captureSession!.start();
      console.info('[CameraService] startCaptureSession succeeded');
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to start CaptureSession, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async restartVideoOutput(surfaceId: string): Promise<void> {
    try {
      if (this.captureSession) {
        await this.captureSession!.stop();
        this.captureSession!.beginConfig();
        await this.removeVideoOutput();
        await this.createVideoOutput(surfaceId);
        this.captureSession!.addOutput(this.videoOutput!);
        await this.captureSession!.commitConfig();
        await this.startCaptureSession();
        if (this.videoOutput) {
          await this.videoOutput!.start();
        } else {
          console.error('[CameraService/restartVideoOutput] videoOutput is null');
          return;
        }
      }
      console.info('[CameraService] restartVideoOutput succeeded');
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to restart VideoOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async removeVideoOutput(): Promise<void> {
    try {
      if (this.captureSession && this.videoOutput) {
        this.captureSession!.removeOutput(this.videoOutput!);
        console.info('[CameraService] removeVideoOutput succeeded');
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to remove VideoOutput, error code: ${err.code}, message: ${err.message}`);
    }
  }

  async createVideoOutput(surfaceId: string): Promise<void> {
    try {
      if (this.videoProfiles && this.cameraManager) {
        let index: int = this.selectVideoProfile(this.videoProfiles!, this.videoResolution);
        this.videoOutput = this.cameraManager!.createVideoOutput(this.videoProfiles![index], surfaceId);
        if (!this.videoOutput) {
          console.error('[CameraService/createVideoOutput] create videoOutPut fail');
          return;
        }
      } else {
        console.error('[CameraService] createVideoOutput failed');
        return;
      }
      console.info('[CameraService] createVideoOutput succeeded');
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