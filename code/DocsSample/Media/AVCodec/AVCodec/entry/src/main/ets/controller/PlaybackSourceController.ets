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
import { common } from '@kit.AbilityKit';
import { picker } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { PlaybackHistoryEntry, PlaybackHistoryModel, getPlaybackTitle } from '../model/PlaybackHistoryModel';
import { PlaybackQueueController } from './PlaybackQueueController';
import { LocalizedText } from '../common/LocalizedText';
import Logger from '../common/utils/Logger';
import { getPickerSelectedIndex } from '../common/utils/MediaUtils';
import { PlaybackUriAccessController } from './PlaybackUriAccessController';

const TAG: string = 'PlaybackSourceController';
const PICKER_LAYOUT_SETTLE_DELAY_MS: number = 100;

export interface PlaybackSourceCallbacks {
  activatePlayer: () => void;
  play: (positionUs?: number) => void;
  stop: () => void;
  isButtonEnabled: () => boolean;
  isStopping: () => boolean;
  isPageActive: () => boolean;
  setPath: (path: string | null) => void;
  getPath: () => string | null;
  setRecentEntries: (entries: PlaybackHistoryEntry[]) => void;
  setQueueEntries: (entries: string[]) => void;
  closeQueue: () => void;
  showNoMediaSelected: () => void;
}

export class PlaybackSourceController {
  private ui: () => UIContext;
  private queue: PlaybackQueueController;
  private history: PlaybackHistoryModel;
  private callbacks: PlaybackSourceCallbacks;
  private selectionTimer: number = 0;
  private sourceLabels: string[] = [
    LocalizedText.get($r('app.string.select_from_filemanager')),
    LocalizedText.get($r('app.string.select_from_album'))
  ];

  constructor(ui: () => UIContext, queue: PlaybackQueueController,
    history: PlaybackHistoryModel, callbacks: PlaybackSourceCallbacks) {
    this.ui = ui;
    this.queue = queue;
    this.history = history;
    this.callbacks = callbacks;
  }

  clearSelectionTimer(): void {
    if (this.selectionTimer !== 0) {
      clearTimeout(this.selectionTimer);
      this.selectionTimer = 0;
    }
  }

  async loadHistory(): Promise<void> {
    try {
      const context = this.ui().getHostContext();
      if (context === undefined) {
        return;
      }
      await this.history.load(context as common.UIAbilityContext);
      this.callbacks.setRecentEntries(this.history.getEntries());
    } catch (error) {
      Logger.error(TAG, 'Load playback history failed: ' + JSON.stringify(error));
    }
  }

  async persistProgress(positionUs: number, durationUs: number, force: boolean,
    lastPositionUs: number): Promise<number> {
    const path = this.callbacks.getPath();
    if (path === null || durationUs <= 0 || positionUs < 0) {
      return lastPositionUs;
    }
    if (!force && lastPositionUs >= 0 && Math.abs(positionUs - lastPositionUs) < 2000000) {
      return lastPositionUs;
    }
    await this.history.update(path, getPlaybackTitle(path), positionUs, durationUs);
    this.callbacks.setRecentEntries(this.history.getEntries());
    return positionUs;
  }

  playRecording(uri: string): void {
    if (uri.length === 0) {
      return;
    }
    this.callbacks.activatePlayer();
    this.callbacks.setPath(uri);
    this.queue.paths = [uri];
    this.queue.index = 0;
    this.callbacks.setQueueEntries(this.queue.paths.slice());
    this.scheduleSelectedPath(uri);
  }

  enqueue(path: string): void {
    if (path.length === 0) {
      return;
    }
    this.queue.append(path);
    this.callbacks.setQueueEntries(this.queue.paths.slice());
  }

  clearQueue(): void {
    this.queue.paths = [];
    this.queue.index = -1;
    this.queue.pendingIndex = -1;
    this.callbacks.setQueueEntries([]);
  }

