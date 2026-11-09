// [Start camera_preConfigImport]
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
// [End camera_preConfigImport]

class Preconfig {
  // [Start camera_createCameraOutput]
  createCameraOutput(context: common.BaseContext, surfaceId: string) : void {
    // 创建预览输出流。
    let previewOutput: camera.PreviewOutput | undefined = undefined;
    let cameraManager = camera.getCameraManager(context);
    try {
      previewOutput = cameraManager.createPreviewOutput(surfaceId);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create the PreviewOutput instance. error code: ${err.code}`);
    }
    if (previewOutput === undefined) {
      return;
    }

    // 创建拍照输出流。
    let photoOutput: camera.PhotoOutput | undefined = undefined;
    try {
      photoOutput = cameraManager.createPhotoOutput();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to createPhotoOutput errorCode = ${err.code}`);
    }
    if (photoOutput === undefined) {
      return;
    }
  }
  // [End camera_createCameraOutput]

  // [Start camera_createAndOpenCameraInput]
  async createAndOpenCameraInput(cameraManager: camera.CameraManager) : Promise<void> {
    // 获取相机列表。
    let cameraArray: camera.CameraDevice[] = cameraManager.getSupportedCameras();
    if (cameraArray.length <= 0) {
      console.error(`cameraManager.getSupportedCameras error`);
      return;
    }
    let cameraInput: camera.CameraInput | undefined = undefined;
    try {
      cameraInput = cameraManager.createCameraInput(cameraArray[0]);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to createCameraInput errorCode = ${err.code}`);
    }
    if (cameraInput === undefined) {
      return;
    }
    // 打开相机。
    await cameraInput.open();
  }
  // [End camera_createAndOpenCameraInput]

  // [Start camera_createCameraSession]
  createCameraSession(cameraManager: camera.CameraManager) : void {
    // 创建会话。
    let photoSession: camera.PhotoSession | undefined = undefined;
    try {
      photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to create the session instance. errorCode = ${err.code}`);
    }
    if (photoSession === undefined) {
      return;
    }
  }
  // [End camera_createCameraSession]

  // [Start camera_getPreconfig]
  getPreconfig(photoSession: camera.PhotoSession) : void {
    // 查询Preconfig能力。
    try {
      let isPreconfigSupport = photoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P);
      if (!isPreconfigSupport) {
        console.error(`PhotoSession canPreconfig check fail.`);
        return;
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to call canPreconfig. errorCode = ${err.code}`);
      return;
    }

    // 配置Preconfig。
    try {
      photoSession.preconfig(camera.PreconfigType.PRECONFIG_1080P);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to call preconfig. errorCode = ${err.code}`);
      return;
    }
  }
  // [End camera_getPreconfig]

  // [Start camera_initCamera]
  async initCamera(photoSession: camera.PhotoSession, cameraInput: camera.CameraInput,
    previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) : Promise<void> {
    // 开始配置会话。
    try {
      photoSession.beginConfig();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to beginConfig. errorCode = ${err.code}`);
    }

    // 向会话中添加相机输入流。
    try {
      photoSession.addInput(cameraInput);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to addInput. errorCode = ${err.code}`);
    }

    // 向会话中添加预览输出流。
    try {
      photoSession.addOutput(previewOutput);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to addOutput(previewOutput). errorCode = ${err.code}`);
    }

    // 向会话中添加拍照输出流。
    try {
      photoSession.addOutput(photoOutput);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to addOutput(photoOutput). errorCode = ${err.code}`);
    }
    // 提交会话配置。
    await photoSession.commitConfig();
  }
  // [End camera_initCamera]

  // [Start camera_startCamera]
  async startCamera(photoSession: camera.PhotoSession) : Promise<void> {
    // 启动会话。
    await photoSession.start().then(() => {
      console.info(`Promise returned to indicate the session start success.`);
    });
  }
  // [End camera_startCamera]
}
