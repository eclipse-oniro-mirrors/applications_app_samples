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

import { MediaLibraryView } from '../components/library/MediaLibraryView';
import { PlaybackHistoryEntry } from '../model/PlaybackHistoryModel';

@Component
export struct LibraryPage {
  @Prop recentEntries: PlaybackHistoryEntry[] = [];
  @Prop queueEntries: string[] = [];
  @Prop queueIndex: number = -1;
  @Prop buttonEnabled: boolean = true;
  @Prop recentPositionPrefix: string = '';
  @Prop recentCompletedText: string = '';
  onOpenFiles: () => void = (): void => {};
  onAddQueue: () => void = (): void => {};
  onClearQueue: () => void = (): void => {};
  onPlayQueueEntry: (index: number) => void = (_index: number): void => {};
  onPlayRecentEntry: (entry: PlaybackHistoryEntry) => void = (_entry: PlaybackHistoryEntry): void => {};

  build() {
    MediaLibraryView({
      recentEntries: this.recentEntries,
      queueEntries: this.queueEntries,
      queueIndex: this.queueIndex,
      buttonEnabled: this.buttonEnabled,
      recentPositionPrefix: this.recentPositionPrefix,
      recentCompletedText: this.recentCompletedText,
      onOpenFiles: this.onOpenFiles,
      onAddQueue: this.onAddQueue,
      onClearQueue: this.onClearQueue,
      onPlayQueueEntry: this.onPlayQueueEntry,
      onPlayRecentEntry: this.onPlayRecentEntry
    })
  }
}
