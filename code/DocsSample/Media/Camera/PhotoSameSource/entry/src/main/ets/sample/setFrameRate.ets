// [Start camera_frameRateImport]
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End camera_frameRateImport]

class PreviewFrameRate {
  // [Start camera_createSession]
  createPhotoSession(cameraManager: camera.CameraManager): camera.Session | undefined {
    let session: camera.Session | undefined = undefined;
    try {
      // 创建Session会话并指定为NORMAL_PHOTO模式。
      session = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create the session instance. error: ${err}`);
    }
    return session;
  }
  // [End camera_createSession]

  // [Start camera_getSupportedFrameRate]
  getSupportedFrameRange(previewOutput: camera.PreviewOutput): camera.FrameRateRange[] {
    // 获取支持的帧率范围，不同的硬件平台可能提供不同的帧率范围。
    return previewOutput.getSupportedFrameRates();
  }
  // [End camera_getSupportedFrameRate]

  // [Start camera_setFrameRate]
  setFrameRate(previewOutput: camera.PreviewOutput, minFps: number, maxFps: number): void {
    try {
      previewOutput.setFrameRate(minFps, maxFps);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to setFrameRate for previewOutput. error: ${err}`);
    }
  }
  // [End camera_setFrameRate]

  // [Start camera_getActiveFrameRate]
  getActiveFrameRange(previewOutput: camera.PreviewOutput): camera.FrameRateRange {
    return previewOutput.getActiveFrameRate();
  }
  // [End camera_getActiveFrameRate]

  // [Start camera_setFrameRateForCompleteProcess]
  async sessionConfig(cameraManager: camera.CameraManager, cameraInput: camera.CameraInput,
    previewOutput: camera.PreviewOutput): Promise<void> {
    try {
      let session: camera.Session | undefined = undefined;
      // 创建CaptureSession实例。
      session = this.createPhotoSession(cameraManager);
      if (session === undefined) {
        return;
      }
      // 开始配置会话。
      session.beginConfig();
      // 把CameraInput加入到会话。
      session.addInput(cameraInput);
      // 把previewOutput加入到会话。
      session.addOutput(previewOutput);
      // 提交配置信息。
      await session.commitConfig();
      // 获取当前支持的帧率范围。
      let supportFrameRateArray: camera.FrameRateRange[] = this.getSupportedFrameRange(previewOutput);

      console.info(`frame rate supported by previewOutput: ${JSON.stringify(supportFrameRateArray)}`);
      // 可在start前对帧率进行设置。
      if (supportFrameRateArray.length !== 0) {
        // 将帧率设置为第一组帧率范围的最大值。
        this.setFrameRate(previewOutput, supportFrameRateArray[0].max, supportFrameRateArray[0].max);
      }
      // 获取当前生效的帧率设置。
      let activeFrameRateArray: camera.FrameRateRange = this.getActiveFrameRange(previewOutput);
      console.info(`current effective frame rate for this previewOutput: ${activeFrameRateArray}`);
      // 开始会话工作并启动预览。
      await session.start();
      // 可在start后对帧率进行设置。
      if (supportFrameRateArray.length !== 0) {
        // 可将帧率设置为最大值的一半（能否设置成功取决于平台是否支持）。
        this.setFrameRate(previewOutput, supportFrameRateArray[0].max / 2, supportFrameRateArray[0].max / 2);
      }
      // 获取当前生效的帧率设置。
      activeFrameRateArray = this.getActiveFrameRange(previewOutput);
      console.info(`current effective frame rate for this previewOutput: ${activeFrameRateArray}`);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`sessionConfig fail : ${err}`);
    }
  }
  // [End camera_setFrameRateForCompleteProcess]
}