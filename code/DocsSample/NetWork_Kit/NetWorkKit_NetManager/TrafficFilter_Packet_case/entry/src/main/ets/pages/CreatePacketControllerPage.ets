import { packetFilterApi } from '../api/PacketFilterApi';
import { PACKET_COPY_MODE_OPTIONS, SelectOptionItem } from '../model/RuleFormModel';
import DestroyPacketControllerPage from './DestroyPacketControllerPage';
import { PacketCopyMode } from '../types/packetFilter'

@Entry
@Component
struct CreatePacketControllerPage {
  @State groupId: string = '1';
  @State priority: string = '1';
  @State packetCopyLen: string = '65535';
  @State nfqueueMaxlen: string = '1024';
  @State nfqueueFlags: boolean = true;
  @State packetCopyMode: PacketCopyMode = PacketCopyMode.COPY_MODE_FULL;
  @State resultText: string = '';
  @State resultOk: boolean = false;
  @State controllerIds: number[] = packetFilterApi.listIds();

  aboutToAppear(): void {
    AppStorage.setOrCreate('controllerIds', packetFilterApi.listIds());
  }

  build() {
    Column({ space: 12 }) {
      Text('createController')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))

      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Text('groupId').fontSize(14).width(100)
          TextInput({ text: this.groupId })
            .type(InputType.Number)
            .onChange((v: string) => this.groupId = v)
            .layoutWeight(1)
        }.width('100%')
        Row({ space: 8 }) {
          Text('priority').fontSize(14).width(100)
          TextInput({ text: this.priority })
            .type(InputType.Number)
            .onChange((v: string) => this.priority = v)
            .layoutWeight(1)
        }.width('100%')
        Row({ space: 8 }) {
          Text('packetCopyLen').fontSize(14).width(100)
          TextInput({ text: this.packetCopyLen })
            .type(InputType.Number)
            .onChange((v: string) => this.packetCopyLen = v)
            .layoutWeight(1)
        }.width('100%')
        Row({ space: 8 }) {
          Text('nfqueueMaxlen').fontSize(14).width(100)
          TextInput({ text: this.nfqueueMaxlen })
            .type(InputType.Number)
            .onChange((v: string) => this.nfqueueMaxlen = v)
            .layoutWeight(1)
        }.width('100%')
        Row({ space: 8 }) {
          Text('nfqueueFlags')
            .fontSize(14)
            .layoutWeight(1)
          Checkbox()
            .select(this.nfqueueFlags)
            .onChange((v: boolean) => { this.nfqueueFlags = v; })
        }
        .width('100%')
        Row({ space: 8 }) {
          Text('packetCopyMode').fontSize(13).width(90)
          Select(PACKET_COPY_MODE_OPTIONS.map((o: SelectOptionItem<number>): SelectOption => ({ value: o.label })))
            .selected(PACKET_COPY_MODE_OPTIONS.findIndex(o => o.value === this.packetCopyMode))
            .value(
              PACKET_COPY_MODE_OPTIONS.find(o => o.value === this.packetCopyMode)?.label ??
                String(this.packetCopyMode)
            )
            .onSelect((idx: number) => { this.packetCopyMode = PACKET_COPY_MODE_OPTIONS[idx].value; })
            .layoutWeight(1)
        }.width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor($r('app.color.card_bg'))
      .borderRadius(8)

      Button('调用 createController')
        .type(ButtonType.Capsule)
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
        Text('存活重定向器:').fontSize(13).fontColor($r('app.color.text_secondary'))
        Text(this.controllerIds.length === 0 ? '(无)' : this.controllerIds.join(', '))
          .fontSize(13).fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
      }.width('100%')


      DestroyPacketControllerPage({controllerIds: this.controllerIds});
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
  }

  private invoke(): void {
    const gid = parseInt(this.groupId || '0', 10);
    const pri = parseInt(this.priority || '0', 10);
    const packetCopyLen = parseInt(this.packetCopyLen || '0', 10);
    const nfqueueMaxlen = parseInt(this.nfqueueMaxlen || '0', 10);
    console.log(
      `createPacketController groupId:${gid},priority:${pri},` +
      `packetCopyLen:${packetCopyLen},nfqueueMaxlen:${nfqueueMaxlen},` +
      `nfqueueFlags:${this.nfqueueFlags}`
    );
    const res = packetFilterApi.createPacketController(gid, pri, packetCopyLen, nfqueueMaxlen, 1, this.packetCopyMode);
    if (res.id > 0 && res.ret === 0) {
      this.resultOk = true;
      this.resultText = `✓ 成功，返回 id = ${res.id}`;
    } else {
      this.resultOk = false;
      this.resultText = `✗ 失败，返回 id = ${res.id}, errCode:${res.ret}`;
    }

    this.controllerIds = packetFilterApi.listIds();
  }
}

export default CreatePacketControllerPage;
