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
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import { display } from '@kit.ArkUI';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import recorder, { Response } from 'librecorder.so';
import { CameraDataModel } from '../model/CameraDateModel';
import Logger from '../common/utils/Logger';

const TAG: string = '[Sample_HMOSLiveStream]';

export class CameraController {
  private cameraIsRunning: boolean = false;
  private cameraData: CameraDataModel;
  private isClosing: boolean = false;
  private cameraTask: Promise<void> = Promise.resolve();
  private releaseTask: Promise<void> | undefined;
  private input: camera.CameraInput | undefined;
  private preview: camera.PreviewOutput | undefined;
  private metadata: camera.MetadataOutput | undefined;
  private session: camera.VideoSession | undefined;
  private nativeRecorderObj: bigint | undefined;
  private context: common.UIAbilityContext | undefined;

  constructor(cameraData: CameraDataModel, context: common.UIAbilityContext) {
    this.cameraData = cameraData;
    this.context = context;
  }


  public getNativeRecorderObj() {
    return this.nativeRecorderObj;
  }

  public getCameraPosition() {
    return this.cameraData.cameraPosition;
  }

  public setCameraPosition(cameraPosition: camera.CameraPosition) {
    this.cameraData.cameraPosition = cameraPosition;
  }

  public updateImageRotation() {
    if (!this.cameraIsRunning || !this.nativeRecorderObj) {
      return;
    }
    try {
      this.cameraData.deviceRotation = display.getDefaultDisplaySync().rotation;
      const displayRotation = this.cameraData.deviceRotation * camera.ImageRotation.ROTATION_90;
      if (this.cameraData.useNativeCamera) {
        const rotation = recorder.rotateNativeCamera(this.nativeRecorderObj, displayRotation,
          this.cameraData.isDisplayLocked ?? false);
        if (rotation < 0) {
          return;
        }
        this.cameraData.imageRotation = rotation;
      } else if (this.preview) {
        this.cameraData.imageRotation = this.preview.getPreviewRotation(displayRotation);
        this.preview.setPreviewRotation(this.cameraData.imageRotation, this.cameraData.isDisplayLocked);
      }
      recorder.UpdateCameraRotation(this.nativeRecorderObj, this.cameraData.imageRotation);
    } catch (error) {
      Logger.error(TAG, `Update camera rotation failed: ${error}`);
    }
  }

  public async initNative(): Promise<Response> {
    this.nativeRecorderObj = recorder.createRecorder();
    return recorder.initNative(this.nativeRecorderObj, this.cameraData.outputFd, this.cameraData.videoCodecMime,
      this.cameraData.cameraWidth,
      this.cameraData.cameraHeight, this.cameraData.frameRate, this.cameraData.isHDRVivid,
      this.cameraData.bitRate, this.cameraData.isOpenEchoCancel, this.cameraData.roiFd,
      this.cameraData.roiPathType);
  }


  public createRecorder(): Promise<void> {
    // Serialize camera switches and foreground/background changes, including asynchronous open/close.
    this.cameraTask = this.cameraTask.then(async () => {
      if (this.isClosing) {
        return;
      }
      await this.releaseCameraInternal();
      try {
        if (this.cameraData.useNativeCamera) {
          await this.createNativeCamera();
        } else {
          await this.createArkTSCamera();
        }
      } catch (error) {
        Logger.error(TAG, `Create camera failed: ${error}`);
        await this.releaseCameraInternal();
      }
    });
    return this.cameraTask;
  }

  private async createNativeCamera(): Promise<void> {
    if (!this.nativeRecorderObj) {
      throw new Error('Recorder has not been initialized');
    }
    const result = await recorder.startNativeCamera(this.nativeRecorderObj, this.cameraData.surfaceId,
      this.cameraData.cameraWidth, this.cameraData.cameraHeight, this.cameraData.frameRate,
      this.cameraData.cameraPosition, this.cameraData.isHDRVivid !== 0);
    if (result.code !== 0) {
      throw new Error(`Native camera start failed, code: ${result.code}`);
    }
    this.cameraData.cameraPosition = result.cameraPosition;
    recorder.updateInfoForCamera(this.nativeRecorderObj,
      this.cameraData.cameraPosition === camera.CameraPosition.CAMERA_POSITION_FRONT);
    this.cameraIsRunning = true;
    this.updateImageRotation();
  }

