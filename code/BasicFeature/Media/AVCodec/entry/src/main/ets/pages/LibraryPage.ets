/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
