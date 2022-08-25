/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import fileio from '@ohos.fileio'
import multimedia_image from '@ohos.multimedia.image'
import multimedia_mediaLibrary from '@ohos.multimedia.mediaLibrary'
import Logger from '../model/Logger'

const TAG: string = '[ImageModel]'

export class ImageModel {
  async getImageFd(context: any, uri: string) {
    Logger.info(TAG, `getImageFd uri = ${uri}`)
    let media = multimedia_mediaLibrary.getMediaLibrary(context)
    let fetchOp = {
      selections: '',
      selectionArgs: [],
      uri: uri
    }
    let fetchFileResult = await media.getFileAssets(fetchOp)
    Logger.info(TAG, `getImageFd fetchFileResult.getCount() = ${fetchFileResult.getCount()}`)
    let fileAsset = await fetchFileResult.getFirstObject()
    Logger.info(TAG, `getImageFd fileAsset.uri = ${fileAsset.uri}`)
    await media.release()
    return await fileAsset.open('r')
  }

  async getImageInfo(context: any, uri: string) {
    let fd = await this.getImageFd(context, uri)
    Logger.info(TAG, `getImageInfo fd = ${fd}`)
    let imageSource = multimedia_image.createImageSource(fd)
    Logger.info(TAG, `getImageInfo createImageSource success! ${JSON.stringify(imageSource)}`)
    let imageInfo = await imageSource.getImageInfo()
    Logger.info(TAG, `getImageInfo getImageInfo width ${imageInfo.size.width}`)
    Logger.info(TAG, `getImageInfo getImageInfo height ${imageInfo.size.height}`)
    await imageSource.release()
    Logger.info(TAG, `getImageInfo imageSource release success!`)
    let result = [imageInfo.size.height, imageInfo.size.width]
    return result
  }

  async queryFile(context: any, uri: string) {
    let media = multimedia_mediaLibrary.getMediaLibrary(context)
    let fetchOp = {
      selections: '',
      selectionArgs: [],
      uri: uri
    }
    let fetchFileResult = await media.getFileAssets(fetchOp)
    Logger.info(TAG, `queryFile fetchFileResult.getCount() = ${fetchFileResult.getCount()}`)
    return await fetchFileResult.getFirstObject()
  }

  async getAllImg(context: any) {
    let media = multimedia_mediaLibrary.getMediaLibrary(context)
    let fileKeyObj = multimedia_mediaLibrary.FileKey
    let fetchOp = {
      selections: fileKeyObj.MEDIA_TYPE + '=?',
      selectionArgs: [multimedia_mediaLibrary.MediaType.IMAGE.toString()],
    }
    let fetchFileResult = await media.getFileAssets(fetchOp)
    Logger.info(TAG, `getAllImg getFileAssetsFromType fetchFileResult.count = ${fetchFileResult.getCount()}`)
    let fileAssets = await fetchFileResult.getAllObject()
    Logger.info(TAG, `getAllImg result = ${JSON.stringify(fileAssets)}`)
    for (let index = 0; index < fileAssets.length; index++) {
      Logger.info(TAG, `fileAssets ${index} uri = ${fileAssets[index].uri}`)
    }
    await media.release()
    return fileAssets
  }

  async getPixel(context: any, uri: string) {
    let fd = await this.getImageFd(context, uri)
    Logger.info(TAG, `getPixel fd = ${fd}`)
    let imageSource = multimedia_image.createImageSource(fd)
    Logger.info(TAG, `getPixel createImageSource ${JSON.stringify(imageSource)}`)
    let fileAsset = await this.queryFile(context, uri)
    Logger.info(TAG, `getPixel width = ${fileAsset.width} height = ${fileAsset.height} uri = ${fileAsset.uri}`)
    return await imageSource.createPixelMap()
  }

  async angleImgs(context: any, uri: string, single: number) {
    let imagePackerApi = multimedia_image.createImagePacker()
    let media = multimedia_mediaLibrary.getMediaLibrary(context)
    let fd = await this.getImageFd(context, uri)
    Logger.info(TAG, `angleImg fd = ${fd}`)
    let fileAsset = await this.queryFile(context, uri)
    let imageSource = multimedia_image.createImageSource(fd)
    Logger.info(TAG, `angleImg createImageSource ${JSON.stringify(imageSource)} width = ${fileAsset.width} height = ${fileAsset.height}`)
    let decodingOptions: multimedia_image.DecodingOptions = { rotate: single }
    let pixel = await imageSource.createPixelMap(decodingOptions)
    Logger.info(TAG, `angleImg pixel = ${JSON.stringify(pixel)}`)
    let packOpts: multimedia_image.PackingOption = { format: 'image/jpeg', quality: 100 }
    let imgData = await imagePackerApi.packing(pixel, packOpts)
    Logger.info(TAG, `angleImg imgData = ${JSON.stringify(imgData)}`)
    let path = await media.getPublicDirectory(multimedia_mediaLibrary.DirectoryType.DIR_IMAGE)
    Logger.info(TAG, `angleImg path = ${path}`)
    let time: number = new Date().getTime()
    Logger.info(TAG, `angleImg data = ${time}`)
    let dataUri = await media.createAsset(multimedia_mediaLibrary.MediaType.IMAGE, `Image_${time}.jpg`, path)
    Logger.info(TAG, `angleImg dataUri = ${dataUri.uri}`)
    let imgFileAsset = await this.queryFile(context, dataUri.uri)
    Logger.info(TAG, `angleImg imgFileAsset.uri = ${imgFileAsset.uri}`)
    let imgFd = await imgFileAsset.open('Rw')
    Logger.info(TAG, `angleImg imgFd = ${imgFd}`)
    await fileio.write(imgFd, imgData)
    await fileio.close(imgFd)
    await fileAsset.close(imgFd)
    Logger.info(TAG, `angleImg create file success`)
    imagePackerApi.release()
    await media.release()
  }
}