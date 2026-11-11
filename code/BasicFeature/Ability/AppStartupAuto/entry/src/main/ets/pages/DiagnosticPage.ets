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

import { deviceInfo, pasteboard } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import { autoStartupService } from '../autostart/AutoStartupService';
import { capabilityDiagnostic } from '../autostart/diagnostics/DiagnosticRuntime';
import { DiagnosticReport, ProbeResult } from '../autostart/diagnostics/CapabilityProbe';
import { HISTORY_SCHEMA, HISTORY_LIMIT, HISTORY_MESSAGE_LIMIT } from '../autostart/AutoStartupHistory';
import { permissionLines, policySeries } from '../autostart/permission/PermissionPlan';
import { DEFAULT_REMINDER, inQuietHours, quietText } from '../autostart/notify/ReminderPolicy';
import { messageLines, userFacingCount } from '../autostart/text/MessageCatalog';
import { defaultRetentionPolicy, describePolicy } from '../autostart/archive/RetentionPolicy';

@Entry
@Component
struct DiagnosticPage {
  @State private report: DiagnosticReport = new DiagnosticReport();
  @State private running: boolean = false;
  @State private notice: string = '';
  @State private showReference: boolean = false;
  @State private permissionLinesState: string[] = [];
  @State private messageLinesState: string[] = [];
  @State private retentionLinesState: string[] = [];
  private unsubscribe: () => void = () => {};
  aboutToAppear(): void {
    this.unsubscribe = capabilityDiagnostic.subscribe((): void => this.syncState());
    this.syncState();
    this.rebuildSections();
  }
  onPageShow(): void {
    this.rebuildSections();
  }

  /**
   * 权限、文案与保留策略按当前系统时间重算，只展示规则目录，不代表已申请权限或已发通知。
   */
  private rebuildSections(): void {
    const hour: number = new Date().getHours();
    const quiet: string = inQuietHours(hour, DEFAULT_REMINDER) ? localText('startup_text_0828') : localText('startup_text_0829');
    this.permissionLinesState = permissionLines().slice(0, 6).concat(policySeries());
    this.messageLinesState = [formatResource('startup_format_fe5608d9043b', [String(userFacingCount())]), quiet, quietText(DEFAULT_REMINDER)]
      .concat(messageLines().slice(0, 4));
    this.retentionLinesState = describePolicy(defaultRetentionPolicy());
  }
  aboutToDisappear(): void {
    this.unsubscribe();
    capabilityDiagnostic.dispose();
  }
  private syncState(): void {
    this.report = capabilityDiagnostic.reportSnapshot();
    this.running = capabilityDiagnostic.isRunning();
  }
  private run(ability: boolean): void {
    const request = ability ? capabilityDiagnostic.runAbilityProbe() : capabilityDiagnostic.runStatusProbe();
    this.syncState();
    request.then((): void => this.syncState());
  }
  private copyReport(): void {
    // No model/serial/account, raw platform message, permission assertion or illustrative schema.
    const content = formatResource('startup_format_08cb0b931b1d', [String(deviceInfo.sdkApiVersion)]) +
      formatResource('startup_format_c3f33b9111c0', [String(deviceInfo.deviceType), String(this.report.ability.stage), String(this.report.ability.value)]) +
      formatResource('startup_format_c5c55bd3cded', [String(this.report.status.stage), String(this.report.status.value)]) + autoStartupService.exportHistory();
    try {
      pasteboard.getSystemPasteboard().setData(pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, content))
        .then((): void => { this.notice = localText('startup_text_0834'); })
        .catch((): void => { this.notice = localText('startup_text_0835'); });
    } catch (_) { this.notice = localText('startup_text_0835'); }
  }
  @Builder
  private linesCard(title: string, lines: string[]) {
    Column({ space: 6 }) {
      Text(title).fontSize(17).fontWeight(FontWeight.Medium).fontColor($r('app.color.text_primary'))
      ForEach(lines, (line: string) => {
        Text(line).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
      }, (line: string, index: number) => `${index}-${line}`)
      if (lines.length === 0) { Text(localText('startup_text_0836')).fontSize(14) }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
      .backgroundColor($r('app.color.card_background')).borderRadius(16)
  }

  @Builder
  private resultCard(title: string, result: ProbeResult) {
    Column({ space: 8 }) {
      Text(title).fontSize(17).fontWeight(FontWeight.Medium).fontColor($r('app.color.text_primary'))
      Text(result.conclusion || localText('startup_text_0837')).fontSize(15).fontColor($r('app.color.text_primary')).width('100%')
      Text(formatResource('startup_format_54a96c164202', [String(result.stage), String(result.value === null ? localText('startup_text_0556') : String(result.value))]))
        .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
      Text(formatResource('startup_format_62510b4d60c0', [String(result.errorCode || localText('startup_text_0524')), String(result.elapsedMillis)]))
        .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
      if (result.errorMessage.length > 0) {
        Text(result.errorMessage).fontSize(14).fontColor($r('app.color.error_color'))
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
      .backgroundColor($r('app.color.card_background')).borderRadius(16)
  }
  build() {
    Scroll() {
      Column({ space: 16 }) {
        Button(localText('startup_text_0842'), { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor(Color.Transparent).padding(0)
          .onClick(() => router.back())
        Text(localText('startup_text_0843')).fontSize(26).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary'))
        Text(localText('startup_text_0844'))
          .fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
        Button(localText('startup_text_0845'), { type: ButtonType.Normal }).width('100%').height(48).fontSize(15)
          .fontColor(Color.White).backgroundColor($r('app.color.accent_color')).borderRadius(12)
          .enabled(!this.running).onClick(() => this.run(true))
        this.resultCard(localText('startup_text_0846'), this.report.ability)
        Button(localText('startup_text_0847'), { type: ButtonType.Normal }).width('100%').height(44).fontSize(15)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft')).borderRadius(12)
          .enabled(!this.running).onClick(() => this.run(false))
        this.resultCard(localText('startup_text_0848'), this.report.status)
        if (this.running) {
          Text(localText('startup_text_0849')).fontSize(14).fontColor($r('app.color.accent_color'))
        }
        if (this.report.advice.length > 0) {
          Text(this.report.advice).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
        }
        Button(localText('startup_text_0850'), { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => this.copyReport())
        if (this.notice.length > 0) {
          Text(this.notice).fontSize(14).fontColor($r('app.color.warning_color')).width('100%')
        }
        Button(this.showReference ? localText('startup_text_0851') : localText('startup_text_0852'), { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showReference = !this.showReference; })
        if (this.showReference) {
          Column({ space: 12 }) {
            Text(`API ${deviceInfo.sdkApiVersion} · ${deviceInfo.deviceType} · ${deviceInfo.osFullName}`)
              .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
            Text(localText('startup_text_0853'))
              .fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
            Text(localText('startup_text_0854'))
              .fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
            Text(formatResource('startup_format_39b4fd76be2a', [String(HISTORY_LIMIT), String(HISTORY_SCHEMA), String(HISTORY_MESSAGE_LIMIT)]))
              .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
            .alignItems(HorizontalAlign.Start)
          this.linesCard(localText('startup_text_0858'), this.permissionLinesState)
          this.linesCard(localText('startup_text_0859'), this.messageLinesState)
          this.linesCard(localText('startup_text_0860'), this.retentionLinesState)
        }
      }.width('100%').padding({ left: 20, right: 20, top: 20, bottom: 28 }).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').align(Alignment.TopStart).backgroundColor($r('app.color.page_background'))
  }
}
