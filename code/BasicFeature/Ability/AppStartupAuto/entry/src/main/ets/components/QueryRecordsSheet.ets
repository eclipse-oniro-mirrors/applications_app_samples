import { QueryRecord } from '../autostart/AutoStartupTypes';
import { outcomeLabel } from '../autostart/AutoStartupHistory';
import { ApiCallDetails } from './ApiCallDetails';
import { formatQueryTime, sourceLabel } from './QueryPresentation';

@Component
export struct QueryRecordsSheet {
  @Prop records: QueryRecord[] = [];
  @Prop filter: string = '全部';
  @Prop notice: string = '';
  @Prop summary: string = '';
  onFilter: (filter: string) => void = () => {};
  onExport: () => void = () => {};
  onClear: () => void = () => {};
  onClose: () => void = () => {};
  @State private expandedRecordId: number = -1;

  private confirmClear(): void {
    AlertDialog.show({
      title: '清空查询记录？',
      message: '清空本机查询历史，已保存归档不受影响。',
      primaryButton: {
        value: '取消',
        action: () => {}
      },
      secondaryButton: {
        value: '确认',
        action: () => {
          this.expandedRecordId = -1;
          this.onClear();
        }
      }
    });
  }

  @Builder
  private recordItem(record: QueryRecord) {
    Column({ space: 14 }) {
      Button({ type: ButtonType.Normal }) {
        Column({ space: 7 }) {
          Text(formatQueryTime(record.timestamp))
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
          Text(sourceLabel(record.source))
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
          Text(record.result)
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
          Text(`结果分类：${outcomeLabel(record.outcome as string)}`)
            .fontSize(13)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
          Text(this.expandedRecordId === record.id ? '收起详情 −' : '查看详情 +')
            .fontSize(13)
            .fontColor($r('app.color.accent_color'))
            .width('100%')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .backgroundColor($r('app.color.card_background'))
      .borderRadius(12)
      .padding(0)
      .onClick(() => {
        this.expandedRecordId = this.expandedRecordId === record.id ? -1 : record.id;
      })

      if (this.expandedRecordId === record.id) {
        Divider().color($r('app.color.line_color'))
        ApiCallDetails({
          supportResult: record.supportResult,
          statusResult: record.statusResult,
          errorCode: record.errorCode,
          errorMessage: record.errorMessage
        })
        Text(`耗时：${record.durationMillis} ms`)
          .fontSize(13)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      }
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
  }

  build() {
    Column({ space: 16 }) {
      Row({ space: 16 }) {
        Text('查询记录')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Button('关闭', { type: ButtonType.Normal })
          .fontSize(14)
          .fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.accent_soft'))
          .height(44).borderRadius(12)
          .padding({ left: 16, right: 16, top: 12, bottom: 12 })
          .onClick(() => this.onClose())
      }
      .width('100%')

      Button('清空记录', { type: ButtonType.Normal })
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .backgroundColor($r('app.color.page_background'))
        .constraintSize({ minHeight: 44 }).padding({ top: 8, bottom: 8, left: 0, right: 12 })
        .enabled(this.records.length > 0)
        .opacity(this.records.length > 0 ? 1 : 0.45)
        .alignSelf(ItemAlign.Start)
        .onClick(() => this.confirmClear())

      if (this.summary.length > 0) {
        Text(this.summary)
          .fontSize(13)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
          .padding(12)
          .backgroundColor($r('app.color.muted_background'))
          .borderRadius(10)
      }
      if (this.notice.length > 0) {
        Text(this.notice)
          .fontSize(13)
          .fontColor($r('app.color.accent_color'))
          .width('100%')
          .padding(12)
          .backgroundColor($r('app.color.accent_soft'))
          .borderRadius(10)
      }

      Row({ space: 8 }) {
        ForEach(['全部', '成功', '失败', '不支持'], (label: string) => {
          Button(label, { type: ButtonType.Normal })
            .fontSize(14)
            .height(44)
            .layoutWeight(1)
            .fontColor(this.filter === label ? Color.White : $r('app.color.accent_color'))
            .backgroundColor(this.filter === label ? $r('app.color.accent_color') : $r('app.color.accent_soft'))
            .borderRadius(10)
            .onClick(() => this.onFilter(label))
        }, (label: string) => label)
      }
      .width('100%')

      Row({ space: 12 }) {
        Button('脱敏导出', { type: ButtonType.Normal })
          .fontSize(13)
          .fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.accent_soft'))
          .borderRadius(10)
          .height(44)
          .layoutWeight(1)
          .enabled(this.records.length > 0)
          .onClick(() => this.onExport())
        Text(`${this.records.length} 条`)
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
      }
      .width('100%')

      Scroll() {
        Column({ space: 12 }) {
          if (this.records.length === 0) {
            Text('暂无查询记录')
              .fontSize(18)
              .fontColor($r('app.color.text_secondary'))
              .padding({ top: 40, bottom: 40 })
              .width('100%')
              .textAlign(TextAlign.Center)
          } else {
            ForEach(this.records, (record: QueryRecord) => {
              this.recordItem(record)
            }, (record: QueryRecord): string => `${record.id}`)
          }
        }
        .width('100%')
        .padding({ bottom: 24 })
      }
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.Top)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 16, bottom: 16 })
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.page_background'))
  }
}
