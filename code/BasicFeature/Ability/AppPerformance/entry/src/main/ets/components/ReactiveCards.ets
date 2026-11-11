import { CallRecord, emptyCallRecord, formatTime } from '../core/Types';

@Component
export struct InfoField {
  @Prop label: string = '';
  @Prop value: string = '';

  build(): void {
    Row({ space: 10 }) {
      Text(this.label).width(72).fontSize(12).fontColor('#667085')
      Text(this.value.length > 0 ? this.value : '—')
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
  @Prop record: CallRecord | undefined = undefined;
  @State private detailsOpen: boolean = false;
  onViewRecords: () => void = (): void => {};

  build(): void {
    Column({ space: 12 }) {
      Row({ space: 8 }) {
        Text('最近结果').fontSize(18).fontWeight(FontWeight.Medium)
          .fontColor('#182238').layoutWeight(1)
        Button('查看记录').type(ButtonType.Normal).fontSize(14)
          .fontColor('#246BFD').backgroundColor('#EEF4FF').height(44).borderRadius(12)
          .onClick((): void => { this.onViewRecords(); })
      }.width('100%')
      if (this.record !== undefined) {
        Row({ space: 12 }) {
          Text(this.record.status).fontSize(18).fontWeight(FontWeight.Medium)
            .fontColor(this.record.kind === 'error' ? '#B42318' : '#182238').layoutWeight(1)
          Text(this.record.kind === 'pending' ? '等待返回' : `${this.record.elapsed} ms`)
            .fontSize(18).fontWeight(FontWeight.Medium).fontColor('#246BFD')
        }.width('100%')
        Text(this.record.message).fontSize(14).fontColor('#667085').width('100%')
          .maxLines(this.detailsOpen ? 20 : 3).textOverflow({ overflow: TextOverflow.Ellipsis })
        Button(this.detailsOpen ? '收起调用详情' : '调用详情').id('apMemoryResultDetails')
          .type(ButtonType.Normal).height(44).fontSize(14).fontColor('#667085')
          .backgroundColor('#F5F7FA').borderRadius(12).width('100%')
          .onClick((): void => { this.detailsOpen = !this.detailsOpen; })
        if (this.detailsOpen) {
          InfoField({ label: '接口', value: this.record.api })
          InfoField({ label: '目标', value: this.record.target })
          InfoField({ label: '代码', value: this.record.code.toString() })
        }
      } else {
        Text('暂无调用结果').fontSize(14).fontColor('#667085')
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF').borderRadius(16)
  }
}

@Component
export struct CallRecordCard {
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
          Text(this.record.status).fontSize(12).fontColor(this.statusColor())
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .backgroundColor(this.statusBackground()).borderRadius(8)
          Text(this.record.api).layoutWeight(1).fontSize(14)
            .fontWeight(FontWeight.Medium).fontColor('#182238')
          Text(this.expanded ? '收起' : '详情').fontSize(12).fontColor('#667085')
        }.width('100%')
        Text(formatTime(this.record.at)).fontSize(12).fontColor('#667085')
        Text(this.record.target.length > 0 ? this.record.target : '—')
          .fontSize(14).fontColor('#667085').width('100%')
      }.width('100%').constraintSize({ minHeight: 44 }).alignItems(HorizontalAlign.Start)
      .onClick((): void => { this.onToggle(this.record.id); })
      if (this.expanded) {
        Divider().color('#E7EBF1')
        InfoField({ label: 'ID', value: this.record.id.toString() })
        InfoField({ label: '代码', value: this.record.code.toString() })
        InfoField({ label: '消息', value: this.record.message })
        InfoField({ label: '耗时', value: `${this.record.elapsed} ms` })
        if (this.record.late) { Text('延迟返回').fontSize(12).fontColor('#B54708') }
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF').borderRadius(16)
  }
}
