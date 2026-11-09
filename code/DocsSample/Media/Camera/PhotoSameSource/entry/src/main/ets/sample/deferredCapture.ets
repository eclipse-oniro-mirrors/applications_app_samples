// [Start camera_deferredCaptureImport]
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
// [End camera_deferredCaptureImport]

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer) {
    if (data === undefined) {
      console.error(`Error occurred when preparing data`);
      return;
    }
    // 应用获取到图片buffer后可自定义处理。
    console.info(`on image data prepared`);
  }
}

class DeferredCapture {
  // [Start camera_getPhotoOutput]
  getPhotoOutput(cameraManager: camera.CameraManager,
    cameraOutputCapability: camera.CameraOutputCapability): camera.PhotoOutput | undefined {
    let photoProfilesArray: camera.Profile[] = cameraOutputCapability.photoProfiles;
    if (photoProfilesArray===null || photoProfilesArray===undefined) {
      console.error(`createOutput photoProfilesArray is null!`);
      return undefined;
    }
    let photoOutput: camera.PhotoOutput | undefined = undefined;
    try {
      if (photoProfilesArray.length > 0) {
        photoOutput = cameraManager.createPhotoOutput(photoProfilesArray[0]);
      } else {
        console.error(`the length of photoProfiles=0!`);
        return undefined;
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to createPhotoOutput. error: ${err}`);
    }
    return photoOutput;
  }
  // [End camera_getPhotoOutput]

  // [Start camera_getPhotoAccessHelper]
  getPhotoAccessHelper(context: Context): photoAccessHelper.PhotoAccessHelper {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
    return phAccessHelper;
  }

  onPhotoOutputPhotoAssetAvailable(photoOutput: camera.PhotoOutput, context: Context): void {
    photoOutput.on('photoAssetAvailable', (err: BusinessError, photoAsset: photoAccessHelper.PhotoAsset) =[] {
      if (err) {
        console.error(`photoAssetAvailable error: ${err}.`);
        return;
      }
      console.info(`photoOutPutCallBack photoAssetAvailable`);
      // 开发者可通过photoAsset调用媒体库相关接口，自定义处理图片。
      // 处理方式一：调用媒体库落盘接口保存一阶段图，二阶段图就绪后媒体库会主动帮应用替换落盘图片。
      this.mediaLibSavePhoto(photoAsset, this.getPhotoAccessHelper(context));
      // 处理方式二：调用媒体库接口请求图片并注册一阶段图或二阶段图buffer回调，自定义使用。
      this.mediaLibRequestBuffer(photoAsset, context);
    });
  }

  async mediaLibSavePhoto(photoAsset: photoAccessHelper.PhotoAsset,
    phAccessHelper: photoAccessHelper.PhotoAccessHelper): Promise<void> {
    try {
      let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
      assetChangeRequest.saveCameraPhoto();
      await phAccessHelper.applyChanges(assetChangeRequest);
      console.info(`apply saveCameraPhoto successfully`);
    } catch (err) {
      console.error(`apply saveCameraPhoto failed with error: ${err.code}, ${err.message}`);
    }
  }

  async mediaLibRequestBuffer(photoAsset: photoAccessHelper.PhotoAsset, context: Context) {
    let requestOptions: photoAccessHelper.RequestOptions = {
      // 按照业务需求配置回图模式。
      // FAST_MODE：仅接收一阶段低质量图回调。
      // HIGH_QUALITY_MODE：仅接收二阶段全质量图回调。
      // BALANCE_MODE：接收一阶段及二阶段图片回调。
      deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
    }
    const handler = new MediaDataHandler();
    await photoAccessHelper.MediaAssetManager.requestImageData(context, photoAsset, requestOptions, handler);
    console.info(`requestImageData successfully`);
  }
  // [End camera_getPhotoAccessHelper]

  // [Start camera_onPhotoOutputCaptureStart]
  onPhotoOutputCaptureStart(photoOutput: camera.PhotoOutput): void {
    photoOutput.on('captureStartWithInfo', (err: BusinessError, captureStartInfo: camera.CaptureStartInfo) => {
      if (err !== undefined && err.code !== 0) {
        return;
      }
      console.info(`photo capture started, captureId : ${captureStartInfo.captureId}`);
    });
  }
  // [End camera_onPhotoOutputCaptureStart]

  // [Start camera_onPhotoOutputCaptureEnd]
  onPhotoOutputCaptureEnd(photoOutput: camera.PhotoOutput): void {
    photoOutput.on('captureEnd', (err: BusinessError, captureEndInfo: camera.CaptureEndInfo) => {
      if (err !== undefined && err.code !== 0) {
        return;
      }
      console.info(`photo capture end, captureId : ${captureEndInfo.captureId}`);
      console.info(`frameCount : ${captureEndInfo.frameCount}`);
    });
  }
  // [End camera_onPhotoOutputCaptureEnd]

  // [Start camera_onPhotoOutputCaptureReady]
  onPhotoOutputCaptureReady(photoOutput: camera.PhotoOutput): void {
    photoOutput.on('captureReady', (err: BusinessError) => {
      if (err !== undefined && err.code !== 0) {
        return;
      }
      console.info(`photo capture ready`);
    });
  }
  // [End camera_onPhotoOutputCaptureReady]

  // [Start camera_onPhotoOutputError]
  onPhotoOutputError(photoOutput: camera.PhotoOutput): void {
    photoOutput.on('error', (error: BusinessError) => {
      console.error(`Photo output error code: ${error.code}`);
    });
  }
  // [End camera_onPhotoOutputError]
}
