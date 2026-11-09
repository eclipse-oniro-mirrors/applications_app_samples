// [Start camera_yuvCapture]
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { dataSharePredicates } from '@kit.ArkData';
import { image } from '@kit.ImageKit';
import { fileIo } from '@kit.CoreFileKit';
// [End camera_yuvCapture]
import { sensor } from '@kit.SensorServiceKit';
import { Decimal } from '@kit.ArkTS';

class YuvCapture {
  public output?: camera.PhotoOutput;
  public context: Context;
  public srcFileUri: string = '';
  private callback: (pixelMap: image.PixelMap, url: string) => void = () => {
  };

  constructor(context: Context) {
    this.context = context;
  }

  setCallback(callback: (pixelMap: image.PixelMap, url: string) => void): void {
    this.callback = callback;
  }

  // [Start camera_getFullOutputCapability]
  getFullOutputCapability(cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice,
    sceneMode: camera.SceneMode): camera.CameraOutputCapability | undefined {
    let cameraOutputCapability = cameraManager.getSupportedFullOutputCapability(cameraDevice, sceneMode);
    if (!cameraOutputCapability) {
      console.error(`cameraManager.getSupportedFullOutputCapability error`);
      return undefined;
    }
    return cameraOutputCapability;
  }
  // [End camera_getFullOutputCapability]

