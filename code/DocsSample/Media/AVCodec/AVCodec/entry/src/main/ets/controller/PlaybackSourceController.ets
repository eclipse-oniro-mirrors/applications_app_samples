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
import { PlaybackHistoryEntry, PlaybackHistoryModel } from '../model/PlaybackHistoryModel';
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
  private selectionRevision: number = 0;
  private historyLoadRevision: number = 0;
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

  cancelSelection(): void {
    ++this.selectionRevision;
    ++this.historyLoadRevision;
    this.clearSelectionTimer();
  }

  private beginSelection(): number {
    ++this.selectionRevision;
    this.clearSelectionTimer();
    return this.selectionRevision;
  }

  private isCurrentSelection(revision: number): boolean {
    return revision === this.selectionRevision && this.callbacks.isPageActive();
  }

  async loadHistory(): Promise<void> {
    const revision: number = ++this.historyLoadRevision;
    try {
      const context = this.ui().getHostContext();
      if (context === undefined) {
        return;
      }
      await this.history.load(context as common.UIAbilityContext);
      if (revision === this.historyLoadRevision && this.callbacks.isPageActive()) {
        this.callbacks.setRecentEntries(this.history.getEntries());
      }
    } catch (error) {
      Logger.error(TAG, 'Load playback history failed: ' + JSON.stringify(error));
    }
  }

  playRecording(uri: string): void {
    if (uri.length === 0 || !this.callbacks.isPageActive()) {
      return;
    }
    const revision: number = this.beginSelection();
    this.callbacks.activatePlayer();
    this.selectPath(uri, revision);
  }

  enqueue(path: string): void {
    if (path.length === 0) {
      return;
    }
    this.queue.append(path);
    this.callbacks.setQueueEntries(this.queue.paths.slice());
  }

  clearQueue(): void {
    this.beginSelection();
    this.queue.clear();
    this.callbacks.setQueueEntries([]);
  }

  playQueueEntry(index: number): void {
    if (!this.callbacks.isPageActive() || index < 0 || index >= this.queue.paths.length) {
      return;
    }
    const path: string = this.queue.paths[index];
    if (path.length === 0) {
      return;
    }
    this.beginSelection();
    this.callbacks.activatePlayer();
    this.callbacks.closeQueue();
    if (index === this.queue.index && !this.callbacks.isButtonEnabled() && !this.callbacks.isStopping()) {
      return;
    }
    if (this.callbacks.isStopping()) {
      // 停止期间只替换待播目标，由原完成回调继续播放。
      this.queue.requestSwitch(index);
      return;
    }
    if (this.callbacks.isButtonEnabled()) {
      this.queue.select(index);
      this.callbacks.setPath(path);
      this.callbacks.setQueueEntries(this.queue.paths.slice());
      this.callbacks.play(0);
      return;
    }
    this.queue.requestSwitch(index);
    this.callbacks.stop();
  }

  playRecentEntry(entry: PlaybackHistoryEntry): void {
    if (!this.callbacks.isPageActive()) {
      return;
    }
    const revision: number = this.beginSelection();
    this.callbacks.activatePlayer();
    this.callbacks.closeQueue();
    this.selectPath(entry.uri, revision, false);
  }

  selectFile(): void {
    if (!this.callbacks.isPageActive()) {
      return;
    }
    const revision: number = this.beginSelection();
    this.ui().showTextPickerDialog({
      range: this.sourceLabels,
      canLoop: false,
      selected: 0,
      onAccept: (value: TextPickerResult): void => {
        if (!this.isCurrentSelection(revision)) {
          return;
        }
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
    if (!this.callbacks.isPageActive()) {
      return;
    }
    const revision: number = this.beginSelection();
    try {
      const options = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 20;
      const result: string[] = await new picker.DocumentViewPicker().select(options);
      if (!this.isCurrentSelection(revision)) {
        return;
      }
      if (result.length === 0) {
        this.callbacks.showNoMediaSelected();
        return;
      }
      await Promise.all(result.map((uri: string): Promise<boolean> =>
        PlaybackUriAccessController.persistDocumentUri(uri)));
      if (!this.isCurrentSelection(revision)) {
        return;
      }
      result.forEach((uri: string): void => this.enqueue(uri));
      if (this.callbacks.isButtonEnabled()) {
        const path: string | undefined = this.queue.selectDefault();
        if (path !== undefined) { this.callbacks.setPath(path); this.callbacks.play(0); }
      }
    } catch (error) {
      Logger.error(TAG, 'Select queue files failed: ' + JSON.stringify(error));
      if (this.isCurrentSelection(revision)) {
        this.callbacks.showNoMediaSelected();
      }
    }
  }

  private selectPath(path: string, revision: number, delayed: boolean = true): void {
    if (!this.isCurrentSelection(revision)) {
      return;
    }
    const deferred: boolean = !this.callbacks.isButtonEnabled() || this.callbacks.isStopping();
    this.queue.replaceSource(path, deferred);
    this.callbacks.setQueueEntries(this.queue.paths);
    if (deferred) {
      // 旧播放完成前不改路径，其进度仍属于旧文件。
      if (!this.callbacks.isStopping()) {
        this.callbacks.stop();
      }
      return;
    }
    this.callbacks.setPath(path);
    if (delayed) {
      this.scheduleSelectedPath(path, revision);
    } else {
      this.callbacks.play();
    }
  }

  private scheduleSelectedPath(path: string, revision: number): void {
    this.clearSelectionTimer();
    this.selectionTimer = setTimeout((): void => {
      this.selectionTimer = 0;
      if (this.isCurrentSelection(revision) && this.callbacks.getPath() === path) {
        this.callbacks.play();
      }
    }, PICKER_LAYOUT_SETTLE_DELAY_MS);
  }

  private async selectDocument(): Promise<void> {
    if (!this.callbacks.isPageActive()) {
      return;
    }
    const revision: number = this.beginSelection();
    try {
      const result: string[] = await new picker.DocumentViewPicker().select(new picker.DocumentSelectOptions());
      if (!this.isCurrentSelection(revision)) {
        return;
      }
      if (result.length === 0) {
        this.callbacks.showNoMediaSelected();
        return;
      }
      const path: string = result[0];
      await PlaybackUriAccessController.persistDocumentUri(path);
      if (!this.isCurrentSelection(revision)) {
        return;
      }
      this.selectPath(path, revision);
    } catch (error) {
      Logger.error(TAG, 'Document selection failed: ' + JSON.stringify(error));
      if (this.isCurrentSelection(revision)) {
        this.callbacks.showNoMediaSelected();
      }
    }
  }

  private async selectAlbum(): Promise<void> {
    if (!this.callbacks.isPageActive()) {
      return;
    }
    const revision: number = this.beginSelection();
    try {
      const result = await new photoAccessHelper.PhotoViewPicker().select({
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE,
        maxSelectNumber: 1
      });
      if (!this.isCurrentSelection(revision)) {
        return;
      }
      if (result.photoUris.length === 0) {
        this.callbacks.showNoMediaSelected();
        return;
      }
      const path: string = result.photoUris[0];
      this.selectPath(path, revision);
    } catch (error) {
      Logger.error(TAG, 'Album selection failed: ' + JSON.stringify(error));
      if (this.isCurrentSelection(revision)) {
        this.callbacks.showNoMediaSelected();
      }
    }
  }
}