  private async createArkTSCamera(): Promise<void> {
    const cameraManager = camera.getCameraManager(this.context);
    const cameraDevices = cameraManager.getSupportedCameras();
    const deviceCur = cameraDevices.find(device => device.cameraPosition === this.cameraData.cameraPosition) ||
      cameraDevices[0];
    if (!deviceCur) {
      throw new Error('No available camera device');
    }
    this.cameraData.cameraPosition = deviceCur.cameraPosition;
    recorder.updateInfoForCamera(this.nativeRecorderObj,
      this.cameraData.cameraPosition === camera.CameraPosition.CAMERA_POSITION_FRONT);
    const profiles = cameraManager.getSupportedOutputCapability(deviceCur, camera.SceneMode.NORMAL_VIDEO);
    const previewProfile = profiles.previewProfiles.find((profile: camera.Profile) => {
      const format = this.cameraData.isHDRVivid ? camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 :
        camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
      return profile.size.width === this.cameraData.cameraWidth && profile.size.height === this.cameraData.cameraHeight &&
        profile.format === format;
    });
    if (!previewProfile) {
      throw new Error('Requested preview profile is unsupported');
    }
    this.preview = cameraManager.createPreviewOutput(previewProfile, this.cameraData.surfaceId);
    this.input = cameraManager.createCameraInput(deviceCur);
    await this.input.open();
    this.session = cameraManager.createSession(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
    this.session.beginConfig();
    this.session.addInput(this.input);
    this.session.addOutput(this.preview);
    let metadataOutput = this.getMetadataOutput(cameraManager, profiles);
    this.metadata = metadataOutput;
    if (metadataOutput !== undefined) {
      this.session.addOutput(metadataOutput);
    }
    this.setColorSpaceBeforeCommitConfig(this.session, this.cameraData.isHDRVivid);
    await this.session.commitConfig();

    // Enable camera ROI metadata after committing the session configuration.
    if (metadataOutput !== undefined) {
      try {
        // [Start roi_enable_in_frame_metadata]
        if (metadataOutput.isInFrameMetadataForEncoderSupported()) {
          metadataOutput.setInFrameMetadataForEncoderEnabled(true);
        } else {
          Logger.warn(TAG, 'In-frame metadata for encoder is not supported; camera ROI is unavailable.');
        }
        // [End roi_enable_in_frame_metadata]
      } catch (error) {
        const err = error as BusinessError;
        Logger.error(TAG, `Failed to enable in-frame metadata for encoder. code: ${err.code}, message: ${err.message}`);
      }
    }
    this.setFocusMode(this.session);
    if (!this.handleFrameRateSetting(this.cameraData.frameRate, this.preview)) {
      throw new Error('Frame rate setting failed');
    }
    this.cameraData.range = this.session.getZoomRatioRange();
    await this.session.start();
    this.cameraIsRunning = true;
    this.updateImageRotation();
    this.registerSystemPressureLevelChangeCallback(this.session);
  }

  public releaseCamera(): Promise<void> {
    this.cameraTask = this.cameraTask.then(() => this.releaseCameraInternal());
    return this.cameraTask;
  }

  private async releaseCameraInternal(): Promise<void> {
    const wasRunning = this.cameraIsRunning;
    this.cameraIsRunning = false;
    if (this.cameraData.useNativeCamera) {
      if (this.nativeRecorderObj) {
        const result = await recorder.stopNativeCamera(this.nativeRecorderObj);
        if (result.code !== 0) {
          Logger.error(TAG, `Stop Native camera failed, code: ${result.code}`);
        }
      }
      return;
    }
    const session = this.session;
    const input = this.input;
    const preview = this.preview;
    const metadata = this.metadata;
    this.session = undefined;
    this.input = undefined;
    this.preview = undefined;
    this.metadata = undefined;
    if (session && wasRunning) {
      try {
        this.unregisterSystemPressureLevelChangeCallback(session);
      } catch (error) {
        Logger.error(TAG, `Unregister camera callback failed: ${error}`);
      }
      await session.stop().catch((error: BusinessError) => Logger.error(TAG, `Stop camera failed: ${error}`));
    }
    await session?.release().catch((error: BusinessError) => Logger.error(TAG, `Release session failed: ${error}`));
    await metadata?.release().catch((error: BusinessError) => Logger.error(TAG, `Release metadata failed: ${error}`));
    await preview?.release().catch((error: BusinessError) => Logger.error(TAG, `Release preview failed: ${error}`));
    await input?.close().catch((error: BusinessError) => Logger.error(TAG, `Close camera failed: ${error}`));
  }

  unregisterSystemPressureLevelChangeCallback(videoSession: camera.VideoSession): void {
    if (deviceInfo.sdkApiVersion >= 20) {
      videoSession.off('systemPressureLevelChange');
    }
  }

  getMetadataOutput(cameraManager: camera.CameraManager,
    cameraOutputCapability: camera.CameraOutputCapability): camera.MetadataOutput | undefined {
    let metadataObjectTypes: camera.MetadataObjectType[] = cameraOutputCapability.supportedMetadataObjectTypes;
    let metadataOutput: camera.MetadataOutput | undefined = undefined;
    try {
      metadataOutput = cameraManager.createMetadataOutput(metadataObjectTypes);
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `Failed to createMetadataOutput, error code: ${err.code}`);
    }
    return metadataOutput;
  }

