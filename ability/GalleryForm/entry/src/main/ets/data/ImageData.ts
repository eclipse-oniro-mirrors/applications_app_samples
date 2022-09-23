/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import Logger from './Logger'

const TAG: string = 'ImageData'

export class ImageData {
  async getAllImage(context:any) {
    let media = mediaLibrary.getMediaLibrary(context)
    let fileKey = mediaLibrary.FileKey
    let mediaFetchOptions = {
      selections: `${fileKey.MEDIA_TYPE}=?`,
      selectionArgs: [mediaLibrary.MediaType.IMAGE.toString()],
    }
    let fetchFileResult = await media.getFileAssets(mediaFetchOptions)
    Logger.info(TAG, `getAllImg getFileAssetsFromType fetchFileResult.count = ${fetchFileResult.getCount()}`)
    let fileAssets = await fetchFileResult.getAllObject()
    Logger.info(TAG, `getAllImg result = ${JSON.stringify(fileAssets)}`)
    for (let index = 0; index < fileAssets.length; index++) {
      Logger.info(TAG, `fileAssets ${index} uri = ${fileAssets[index].uri}`)
    }
    await media.release()
    return fileAssets
  }
}

export default new ImageData()