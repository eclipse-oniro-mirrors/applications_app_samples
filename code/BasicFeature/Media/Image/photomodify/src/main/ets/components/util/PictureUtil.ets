/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file src/main/ets/components/util/PictureUtil.ets
 * 文件职责：PictureUtil 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import image from '@ohos.multimedia.image'
import fileIo from '@ohos.file.fs';
import { logger } from './Logger';
import { ImageTest } from '../util/FileUtil';
import fs from '@ohos.file.fs';

// const 语句
const TAG: string = '[Sample_Picture]';
// let 语句
let test = new ImageTest();

// let 语句
let options: image.DecodingOptionsForPicture = {
  // 字段 desiredAuxiliaryPictures：声明并维护该成员的状态
  desiredAuxiliaryPictures: []
};
// let 语句
let packOpts: image.PackingOption = {
  // 字段 format：声明并维护该成员的状态
  format: 'image/jpeg',
  // 字段 quality：声明并维护该成员的状态
  quality: 98
};
// let 语句
let pictureObj: image.Picture | null = null;
// let 语句
let pixelsBuffer: ArrayBuffer | null = null;
// let 语句
let imagePacker: image.ImagePacker | null = null;
// let 语句
let pixelMap: image.PixelMap | null = null;
// let 语句
let auxPictureObj: image.AuxiliaryPicture | null = null;

export async function DecodingPicture(uri: string, auxType: image.AuxiliaryPictureType): Promise<PixelMap | null> {
  // let 语句
  let context = getContext();

  // let 语句
  let resourceMgr = context.resourceManager;

  // let 语句
  let rawFile = await resourceMgr.getRawFileContent(uri);

  // let 语句
  let isSupportHEIFDecode: Boolean = image.createImageSource(rawFile.buffer as ArrayBuffer)
    .supportedFormats
    .includes('image/heif');

  // if 语句
  if (!isSupportHEIFDecode) {
    logger.info(TAG, `device is not support heif decode`);
    // 字段 rawFile：声明并维护该成员的状态
    rawFile = await resourceMgr.getRawFileContent('HdrVivid.jpg');
  }

  // let 语句
  let imageSourceApi: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer);

  // if 语句
  if (!imageSourceApi) {
    // return 语句
    return null;
  }

  // 字段 pictureObj：声明并维护该成员的状态
  pictureObj = await imageSourceApi.createPicture(options);

  // 字段 auxPictureObj：声明并维护该成员的状态
  auxPictureObj = pictureObj.getAuxiliaryPicture(auxType);

  // if 语句
  if (auxPictureObj != null) {
    // 字段 pixelsBuffer：声明并维护该成员的状态
    pixelsBuffer = await auxPictureObj.readPixelsToBuffer();
    // let 语句
    let opts: image.InitializationOptions = {
      // 字段 size：声明并维护该成员的状态
      size: auxPictureObj.getAuxiliaryPictureInfo().size,
    }
    // 字段 pixelMap：声明并维护该成员的状态
    pixelMap = image.createPixelMapSync(pixelsBuffer, opts);
  } else {
    // return 语句
    return null;
  }

  // if 语句
  if (!pixelMap) {
    // return 语句
    return null;
  }

  // return 语句
  return pixelMap;
}

export async function EncodingPicture(pushStatus: number, uri: string, outState: number): Promise<PixelMap | null> {
  // const 语句
  const context = getContext();

  // const 语句
  const resourceMgr = context.resourceManager;

  // const 语句
  const rawFile = await resourceMgr.getRawFileContent(uri);

  // createImageSource
  let imageSourceApi: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer);

  // if 语句
  if (!imageSourceApi) {
    // return 语句
    return null;
  }

  // createImagePacker
  imagePacker = image.createImagePacker();

  // packingToFile Save
  const filePath: string = context.filesDir + '/packing.jpg';

  // let 语句
  let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);

  // encode options
  if (!pushStatus) { // source
    if (outState) { // file
      await imagePacker.packToFile(imageSourceApi, file.fd, packOpts);
      // let 语句
      let imageSource = image.createImageSource(filePath);
      // 字段 pixelMap：声明并维护该成员的状态
      pixelMap = await imageSource.createPixelMap();
      logger.info(TAG, `writePictureSource filePath is`, JSON.stringify(filePath));
    } else { // buffer
      pixelsBuffer = await imagePacker.packing(imageSourceApi, packOpts);
      // let 语句
      let source: image.ImageSource = image.createImageSource(pixelsBuffer);
      // 字段 pixelMap：声明并维护该成员的状态
      pixelMap = await source.createPixelMap();
    }
  } else { // obj
    pictureObj = await imageSourceApi.createPicture(options);
    // if 语句
    if (outState) { // file
      await imagePacker.packToFile(pictureObj, file.fd, packOpts);
      logger.info(TAG, `writePictureSource filePath is`, JSON.stringify(filePath));
      // let 语句
      let imageSource = image.createImageSource(filePath);
      // 字段 pixelMap：声明并维护该成员的状态
      pixelMap = await imageSource.createPixelMap();
    } else { // buffer
      pixelsBuffer = await imagePacker.packing(pictureObj, packOpts);
      // let 语句
      let source: image.ImageSource = image.createImageSource(pixelsBuffer);
      // 字段 pixelMap：声明并维护该成员的状态
      pixelMap = await source.createPixelMap();
    }
  }

  // if 语句
  if (!pixelMap) {
    // return 语句
    return null;
  }

  // return 语句
  return pixelMap;
}

