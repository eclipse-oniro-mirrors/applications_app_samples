import { Packet } from '../types/packetFilter';
import { packetFilterApi } from '../api/PacketFilterApi';

@Entry
@Component
struct PacketCallbackPage {
  @Prop controllerIds: number[] = [];
  @State selectedIdIdx: number = 0;
  @State userData: string = '';
  @State resultText: string = '';
  @State resultOk: boolean = false;
  @State packets: Packet[] = [];
  @State callbackRegistered: boolean = false;

  aboutToAppear(): void {
    this.refreshIds();
  }

  build() {
    Column({ space: 10 }) {
      Text('registerPacketCallback / unregisterPacketCallback')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
      Text('签名: registerPacketCallback(id, userData, callback)')
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))

      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Text('目标 id').fontSize(14).width(90)
          if (this.controllerIds.length === 0) {
            Text('（请先创建包过滤器）')
              .fontSize(13).fontColor($r('app.color.err_red'))
              .layoutWeight(1)
          } else {
            Select(this.controllerIds.map((i: number): SelectOption => ({ value: String(i) })))
              .selected(this.selectedIdIdx)
              .value(String(this.controllerIds[this.selectedIdIdx] ?? '-'))
              .onSelect((idx: number) => {
                this.selectedIdIdx = idx;
                this.checkCallbackStatus();
              })
              .layoutWeight(1)
          }
        }.width('100%')

        Row({ space: 8 }) {
          Text('userData').fontSize(14).width(90)
          TextInput({ text: this.userData, placeholder: '输入自定义上下文' })
            .onChange((v: string) => this.userData = v)
            .layoutWeight(1)
        }.width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor($r('app.color.card_bg'))
      .borderRadius(8)

      Row({ space: 10 }) {
        Button('注册回调')
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.app_primary'))
          .layoutWeight(1)
          .enabled(this.controllerIds.length > 0 && !this.callbackRegistered)
          .onClick(() => this.registerCallback())

        Button('取消回调')
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.err_red'))
          .layoutWeight(1)
          .enabled(this.callbackRegistered)
          .onClick(() => this.unregisterCallback())
      }.width('100%')

      if (this.resultText.length > 0) {
        Text(this.resultText)
          .fontSize(14)
          .fontColor(this.resultOk ? $r('app.color.ok_green') : $r('app.color.err_red'))
          .width('100%')
          .padding(10)
          .backgroundColor($r('app.color.card_bg'))
          .borderRadius(8)
      }

      Row({ space: 8 }) {
        Text('回调状态:').fontSize(13).fontColor($r('app.color.text_secondary'))
        Text(this.callbackRegistered ? '已注册' : '未注册')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.callbackRegistered ? $r('app.color.ok_green') : $r('app.color.text_secondary'))
        Blank()
        Text('已收报文:').fontSize(13).fontColor($r('app.color.text_secondary'))
        Text(String(this.packets.length))
          .fontSize(13).fontColor($r('app.color.text_primary'))
      }.width('100%')

      Text('收到的报文').fontSize(16).fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary')).width('100%')

      if (this.packets.length === 0) {
        Column({ space: 6 }) {
          Text('（暂无报文）')
            .fontSize(13).fontColor($r('app.color.text_secondary'))
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else {
        List({ space: 8 }) {
          ForEach(this.packets, (pkt: Packet, idx: number) => {
            ListItem() {
              this.PacketCard(pkt, idx)
            }
          }, (pkt: Packet, idx: number) => String(pkt) + '_' + idx)
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

  @Builder PacketCard(pkt: Packet, idx: number) {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text(`#${idx + 1}`).fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(`packetId: ${pkt.packetId + 1}`).fontSize(13).fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.app_primary')).layoutWeight(1)
        Text(`packetLen:${pkt.packetLen} bytes`).fontSize(12).fontColor($r('app.color.text_secondary'))
      }.width('100%')

      Row({ space: 6 }) {
        Text('protocol:').fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(String(pkt.protocol)).fontSize(12).fontColor($r('app.color.text_primary')).layoutWeight(1)
      }.width('100%')

      Row({ space: 6 }) {
        Text('src:').fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(`${pkt.srcIp.addr.join('.')}:${pkt.srcPort}/${pkt.srcIp.family}`)
          .fontSize(12).fontColor($r('app.color.text_primary')).layoutWeight(1)
      }.width('100%')

      Row({ space: 6 }) {
        Text('dst:').fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(`${pkt.dstIp.addr.join('.')}:${pkt.dstPort}/${pkt.dstIp.family}`)
          .fontSize(12).fontColor($r('app.color.text_primary')).layoutWeight(1)
      }.width('100%')

      Row({ space: 6 }) {
        Text('userData:').fontSize(12).fontColor($r('app.color.text_secondary'))
        Text(pkt.userData || '(空)').fontSize(12).fontColor($r('app.color.text_primary')).layoutWeight(1)
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
  }

  private currentId(): number {
    return this.controllerIds[this.selectedIdIdx] ?? -1;
  }

  private registerCallback(): void {
    const id = this.currentId();
    if (id < 0) {
      this.resultOk = false;
      this.resultText = '✗ 请先选择目标 Controller';
      return;
    }

    const ret = packetFilterApi.registerPacketCallback(id, this.userData, (packet: Packet, userData: string) => {
      this.onPacketReceived(packet);
      console.log('packet res'+JSON.stringify(packet))
      return 0;
    });
    this.callbackRegistered = true;
    this.resultOk = ret === 0;
    this.resultText = this.resultOk? `✓ 已注册回调 (id=${id})`: `注册回调失败 error Code:${ret}`;
  }

  private unregisterCallback(): void {
    const id = this.currentId();
    if (id < 0) {
      this.resultOk = false;
      this.resultText = '✗ 请先选择目标 Controller';
      return;
    }
    const ret = packetFilterApi.unregisterPacketCallback(id);
    this.callbackRegistered = false;
    this.resultOk = ret === 0;
    this.resultText = this.resultOk? `✓ 已取消回调 (id=${id})`: `取消回调 error Code:${ret}`;
  }

  private onPacketReceived(packet: Packet): void {
    this.packets = [packet];
    console.log('this.packets'+JSON.stringify(this.packets))
  }

  private refreshIds(): void {
    if (this.selectedIdIdx >= this.controllerIds.length) {
      this.selectedIdIdx = 0;
    }
    this.checkCallbackStatus();
  }

  private checkCallbackStatus(): void {

    this.callbackRegistered = false;
  }

  private ipSummary(ipType: number): string {
    switch (ipType) {
      case 0: return 'ANY';
      case 1: return 'SINGLE';
      case 2: return 'CIDR';
      case 3: return 'RANGE';
      case 4: return 'MULTI';
      default: return `TYPE(${ipType})`;
    }
  }

  private portSummary(portType: number): string {
    switch (portType) {
      case 0: return 'ANY';
      case 1: return 'SINGLE';
      case 2: return 'RANGE';
      case 3: return 'MULTI';
      default: return `TYPE(${portType})`;
    }
  }
}

export default PacketCallbackPage;
