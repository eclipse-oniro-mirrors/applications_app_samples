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

import { localize } from '../common/LocaleStrings';
import { getLearningController } from '../learning/LearningContext';
import { SceneSnapshot } from '../learning/scene/SceneWorkbench';
import { ScenePageSession } from '../learning/scene/ScenePageSession';
import { READING_CHAPTERS, ReadingBookmark, ReadingChapter } from '../learning/scene/SceneModel';
import { SceneContinuationStatus } from '../components/SceneContinuationStatus';
import { LEARNING_BG, LEARNING_BLUE, LEARNING_INK, LEARNING_MUTED, openLearningTab } from '../components/LearningUi';

@Entry
@Component
struct ReadingScenePage {
  @State private view: SceneSnapshot = new SceneSnapshot();
  @State private navigationMessage: string = '';
  @State private chaptersExpanded: boolean = false;
  private readonly binding: ScenePageSession = new ScenePageSession('reading');
  private receiptRequest: number = -1;
  aboutToAppear(): void { this.bind(); }
  onPageShow(): void { this.bind(); }
  onPageHide(): void { this.binding.hide(); }
  aboutToDisappear(): void { this.binding.hide(); }
  private bind(): void {
    this.binding.bind(getLearningController(), (): void => { this.view = this.binding.snapshot(); });
  }
  private positionRendered(): void {
    const target = this.binding.target();
    if (target === undefined || target.document.state.kind !== 'reading' || target.request === this.receiptRequest) {
      return;
    }
    if (this.view.readingChapter !== target.document.state.reading.chapter ||
      this.view.readingAnchor !== target.document.state.reading.anchor || this.view.readingParagraph.length === 0) {
      return;
    }
    this.receiptRequest = target.request;
    // This page renders exactly the selected paragraph, so a non-empty layout is its actual anchor receipt.
    this.binding.receipt(target, this.view.readingChapter, this.view.readingAnchor, true);
  }
  private jump(chapter: number, anchor: number): void {
    getLearningController()?.sceneWorkbench.gotoParagraph(chapter, anchor);
  }
  private backToWorkbench(): void {
    this.navigationMessage = '';
    openLearningTab(this.getUIContext(), 1, (message: string): void => { this.navigationMessage = message; });
  }
  build() {
    Scroll() {
      Column({ space: 14 }) {
        Button($r('app.string.ac_formscenepage_001'), { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
          .onClick((): void => { this.backToWorkbench(); })
        if (this.navigationMessage.length > 0) {
          Text(this.navigationMessage).fontSize(14).fontColor('#B42318').width('100%')
        }
        Text($r('app.string.ac_readingscenepage_002')).fontSize(26).fontWeight(FontWeight.Bold).fontColor(LEARNING_INK).width('100%')
        Text(this.view.text()).fontSize(14).fontColor(LEARNING_MUTED).width('100%')
        SceneContinuationStatus()
        Column({ space: 12 }) {
          Text(this.view.readingChapterTitle).fontSize(18).fontWeight(FontWeight.Medium)
            .fontColor(LEARNING_INK).width('100%')
          Text(this.view.readingParagraph).fontSize(15).lineHeight(27).fontColor(LEARNING_INK).width('100%')
            .onAreaChange((_old, area): void => {
              if (Number(area.width) > 0 && Number(area.height) > 0) {
                this.positionRendered();
              }
            })
          Text(localize('ac_readingscenepage_003', [this.view.readingAnchor + 1, this.view.readingParagraphCount]))
            .fontSize(12).fontColor(LEARNING_MUTED).width('100%')
        }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(14)
        Row({ space: 10 }) {
          Button($r('app.string.ac_readingscenepage_004'), { type: ButtonType.Normal }).layoutWeight(1).height(44).fontSize(14)
            .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10).enabled(this.view.editable)
            .onClick((): void => { getLearningController()?.sceneWorkbench.previousParagraph(); })
          Button($r('app.string.ac_readingscenepage_005'), { type: ButtonType.Normal }).layoutWeight(1).height(44).fontSize(14)
            .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10).enabled(this.view.editable)
            .onClick((): void => { getLearningController()?.sceneWorkbench.nextParagraph(); })
        }.width('100%')
        Button($r('app.string.ac_readingscenepage_006')).width('100%').height(48).fontSize(15).backgroundColor(LEARNING_BLUE).borderRadius(10)
          .enabled(this.view.editable).onClick((): void => { getLearningController()?.sceneWorkbench.saveReading(); })
        Button($r('app.string.ac_readingscenepage_007'), { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10).enabled(this.view.editable)
          .onClick((): void => { getLearningController()?.sceneWorkbench.addBookmark(); })
        Text(this.view.error.length > 0 ? this.view.error : this.view.notice)
          .fontSize(14).fontColor(LEARNING_INK).width('100%')
        Button(this.chaptersExpanded ? localize('ac_readingscenepage_008') : localize('ac_readingscenepage_009'), { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#FFFFFF').borderRadius(10)
          .onClick((): void => { this.chaptersExpanded = !this.chaptersExpanded; })
        if (this.chaptersExpanded) {
          ForEach(READING_CHAPTERS, (chapter: ReadingChapter, index: number) => {
            Button(chapter.title, { type: ButtonType.Normal }).width('100%')
              .constraintSize({ minHeight: 44 }).fontSize(14)
              .fontColor(LEARNING_BLUE).backgroundColor('#FFFFFF').borderRadius(10).enabled(this.view.editable)
              .onClick((): void => this.jump(index, 0))
          }, (chapter: ReadingChapter) => chapter.title)
        }
        Text(localize('ac_readingscenepage_010', [this.view.bookmarks.length])).fontSize(16).fontWeight(FontWeight.Medium)
          .fontColor(LEARNING_INK).width('100%')
        ForEach(this.view.bookmarks, (bookmark: ReadingBookmark, index: number) => {
          Row({ space: 10 }) {
            Button(localize('ac_readingscenepage_011', [bookmark.chapter + 1, bookmark.anchor + 1]), { type: ButtonType.Normal })
              .layoutWeight(1).height(44).fontSize(14).fontColor(LEARNING_BLUE)
              .backgroundColor('#FFFFFF').borderRadius(10)
              .enabled(this.view.editable).onClick((): void => this.jump(bookmark.chapter, bookmark.anchor))
            Button($r('app.string.ac_readingscenepage_012'), { type: ButtonType.Normal }).height(44).fontSize(14)
              .fontColor('#B42318').backgroundColor('#FEF3F2').borderRadius(10).enabled(this.view.editable)
              .onClick((): void => { getLearningController()?.sceneWorkbench.removeBookmark(index); })
          }.width('100%')
        }, (bookmark: ReadingBookmark) => `${bookmark.chapter}:${bookmark.anchor}`)
      }.width('100%').padding(20).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor(LEARNING_BG).align(Alignment.TopStart)
  }
}
