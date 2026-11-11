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

import { formatResource, localText, recordValueLabel } from '../autostart/text/LocalizedText';

import { router } from '@kit.ArkUI';
import { autoStartupService } from '../autostart/AutoStartupService';
import { RevisitSession, RevisitStage } from '../autostart/revisit/RevisitTracker';
import { FALLBACK_GUIDANCE, stepTexts } from '../autostart/revisit/GuidanceCatalog';
import { formatQueryTime } from '../components/QueryPresentation';
import { revisitDetails } from '../autostart/revisit/RevisitView';

@Entry
@Component
struct GuidancePage {
  @State private session: RevisitSession = new RevisitSession();
  @State private notice: string = '';
  @State private archived: RevisitSession[] = [];
  @State private detail: string[] = [];
  @State private selectedSessionId: string = '';
  @State private readBlocked: boolean = false;
  @State private showDetails: boolean = false;
  @State private showStorage: boolean = false;
  @State private showArchive: boolean = false;
  private unsubscribe: () => void = () => {};
  aboutToAppear(): void {
    this.unsubscribe = autoStartupService.subscribe((): void => this.syncState());
    this.syncState();
  }
  aboutToDisappear(): void { this.unsubscribe(); }
  onPageShow(): void { this.syncState(); }
  private syncState(): void {
    this.session = autoStartupService.revisitSnapshot();
    this.notice = autoStartupService.revisitNotice();
    this.archived = autoStartupService.revisitArchive();
    this.readBlocked = autoStartupService.revisitReadBlocked();
    this.detail = revisitDetails(this.archived.find((session: RevisitSession): boolean =>
      session.sessionId === this.selectedSessionId));
  }
  private sampleText(before: boolean): string {
    const record = before ? this.session.before : this.session.after;
    return record === undefined ? localText('startup_text_0524') : `#${record.id} ${recordValueLabel(record.result)} ${formatQueryTime(record.timestamp)}`;
  }
  build() {
    Scroll() {
      Column({ space: 16 }) {
        Button(localText('startup_text_0842'), { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor(Color.Transparent).padding(0)
          .onClick(() => router.back())
        Text(localText('startup_text_0889')).fontSize(26).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary'))
        Column({ space: 12 }) {
          Text(FALLBACK_GUIDANCE.summary).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
          ForEach(stepTexts(FALLBACK_GUIDANCE), (step: string) => {
            Text(step).fontSize(15).fontColor($r('app.color.text_primary')).width('100%')
          }, (step: string): string => step)
          Text(localText('startup_text_0890')).fontSize(12).fontColor($r('app.color.text_secondary'))
          Button(localText('startup_text_0891'), { type: ButtonType.Normal }).width('100%').height(48).fontSize(15)
            .backgroundColor($r('app.color.accent_color')).fontColor(Color.White).borderRadius(12)
            .enabled(!this.readBlocked).onClick(() => { autoStartupService.beginRevisit(); })
        }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
          .alignItems(HorizontalAlign.Start)
        Column({ space: 12 }) {
          Text(localText('startup_text_0892')).fontSize(17).fontWeight(FontWeight.Medium).fontColor($r('app.color.text_primary'))
          Text(this.session.conclusion).fontSize(15).fontColor($r('app.color.text_primary')).width('100%')
          Text(formatResource('startup_format_cae88552bad3', [String(this.sampleText(true))])).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
          Text(formatResource('startup_format_9fb76b9f4a57', [String(this.sampleText(false))])).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
          if (this.notice.length > 0) {
            Text(this.notice).fontSize(14).fontColor($r('app.color.warning_color')).width('100%')
          }
          if (this.session.stage === RevisitStage.RETURNED || this.session.stage === RevisitStage.RECHECKED) {
            Button(localText('startup_text_0895')).height(44).fontSize(14).onClick(() => autoStartupService.retryRevisitQuery())
          }
          if (this.session.stage === RevisitStage.GUIDED || this.session.stage === RevisitStage.LEFT ||
            this.session.stage === RevisitStage.RETURNED) {
            Button(localText('startup_text_0896')).height(44).fontSize(14).onClick(() => autoStartupService.cancelRevisit())
          }
          Button(this.showDetails ? localText('startup_text_0897') : localText('startup_text_0898'), { type: ButtonType.Normal })
            .height(44).fontSize(14).fontColor($r('app.color.accent_color'))
            .backgroundColor(Color.Transparent).padding(0)
            .onClick(() => { this.showDetails = !this.showDetails; })
          if (this.showDetails) {
            Text(formatResource('startup_format_84f8745990cf', [String(this.session.stage)])).fontSize(12).fontColor($r('app.color.text_secondary'))
            Text(formatResource('startup_format_1c36bcd4e70d', [String(formatQueryTime(this.session.leftAt)), String(formatQueryTime(this.session.returnedAt))]))
              .fontSize(12).fontColor($r('app.color.text_secondary'))
            Text(formatResource('startup_format_27777b5cb3c1', [String(this.session.expectedQueryId || localText('startup_text_0524'))])).fontSize(12).fontColor($r('app.color.text_secondary'))
          }
        }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
          .alignItems(HorizontalAlign.Start)
        Button(this.showStorage ? localText('startup_text_0903') : localText('startup_text_0904'), { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showStorage = !this.showStorage; })
        if (this.showStorage || this.readBlocked) {
          Column({ space: 12 }) {
            Button(localText('startup_text_0905')).height(44).fontSize(14).onClick(() => autoStartupService.retryPersistence())
            Button(localText('startup_text_0906')).height(44).fontSize(14).enabled(this.readBlocked)
              .onClick(() => autoStartupService.retryRevisitRead())
            if (this.readBlocked) {
              Button(localText('startup_text_0907')).height(44).fontSize(14).onClick((): void => {
                this.getUIContext().showAlertDialog({
                  title: localText('startup_text_0908'), message: localText('startup_text_0909'),
                  primaryButton: { value: localText('startup_text_0078'), action: (): void => {} },
                  secondaryButton: { value: localText('startup_text_0910'), action: (): void => autoStartupService.discardUnreadRevisit() }
                });
              })
            }
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
        }
        Button(this.showArchive ? localText('startup_text_0911') : formatResource('startup_format_a75b195995bb', [String(this.archived.length)]), { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showArchive = !this.showArchive; })
        if (this.showArchive) {
          Column({ space: 12 }) {
            Text(localText('startup_text_0914')).fontSize(12).fontColor($r('app.color.text_secondary'))
            if (this.archived.length === 0) { Text(localText('startup_text_0915')).fontSize(14).fontColor($r('app.color.text_secondary')) }
            ForEach(this.archived, (session: RevisitSession) => {
              Button(`${session.sessionId}｜${session.stage}`).height(44).fontSize(13)
                .onClick((): void => { this.selectedSessionId = session.sessionId; this.syncState(); })
            }, (session: RevisitSession): string => session.sessionId)
            ForEach(this.detail, (line: string, index: number) => {
              Text(line).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
            }, (line: string, index: number): string => `${index}:${line}`)
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
            .alignItems(HorizontalAlign.Start)
        }
      }.width('100%').padding({ left: 20, right: 20, top: 20, bottom: 28 }).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor($r('app.color.page_background'))
  }
}