/**
 * 判断Native多图对象编码类型
 * @param decodingType 解码类型(1:Gain map)
 * @returns
 */
export async function checkEncodingType(fileName: string,
                                        // 字段 encodingObject：声明并维护该成员的状态
                                        encodingObject: string, encodingResult: string): Promise<string> {
  // let 语句
  let context = getContext();

  // let 语句
  let packingFileName: string = '';

  // switch 语句
  switch (encodingObject) {
    // 分支：case 'imageSource'
    case 'imageSource':
      switch (encodingResult) {
        // 分支：case 'data': {
        case 'data': {
          // 字段 packingFileName：声明并维护该成员的状态
          packingFileName = await test.packToDataImageSource(context);
          // if 语句
          if (packingFileName != 'packing fail') {
            // return 语句
            return packingFileName;
          }
          // return 语句
          return 'Illegal input';
        }
        // 分支：case 'file': {
        case 'file': {
          // let 语句
          let sourcePath: string = context.filesDir + '/' + fileName;
          // let 语句
          let file: fileIo.File = fs.openSync(sourcePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          // 字段 packingFileName：声明并维护该成员的状态
          packingFileName = test.packToFileImageSource(context, file);
          // if 语句
          if (packingFileName != 'packing fail') {
            // return 语句
            return packingFileName;
          }
          // return 语句
          return 'Illegal input';
        }
      }
    // 分支：case 'picture'
    case 'picture':
      switch (encodingResult) {
        // 分支：case 'data': {
        case 'data': {
          // 字段 packingFileName：声明并维护该成员的状态
          packingFileName = 'packPictureToData.jpg';
          // await 语句
          await test.packToDataFromPicture(packingFileName);
          // return 语句
          return packingFileName;
        }
        // 分支：case 'file': {
        case 'file': {
          // 字段 packingFileName：声明并维护该成员的状态
          packingFileName = 'packPictureToFile.jpg';
          // await 语句
          await test.packToFileFromPicture(packingFileName);
          return packingFileName;
        }
      }
    default:
      return 'Illegal input';
  }
}

export async function showAuxiliaryPicture(uri: string, auxType: image.AuxiliaryPictureType): Promise<PixelMap | null> {
  let imageSourceApi: image.ImageSource = image.createImageSource(uri);
  if (!imageSourceApi) {
    return null;
  }
  pictureObj = await imageSourceApi.createPicture(options);
  auxPictureObj = pictureObj.getAuxiliaryPicture(auxType);
  if (auxPictureObj != null) {
    pixelsBuffer = await auxPictureObj.readPixelsToBuffer();
    let opts: image.InitializationOptions = {
      size: auxPictureObj.getAuxiliaryPictureInfo().size,
    }
    pixelMap = image.createPixelMapSync(pixelsBuffer, opts);
  } else {
    return null;
  }
  if (!pixelMap) {
    return null;
  }
  return pixelMap;
}

export async function NDKPictureDecoding(uri: string, auxType: image.AuxiliaryPictureType): Promise<PixelMap | null> {
  const context = getContext();
  const resourceMgr = context.resourceManager;
  const rawFile = await resourceMgr.getRawFileContent(uri);
  let isSupportHEIFDecode: Boolean =
    image.createImageSource(rawFile.buffer as ArrayBuffer).supportedFormats.includes('image/heif');
  console.log('isSupportHEIFDecode is : ' + isSupportHEIFDecode);
  if (!isSupportHEIFDecode) {
    logger.info(TAG, `device is not support heif decode`);
    uri = 'HdrVivid.jpg';
  }
  console.log('uri is : ' + uri);
  let filePath = await test.writeFileToBox(uri);
  test.createDecodingOptions();
  test.decodingOptionPictSetAux();
  test.decodingOptionPictGetAux();
  await test.createPictureByImageSource(filePath);
  pixelMap = await DecodingPicture(uri, auxType);
  return pixelMap
}

export async function NDKPictureEncoding(fileName: string, obj: string, result: string): Promise<PixelMap | null> {
  let filePath = await test.writeFileToBox(fileName);
  test.createDecodingOptions();
  test.decodingOptionPictSetAux();
  test.decodingOptionPictGetAux();
  test.createPictureByImageSource(filePath);
  let packName = await checkEncodingType(fileName, obj, result);
  if (packName != 'Illegal input') {
    pixelMap = await test.showPhoto(packName);
  } else if (!pixelMap) {
    return null;
  }
  return pixelMap;
}