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

import { common } from '@kit.AbilityKit';
import { fileIo, fileUri, picker } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { LocalizedText } from '../common/LocalizedText';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { TranscodeFileCloser } from './TranscodeFileCloser';

export interface TranscodeExportResult { path: string; state: string; detail: string; }

@Observed
export class TranscodeExportController {
  public results: TranscodeExportResult[] = [];

  async save(context: common.Context, paths: string[], gallery: boolean): Promise<void> {
    this.results = [];
    if (paths.length === 0) { return; }
    if (MediaFileActivity.isCleanupUnconfirmed()) {
      throw new Error(LocalizedText.get($r('app.string.transcode_close_unconfirmed')));
    }
    let helper: photoAccessHelper.PhotoAccessHelper | undefined = undefined;
    try {
      const names: string[] = paths.map((path: string): string => path.substring(path.lastIndexOf('/') + 1));
      let destinations: string[] = [];
      if (gallery) {
        helper = photoAccessHelper.getPhotoAccessHelper(context);
        const configs: photoAccessHelper.PhotoCreationConfig[] = names.map((name: string):
          photoAccessHelper.PhotoCreationConfig => ({
            title: name.substring(0, name.length - 4), fileNameExtension: 'mp4',
            photoType: photoAccessHelper.PhotoType.VIDEO
          }));
        destinations = await helper.showAssetsCreationDialog(
          paths.map((path: string): string => fileUri.getUriFromPath(path)), configs);
      } else {
        destinations = await new picker.DocumentViewPicker(context).save({ newFileNames: names });
      }
      for (let index: number = 0; index < paths.length; index++) {
        if (MediaFileActivity.isCleanupUnconfirmed()) {
          this.results = this.results.concat([{
            path: paths[index],
            state: 'not_attempted',
            detail: LocalizedText.get($r('app.string.transcode_close_unconfirmed'))
          }]);
        } else if (destinations[index] === undefined) {
          this.results = this.results.concat([{ path: paths[index], state: 'cancelled', detail: '' }]);
        } else {
          const result: TranscodeExportResult = await this.copy(paths[index], destinations[index]);
          this.results = this.results.concat([result]);
        }
      }
    } finally {
      if (helper !== undefined) { await helper.release().catch((): void => {}); }
    }
  }

  private async copy(path: string, destination: string): Promise<TranscodeExportResult> {
    let target: fileIo.File | undefined = undefined;
    let failure: string | undefined = undefined;
    let closed: boolean = true;
    try {
      target = await fileIo.open(destination, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
      await fileIo.copyFile(path, target.fd);
    } catch (error) {
      failure = (error as Error).message || JSON.stringify(error);
    } finally {
      closed = await TranscodeFileCloser.close(target);
    }
    if (!closed) {
      const cleanup: string = LocalizedText.get($r('app.string.transcode_close_unconfirmed'));
      const detail: string = failure === undefined ? cleanup : failure + ' · ' + cleanup;
      return { path: path, state: 'close_unconfirmed', detail: detail };
    }
    return failure === undefined ? { path: path, state: 'saved', detail: '' } :
      { path: path, state: 'failed', detail: failure };
  }
}
