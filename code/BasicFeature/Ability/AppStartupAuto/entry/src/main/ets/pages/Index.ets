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

import { formatResource, localText } from '../autostart/text/LocalizedText';

import { promptAction, router } from '@kit.ArkUI';
import { BusinessError, deviceInfo, pasteboard } from '@kit.BasicServicesKit';
import { reportFailure } from '../autostart/SampleLogger';
import { autoStartupService } from '../autostart/AutoStartupService';
import { QueryPhase, QueryRecord, QuerySnapshot, RefreshSource } from '../autostart/AutoStartupTypes';
import { CapabilityQuery, DeviceForm, SystemFlavor } from '../autostart/rules/CapabilityMatrix';
import { GuidanceEntry, guidanceCaption, selectGuidance, stepTexts } from '../autostart/revisit/GuidanceCatalog';
import { ApiCallDetails } from '../components/ApiCallDetails';
import { formatQueryTime, statusLabel, supportLabel } from '../components/QueryPresentation';
import { QueryRecordsSheet } from '../components/QueryRecordsSheet';

@Entry
@Component
struct Index {
  @State private query: QuerySnapshot = new QuerySnapshot();
  @State private queryRecords: QueryRecord[] = [];
  @State private showRecords: boolean = false;
  @State private showCallDetails: boolean = false;
  @State private showGuidanceSteps: boolean = false;
  @State private historyFilter: string = 'all';
  @State private historyNotice: string = '';
  @State private historySummary: string = '';
  @State private guidanceTitle: string = '';
  @State private guidanceCaption: string = '';
  @State private guidanceSteps: string[] = [];
  private unsubscribe: () => void = () => {};

  /** Navigate with a recorded, non-fatal diagnostic instead of swallowing the failure. */
  private openPage(url: string): void {
    router.pushUrl({ url: url }).catch((error: BusinessError): void => {
      reportFailure(`Open page ${url} (code ${error.code})`);
    });
  }

  aboutToAppear(): void {
    this.unsubscribe();
    this.unsubscribe = autoStartupService.subscribe(() => this.syncState());
    this.syncState();
    autoStartupService.refresh(RefreshSource.INITIAL);
  }

  aboutToDisappear(): void {
    this.unsubscribe();
    this.unsubscribe = () => {};
  }

  onPageShow(): void {
    this.syncState();
  }

  private syncState(): void {
    this.query = autoStartupService.snapshot();
    this.queryRecords = autoStartupService.records(this.historyFilter);
    this.historyNotice = autoStartupService.historyNotice();
    this.refreshHistorySummary();
    this.refreshGuidance();
  }

  /**
   * 设备上下文不代替系统返回；发行版、权限和设置入口没有运行时证据，不假定可用。
   */
  private refreshGuidance(): void {
    let form: DeviceForm = DeviceForm.UNKNOWN;
    if (deviceInfo.deviceType === 'phone') {
      form = DeviceForm.PHONE;
    } else if (deviceInfo.deviceType === 'tablet') {
      form = DeviceForm.TABLET;
    } else if (deviceInfo.deviceType === 'tv') {
      form = DeviceForm.TV;
    } else if (deviceInfo.deviceType === 'wearable') {
      form = DeviceForm.WEARABLE;
    }
    const query: CapabilityQuery = new CapabilityQuery(deviceInfo.sdkApiVersion, form,
      SystemFlavor.UNKNOWN, false, false);
    const entry: GuidanceEntry = selectGuidance(query);
    this.guidanceTitle = entry.title;
    this.guidanceCaption = guidanceCaption(entry);
    this.guidanceSteps = stepTexts(entry);
  }

  private refreshHistorySummary(): void {
    const summary = autoStartupService.historySummary();
    this.historySummary = summary.total === 0 ? localText('startup_text_0520') :
      formatResource('startup_format_d4162659f392', [String(summary.total), String(summary.success), String(summary.failure)]) +
      formatResource('startup_format_b655c0b469bb', [String(summary.unsupported), String(summary.timeout), String(summary.unknown)]) +
      (summary.latestValidId >= 0 ? formatResource('startup_format_417aa7fb9d0c', [String(summary.latestValidId)]) : localText('startup_text_0966')) +
      (summary.expiringSoon > 0 ? formatResource('startup_format_9665e649878d', [String(summary.expiringSoon)]) : '');
  }

