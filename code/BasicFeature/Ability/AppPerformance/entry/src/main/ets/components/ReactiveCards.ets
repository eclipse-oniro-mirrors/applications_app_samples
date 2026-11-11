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

import { resolveText, displayValue } from '../core/UiText';
import { CallRecord, emptyCallRecord, formatTime } from '../core/Types';

@Component
export struct InfoField {
  private display(value: string): string {
    return displayValue(this.getUIContext().getHostContext(), value);
  }

  @Prop label: string = '';
  @Prop value: string = '';

  build(): void {
    Row({ space: 10 }) {
      Text(this.label).width(72).fontSize(12).fontColor('#667085')
      Text(this.value.length > 0 ? this.display(this.value) : '—')
        .layoutWeight(1).fontSize(14).fontColor('#182238')
    }.width('100%').alignItems(VerticalAlign.Top)
  }
}

@Component
export struct ChoiceButton {

  @Prop label: string = '';
  @Prop selected: boolean = false;
  onSelect: () => void = (): void => {};

  build(): void {
    Button(this.label)
      .type(ButtonType.Normal).layoutWeight(1).height(44).borderRadius(10)
      .fontSize(14).fontWeight(this.selected ? FontWeight.Medium : FontWeight.Regular)
      .fontColor(this.selected ? '#246BFD' : '#667085')
      .backgroundColor(this.selected ? '#FFFFFF' : '#EEF2F6')
      .onClick((): void => { this.onSelect(); })
  }
}

@Component
export struct ActionButton {

  @Prop label: string = '';
  @Prop primary: boolean = false;
  @Prop isEnabled: boolean = true;
  onAction: () => void = (): void => {};

  build(): void {
    Button(this.label)
      .type(ButtonType.Normal).layoutWeight(1).height(48).borderRadius(12)
      .fontSize(14).fontWeight(FontWeight.Medium)
      .fontColor(this.primary ? '#FFFFFF' : '#182238')
      .backgroundColor(this.primary ? '#246BFD' : '#EEF2F6')
      .opacity(this.isEnabled ? 1 : 0.45).enabled(this.isEnabled)
      .onClick((): void => { this.onAction(); })
  }
}

@Component
export struct MemoryResultCard {

  private text(resource: Resource, args: (string | number)[] = []): string {
    return resolveText(this.getUIContext().getHostContext(), resource, args);
  }

  private display(value: string): string {
    return displayValue(this.getUIContext().getHostContext(), value);
  }

  @Prop record: CallRecord | undefined = undefined;
  @State private detailsOpen: boolean = false;
  onViewRecords: () => void = (): void => {};

  build(): void {
    Column({ space: 12 }) {
      Row({ space: 8 }) {
        Text(this.text($r('app.string.ap_ui_latest_result'))).fontSize(18).fontWeight(FontWeight.Medium)
          .fontColor('#182238').layoutWeight(1)
        Button(this.text($r('app.string.ap_ui_view_records'))).type(ButtonType.Normal).fontSize(14)
          .fontColor('#246BFD').backgroundColor('#EEF4FF').height(44).borderRadius(12)
          .onClick((): void => { this.onViewRecords(); })
      }.width('100%')
      if (this.record !== undefined) {
        Row({ space: 12 }) {
          Text(this.display(this.record.status)).fontSize(18).fontWeight(FontWeight.Medium)
            .fontColor(this.record.kind === 'error' ? '#B42318' : '#182238').layoutWeight(1)
          Text(this.record.kind === 'pending' ? this.text($r('app.string.ap_ui_waiting_for_response')) : `${this.record.elapsed} ms`)
            .fontSize(18).fontWeight(FontWeight.Medium).fontColor('#246BFD')
        }.width('100%')
        Text(this.record.message).fontSize(14).fontColor('#667085').width('100%')
          .maxLines(this.detailsOpen ? 20 : 3).textOverflow({ overflow: TextOverflow.Ellipsis })
        Button(this.detailsOpen ? this.text($r('app.string.ap_ui_hide_call_details')) : this.text($r('app.string.ap_ui_call_details'))).id('apMemoryResultDetails')
          .type(ButtonType.Normal).height(44).fontSize(14).fontColor('#667085')
          .backgroundColor('#F5F7FA').borderRadius(12).width('100%')
          .onClick((): void => { this.detailsOpen = !this.detailsOpen; })
        if (this.detailsOpen) {
          InfoField({ label: this.text($r('app.string.ap_ui_api')), value: this.record.api })
          InfoField({ label: this.text($r('app.string.ap_ui_target')), value: this.record.target })
          InfoField({ label: this.text($r('app.string.ap_ui_code')), value: this.record.code.toString() })
        }
      } else {
        Text(this.text($r('app.string.ap_ui_no_call_results'))).fontSize(14).fontColor('#667085')
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF').borderRadius(16)
  }
}

@Component
export struct CallRecordCard {

  private text(resource: Resource, args: (string | number)[] = []): string {
    return resolveText(this.getUIContext().getHostContext(), resource, args);
  }

  private display(value: string): string {
    return displayValue(this.getUIContext().getHostContext(), value);
  }

  @Prop record: CallRecord = emptyCallRecord();
  @Prop expanded: boolean = false;
  onToggle: (id: number) => void = (id: number): void => {};

  private statusColor(): string {
    if (this.record.kind === 'success') { return '#067647'; }
    if (this.record.kind === 'error') { return '#B42318'; }
    if (this.record.kind === 'blocked' || this.record.kind === 'timeout') { return '#B54708'; }
    return '#246BFD';
  }

  private statusBackground(): string {
    if (this.record.kind === 'success') { return '#ECFDF3'; }
    if (this.record.kind === 'error') { return '#FEF3F2'; }
    if (this.record.kind === 'blocked' || this.record.kind === 'timeout') { return '#FFFAEB'; }
    return '#EEF4FF';
  }

  build(): void {
    Column({ space: 12 }) {
      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Text(this.display(this.record.status)).fontSize(12).fontColor(this.statusColor())
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .backgroundColor(this.statusBackground()).borderRadius(8)
          Text(this.record.api).layoutWeight(1).fontSize(14)
            .fontWeight(FontWeight.Medium).fontColor('#182238')
          Text(this.expanded ? this.text($r('app.string.ap_ui_collapse')) : this.text($r('app.string.ap_ui_details'))).fontSize(12).fontColor('#667085')
        }.width('100%')
        Text(formatTime(this.record.at)).fontSize(12).fontColor('#667085')
        Text(this.record.target.length > 0 ? this.record.target : '—')
          .fontSize(14).fontColor('#667085').width('100%')
      }.width('100%').constraintSize({ minHeight: 44 }).alignItems(HorizontalAlign.Start)
      .onClick((): void => { this.onToggle(this.record.id); })
      if (this.expanded) {
        Divider().color('#E7EBF1')
        InfoField({ label: 'ID', value: this.record.id.toString() })
        InfoField({ label: this.text($r('app.string.ap_ui_code')), value: this.record.code.toString() })
        InfoField({ label: this.text($r('app.string.ap_ui_message')), value: this.record.message })
        InfoField({ label: this.text($r('app.string.ap_ui_duration')), value: `${this.record.elapsed} ms` })
        if (this.record.late) { Text(this.text($r('app.string.ap_ui_late_response'))).fontSize(12).fontColor('#B54708') }
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF').borderRadius(16)
  }
}
