import { packetFilterApi } from '../api/PacketFilterApi';

@Component
struct DestroyPacketControllerPage {
  @State idInput: string = '';
  @Prop @Watch('idsChange') controllerIds: number[] = [];
  @State selectedIdIdx: number = 0;
  @State resultText: string = '';
  @State resultOk: boolean = false;

  aboutToAppear(): void {
  }

  idsChange(){
    this.refreshIds();
  }
  build() {
    Column({ space: 12 }) {
      Text('destroyController')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
      Text('签名: destroyController(id: number): void')
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))

      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Text('从列表选择').fontSize(13).width(90)
          if (this.controllerIds.length === 0) {
            Text('（无可销毁的重定向器）')
              .fontSize(13).fontColor($r('app.color.err_red'))
              .layoutWeight(1)
          } else {
            Select(this.controllerIds.map((i: number): SelectOption => ({ value: String(i) })))
              .selected(this.selectedIdIdx)
              .value(String(this.controllerIds[this.selectedIdIdx] ?? '-'))
              .onSelect((idx: number) => {
                this.selectedIdIdx = idx;
                this.idInput = String(this.controllerIds[idx]);
              })
              .layoutWeight(1)
          }
        }.width('100%')
        Row({ space: 8 }) {
          Text('或手动输入 id').fontSize(13).width(90)
          TextInput({ text: this.idInput })
            .type(InputType.Number)
            .onChange((v: string) => this.idInput = v)
            .layoutWeight(1)
        }.width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor($r('app.color.card_bg'))
      .borderRadius(8)

      Button('调用 destroyController')
        .type(ButtonType.Capsule)
        .backgroundColor($r('app.color.err_red'))
        .width('100%')
        .onClick(() => this.invoke())

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
        Text('剩余存活:').fontSize(13).fontColor($r('app.color.text_secondary'))
        Text(this.controllerIds.length === 0 ? '(无)' : this.controllerIds.join(', '))
          .fontSize(13).fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
      }.width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
  }

  private invoke(): void {
    const id = parseInt(this.idInput || '0', 10);
    const before = packetFilterApi.listIds().length;
    console.log(`destroyPacketController id: ${id}`)
    const ret = packetFilterApi.destroyPacketController(id);
    const after = packetFilterApi.listIds().length;
    console.log(`destroyPacketController ret: ${ret}`)
    if (ret === 0) {
      this.resultOk = true;
      this.resultText = `✓ id=${id} 已销毁`;
    } else {
      this.resultOk = false;
      this.resultText = `✗ id=${id} 不存在（NOT_FOUND，见日志页）`;
    }
    this.refreshIds();
  }

  private refreshIds(): void {
    if (this.selectedIdIdx >= this.controllerIds.length) {
      this.selectedIdIdx = 0;
    }
    this.idInput = String(this.controllerIds[this.selectedIdIdx]) || '';
  }
}

export default DestroyPacketControllerPage;