  playQueueEntry(index: number): void {
    if (index < 0 || index >= this.queue.paths.length) {
      return;
    }
    const path: string = this.queue.paths[index];
    if (path.length === 0) {
      return;
    }
    this.callbacks.activatePlayer();
    this.callbacks.closeQueue();
    if (index === this.queue.index && !this.callbacks.isButtonEnabled()) {
      return;
    }
    if (this.callbacks.isButtonEnabled()) {
      this.queue.index = index;
      this.callbacks.setPath(path);
      this.callbacks.setQueueEntries(this.queue.paths.slice());
      this.callbacks.play(0);
      return;
    }
    if (this.callbacks.isStopping()) {
      return;
    }
    this.queue.pendingIndex = index;
    this.callbacks.stop();
  }

  playRecentEntry(entry: PlaybackHistoryEntry): void {
    this.callbacks.activatePlayer();
    this.callbacks.closeQueue();
    this.callbacks.setPath(entry.uri);
    this.queue.paths = [entry.uri];
    this.queue.index = 0;
    this.callbacks.setQueueEntries(this.queue.paths.slice());
    this.callbacks.play();
  }

  selectFile(): void {
    this.ui().showTextPickerDialog({
      range: this.sourceLabels,
      canLoop: false,
      selected: 0,
      onAccept: (value: TextPickerResult): void => {
        const selectedIndex: number = getPickerSelectedIndex(value.index);
        if (selectedIndex === 0) {
          void this.selectDocument();
        } else if (selectedIndex === 1) {
          void this.selectAlbum();
        }
      }
    });
  }

  async selectQueueFiles(): Promise<void> {
    try {
      const options = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 20;
      const result: string[] = await new picker.DocumentViewPicker().select(options);
      if (result.length === 0) {
        this.callbacks.showNoMediaSelected();
        return;
      }
      await Promise.all(result.map((uri: string): Promise<boolean> =>
        PlaybackUriAccessController.persistDocumentUri(uri)));
      result.forEach((uri: string): void => this.enqueue(uri));
      if (this.callbacks.isButtonEnabled()) {
        this.queue.index = this.queue.index < 0 ? 0 : this.queue.index;
        this.callbacks.setPath(this.queue.paths[this.queue.index]);
        this.callbacks.play(0);
      }
    } catch (error) {
      Logger.error(TAG, 'Select queue files failed: ' + JSON.stringify(error));
      this.callbacks.showNoMediaSelected();
    }
  }

  private scheduleSelectedPath(path: string): void {
    this.clearSelectionTimer();
    this.selectionTimer = setTimeout((): void => {
      this.selectionTimer = 0;
      if (this.callbacks.isPageActive() && this.callbacks.getPath() === path) {
        this.callbacks.play();
      }
    }, PICKER_LAYOUT_SETTLE_DELAY_MS);
  }

  private async selectDocument(): Promise<void> {
    try {
      const result: string[] = await new picker.DocumentViewPicker().select(new picker.DocumentSelectOptions());
      if (result.length === 0) {
        this.callbacks.showNoMediaSelected();
        return;
      }
      const path: string = result[0];
      await PlaybackUriAccessController.persistDocumentUri(path);
      this.callbacks.setPath(path);
      this.queue.paths = [path];
      this.queue.index = 0;
      this.callbacks.setQueueEntries(this.queue.paths.slice());
      this.scheduleSelectedPath(path);
    } catch (error) {
      Logger.error(TAG, 'Document selection failed: ' + JSON.stringify(error));
      this.callbacks.showNoMediaSelected();
    }
  }

  private async selectAlbum(): Promise<void> {
    try {
      const result = await new photoAccessHelper.PhotoViewPicker().select({
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE,
        maxSelectNumber: 1
      });
      if (result.photoUris.length === 0) {
        this.callbacks.showNoMediaSelected();
        return;
      }
      const path: string = result.photoUris[0];
      this.callbacks.setPath(path);
      this.queue.paths = [path];
      this.queue.index = 0;
      this.callbacks.setQueueEntries(this.queue.paths.slice());
      this.scheduleSelectedPath(path);
    } catch (error) {
      Logger.error(TAG, 'Album selection failed: ' + JSON.stringify(error));
      this.callbacks.showNoMediaSelected();
    }
  }
}
