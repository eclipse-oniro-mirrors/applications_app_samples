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

import { PlaybackHistoryEntry, getPlaybackTitle } from '../../model/PlaybackHistoryModel';

@Component
export struct MediaLibraryView {
  @Prop recentEntries: PlaybackHistoryEntry[] = [];
  @Prop queueEntries: string[] = [];
  @Prop queueIndex: number = -1;
  @Prop buttonEnabled: boolean = true;
  @Prop recentPositionPrefix: string = '';
  @Prop recentCompletedText: string = '';
  onOpenFiles: () => void = () => {};
  onAddQueue: () => void = () => {};
  onClearQueue: () => void = () => {};
  onPlayQueueEntry: (index: number) => void = (_index: number): void => {};
  onPlayRecentEntry: (entry: PlaybackHistoryEntry) => void = (_entry: PlaybackHistoryEntry): void => {};

  private formatHistoryPosition(positionUs: number): string {
    const totalSeconds: number = Math.floor(Math.max(0, positionUs) / 1000000);
    const minutes: number = Math.floor(totalSeconds / 60);
    const seconds: number = totalSeconds % 60;
    return (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
  }

  build() {
    Scroll() {
      Column({ space: '20vp' }) {
        Column({ space: '4vp' }) {
          Text($r('app.string.library_title'))
            .fontSize('24fp')
            .fontWeight(FontWeight.Bold)
            .fontColor('#101820')
            .width('100%')
          Text($r('app.string.library_description'))
            .fontSize('14fp')
            .fontColor('#667085')
            .width('100%')
        }.width('100%')

        Row({ space: '12vp' }) {
          Button($r('app.string.library_open_files'))
            .layoutWeight(1)
            .height('48vp')
            .backgroundColor('#0A59F7')
            .fontColor(Color.White)
            .onClick(this.onOpenFiles)
          Button($r('app.string.library_add_queue'))
            .layoutWeight(1)
            .height('48vp')
            .onClick(this.onAddQueue)
        }.width('100%').height('48vp')

        Column({ space: '12vp' }) {
          Row() {
            Text($r('app.string.playback_queue'))
              .fontSize('18fp')
              .fontWeight(FontWeight.Medium)
              .fontColor('#101820')
              .layoutWeight(1)
            Button($r('app.string.playback_queue_clear'))
              .height('40vp')
              .enabled(this.queueEntries.length > 0)
              .onClick(this.onClearQueue)
          }.width('100%')
          if (this.queueEntries.length === 0) {
            Column({ space: '8vp' }) {
              SymbolGlyph($r('sys.symbol.play_fill'))
                .fontSize('24fp')
                .fontColor(['#98A2B3'])
              Text($r('app.string.library_queue_empty'))
                .fontSize('15fp')
                .fontWeight(FontWeight.Medium)
                .fontColor('#344054')
              Text($r('app.string.library_queue_empty_hint'))
                .fontSize('13fp')
                .fontColor('#667085')
                .textAlign(TextAlign.Center)
              Button($r('app.string.library_add_queue'))
                .height('40vp')
                .backgroundColor('#EAF1FF')
                .fontColor('#0A59F7')
                .onClick(this.onAddQueue)
            }
              .width('100%')
              .padding('20vp')
              .alignItems(HorizontalAlign.Center)
              .backgroundColor('#F7F8FA')
              .borderRadius('16vp')
          } else {
            ForEach(this.queueEntries, (path: string, index: number) => {
              Row() {
                if (index === this.queueIndex) {
                  SymbolGlyph($r('sys.symbol.play_fill'))
                    .fontSize('14fp')
                    .fontColor(['#0A59F7'])
                    .width('28vp')
                } else {
                  Text((index + 1).toString())
                    .fontSize('13fp')
                    .fontColor('#667085')
                    .width('28vp')
                }
                Text(getPlaybackTitle(path))
                  .fontSize('14fp')
                  .fontColor('#101820')
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .layoutWeight(1)
                if (index === this.queueIndex) {
                  Text($r('app.string.playback_queue_playing'))
                    .fontSize('12fp')
                    .fontColor('#0A59F7')
                }
              }
              .width('100%')
              .padding({ left: '12vp', right: '12vp', top: '12vp', bottom: '12vp' })
              .backgroundColor(index === this.queueIndex ? '#EAF1FF' : '#F7F8FA')
              .borderRadius('12vp')
              .onClick(() => this.onPlayQueueEntry(index))
            }, (path: string) => path)
          }
        }.width('100%')

        Column({ space: '12vp' }) {
          Text($r('app.string.library_recent'))
            .fontSize('18fp')
            .fontWeight(FontWeight.Medium)
            .fontColor('#101820')
            .width('100%')
          if (this.recentEntries.length === 0) {
            Column({ space: '8vp' }) {
              SymbolGlyph($r('sys.symbol.folder_fill'))
                .fontSize('24fp')
                .fontColor(['#98A2B3'])
              Text($r('app.string.playback_recent_empty'))
                .fontSize('15fp')
                .fontWeight(FontWeight.Medium)
                .fontColor('#344054')
              Text($r('app.string.library_recent_empty_hint'))
                .fontSize('13fp')
                .fontColor('#667085')
                .textAlign(TextAlign.Center)
              Button($r('app.string.library_open_files'))
                .height('40vp')
                .backgroundColor('#EAF1FF')
                .fontColor('#0A59F7')
                .onClick(this.onOpenFiles)
            }
              .width('100%')
              .padding('20vp')
              .alignItems(HorizontalAlign.Center)
              .backgroundColor('#F7F8FA')
              .borderRadius('16vp')
          } else {
            ForEach(this.recentEntries, (entry: PlaybackHistoryEntry) => {
              Row({ space: '12vp' }) {
                Column({ space: '4vp' }) {
                  Text(entry.title)
                    .fontSize('14fp')
                    .fontColor('#101820')
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .width('100%')
                  Text(entry.positionUs > 0 ?
                    this.recentPositionPrefix + this.formatHistoryPosition(entry.positionUs) :
                    this.recentCompletedText)
                    .fontSize('12fp')
                    .fontColor('#667085')
                    .width('100%')
                }.layoutWeight(1)
                Button($r('app.string.playback_recent_play'))
                  .enabled(this.buttonEnabled)
                  .height('40vp')
                  .onClick(() => this.onPlayRecentEntry(entry))
              }
              .width('100%')
              .padding('12vp')
              .backgroundColor('#F7F8FA')
              .borderRadius('12vp')
            }, (entry: PlaybackHistoryEntry) => entry.uri)
          }
        }.width('100%')
      }
      .width('100%')
      .padding({ left: '20vp', right: '20vp', top: '24vp', bottom: '24vp' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .scrollBar(BarState.Auto)
  }
}