  setFocusMode(videoSession: camera.VideoSession): void {
    const focusPoint: camera.Point = { x: 1, y: 1 };
    try {
      // Set autofocus mode
      videoSession.setFocusMode(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      // Set focus point
      videoSession.setFocusPoint(focusPoint);
    } catch (error) {
      // On failure, return the error code error.code and handle it
      let err = error as BusinessError;
      Logger.error(TAG, `The setFocusMode and setFocusPoint call failed. error code: ${err.code}`);
    }
  }

  setDynamicFrameRate(xComponentPreviewOutput: camera.PreviewOutput, encoderVideoOutput: camera.VideoOutput) {
    Logger.error('[czztest]begin');
    let supportFrameRateArray: camera.FrameRateRange[] = this.getSupportedFrameRange(xComponentPreviewOutput);
    let supportVideoFrameRateArray: camera.FrameRateRange[] = this.getVideoSupportedFrameRange(encoderVideoOutput);
    // Frame rate can be set before start
    if (supportFrameRateArray.length !== 0 && supportVideoFrameRateArray.length !== 0) {
      /**
       * Set the frame rate to the maximum value of the first frame rate range.
       * Currently, the video stream must be configured first;
       * otherwise, settings for the preview stream will not take effect.
       * If the video stream is configured first, its frame rate will be set to the default,
       * and the two streams will enforce strict mutual validation.
       * Specifically, if the video stream is configured first,
       * the default rules will be based on the video stream—for example,
       * if it's set to 10–24 fps, the preview stream can only be set to 24 fps or a multiple of 24.
       * Conversely, if the preview stream is configured first, it will default to 30 fps,
       * which may conflict with the video stream during strict validation, causing the configuration to fail.
       */
      this.setVideoFrameRate(encoderVideoOutput, 10, 24);
      this.setFrameRate(xComponentPreviewOutput, 10, 24);
    }

    let activeFrameRateArray: camera.FrameRateRange = this.getActiveFrameRange(xComponentPreviewOutput);
    let activeVideoFrameRateArray: camera.FrameRateRange = this.getVideoActiveFrameRange(encoderVideoOutput);
    Logger.info(TAG,
      `[czztest]current effective frame rate for this previewOutput: ${JSON.stringify(activeFrameRateArray)}, current effective frame rate for this encoderVideoOutputc: ${JSON.stringify(activeVideoFrameRateArray)}`);

    Logger.error(TAG, '[czztest]end');
  }


  handleFrameRateSetting(
    targetFrameRate: number,
    previewOutput: camera.PreviewOutput
  ): boolean {
    // Get the currently supported frame rate ranges
    const supportFrameRateArray: camera.FrameRateRange[] = previewOutput.getSupportedFrameRates();
    Logger.info(TAG, `frame rate supported by previewOutput: ${JSON.stringify(supportFrameRateArray)}`);

    // Check if the target frame rate is supported
    let isFpsSupported = false;
    for (const frameRateRange of supportFrameRateArray) {
      if (targetFrameRate >= frameRateRange.min && targetFrameRate <= frameRateRange.max) {
        isFpsSupported = true;
        break; // Exit the loop early once a supported range is found
      }
    }

    // If supported, attempt to set the frame rate
    if (isFpsSupported) {
      try {
        previewOutput.setFrameRate(targetFrameRate, targetFrameRate);
      } catch (error) {
        const err = error as BusinessError;
        Logger.error(TAG, `Failed to setFrameRate for previewOutput. error: ${JSON.stringify(err)}`);
        return false; // Failed to set
      }
    } else {
      Logger.error(TAG, `Target frame rate ${targetFrameRate} is not supported`);
      return false; // Target frame rate is not supported
    }

    // Verify the currently active frame rate
    const activeFrameRate: camera.FrameRateRange = previewOutput.getActiveFrameRate();
    if (activeFrameRate.min !== targetFrameRate || activeFrameRate.max !== targetFrameRate) {
      Logger.error(TAG,
        `Current effective frame rate: ${JSON.stringify(activeFrameRate)} but wanted ${targetFrameRate}`);
      return false; // Frame rate mismatch
    } else {
      Logger.info(TAG,
        `Current effective frame rate: ${JSON.stringify(activeFrameRate)} and wanted ${targetFrameRate}`);
    }

    return true; // Frame rate successfully set and verified
  }


  // [Start Set_color_space]
  // Set the color space
  setColorSpaceBeforeCommitConfig(session: camera.VideoSession, isHdr: number): void {
    let colorSpace: colorSpaceManager.ColorSpace =
      isHdr ? colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT : colorSpaceManager.ColorSpace.BT709_LIMIT;
    let colorSpaces: colorSpaceManager.ColorSpace[] = this.getSupportedColorSpaces(session);
    let isSupportedColorSpaces = colorSpaces.indexOf(colorSpace) >= 0;
    if (isSupportedColorSpaces) {
      Logger.info(TAG, `setColorSpace: ${colorSpace}`);
      try {
        session.setColorSpace(colorSpace);
      } catch (error) {
        Logger.error(TAG, `setColorSpace fail ${error}`);
      }
      let activeColorSpace: colorSpaceManager.ColorSpace;
      try {
        activeColorSpace = session.getActiveColorSpace();
        if (activeColorSpace != colorSpace) {
          Logger.error(TAG, `activeColorSpace: ${activeColorSpace}, but wait: ${colorSpace}`);
        }
        Logger.info(TAG, `activeColorSpace: ${activeColorSpace}`);
      } catch (error) {
        Logger.error(TAG, `getActiveColorSpace fail ${error}`);
      }
    } else {
      Logger.info(TAG, `colorSpace: ${colorSpace} is not support`);
    }
  }
  // [End Set_color_space]

  // [Start System_pressure_level]
  systemPressureLevelChangeCallback(err: BusinessError, systemPressureLevel: camera.SystemPressureLevel): void {
    if (err !== undefined && err.code !== 0) {
      Logger.error(TAG, `Callback Error, errorCode: ${err.code}`);
      return;
    }
    Logger.info(TAG, `systemPressureLevel: ${systemPressureLevel}`);
  }


  registerSystemPressureLevelChangeCallback(videoSession: camera.VideoSession): void {
    if (deviceInfo.sdkApiVersion >= 20) {
      videoSession.on('systemPressureLevelChange', this.systemPressureLevelChangeCallback);
    }
  }
  // [End System_pressure_level]

  setVideoFrameRate(videoOutput: camera.VideoOutput, minFps: number, maxFps: number): void {
    try {
      videoOutput.setFrameRate(minFps, maxFps);
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `Failed to setFrameRate for previewOutput. error: ${JSON.stringify(err)}`);
    }
  }

