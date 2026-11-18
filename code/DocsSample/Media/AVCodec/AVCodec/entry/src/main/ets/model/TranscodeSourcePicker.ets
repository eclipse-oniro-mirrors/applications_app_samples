/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { UIContext } from '@kit.ArkUI';
import { picker } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

export class TranscodeSourcePicker {
  static async select(ui: UIContext, fromGallery: boolean): Promise<string> {
    const selection: string[] = await TranscodeSourcePicker.selectMany(ui, fromGallery, 1);
    return selection[0] ?? '';
  }

  static async selectMany(ui: UIContext, fromGallery: boolean, limit: number): Promise<string[]> {
    const context = ui.getHostContext();
    if (context === undefined || limit <= 0) { return []; }
    if (fromGallery) {
      const selection: photoAccessHelper.PhotoSelectResult = await new photoAccessHelper.PhotoViewPicker().select({
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE, maxSelectNumber: Math.min(30, limit)
      });
      return selection.photoUris;
    }
    const selection: string[] = await new picker.DocumentViewPicker(context).select({
      maxSelectNumber: Math.min(30, limit), fileSuffixFilters: ['Video|.mp4,.mkv,.mov,.webm,.ts,.3gp']
    });
    return selection;
  }
}