  private changeFilter(filter: string): void {
    this.historyFilter = filter;
    autoStartupService.setHistoryFilter(filter);
    this.syncState();
  }

  private exportHistory(): void {
    const text: string = autoStartupService.exportHistory();
    try {
      pasteboard.getSystemPasteboard().setData(pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text))
        .then(() => {
          promptAction.showToast({ message: localText('startup_text_0927') });
        })
        .catch(() => {
          promptAction.showToast({ message: localText('startup_text_0154') });
        });
    } catch (_) {
      this.historyNotice = this.historyNotice.length > 0 ? formatResource('startup_format_420bf171a18b', [String(this.historyNotice)]) : localText('startup_text_0154');
    }
  }

  private statusColor(): Resource {
    switch (this.query.phase) {
      case QueryPhase.SUCCEEDED:
        return this.query.value === true ? $r('app.color.success_color') : $r('app.color.text_primary');
      case QueryPhase.FAILED:
      case QueryPhase.TIMEOUT:
        return $r('app.color.error_color');
      case QueryPhase.UNSUPPORTED:
        return $r('app.color.text_secondary');
      default:
        return $r('app.color.accent_color');
    }
  }

  private refreshLabel(): string {
    if (this.query.pending) {
      return this.query.phase === QueryPhase.TIMEOUT ? localText('startup_text_0969') : localText('startup_text_0761');
    }
    switch (this.query.phase) {
      case QueryPhase.FAILED:
      case QueryPhase.TIMEOUT:
        return localText('startup_text_0970');
      case QueryPhase.UNSUPPORTED:
        return localText('startup_text_0971');
      default:
        return localText('startup_text_0972');
    }
  }

  private showLastResult(): boolean {
    return this.query.lastValue !== null &&
      (this.query.phase === QueryPhase.FAILED || this.query.phase === QueryPhase.TIMEOUT);
  }

  private lastQueryTime(): string {
    const timestamp: number = this.queryRecords.length > 0 ? this.queryRecords[0].timestamp :
      (this.query.sampleTime > 0 ? this.query.sampleTime : this.query.lastSampleTime);
    return formatQueryTime(timestamp);
  }

  @Builder
  private statusCard() {
    Column({ space: 18 }) {
      Text(localText('startup_text_0973'))
        .fontSize(16)
        .fontColor($r('app.color.text_secondary'))
      Text(statusLabel(this.query))
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.statusColor())
        .width('100%')

      if (this.query.pending) {
        LoadingProgress()
          .width(28)
          .height(28)
          .color($r('app.color.accent_color'))
      }
      if (this.query.phase === QueryPhase.TIMEOUT && this.query.pending) {
        Text(localText('startup_text_0974'))
          .fontSize(16)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      }

      Divider().color($r('app.color.line_color'))
      Column({ space: 8 }) {
        if (this.query.phase !== QueryPhase.UNSUPPORTED) {
          Text(formatResource('startup_format_0d8bc32738eb', [String(supportLabel(this.query.support))]))
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        Text(formatResource('startup_format_20c4cde090c1', [String(this.lastQueryTime())]))
          .fontSize(16)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        if (this.showLastResult()) {
          Text(formatResource('startup_format_880313dd233b', [String(this.query.lastValue === true ? localText('startup_text_0168') : localText('startup_text_0169'))]) +
            formatQueryTime(this.query.lastSampleTime))
            .fontSize(16)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
  }

  @Builder
  private actionButtons() {
    Button(this.refreshLabel(), { type: ButtonType.Normal })
      .fontSize(16).fontWeight(FontWeight.Medium).fontColor(Color.White)
      .width('100%').height(48).backgroundColor($r('app.color.accent_color')).borderRadius(12)
      .enabled(!this.query.pending).opacity(this.query.pending ? 0.6 : 1)
      .onClick(() => autoStartupService.refresh(RefreshSource.MANUAL))
  }

  @Builder
  private toolsCard() {
    Row({ space: 12 }) {
      Button(localText('startup_text_0978'), { type: ButtonType.Normal })
        .fontSize(14).fontColor($r('app.color.text_secondary'))
        .layoutWeight(1).height(44).backgroundColor($r('app.color.card_background')).borderRadius(12)
        .onClick(() => { this.openPage('pages/DiagnosticPage'); })
      Button(localText('startup_text_0880'), { type: ButtonType.Normal })
        .fontSize(14).fontColor($r('app.color.text_secondary'))
        .layoutWeight(1).height(44).backgroundColor($r('app.color.card_background')).borderRadius(12)
        .onClick(() => { this.openPage('pages/FaultPage'); })
    }.width('100%')
  }

  @Builder
  private guidanceCard() {
    Column({ space: 8 }) {
      Row({ space: 12 }) {
        Column({ space: 4 }) {
          Text(localText('startup_text_0979')).fontSize(16).fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.text_primary')).width('100%')
          Text(localText('startup_text_0980')).fontSize(13)
            .fontColor($r('app.color.text_secondary')).width('100%')
        }.layoutWeight(1).alignItems(HorizontalAlign.Start)
        Button(localText('startup_text_0981'), { type: ButtonType.Normal })
          .fontSize(14).height(44).fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.accent_soft')).borderRadius(12)
          .onClick(() => { this.openPage('pages/GuidancePage'); })
      }.width('100%')
      Button(this.showGuidanceSteps ? localText('startup_text_0982') : localText('startup_text_0983'), { type: ButtonType.Normal })
        .height(44).fontSize(13).fontColor($r('app.color.text_secondary'))
        .backgroundColor(Color.Transparent).constraintSize({ minHeight: 44 }).padding(0)
        .onClick(() => { this.showGuidanceSteps = !this.showGuidanceSteps; })
      if (this.showGuidanceSteps) {
        Text(this.guidanceTitle).fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
        if (this.guidanceCaption.length > 0) {
          Text(this.guidanceCaption).fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
        }
        ForEach(this.guidanceSteps, (step: string) => {
          Text(step).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
        }, (step: string): string => step)
      }
    }.width('100%').padding(16).backgroundColor($r('app.color.card_background'))
      .borderRadius(16).alignItems(HorizontalAlign.Start)
  }

  @Builder
  private callDetailsCard() {
    Column({ space: 18 }) {
      Button({ type: ButtonType.Normal }) {
        Text(this.showCallDetails ? localText('startup_text_0984') : localText('startup_text_0985'))
          .fontSize(17)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      }
      .width('100%')
      .constraintSize({ minHeight: 44 }).padding(0)
      .backgroundColor($r('app.color.card_background'))
      .borderRadius(12)
      .onClick(() => this.showCallDetails = !this.showCallDetails)

      if (this.showCallDetails) {
        Divider().color($r('app.color.line_color'))
        ApiCallDetails({
          supportResult: this.query.supportResult,
          statusResult: this.query.statusResult,
          errorCode: this.query.errorCode,
          errorMessage: this.query.errorMessage
        })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
  }

  @Builder
  private recordSheet() {
    QueryRecordsSheet({
      records: this.queryRecords,
      filter: this.historyFilter,
      notice: this.historyNotice,
      summary: this.historySummary,
      onFilter: (filter: string): void => this.changeFilter(filter),
      onExport: (): void => this.exportHistory(),
      onClear: () => autoStartupService.clearRecords(),
      onClose: () => this.showRecords = false
    })
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Column({ space: 10 }) {
          Text(localText('startup_text_0718'))
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
          Text(localText('startup_text_0986'))
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        this.statusCard()
        this.actionButtons()
        this.guidanceCard()

        Button({ type: ButtonType.Normal }) {
          Text(formatResource('startup_format_7c478eee9f7b', [String(this.queryRecords.length)]))
            .fontSize(16)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
        }
        .width('100%')
        .constraintSize({ minHeight: 52 })
        .padding(16)
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)
        .onClick(() => this.showRecords = true)

        Button({ type: ButtonType.Normal }) {
          Text(localText('startup_text_0989'))
            .fontSize(16)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        .width('100%')
        .constraintSize({ minHeight: 52 })
        .padding(16)
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)
        .onClick(() => {
          this.openPage('pages/HistoryPage');
        })
        this.toolsCard()
        this.callDetailsCard()
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 20, bottom: 28 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_background'))
    .scrollBar(BarState.Auto)
    .bindSheet($$this.showRecords, this.recordSheet(), {
      height: SheetSize.LARGE,
      dragBar: true,
      showClose: false,
      backgroundColor: $r('app.color.page_background'),
      onDisappear: () => this.showRecords = false
    })
  }
}