  // [Start camera_getPhotoOutput]
  getPhotoOutput(cameraManager: camera.CameraManager, photoProfile: camera.Profile): camera.PhotoOutput | undefined {
    // 创建拍照输出流。
    let photoOutput: camera.PhotoOutput | undefined = undefined;
    try {
      photoOutput = cameraManager.createPhotoOutput(photoProfile);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to createPhotoOutput. error: ${err}`);
    }
    return photoOutput;
  }
  // [End camera_getPhotoOutput]

  // [Start camera_setPhotoOutputCbSingle]
  setPhotoOutputCbSingle(photoOutput: camera.PhotoOutput, context: Context) {
    // 设置回调之后，调用photoOutput的capture方法，就会将拍照的pixelMap回传到回调中。
    photoOutput.onCapturePhotoAvailable((capturePhoto: camera.CapturePhoto): void => {
      if (capturePhoto === undefined) {
        console.error(`getPhoto failed`);
        return;
      }

      console.info(`photoAvailable success`);
      this.mediaLibSavePhotoSingle(context, capturePhoto.main);
    });
  }

  async mediaLibSavePhotoSingle(context: Context, imageObj: image.Image | image.Picture) {
    let picture: image.Picture = imageObj as image.Picture;
    console.info(`picture getMainPixelmap E`);
    await this.getMainPixelmap(context, picture);
    console.info(`picture getMainPixelmap X`);

    console.info(`picture releasePicture E`);
    await this.releasePicture(picture);
    console.info(`picture releasePicture X`);
  }

  async packToFileFromPixelMap(context : Context, pixelMap : image.PixelMap) {
    const imagePackerApi = image.createImagePacker();
    let packOpts : image.PackingOption = { format: 'image/jpeg', quality: 95 };
    const path : string = context.cacheDir + '/pixel_map.jpg';
    let file = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
    try {
      await imagePackerApi.packToFile(pixelMap, file.fd, packOpts);
      this.srcFileUri = file.path;
    } catch (error) {
      console.error(`Failed to pack the pixelMap to file. And the errorcode: ${error.code} ,error.message: ${error.message}`);
    }
  }

  async saveFile(srcFileUri: string, phAccessHelper: photoAccessHelper.PhotoAccessHelper){
    try {
      // 指定待保存到媒体库的位于应用沙箱的图片uri。
      let srcFileUris: string[] = [
        srcFileUri
      ];
      // 指定待保存照片的创建选项，包括文件后缀和照片类型，标题和照片子类型可选。
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig[] = [
        {
          title: 'test', // 可选。
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT, // 可选。
        }
      ];
      // 基于弹窗授权的方式获取媒体库的目标uri。
      let desFileUris: string[] = await phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
      // 将来源于应用沙箱的照片内容写入媒体库的目标uri。
      let desFile: fileIo.File = await fileIo.open(desFileUris[0], fileIo.OpenMode.WRITE_ONLY);
      let srcFile: fileIo.File = await fileIo.open(srcFileUri, fileIo.OpenMode.READ_ONLY);
      await fileIo.copyFile(srcFile.fd, desFile.fd);
      fileIo.closeSync(srcFile);
      fileIo.closeSync(desFile);
      console.info(`create asset by dialog successfully`);
    } catch (err) {
      console.error(`failed to create asset by dialog successfully errCode is: ${err.code}, ${err.message}`);
    }
  }

  // 获取拍照的主图的pixelMap。
  async getMainPixelmap(context: Context, pictureObj: image.Picture) {
    if (pictureObj != null) {
      let mainPixelmap: image.PixelMap = pictureObj.getMainPixelmap();
      if (mainPixelmap != null) {
        // 编码。
        await this.packToFileFromPixelMap(context, mainPixelmap);
        // 保存。
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        await this.saveFile(this.srcFileUri, phAccessHelper);

        this.callback(mainPixelmap, '');
        mainPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          if (imageInfo != null) {
            console.info(`getMainPixelmap information height:${imageInfo.size.height} width:${imageInfo.size.width} ` +
              `pixelFormat:${imageInfo.pixelFormat} isHdr:${imageInfo.isHdr}`);
          }
        }).catch((error: BusinessError) => {
          console.error(`Failed error.code: ${error.code} ,error.message: ${error.message}`);
        });
      } else {
        console.error(`PictureObj getMainPixelmap is null`);
      }
    } else {
      console.error(`PictureObj is null`);
    }
  }

  // 释放图片资源。
  async releasePicture(pictureObj: image.Picture) {
    if (pictureObj != null) {
      pictureObj.release();
      if (pictureObj.getMainPixelmap() == null) {
        console.info(`PictureObj release Success !`);
      } else {
        console.error(`PictureObj release Failed !`);
      }
    } else {
      console.error(`PictureObj is null`);
    }
  }
  // [End camera_setPhotoOutputCbSingle]

  // [Start camera_mediaLibSavePhoto]
  // 保存图片。
  async mediaLibSavePhoto(photoAsset: photoAccessHelper.PhotoAsset,
    phAccessHelper: photoAccessHelper.PhotoAccessHelper): Promise<void> {
    try {
      let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
        new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
      console.info(`saveCameraPhoto E`);
      await assetChangeRequest.saveCameraPhoto(photoAccessHelper.ImageFileType.JPEG);
      await phAccessHelper.applyChanges(assetChangeRequest);
      console.info(`saveCameraPhoto X`);
      await phAccessHelper.release();
    } catch (error) {
      console.error(`apply saveCameraPhoto failed with error: ${error.code}, ${error.message}`);
    }
  }

  async mediaLibRequestBuffer(photoAsset: photoAccessHelper.PhotoAsset, context: Context,
    callback: (pixelMap: image.PixelMap, url: string) => void) {
    // 获取图片pixelmap信息。
    try {
      console.info(`quickRequestImage E`);

      class MediaDataHandler implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
        onDataPrepared(data: image.Picture, imageSource: image.ImageSource, map: Map<string, string>) {
          if (data != undefined) {
            console.info(`On photoAssetAvailable callback data is not undefined`);
            let pixelMap: image.PixelMap = data.getMainPixelmap();
            callback(pixelMap, photoAsset.uri);
          } else if (data === undefined && imageSource != undefined) {
            console.info(`On photoAssetAvailable callback data is undefined, and imageSource is not undefined`);
            imageSource.createPixelMap().then((pixelMap: image.PixelMap) => {
              callback(pixelMap, photoAsset.uri);
            }).catch((error: BusinessError) => {
              console.error(`On photoAssetAvailable callback createPixelMap failed, error: ${error.message}`);
            })
          } else {
            console.error(`On photoAssetAvailable callback data and imageSource are both undefined`);
            return;
          }
        }
      }
      // 创建数据共享谓词。
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      // 配置媒体资产检索条件。
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      // 配置请求策略为平衡模式。
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      }

      const handler = new MediaDataHandler();
      await photoAccessHelper.MediaAssetManager.quickRequestImage(context, photoAsset, requestOptions, handler);
    } catch (error) {
      console.error(`mediaLibRequestBuffer failed with error: ${error.code}, ${error.message}`);
    }
  }


  public setPhotoOutputCbDouble(cameraPhotoOutput: camera.PhotoOutput) {
    console.info(`setPhotoOutputCbDouble ...`);
    cameraPhotoOutput.on('photoAssetAvailable',
      async (_err: BusinessError, photoAsset: photoAccessHelper.PhotoAsset): Promise<void> => {
        try {
          console.info(`on photoAssetAvailable callback uri:${photoAsset.uri}`);
          let accessHelper: photoAccessHelper.PhotoAccessHelper =
            photoAccessHelper.getPhotoAccessHelper(this.context);
          await this.mediaLibSavePhoto(photoAsset, accessHelper);
          await this.mediaLibRequestBuffer(photoAsset, this.context, this.callback);
        } catch (_err) {
          console.error(`photoAssetAvailable err:${_err.code}`);
        }
      });
  }
  // [End camera_mediaLibSavePhoto]

  // [Start camera_setPhotoOutputCallback]
  // 根据单拍/双拍模式设置拍照回调。
  setPhotoOutputCallback(isSingle: boolean): void {
    if (this.output === undefined) {
      console.error(`photoOutput is undefined`);
      return;
    }
    this.output.offCapturePhotoAvailable();
    this.output.off('photoAssetAvailable');
    if (isSingle) {
      this.setPhotoOutputCbSingle(this.output, this.context);
    } else {
      this.setPhotoOutputCbDouble(this.output);
    }
  }
  // [End camera_setPhotoOutputCallback]

  // [Start camera_getPhotoRotation]
  getPhotoRotation(photoOutput: camera.PhotoOutput, deviceDegree: number): camera.ImageRotation {
    let photoRotation: camera.ImageRotation = camera.ImageRotation.ROTATION_0;
    try {
      photoRotation = photoOutput.getPhotoRotation(deviceDegree);
    } catch (error) {
      let err = error as BusinessError;
      console.error(`The photoOutput.getPhotoRotation call failed. error code: ${err.code}`);
    }
    return photoRotation;
  }
  // [End camera_getPhotoRotation]

  // [Start camera_capture]
  public async capture(isFront: boolean) {
    console.info(`capture start.`);
    const degree = await this.getPhotoDegree();
    let rotation = this.getPhotoRotation(this.output!, degree);
    rotation = camera.ImageRotation.ROTATION_0;
    console.info(`rotation: ${rotation}.`);
    let settings: camera.PhotoCaptureSetting = {
      quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,  // 设置图片质量。
      rotation,  // 设置图片旋转角度。
      mirror: isFront  // 设置镜像使能开关。
    };
    this.output?.capture(settings, (err: BusinessError) => {
      if (err) {
        console.error(`Failed to capture the photo. error: ${JSON.stringify(err)}`);
        return;
      }
      console.info(`Callback invoked to indicate the photo capture request success.`);
    });
  }
  // [End camera_capture]

  // [Start camera_getPhotoDegree]
  // 设备接近垂直放置（垂直于地面）时无需旋转。
  private calculateDeviceDegree(x: number, y: number, z: number): number {
    let deviceDegree: number = 0;
    if ((x * x + y * y) * 3 < z * z) {
      return deviceDegree;
    } else {
      // 计算反正切值。
      let sd: Decimal = Decimal.atan2(y, -x);
      // 将弧度值转换为角度值。
      let sc: Decimal = Decimal.round(Number(sd) / Math.PI * 180);
      // 将角度调整为相对垂直方向的角度。
      deviceDegree = 90 - Number(sc);
      // 将角度归一化到 0-360 度。
      deviceDegree = deviceDegree >= 0 ? deviceDegree % 360 : deviceDegree % 360 + 360;
    }
    return deviceDegree;
  }

  private getPhotoDegree(): Promise<number> {
    const promise: Promise<number> = new Promise(resolve => {
      sensor.once(sensor.SensorId.ACCELEROMETER, (data: sensor.AccelerometerResponse) => {
        let degree = this.calculateDeviceDegree(data.x, data.y, data.z);
        resolve(degree);
      });
    });
    return promise;
  }
  // [End camera_getPhotoDegree]

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

  // [Start camera_captureReadyCallback]
  captureReadyCallback(err: BusinessError): void {
    if (err !== undefined && err.code !== 0) {
      console.error(`Callback Error, errorCode: ${err.code}`);
      return;
    }
    console.info(`photo capture ready`);
  }

  registerPhotoOutputCaptureReady(photoOutput: camera.PhotoOutput): void {
    console.info(`register PhotoOutput Capture Ready...`);
    photoOutput.on('captureReady', this.captureReadyCallback);
  }

  unregisterPhotoOutputCaptureReady(photoOutput: camera.PhotoOutput): void {
    console.info(`unregister PhotoOutput Capture Ready...`);
    photoOutput.off('captureReady');
  }
  // [End camera_captureReadyCallback]

  // [Start camera_onPhotoOutputError]
  onPhotoOutputError(photoOutput: camera.PhotoOutput): void {
    photoOutput.on('error', (error: BusinessError) => {
      console.error(`Photo output error code: ${error.code}`);
    });
  }
  // [End camera_onPhotoOutputError]

  // [Start camera_release]
  async release(): Promise<void> {
    if (this.output === undefined) {
      return;
    }
    this.output.offCapturePhotoAvailable();
    this.output.off('photoAssetAvailable');
    this.output.off('captureReady');
    await this.output.release();
    this.output = undefined;
  }
  // [End camera_release]
}
