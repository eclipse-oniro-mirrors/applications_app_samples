import { ErrCode } from 'libentry.so';
import { packetFilterApi, CallLog } from '../api/PacketFilterApi';

@Entry
@Component
struct LogPage {
  @StorageLink('callLogs') logs: CallLog[] = [];

  build() {
    Column({ space: 10 }) {
      Row({ space: 8 }) {
        Text('调用日志').fontSize(18).fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary')).layoutWeight(1)
        Button('清空')
          .fontSize(12).height(28)
          .backgroundColor($r('app.color.divider'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => packetFilterApi.clearLogs())
      }.width('100%')

      if (this.logs.length === 0) {
        Column({ space: 6 }) {
          Text('（暂无日志）')
            .fontSize(13).fontColor($r('app.color.text_secondary'))
          Text('前往「创建 / 规则 / 销毁」页操作，每次调用都会记录于此。')
            .fontSize(12).fontColor($r('app.color.text_secondary'))
        }
        .width('100%').height('70%')
        .justifyContent(FlexAlign.Center)
      } else {
        List({ space: 8 }) {
          ForEach(this.logs, (log: CallLog) => {
            ListItem() {
              this.LogCard(log)
            }
          }, (log: CallLog) => String(log.seq))
        }
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Auto)
      }
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
  }

  @Builder LogCard(log: CallLog) {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text(`#${log.seq}`).fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(log.time).fontSize(12).fontColor($r('app.color.text_secondary'))
        Blank()
        Text(log.fn)
          .fontSize(13).fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.app_primary'))
      }.width('100%')

      Row({ space: 6 }) {
        Text('args:').fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(log.args).fontSize(12).fontColor($r('app.color.text_primary')).layoutWeight(1)
      }.width('100%')

      Row({ space: 6 }) {
        Text('result:').fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(log.result).fontSize(12).fontColor($r('app.color.text_primary')).layoutWeight(1)
      }.width('100%')

      Row({ space: 6 }) {
        Text('ErrCode:').fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(`${log.codeName} (${log.code})`)
          .fontSize(12).fontWeight(FontWeight.Bold)
          .fontColor(log.code === ErrCode.OK ? $r('app.color.ok_green') : $r('app.color.err_red'))
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }
}

export default LogPage;