  setFrameRate(previewOutput: camera.PreviewOutput, minFps: number, maxFps: number): void {
    try {
      previewOutput.setFrameRate(minFps, maxFps);
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `Failed to setFrameRate for previewOutput. error: ${JSON.stringify(err)}`);
    }
  }

  getActiveFrameRange(previewOutput: camera.PreviewOutput): camera.FrameRateRange {
    return previewOutput.getActiveFrameRate();
  }

  getSupportedFrameRange(previewOutput: camera.PreviewOutput): Array<camera.FrameRateRange> {
    // Get the supported frame rate ranges; different hardware platforms may provide different frame rate ranges.
    return previewOutput.getSupportedFrameRates();
  }

  getVideoActiveFrameRange(videoOutput: camera.VideoOutput): camera.FrameRateRange {
    return videoOutput.getActiveFrameRate();
  }

  getVideoSupportedFrameRange(videoOutput: camera.VideoOutput): Array<camera.FrameRateRange> {
    // Get the supported frame rate ranges; different hardware platforms may provide different frame rate ranges.
    return videoOutput.getSupportedFrameRates();
  }

  getSupportedColorSpaces(session: camera.VideoSession): Array<colorSpaceManager.ColorSpace> {
    let colorSpaces: colorSpaceManager.ColorSpace[] = [];
    try {
      colorSpaces = session.getSupportedColorSpaces();
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `The getSupportedColorSpaces call failed. error code: ${err.code}`);
    }
    return colorSpaces;
  }

  public setIsOpenROI(isOpenROI: boolean) {
    if (this.nativeRecorderObj) {
      recorder.setIsOpenROI(this.nativeRecorderObj, isOpenROI);
    }
  }

  public onDisplayCallback() {
    try {
      display.on(`foldStatusChange`, this.callbackFoldStatus);
    } catch (error) {
      Logger.error(TAG, `set on foldStatusChange fail ${error}`);
    }
    display.on(`change`, this.displayChangeCallback);
  }

  public offDisplayCallback() {
    try {
      display.off(`foldStatusChange`, this.callbackFoldStatus);
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `offDisplayCallback failed, errCode = ${err.code}, errMessage = ${err.message}.`);
    }
    display.off(`change`, this.displayChangeCallback);
  }

  public doGestureUpdate(fov: number, event: GestureEvent) {
    if (!this.cameraIsRunning) {
      return;
    }
    if (this.cameraData.useNativeCamera && this.nativeRecorderObj) {
      recorder.setNativeCameraZoom(this.nativeRecorderObj, fov * event.scale);
    } else if (this.session) {
      const zoom = Math.min(this.cameraData.range[1], Math.max(this.cameraData.range[0], fov * event.scale));
      try {
        this.session.setZoomRatio(zoom);
      } catch (error) {
        Logger.error(TAG, `Set zoom ratio failed: ${error}`);
      }
    }
  }

  public getCurrentZoomRatio(): number | undefined {
    if (!this.cameraIsRunning) {
      return undefined;
    }
    if (this.cameraData.useNativeCamera && this.nativeRecorderObj) {
      return recorder.getNativeCameraZoom(this.nativeRecorderObj);
    }
    try {
      return this.session?.getZoomRatio();
    } catch (error) {
      Logger.error(TAG, `Get zoom ratio failed: ${error}`);
      return undefined;
    }
  }

  release(): Promise<void> {
    if (!this.releaseTask) {
      this.isClosing = true;
      this.releaseTask = this.stopRecording();
    }
    return this.releaseTask;
  }

  private async stopRecording(): Promise<void> {
    // Stop the producer before releasing the NativeImage/encoder, then wait for the MP4 to finish.
    await this.releaseCamera();
    if (this.nativeRecorderObj) {
      const data: Response = await recorder.stopNative(this.nativeRecorderObj);
      if (data.code !== 0) {
        Logger.error(TAG, `Stop recording failed, code: ${data.code}`);
      }
    }
  }

  public startNative(xComponentSurfaceId: string) {
    recorder.startNative(this.nativeRecorderObj, xComponentSurfaceId);
  }

  public UpdateCameraRotation(imageRotation: number) {
    recorder.UpdateCameraRotation(this.nativeRecorderObj, imageRotation);
  }

  public async releaseNative(): Promise<void> {
    await this.release();
    if (this.nativeRecorderObj) {
      recorder.releaseRecorder(this.nativeRecorderObj);
      this.nativeRecorderObj = 0n;
    }
  }

  private displayChangeCallback: Callback<number> = (_: number): void => {
    this.updateImageRotation();
  }
  private callbackFoldStatus: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
    Logger.info(TAG, `arkTsrotation: change fold ${data}`);
    if (data === display.FoldStatus.FOLD_STATUS_EXPANDED ||
      data === display.FoldStatus.FOLD_STATUS_FOLDED) {
      this.releaseCamera();
      this.createRecorder();
    }
  }
}